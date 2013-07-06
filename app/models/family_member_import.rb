require 'roo' 

class FamilyMemberImport
  
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file
  
  def initialize(attributes = {}, drive_id = nil)
    attributes.each { |name, value| send("#{name}=", value) }
    @drive = Drive.find(drive_id) if drive_id != nil
  end

  def persisted?
    false
  end
  
  def save
    if imported_family_members.map(&:valid?).all?
      imported_family_members.each(&:save!)
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
      family_member = FamilyMember.find_by_id(row["id"]) || FamilyMember.new
      family_member.attributes = row.to_hash.slice(*FamilyMember.accessible_attributes)
      family_member.family = Family.find_or_create_by_code(row["family_code"])
      family = family_member.family
      family.drive = @drive
      family.save
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

end
