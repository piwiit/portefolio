class AddPictureToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :picture, :string
  end
end
