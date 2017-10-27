class QuizController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @creator = User.find(@quiz.creator_id)
  end

  def new
    @quiz = Quiz.new

   1.times { @quiz.questions.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.creator_id = current_user.id

    if @quiz.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def play
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    if params['Shuffled_Questions'] == '1'
      @questions = @questions.shuffle
    end  
  end


  private
    def quiz_params
      params.require(:quiz).permit(:name, :category, questions_attributes: [
        :description, :correct_answer, :answer_option_1, :answer_option_2, :answer_option_3])
    end  
end
