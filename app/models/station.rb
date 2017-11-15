class Station < ActiveRecord::Base
  has_many :trips
  has_many :bikes, through: :trips
end
