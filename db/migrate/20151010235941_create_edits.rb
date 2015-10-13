class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :notes
      t.text :line_edits
      t.text :suggestion

      t.belongs_to :user, index: true
      t.belongs_to :submission, index: true

      t.timestamps null: false
    end
  end
end



# t.integer :user_id
# t.integer :submission_id
