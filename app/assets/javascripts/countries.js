$(document).on('turbolinks:load', () => {
    $("#deactive-country").on('click', () => {
        country_status = $("#country-status").val()
        country_id = window.location.href.split('/')[4]
        debugger
            $.ajax({
            type: "PATCH",
            url: `/countries/${country_id}/deactivate_country`,
            data: {status: country_status},
            success: function(data){
                window.location.reload()
            }
        })
    })
});