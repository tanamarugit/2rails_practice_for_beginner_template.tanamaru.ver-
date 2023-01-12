class QuestionsController < ApplicationController
  before_action :login_required, except: %i[index]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))
    if @question.save
      redirect_to questions_path(@question), success: '質問を投稿しました。'
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, success: "質問「#{@question.title}」を更新しました。"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, success: "質問「#{@question.title}」を削除しました。"
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
