$(document).ready(function(){
  $(".tutorial").one('click', function(){
    var user = $(this).data('user');
    createPurgatory(user);
  });
});

function createPurgatory(user) {
  $.post({
    url: '/' + user + '/purgatory',
    success: function(res) {
    }
  });
}
