function startTimer(duration, displayMinute, displaySecond) {
  var timer = duration,
  displayMinute, displaySecond;
  var timeIntervalID = setInterval(function () {
    minutes = parseInt(timer / 60, 10)    
    seconds = parseInt(timer % 60, 10);   
    minutes = minutes < 10 ? "0" + minutes : minutes;    
    seconds = seconds < 10 ? "0" + seconds : seconds;    
    displayMinute.textContent = minutes;    
    displaySecond.textContent = seconds;
    if (--timer < -1) {     
      timer = 0;  
      displaySecond.textContent = "00";      
      if (timer == 0) {    
        clearInterval(timeIntervalID);        
        $("#new_lesson").submit();        
      }      
    }    
  }, 1000);  
};

$(document).ready(function() {
  return $('input[type=radio]').change(function() {
    var numberOfCheckedRadio;
    numberOfCheckedRadio = $('input:radio:checked').length;
    return $('#answer_count').html(numberOfCheckedRadio);
  });
});

$(document).ready(function () {
  var fragmentTime;
  $('.timeout_message_show').hide();
  var minutes = jQuery('span.minute').text();
  var seconds = jQuery('span.second').text();
  minutes = parseInt(minutes);
  seconds = parseInt(seconds);
  if (isNaN(minutes)) {
    minutes = 00;
  }
  if (isNaN(seconds)) {
    seconds = 00;
  }
  if (minutes == 60) {
    minutes = 59;
  }
  if (seconds == 60) {
    seconds = 59;
  }
  fragmentTime = (60 * minutes) + (seconds);
  displayMinute = document.querySelector('span.minute');
  displaySecond = document.querySelector('span.second');
  startTimer(fragmentTime, displayMinute, displaySecond);
});
