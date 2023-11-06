$(document).on('turbolinks:load', () => {
  $("#deactive-club").on('click', () => {
    club_status = $("#club-status").val()
    club_id = window.location.href.split('/')[4]
    debugger
        $.ajax({
        type: "PATCH",
        url: `/clubs/${club_id}/deactivate_club`,
        data: {status: club_status},
        success: function(data){
            window.location.reload()
        }
    })
  })  
});