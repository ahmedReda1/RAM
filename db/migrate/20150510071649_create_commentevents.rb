class CreateCommentevents < ActiveRecord::Migration
  def change
    create_table :commentevents do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :commentbody

      t.timestamps null: false
    end
  end
end
