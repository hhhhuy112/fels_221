$(document).on('ready page:load', function(event) {
  $(document).on('click', '#show_user .pagination a', function (event) {
    event.preventDefault();
    $.getScript($(this).attr('href'));
    return false;
  });
});
