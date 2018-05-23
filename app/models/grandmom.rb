class Grandmom < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :users, through: :bookings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
