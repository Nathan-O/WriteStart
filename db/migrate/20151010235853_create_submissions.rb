class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :content
      t.string :genre
      t.text :summary

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end



# t.integer :user_id
# t.integer :edit_id
