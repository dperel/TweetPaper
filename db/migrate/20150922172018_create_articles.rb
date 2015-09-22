class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :tweet_1
      t.string :tweet_2
      t.string :tweet_3
      t.string :tweet_4
      t.string :tweet_5
#will add pic 
      t.timestamps null: false
    end
  end
end
