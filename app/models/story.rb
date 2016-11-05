class Story < ActiveRecord::Base
  searchkick
  validates :title,  length: { minimum: 2 }, presence: true
  validates :body,  length: { minimum: 30 }, presence: true

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
