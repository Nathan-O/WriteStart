class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :notes
      t.text :line_edits
      t.text :suggestion

      t.timestamps null: false
    end
  end
end
