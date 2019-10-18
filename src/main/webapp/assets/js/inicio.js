$(document).ready(function () {


    $("#videos-tab").click();

    //le doy a el movimiento de las pestanas
    $('#myTab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')
      });
    
    //capturo el evento click
    $('#videos-tab').on('click', function (e) {
        e.target; // newly activated tab
        e.relatedTarget; // previous active tab
        $("#videos").load("videos.jsp");
    });
    
    $('#playlists-tab').on('click', function (e) {
        e.target; // newly activated tab
        e.relatedTarget; // previous active tab
        $("#playlists").load("playlists.jsp");
    });


    
});
