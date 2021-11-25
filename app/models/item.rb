class Item < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :state_id, presence: true
  validates :days_id, presence: true
  validates :prace, presence: true

  belong_to :user
  has_one_attached :image
end
