class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :technologies
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
