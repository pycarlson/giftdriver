FactoryGirl.define do

  factory :user do
    full_name "Cat Woman"
    sequence(:email) { |n| "testuser+#{n}@example.com" }
    password 'password'
  end

  factory :drive do
    org_blurb "We are a helpful place"
    org_email "smiles@smiles.org"
    org_phone "510-777-7777"
    org_name "Smiles"
    org_address "717 Cali"
    org_zipcode "94606"
    sequence(:drive_title) { |n| "Holiday Drive #{n}" }
    drive_blurb "Smiling all the way"
    start_date "Nov 15, 2013"
    end_date "Dec 24, 2013"

    after(:create) do |drive, evaluator|
      unless drive.drop_locations.length > 0
        create(:drop_location, drive: drive)
      end
    end
  end

  factory :drop_location do 
    drive
    street "717 California Street"
    city "San Francisco"
    state "CA"
    zipcode "94108" 
    code 1
    latitude 53.630475 
    longitude -113.625641
    gmaps true  
  end

  factory :family do
    sequence(:code) { |n| "familycode-#{n}" }
    drive
    drop_location
  end

  factory :adopted_family, parent: :family do
    code "cat123"
    adopted_by 1
    drive
    drop_location
  end

  factory :family_member do
    family
    first_name "Kitty"
    age 9
    gender "cat"
    bio "this is a healthy cat"
  end

  factory :need do
    text "new shoes"
    family_member
  end

  factory :organizer do 
    user_id 1
    drive_id 1
  end

  factory :donor do 
    user
    drive
    drop_location
  end
end
