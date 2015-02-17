class Artist < ActiveRecord::Base
  scope :query,  ->(query){ where("lower(name) LIKE ?", "%#{query.downcase}%") }
end
