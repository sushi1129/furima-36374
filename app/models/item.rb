class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefectures
  belongs_to :shipping_day
  


  with_options presence: true do
    validates :item_name, :info, :image
    validates :price, inclusion: { in: 300..9999999, message: 'is out of setting range'},
                      format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                      numericality: true

    with_options numericality: { other_than: 0 , message: "can't be blank"} do
      validates :category_id,    :condition_id,  :shipping_cost_id, 
                :prefectures_id, :shipping_day_id
    end
  end
end
