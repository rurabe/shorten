class Url < ActiveRecord::Base
  attr_accessible :key, :long_url
  has_many :clicks
  validates :long_url, :format => { :with => URI::regexp, :error => "Please use http://" }
  
  BRICKS = [(0..9).to_a,("a".."z").to_a,("A".."Z").to_a].flatten!
  BASE = "http://srl.herokuapp.com"

   before_create :set_key
   
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
     Url.joins("LEFT OUTER JOIN clicks on urls.id = clicks.url_id")
        .group("urls.id")
        .order("COUNT(clicks.id) DESC")
   end

   protected

    def set_key
      warn self.key.blank?.inspect
      self.key.blank? ? self.key = random_key : self.key =  custom_key
    end

    def random_key
     key = []
     4.times { key << BRICKS[rand(BRICKS.length)] }
     key = key.join("")
    end

    def custom_key
      self.key.parameterize
    end
     
end
