class AddNameToPages < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :name, :string
  end
end
