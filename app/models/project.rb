class Project < ApplicationRecord
  has_many :languages_projects
  has_many :languages, through: :languages_projects

  mount_uploader :picture, PictureUploader

  validates :title, :description, :url, presence: true
end
