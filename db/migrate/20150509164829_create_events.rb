class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.datetime :date
      t.string :place
      t.integer :member
      t.references :meeting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
