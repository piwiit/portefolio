class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desciption
      t.text :url

      t.timestamps
    end
  end
end
