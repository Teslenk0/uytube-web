$(document).ready(function () {
    var isChannelPrivate = $("#is-channel-private").attr("data-value");

    if (isChannelPrivate === "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }
});