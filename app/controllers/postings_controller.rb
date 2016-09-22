class PostingsController < ApplicationController


  def index
    if params[:search]
      @postings = Posting.search(params[:search]).order(updated_at: :desc).page(params[:page]).per(10)
    else
      @postings = Posting.all.page(params[:page]).per(10)
    end
  end

  def show
    @posting = Posting.find(params[:id])
    @user = User.find(@posting.user_id)
    @submital = @posting.submitals.new
  end


private

  def search
    @postings = Posting.where(description: params[:search])
  end

end
