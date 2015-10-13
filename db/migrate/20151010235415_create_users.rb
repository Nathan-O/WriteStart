class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :pseudonym
      t.string :profile_photo_url
      t.string :publications_title
      t.string :publications_url
      t.string :user_site_title
      t.string :user_site_url



      t.timestamps null: false
    end
  end
end

# t.integer :submission_id
# t.integer :edit_id
