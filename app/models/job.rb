class Job < ActiveRecord::Base

  def self.search(term)
    term = "%#{term}%"
    where("LOWER(title) LIKE LOWER(?) or LOWER(description) LIKE LOWER(?)", term, term)
  end
end
