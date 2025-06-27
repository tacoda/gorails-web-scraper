class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.belongs_to :page, null: false, foreign_key: true
      t.boolean :success

      t.timestamps
    end
  end
end
