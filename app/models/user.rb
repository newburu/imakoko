class User < ApplicationRecord
  has_many :locations

  def last_location
    self.locations.last || Location.new
  end

end
