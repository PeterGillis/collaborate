class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :tracks
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :requests, through: :tracks
  has_many :submissions
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :final_tracks
  has_many :messages
end
