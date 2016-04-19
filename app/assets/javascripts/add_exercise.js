$(document).ready(function(){
  $(".exercise").one('click', function(){
    var exercise = $(this).data('exercise');
    var user = $(this).data('user');
    addExercise(exercise, user);
  });
});

function addExercise(exercise, user) {
  $.ajax({
    method: 'post',
    url: '/' + user + '/exercises',
    data: { "user": user,
            "exercise": exercise },
    success: function(res) {
      console.log("cool")
    }
  });
}
