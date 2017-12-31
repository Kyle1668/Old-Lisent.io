class AddUserKeyToAnalyses < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :user_key, :string
  end
end
