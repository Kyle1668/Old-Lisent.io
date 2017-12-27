class AddArguedTextToAnalyses < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :argued_text, :text
  end
end
