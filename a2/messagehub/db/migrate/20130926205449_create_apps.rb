class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_title
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
