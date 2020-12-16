class Language < ApplicationRecord
  has_many :languages_projects
  has_many :projects, through: :languages_projects

  mount_uploader :picture, PictureUploader

  validates :name, presence: true
end
