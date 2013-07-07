require 'roo' 

class FamilyMemberImport

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file
  
  def initialize(attributes = {}, drive_id = nil)
    attributes.each { |name, value| send("#{name}=", value) }
    @drive = Drive.find(drive_id) if drive_id != nil
    @families = []
  end

  def persisted?
    false
  end
  
  def save
    if imported_family_members.map(&:valid?).all?
      imported_family_members.each(&:save!)
      @families.each(&:save!)
      true
    else
      imported_family_members.each_with_index do |family_member, index|
        family_member.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_family_members
    @imported_family_members ||= load_imported_family_members
  end

  def load_imported_family_members
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      family = Family.find_by_code(row["family_code"]) || Family.new(code: row["family_code"])
      family_member = FamilyMember.where("family_id = ? AND first_name = ?", family.id, row["first_name"]).first || FamilyMember.new
      family_member.attributes = row.to_hash.slice(*FamilyMember.accessible_attributes)
      
      # this saving is a hack to allow needs to be associated with person. Need to handle this better if time.
      if family_member.save
        check_for_needs(row, family_member)
        create_family_associations(family_member, family)
      end      
      
      family_member
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}. Please import '.csv', '.xls', or '.xlsx' filetypes only."
    end
  end

  def check_for_needs(row, family_member) 
    row.each do |key, value|
      if key.include?("need")
        if value != nil
          need_check = []
          family_member.needs.each do |need|
            need_check << need if need.text == value
          end
          if need_check.length == 0
            need = Need.create(text: value) 
            family_member.needs << need
          end
        end
      end
    end
  end

  def create_family_associations(family_member, family)
    family_member.family = family
    family.drive = @drive
    @families << family
  end

end
