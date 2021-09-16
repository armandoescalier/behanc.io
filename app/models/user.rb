class User < ApplicationRecord
  has_one_attached :profile_picture
  has_many :projects, dependent: :destroy

  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :given_follows, source: :followed_user
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :occupation, :company, :country, :city
  validates :username, presence: true, uniqueness: true
  validates :profile_picture, content_type: ['image/jpeg', 'image/png', 'image/jpg']

  def full_name
    "#{first_name} #{last_name}"
  end

  def location
    "#{city}, #{country}"
  end

  def to_param
    username
  end
end
