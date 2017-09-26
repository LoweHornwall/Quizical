class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :description
      t.string :correct_answer
      t.string :answer_option_1
      t.string :answer_option_2
      t.string :answer_option_3
      t.timestamps
    end
  end
end
