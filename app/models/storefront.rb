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
class Storefront < ApplicationRecord
  before_save :ensure_proper_name_case

  validates :storefront_code, presence: true, uniqueness: true, length: { is: 4 }
  validates :storefront_name, presence: true
  belongs_to :location_detail

  private

  def ensure_proper_name_case
    self.storefront_code = storefront_code.capitalize
  end
end
