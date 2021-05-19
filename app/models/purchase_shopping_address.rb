class PurchaseShoppingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, numericality: {only_integer: true,  message: "is invalid. Input only number"}
  end

  validates :phone_number, length: {minimum: 10, message: "is too short"}
  validates :phone_number, length: {maximum: 11, message: "is too long"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end