$(document).on('turbolinks:load', () => {
    $("#deactive-city").on('click', () => {
        cityStatus = $("#city-status").val()
        cityId = window.location.href.split('/')[4]
        nameSearch = window.location.href.includes('=')
        name  = nameSearch ? window.location.href.split('=')[1] :  "" 
        name = name.split('20').length > 1 ? name.split('20')[1] : name
        debugger
            $.ajax({
            type: "PATCH",
            url: `/cities/${cityId}/deactivate_city`,
            data: {status: cityStatus, name_search: nameSearch, name: name},
            success: function(data){
                window.location.reload()
            }
        })
    })
});