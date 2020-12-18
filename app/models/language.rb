class Language < ApplicationRecord
  has_many :languages_projects
  has_many :projects, through: :languages_projects

  has_one_attached :picture

  validates :name, presence: true
end
