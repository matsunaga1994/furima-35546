class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :burden
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
    validates :price
    validates :image
  end

validates :name, length: {maximum: 40}

validates :price, numericality: { greater_than_or_equal_to: 300, 
  less_than_or_equal_to: 9999999, message: 'Out of setting range' }, 
  format: { with: /\A[0-9]\d+\z/, message: 'is invalid. Harf-width characters' }
end
