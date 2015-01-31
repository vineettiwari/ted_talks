class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :talk

      t.timestamps null: false
    end
  end
end
