class WordsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @words_count = current_user.words.count
    @words = current_user.words.page(params[:page])
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
    @word = current_user.words.find(params[:id])
  end
    def update
    @word = current_user.words.find(params[:id])
    if @word.update_attributes(word_params)
      redirect_to root_path, notice: 'Book was updated'
    else
      render :edit
    end
  end

  def destroy
    @word = current_user.words.find(params[:id])
    if @word.destroy
      redirect_to root_path, notice: 'Book was destroyed!!!'
    else
      redirect_to root_path, alert: 'Book wasnt destroyed'
    end
  end

  def tag
    @words = current_user.words.tagged_with(params[:tag_name]).page(params[:page])
    @tags = current_user.words.tag_counts_on(:tags)
  end

  def profile
  end

  private

  def word_params
    params.require(:word).permit(:title, :translation, :tag_list)
  end
end
