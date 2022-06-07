require 'rails_helper'

RSpec.describe 'User', type: :model do
  describe '#create' do
    context 'when attributes are valid' do
      it 'create user successfully' do
        user = create(:user)
        expect(user).to be_valid
      end
    end

    context 'when attributes are invalid' do
      it 'is invalid if first name is blank or nil' do
        user = build(:user)

        user.first_name = ''
        expect(user).to be_invalid

        user.first_name = nil
        expect(user).to be_invalid
      end

      it 'is invalid if last name is blank or nil' do
        user = build(:user)

        user.last_name = ''
        expect(user).to be_invalid

        user.last_name = nil
        expect(user).to be_invalid
      end

      it 'is invalid if username is blank or nil' do
        user = build(:user)

        user.username = ''
        expect(user).to be_invalid

        user.username = nil
        expect(user).to be_invalid
      end

      it 'is invalid if username is taken' do
        first_user = create(:user)

        user = build(:user, username: first_user.username)
        expect(user).to be_invalid
      end

      it 'is invalid if email is taken' do
        first_user = create(:user)

        user = build(:user, email: first_user.email)
        expect(user).to be_invalid
      end

      it 'is valid if email is blank or nil' do
        user = build(:user)

        user.email = ''
        expect(user).to be_invalid

        user.email = nil
        expect(user).to be_invalid
      end

      it 'is invalid if the email looks bogus' do
        user.email = ''
        expect(user).to be_invalid

        user.email = 'foo.bar'
        expect(user).to be_invalid

        user.email = 'foo.bar#example.com'
        expect(user).to be_invalid

        user.email = 'f.o.o.b.a.r@example.com'
        expect(user).to be_valid

        user.email = 'foo+bar@example.com'
        expect(user).to be_valid

        user.email = 'foo.bar@sub.example.co.id'
        expect(user).to be_valid
      end

      it 'is invalid if password is out of bounds' do
        user = build(:user)

        user.password = '*'
        expect(user).to be_invalid

        user.password = '*' * 13
        expect(user).to be_invalid
      end
    end
  end
end
