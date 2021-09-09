class User < ApplicationRecord
  has_one_attached :profile_picture
  has_many :projects, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :occupation, :company, :country, :city
  validates :username, presence: true, uniqueness: true
  validates :profile_picture, content_type: ["image/jpeg", "image/png", "image/jpg"]

  def full_name
    "#{first_name} #{last_name}"
  end

  def location
    "#{city}, #{country}"
  end
end
