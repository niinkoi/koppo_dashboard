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
require 'rails_helper'

RSpec.describe LocationDetail, type: :model do
  describe '#create' do
    context 'when attributes are valid' do
      let(:location) { create(:location_detail) }

      it 'create location successfully' do
        expect(location).to be_valid
      end
    end

    context 'when attributes are invalid' do
      let(:location) { create(:location_detail) }

      it 'could not create when location_city is invalid' do
        location.location_city = nil
        expect(location).not_to be_valid

        location.location_city = ''
        expect(location).not_to be_valid
      end

      it 'could not create when location_ward is invalid' do
        location.location_ward = nil
        expect(location).not_to be_valid

        location.location_ward = ''
        expect(location).not_to be_valid
      end

      it 'could not create when location_district is invalid' do
        location.location_district = nil
        expect(location).not_to be_valid

        location.location_district = ''
        expect(location).not_to be_valid
      end
    end
  end
end
