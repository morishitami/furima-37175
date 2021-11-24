class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :nickname, presence: true
  validate :lastname, presence: true
  validate :firstname, presence: true
  validate :lastname_kana, presence: true
  validate :firstname_kana, presence: true
  validate :birthday, presence: true
end
