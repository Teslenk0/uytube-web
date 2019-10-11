$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#modificoUser_btn");
    console.log("hola");
    boton.on("click",function (e) {

        panel.empty();
       panel.load("modificarUser.jsp");

    });
});