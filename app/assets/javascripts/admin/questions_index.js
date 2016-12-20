$(document).on('ready page:load', function(event) {
   $(document).on('click', '.index_questions .pagination a', function (event) {
    event.preventDefault();
    $.getScript($(this).attr('href'));
    return false;
  });
  $(document).on('change', '.index_questions #index_questions_search select', function (event) {
    $.get($('.index_questions #index_questions_search').attr('action'), $('.index_questions #index_questions_search').serialize(), null, 'script');
    return false;
  });
  $(document).on('keyup', '.index_questions #index_questions_search input', function (event) {
    $.get($('.index_questions #index_questions_search').attr('action'), $('.index_questions #index_questions_search').serialize(), null, 'script');
    return false;
  });
});
