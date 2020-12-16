class AddPictureToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :picture, :string
  end
end
