class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :production
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
