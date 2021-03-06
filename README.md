# TweetPaper

TweetPaper is a side project app that I built in about a day and a half using Ruby on Rails, AJAX, and some basic CSS to give a newspaper-y look to Twitter.

**Video demo of AJAXified app: https://vimeo.com/140348915**

Video demo of earlier version, without AJAX: https://vimeo.com/140255173

To run: Clone the repo, run 'bundle install' in terminal. You will need to add the following to your application.yml file. All tokens can be obtained from dev.twitter.com.

  <pre><code>twitter_consumer_key: "xxxx"
             twitter_consumer_secret: "xxxx"
             twitter_access_token: "xxx"
             twitter_access_token_secret: "xxx"
  </code></pre>

 Once that is set up, run rails server and navigate to localhost:3000 to get started.


**Refactoring:** 
I think this app could be improved in several ways. It would be nice to have the feeds autorefresh every minute and even cycle through different articles. Background processing would fit perfectly in this situation. 

Links could be parsed out of the tweets and featured as a small --> type element at the end of each tweet. 

As a more far-out feature, an interest-based clipping service would be a useful feature. Tweets contaning more than one of your interests could be saved into a "for you" category. 
