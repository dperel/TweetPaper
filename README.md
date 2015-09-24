# TweetPaper

TweetPaper is a side project app that I built in about a day and a half using Ruby on Rails and some basic CSS to give a newspaper-y look to Twitter.

This is the **vanilla** version - no javascript. I'll upload a version with a different front end to compare them.

**Vimeo demo of  app: https://vimeo.com/140255173**

To run: Clone the repo, run 'bundle install' in terminal. You will need to add the following to your application.yml file. All tokens can be obtained from dev.twitter.com. 
<pre><code>
  twitter_consumer_key: "xxxx"
  twitter_consumer_secret: "xxxx"
  twitter_access_token: "xxx"
  twitter_access_token_secret: "xxx"
  </code></pre>
  
 Once that is set up, run rails server and navigate to localhost:3000 to get started.
