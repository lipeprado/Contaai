class Story < ActiveRecord::Base
    ratyrate_rateable "gostei", "mentira"
  acts_as_votable
  belongs_to :category
  belongs_to :user
  has_many :comments


  def self.top
    order(cached_votes_score: :desc).limit(5)
  end

  def self.random
    limit(5).order("RANDOM()")
  end
end
