class AddCreatorIdToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :creator_id, :integer
  end
end
