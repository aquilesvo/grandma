class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :rented_grandmoms, through: :bookings, source: 'user'
  has_many :owned_grandmoms, :class_name => 'Grandmom', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
