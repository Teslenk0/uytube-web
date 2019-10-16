$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#modificarPlaylist_btn");
    var isPlaylistPrivate = $("#is-playlist-private").attr("data-value");

    if (isPlaylistPrivate == "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }

    boton.on("click",function (e) {
        panel.empty();
        panel.load("modificarPlaylist.jsp");
    });

});