class Category < ActiveRecord::Base
  has_many :stories
end
