$(document).on('ready page:load', function(event) {
  $(document).on('click', '.index_users .pagination a', function (event) {
    event.preventDefault();
    $.getScript($(this).attr('href'));
    return false;
  });
  $(document).on('keyup', '.index_users #index_users_search input', function (event) {
    $.get($('.index_users #index_users_search').attr('action'), $('.index_users #index_users_search').serialize(), null, 'script');
    return false;
  });
});
