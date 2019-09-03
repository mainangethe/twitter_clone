# index emails in the system for ease of searching and
# ensure they are unique to avoid duplicate emails in the db
class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
  end
end
