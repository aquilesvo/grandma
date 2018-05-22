class Grandmom < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true

  mount_uploader :photo, PhotoUploader
end
