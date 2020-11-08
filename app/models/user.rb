class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true, length: { maximum: 6 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_Kana, presence: true
  validates :first_name_Kana, presence: true
  validates :birth_date, presence: true

  has_many :items
  has_many :orders
end
