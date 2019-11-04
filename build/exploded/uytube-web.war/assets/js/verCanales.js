$(document).ready(function () {

    $('#myTab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')
      });

    $('#videos-tab').on('click', function (e) {
        e.target;
        e.relatedTarget;
        $("#videos").load("videosCanal.jsp");
    });
    
    $('#playlists-tab').on('click', function (e) {
        e.target;
        e.relatedTarget;
        $("#playlists").load("listasParticularCanales.jsp");
    });

    $('#informacion-tab').on('click', function (e) {
        e.target;
        e.relatedTarget;
        $("#informacion").load("infoCanales.jsp");
    });

    $('#social-tab').on('click', function (e) {
        e.target;
        e.relatedTarget;
        $("#social").load("socialCanales.jsp");
    });
});
