const comentar = $('#formComentario');
    comentar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;
        console.log(e.returnValue);

        let com = $('#comentario').val().trim();

        if(!com.existe){
            comentar.off('submit');
            comentar.submit();
        }
        else{
            var div = $("#error");
            $('#alertaRoja').remove();
            div.append('<p id="alertaRoja" style="color: red">El comentario esta vacio</p>');
        }
    })

