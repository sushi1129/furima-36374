class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cade, :prefectures_id, :city, :house_number, :building_name, :telephone_number, :order_id

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number, :order_id
    validates :postal_cade, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"},
                                 length: {minimum: 10, message: "is too short"}
  end
  validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cade: postal_cade, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end