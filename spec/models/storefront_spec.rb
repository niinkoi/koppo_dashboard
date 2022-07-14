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
require 'rails_helper'

RSpec.describe Storefront, type: :model do
  describe '#create' do
    context 'when attributes are valid' do
      let(:location) { create(:location_detail) }
      let(:storefront) { create(:storefront, location_detail: location) }

      it 'create location successfully' do
        expect(storefront).to be_valid
      end
    end

    context 'when attributes are invalid' do
      let(:location) { create(:location_detail) }

      it 'could not create when code is invalid' do
        store = create(:storefront, location_detail: location)

        store.storefront_code = nil
        expect(store).not_to be_valid

        store.storefront_code = ''
        expect(store).not_to be_valid
      end

      it 'could not create when code is already taken' do
        create(:storefront, location_detail: location, storefront_code: 'noob')
        attempted_second_store = build(:storefront, location_detail: location, storefront_code: 'foo')
        expect(attempted_second_store).not_to be_valid
      end

      it 'could not create when code exceeds 4 length' do
        store = build(:storefront, location_detail: location)

        store.storefront_code = '*' * 5
        expect(store).not_to be_valid

        store.storefront_code = '*' * 3
        expect(store).not_to be_valid
      end

      it 'could not create when name is invalid' do
        store = create(:storefront, location_detail: location)

        store.storefront_name = nil
        expect(store).not_to be_valid

        store.storefront_name = ''
        expect(store).not_to be_valid
      end
    end
  end
end
