class AddClassificationToAnalyses < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :classification, :string
  end
end
