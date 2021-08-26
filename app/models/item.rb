class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :imege
end
