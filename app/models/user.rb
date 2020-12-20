class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :email
         validates :password
         validates :nickname
         validates :name_kanji_sei
         validates :name_kanji_mei
         validates :name_kana_sei
         validates :name_kana_mei
         validates :birthday
         end
         has_many :items
         
end
