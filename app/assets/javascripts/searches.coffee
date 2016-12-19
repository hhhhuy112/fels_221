$(document).on 'ready page:load', (event) ->
  $(document).on 'change', '#index_questions_search select', (event) ->
    $.get $('#index_questions_search').attr('action'), $('#index_questions_search').serialize(), null, 'script'
    false
  $(document).on 'change', '#index_questions_search input:radio', (event) ->
    $.get $('#index_questions_search').attr('action'), $('#index_questions_search').serialize(), null, 'script'
    false
  $(document).on 'keyup', '#index_questions_search input', (event) ->
    $.get $('#index_questions_search').attr('action'), $('#index_questions_search').serialize(), null, 'script'
    false
  $(document).on 'click', '.pagination a', (event) ->
    event.preventDefault()
    $.getScript $(this).attr('href')
    false
