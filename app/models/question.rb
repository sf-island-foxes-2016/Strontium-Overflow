require_relative 'vote_value'

class Question < ActiveRecord::Base
  include Vote_value
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable


end
