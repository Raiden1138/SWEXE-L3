class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create    
    tweet = Tweet.new(message: params[:tweet][:message], tdate:
    Time.current)
    unless tweet.save
      flash[:message]="文字数が1以上140未満でないので投稿されませんでした"
    else
      flash[:message]="ツイートが投稿されました"
    end
    redirect_to '/'
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
    flash[:message]="ツイートが削除されました"
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message])
    redirect_to '/'
    unless tweet.save
      flash[:message]="文字数が140を超えたので編集されませんでした"
    else
      flash[:message]="ツイートが編集されました"
    end
  end
end