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
    drop_location "in town"
    drive_title "Smile Bright"
    drive_blurb "Smiling all the way"
    start_date "Nov 15, 2013"
    end_date "Dec 24, 2013"
  end

  factory :family do
    code "hrt675"
    drive
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
end
