# == Schema Information
#
# Table name: location_details
#
#  id                :bigint           not null, primary key
#  location_city     :string(255)
#  location_district :string(255)
#  location_ward     :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :location_detail do
    location_city { Faker::Address.city }
    location_district { '123' }
    location_ward { 'foo' }
  end
end
