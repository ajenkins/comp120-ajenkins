class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_title, null: false
      t.text :description, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
