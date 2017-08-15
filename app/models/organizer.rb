class Organizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :events, dependent: :destroy
  self.per_page = 10

  validates :name, presence: true
  validates :description, presence: true
end
