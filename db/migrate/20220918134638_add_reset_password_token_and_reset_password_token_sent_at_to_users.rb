class AddResetPasswordTokenAndResetPasswordTokenSentAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password_token_sent_at, :datetime
    add_column :users, :reset_password_token, :string
    add_index :users,  :reset_password_token
  end
end
