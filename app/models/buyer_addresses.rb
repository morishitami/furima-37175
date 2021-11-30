class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :line1, :line2, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :line1
    validates :phone,format: {/\A\d{10}$|^\d{11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cade: postal_code, state_id: state_id, city: city, line1: line1, line2: line2, phone: phone, buyer_id: buyer.id)
  end
end