require 'pry'
class Article < ActiveRecord::Base
belongs_to :user

  def self.populate(article_params, current_user)
    establish_client(current_user)
    @article = Article.new()
    results, media = [], []
    @@client.search(article_params["title"], result_type: "popular").take(5).collect do |tweet|
        results.push(tweet)
      end

      #need to clean up this mess/mass assignment

    @article.title = article_params["title"].capitalize
    @article.picture_url = results[0].media[0].to_hash[:media_url] if results[0].media?
    @article.tweet_1 = "#{results[0].user.screen_name}: #{results[0].text}"
    @article.tweet_2 = "#{results[1].user.screen_name}: #{results[1].text}"
    @article.tweet_3 = "#{results[2].user.screen_name}: #{results[2].text}"
    @article.tweet_4 = "#{results[3].user.screen_name}: #{results[3].text}"
    @article.tweet_5 = "#{results[4].user.screen_name}: #{results[4].text}"
    @article.user = current_user
    @article.save
  end


  def self.establish_client(current_user)
    @@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_consumer_key"]
      config.consumer_secret     = ENV["twitter_consumer_secret"]
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end
  end

end
