# == Schema Information
#
# Table name: storefronts
#
#  id                 :bigint           not null, primary key
#  storefront_code    :string(255)
#  storefront_name    :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  location_detail_id :bigint           not null
#
# Indexes
#
#  index_storefront_on_storefront_code      (storefront_code) UNIQUE
#  index_storefronts_on_location_detail_id  (location_detail_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_detail_id => location_details.id)
#
FactoryBot.define do
  factory :storefront do
    storefront_code { 'QXZ1' }
    storefront_name { Faker::Games::Pokemon.location }
    location_detail { create(:location_detail) }
  end
end
