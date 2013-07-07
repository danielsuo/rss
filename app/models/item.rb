class Item < ActiveRecord::Base
  attr_accessible :description, :feed_id, :link, :title
  belongs_to :feed, inverse_of: :items, counter_cache: true
end
