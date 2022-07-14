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
class LocationDetail < ApplicationRecord
  validates :location_city, presence: true
  validates :location_district, presence: true
  validates :location_ward, presence: true
end
