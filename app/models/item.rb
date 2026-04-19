class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  paginates_per 8
  has_many :cart_items, dependent: :destroy
end