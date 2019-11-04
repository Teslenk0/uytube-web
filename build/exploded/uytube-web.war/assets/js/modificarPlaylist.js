$(document).ready(function () {
    const isPlaylistPrivate = $("#is-lista-private").attr("data-value");

    if (isPlaylistPrivate === "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }

});