class AddquizIdToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :quiz_id, :integer
  end
end
