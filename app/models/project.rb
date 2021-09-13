class Project < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_one_attached :cover_image

  default_scope { order(created_at: :desc) }

  CATEGORIES = ['Graphic Design', 'Illustration', 'Photography', 'Interaction Design', 'Fashion', 'Product Design', 'Architecture', 'Advertising'].freeze

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :cover_image, content_type: ['image/jpeg', 'image/png', 'image/jpg'], presence: true
end
