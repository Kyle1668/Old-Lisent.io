class AddPposToAnalyses < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :ppos, :float
  end
end
