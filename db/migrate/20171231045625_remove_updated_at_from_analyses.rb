class RemoveUpdatedAtFromAnalyses < ActiveRecord::Migration[5.1]
  def change
    remove_column :analyses, :updated_at, :string
  end
end
