class User < ApplicationRecord
  has_secure_password
  has_many :reserves
  validates :birthday,
    presence: true
  validates :password,
    presence: true,
    length: {minimum: 8, allow_blank: true}
  validates :email,
    presence: true,
    confirmation: true,
    length: {minimum: 8, allow_blank: true}
  validates :username,
    presence: true,
    length: {minimum: 1, maximum: 50, allow_blank: true}
  validates :post_code,
    presence: true,
    format: {with: /\A\d{3}-\d{4}\z/, allow_blank: true}
  validates :address,
    presence: true,
    length: { minimum: 1, maximum: 100, allow_blank: true}
  validates :phone_number,
    presence: true,
    format: {with: /\A\d{2,4}-\d{2,4}-\d{4}\z/, allow_blank: true}
  validates :sex,
    presence: true,
    inclusion: {in: ['男', '女'], allow_blank: true}
end
