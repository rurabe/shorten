class Url < ActiveRecord::Base
  attr_accessible :key, :long_url
  has_many :clicks
  validates :long_url, :format => { :with => URI::regexp, :error => "Please use http://" }
  
  BRICKS = [(0..9).to_a,("a".."z").to_a,("A".."Z").to_a].flatten!
  BASE = "http://srl.herokuapp.com"

   def self.generate_key
     key = []
     4.times do
       key << BRICKS[rand(BRICKS.length)]
     end
     key = key.join("")
   end
   
   def to_s
     "#{BASE}/#{self.key}"
   end
   
   def clicks_count
     self.clicks.count
   end
   
   def self.most_recent
     Url.order("created_at DESC")
   end
   
   def self.most_popular
     Url.joins(:clicks).group("urls.id").order("COUNT(clicks.id) DESC")
   end
     
end
