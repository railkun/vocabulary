class WordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @words = current_user.words
    @tags = current_user.words.tag_counts_on(:tags)
  end
  def new
    @word = Word.new
  end
  def create
    @word = Word.new(word_params)
    @word.user = current_user
    if @word.save
      redirect_to root_path, notice: 'Word add'
    else
      render :new
    end
  end
  def edit
    @word = Word.find(params[:id])
  end
    def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      redirect_to root_path, notice: 'Book was updated'
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      redirect_to root_path, notice: 'Book was destroyed!!!'
    else
      redirect_to root_path, alert: 'Book wasnt destroyed'
    end
  end


  private

  def word_params
    params.require(:word).permit(:title, :translation, :tag_list)
  end
end
