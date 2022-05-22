# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  password_digest :string(255)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  before_save :ensure_proper_name_case

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6, maximum: 12 }, on: :create

  private

  def ensure_proper_name_case
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
