class Click < ActiveRecord::Base
  belongs_to :url
  # attr_accessible :title, :body
  def count
    Click.where(self.url.id).count
  end


end
