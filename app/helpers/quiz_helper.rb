module QuizHelper
  def link_to_add_question(name, f)
    new_object = f.object.questions.build
    fields = f.fields_for(:questions, new_object, :child_index => 'new_questions') do |builder|
      render('question_form', :f => builder)
    end
    link_to name, '', :onclick => "add_question(this, \"#{escape_javascript(fields)}\")", :remote => true
  end

  def link_to_check_answer(question, answer)
    result = question.is_correct_answer(answer)

    link_to answer, '', :onclick => "show_result(this, \"#{result}\")", :remote => true
  end
end
