class AddScreenshotToProject < ActiveRecord::Migration
  def change
    add_column :projects, :screenshot, :string
  end
end
