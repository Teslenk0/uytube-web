$(document).ready(function () {
    $('#validateForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nombre: {
                validators: {
                    stringLength: {
                        min: 5,
                        message: 'Por favor ingresa un nombre con un largo minimo de 5 caracteres'
                    },
                    notEmpty: {
                        message: 'Por favor ingresa un nombre'
                    }
                }
            },
            apellido: {
                validators: {
                    stringLength: {
                        min:5,
                        message: 'Por favor ingresa un apellido con un largo minimo de 5 caracteres'
                    },
                    notEmpty: {
                        message: 'Por favor ingresa un apellido'
                    }
                }
            },
            nickname: {
                validators: {
                    stringLength: {
                        min: 5,
                        message:'Por favor ingresa un nickname con un largo minimo de 5 caracteres'
                    },
                    notEmpty: {
                        message: 'Por favor ingresa un nickname'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Por favor ingresa un email'
                    },
                    emailAddress: {
                        message: 'Por favor ingresa un email valido'
                    }
                }
            },
            fechaNac: {
                validators: {
                    notEmpty: {
                        message: 'Por favor ingresa una fecha de nacimiento'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'Por favor ingresa una contraseña'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'Por favor confirma la contraseña'
                    },
                    identical: {
                        field: 'password',
                        message: 'Las contraseñas no coinciden'
                    }
                }
            },
            descripcion: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 400,
                        message: 'Por favor ingresa la descripcion, maximo 400 caracteres'
                    },
                    notEmpty: {
                        message: 'Por favor ingresa una descripcion'
                    }
                }
            },
        }
    });

    const form = $("#submitForm");
    form.click(function (e) {
        e.preventDefault();
        e.returnValue = false;

        var datos = {
            nickname: $('#nickname').val().trim(),
            email: $('#email').val().trim(),
            canal: $('#nomCanal').val().trim()
        };

        $.ajax({
            type: 'get',
            url: 'ValidarRegistroServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                datos: JSON.stringify(datos)
            },
            success: function (response) {
                if(!response.nickname && !response.email && !response.canal){
                    const formu  = $('#validateForm');
                    formu.off('submit');
                    formu.submit();

                }else{
                    $('#alertaNick').remove();
                    $('#alertaEmail').remove();
                    $('#alertaCanal').remove();
                    if(response.nickname) {
                        var div = $("#dNickname");
                        div.append('<p style="color: red" id="alertaNick">El nickname ya esta en uso</p>');
                    }
                    if(response.email) {
                        var div = $("#dEmail");
                        div.append('<p style="color: red" id="alertaEmail">El email ya esta en uso</p>');
                    }
                    if(response.canal) {
                        var div = $("#dCanal");
                        div.append('<p style="color: red" id="alertaCanal">El nombre del canal ya esta en uso</p>');
                    }
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});