namespace :search_suggestions do
  desc Settings.task.searches_desc
  task index: :environment do
    SearchSuggestion.index_words
  end
end
