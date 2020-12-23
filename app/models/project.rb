class Project < ApplicationRecord
  has_many :languages_projects
  has_many :languages, through: :languages_projects

  has_one_attached :picture
  validates :title, :description, :url, presence: true
end
