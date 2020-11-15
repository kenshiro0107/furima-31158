class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :delivery_fee
  belongs_to :prefectual
  belongs_to :shipping_day
  belongs_to :category
  belongs_to :status
  belongs_to :user
  has_one :order

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 299 }
  validates :price, numericality: { less_than: 10_000_000 }
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: :only_integer
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :prefectual_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
end
