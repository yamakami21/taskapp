class AddDetailsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :done, :boolean
    add_column :tasks, :project, :reference
  end
end
