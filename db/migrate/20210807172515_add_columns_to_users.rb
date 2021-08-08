class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string, null: false, unique: true
  	add_column :users, :email, :string, null: false, index: true, unique: true
  	add_column :users, :password_digest, :string
  	add_column :users, :role, :string, null: false, default: 'user'
  	add_column :users, :last_login, :datetime	
  end
end
