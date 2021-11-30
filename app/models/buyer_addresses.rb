class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :line1, :line2, :phone, :buyer_id
