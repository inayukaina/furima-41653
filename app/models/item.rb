class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost_status
  belongs_to :prefecture
  belongs_to :shipping_schedule

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :item_condition_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :shipping_cost_status_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :shipping_schedule_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
