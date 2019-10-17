$(document).ready(function () {
    const panel = $("#panelcentral");

    $("#canal_btn").on("click",function (e) {
        panel.empty();
        panel.load("inicio.jsp");
    });

    $("#modificoVideo_btn").on("click",function (e) {
        panel.empty();
        panel.load("modificarVideo.jsp");
    });

    $("#altaVideo_btn").on("click",function (e) {

        panel.empty();
        panel.load("altaVideo.jsp");

    });

    $("#modificarPlaylist_btn").on("click",function (e) {
        panel.empty();
        panel.load("modificarPlaylist.jsp");
    });

    $("#modificoUser_btn").on("click",function (e) {
        panel.empty();
        panel.load("modificarUser.jsp");
    });

});