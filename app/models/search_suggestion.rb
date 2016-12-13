class SearchSuggestion < ApplicationRecord

  scope :terms_for, -> prefix do
    suggestions = where("term LIKE ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  scope :index_words, -> do
    Question.find_each do |question|
      self.index_term question.content
      question.content.split.each {|t| self.index_term(t)}
    end
  end

  scope :index_term, -> term do
    find_or_create_by(term: term.downcase).tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
