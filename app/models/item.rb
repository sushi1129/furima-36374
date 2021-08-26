class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :imege

  with_options presence: true do
    validates :item_name
    validates :info
    validates :category_id
    validates :sipping_cost_id
    validates :prefectures_id
    validates :sipping_day_id
    validates :price
    validates :imege
  end
end
