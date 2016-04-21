$(document).ready(function(){
  $(".exercise").one('click', function(){
    var exercise = $(this).data('exercise');
    var user = $(this).data('user');
    addExercise(exercise, user);
  });
});

function addExercise(exercise, user) {
  $.post({
    url: '/' + user + '/exercises',
    data: { "exercise": exercise },
    success: function(res) {
      console.log("cool")
    }
  });
}
