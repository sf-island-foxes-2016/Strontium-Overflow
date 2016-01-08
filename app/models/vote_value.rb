module Vote_value

  def vote_value
    vote_array = self.votes.map {|vote| vote.approval}
    vote_counts = Hash.new 0
    vote_array.each {|value| vote_counts[value] += 1 }
    vote_counts[true] - vote_counts[false]
  end

end
