$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#modificoUser_btn");
    var videos = $("#modificarVideo_btn");
    var playlist = $("#modificarPlaylist_btn");
    var isChannelPrivate = $("#is-channel-private").attr("data-value");

    if (isChannelPrivate == "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }

    boton.on("click",function (e) {
        panel.empty();
        panel.load("modificarUser.jsp");
    });

    videos.on("click",function (e) {
        panel.empty();
        panel.load("modificarVideo.jsp");
    });

    playlist.on("click",function (e) {
        panel.empty();
        panel.load("modificarPlaylist.jsp");
    });
});