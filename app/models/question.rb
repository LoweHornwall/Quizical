class Question < ApplicationRecord
  belongs_to :quiz

  validates :description, :correct_answer, :answer_option_1, :answer_option_2, :answer_option_3, presence: true, length: {maximum: 128}

  def is_correct_answer(answer)
    if answer == self.correct_answer
      true
    else
      false  
    end  
  end
end
