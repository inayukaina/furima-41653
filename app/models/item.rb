class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost_status
  belongs_to :prefecture
  belongs_to :shipping_schedule

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_schedule_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { with: /\A\d+\z/, message: '半角数字を使用してください' },
                    length: { minimum: 3, maximum: 7 }
  validates :image, presence: true
end
