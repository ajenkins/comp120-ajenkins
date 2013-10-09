class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :app_id, null: false
      t.string :content, null: false
      t.string :username, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
