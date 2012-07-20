class Url < ActiveRecord::Base
  attr_accessible :key, :long_url
  
  BRICKS = [(0..9).to_a,("a".."z").to_a,("A".."Z").to_a].flatten!

   def self.generate_key
     key = []
     4.times do
       key << BRICKS[rand(BRICKS.length)]
     end
     key = key.join("")
   end
end
