require 'pry'
class Article < ActiveRecord::Base

  def self.populate(article_params)
    establish_client
    @article = Article.new()
    results = []
      @@client.search(article_params["title"], result_type: "popular").take(5).collect do |tweet|
        results.push("#{tweet.user.screen_name}: #{tweet.text}")
      end
    @article.title = article_params["title"]
    @article.tweet_1 = results[0]
    @article.tweet_2 = results[1]
    @article.tweet_3 = results[2]
    @article.tweet_4 = results[3]
    @article.tweet_5 = results[4]
    @article.save
  end

  def self.establish_client
    @@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_consumer_key"]
      config.consumer_secret     = ENV["twitter_consumer_secret"]
      config.access_token        = ENV["twitter_access_token"]
      config.access_token_secret = ENV["twitter_access_token_secret"]
    end
  end

end
