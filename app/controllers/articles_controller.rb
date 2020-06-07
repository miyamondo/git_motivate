class ArticlesController < ApplicationController
  before_action :twetter_client, only: [:create]
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      #/rで改行する
      @client.update("#{@article.title}/r")
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title)
  end
  
  def twetter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "Y2cLQWeVDwB9jkvV04hRECSHE"
      config.consumer_secret = "VAbo29Z0P50h7qkthDe3dJBBSlww0a7ZGVt7iADJc20a5SP4Jd"
      config.access_token = "1084763623505899520-4JDnOMf2rdePs50Ci4dire41wK7haT"
      config.access_token_secret ="NcUg47PwDgPvCxky8cvVQHeQmb8yoN6Epl5yDdZsc6Q9X"
    end
  end
  
  
end