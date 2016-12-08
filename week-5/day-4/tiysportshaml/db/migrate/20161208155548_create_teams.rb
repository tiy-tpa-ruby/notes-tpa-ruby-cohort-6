class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :mascot
      t.string :sport
      t.string :image_url

      t.timestamps
    end
  end
end
