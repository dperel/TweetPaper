class Article < ActiveRecord::Base

  def create_article
    #method here will query Twitter API, pull top 5 tweets on the searched subject, and store as attributes of that article
  end

  def refresh_all
    
  end

end
