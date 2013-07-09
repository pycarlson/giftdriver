FactoryGirl.define do

  factory :user do
    full_name "Cat Woman"
    sequence(:email) { |n| "testuser+#{n}@example.com" }
    zipcode "94606"
    password 'password'
    password_confirmation 'password'
  end

  factory :drive do
    org_blurb "We are a helpful place"
    org_email "smiles@smiles.org"
    org_phone "510-777-7777"
    org_name "Smiles"
    org_address "717 Cali"
    org_zipcode "94606"
    drive_title "Smile Bright"
    drive_blurb "Smiling all the way"
    start_date "Nov 15, 2013"
    end_date "Dec 24, 2013"
  end

  factory :drop_location do 
    drive_id  1
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
    code "hrt675"
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
