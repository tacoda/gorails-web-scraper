class AddLastResultToPages < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :last_result_id, :integer
  end
end
