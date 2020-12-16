class CreateLanguagesProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :languages_projects do |t|

      t.timestamps
    end
  end
end
