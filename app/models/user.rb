class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: ' Include both letters and numbers'}
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' Input full-width characters'}
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' Input full-width characters'}
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' Input full-width katakana characters'}
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' Input full-width katakana characters'}
  validates :birthday, presence: true

  has_many :items
  has_many :buyers
end
