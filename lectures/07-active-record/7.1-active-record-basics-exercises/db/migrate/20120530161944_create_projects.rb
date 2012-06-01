class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :employees_count, :default => 0

      t.timestamps
    end
  end
end
