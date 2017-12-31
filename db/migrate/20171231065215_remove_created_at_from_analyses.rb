class RemoveCreatedAtFromAnalyses < ActiveRecord::Migration[5.1]
  def change
    remove_column :analyses, :created_at, :string
  end
end
