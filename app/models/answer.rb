require_relative 'vote_value'

class Answer < ActiveRecord::Base
  include Vote_value

  belongs_to :user
  belongs_to :question

  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
end


