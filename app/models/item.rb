class Item < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :day_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :prace, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :state
  belongs_to :day
end
