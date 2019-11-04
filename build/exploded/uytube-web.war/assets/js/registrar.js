$(document).ready(function() {
    $('.datepicker').datepicker();
    $('textarea#descripcion').characterCounter();
    $('.datepicker').datepicker({
        firstDay: true,
        format: 'yyyy-mm-dd',
        minDate: new Date(1950,1,1),
        maxDate: new Date(2019,9,22),
        i18n: {
            months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"],
            weekdays: ["Domingo","Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
            weekdaysShort: ["Dom","Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
            weekdaysAbbrev: ["D","L", "M", "M", "J", "V", "S"]
        }
    });
});

const nombre = document.getElementById('nombre');
const apellido = document.getElementById('apellido');
const nickname = document.getElementById('nickname');
const email = document.getElementById('email');
const fecha = document.getElementById('fechaNac');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirmPassword');
const canal = document.getElementById('nomCanal');
const desc = document.getElementById('descripcion');
const form = document.getElementById('bodyForm');

const green = '#4CAF50';
const red = '#F44336';

form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (
        validateNombre() &&
        validateApellido() &&
        validateNickname() &&
        validateEmail() &&
        fecha.checkValidity() &&
        validatePassword() &&
        validateConfirmPassword() &&
        validateCanal() &&
        desc.checkValidity()
    ) {
        setTimeout(carga, 1000);
        document.getElementById('LBar').className = '';
        function carga() {
            const datos = {
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
                    document.getElementById('LBar').className = 'hide';
                    if(!response.nickname && !response.email && !response.canal){
                        const form = $('#bodyForm');
                        form.off();
                        form.submit();
                    }else{
                        if(response.nickname) {
                            setInvalid(nickname, 'Este nickname ya se encuentra en uso');
                        }
                        if(response.email) {
                            setInvalid(email, 'Este email ya se encuentra en uso');
                        }
                        if(response.canal) {
                            setInvalid(canal, 'Este nombre de canal ya se encuentra en uso');
                        }
                    }
                },
                error: function (data) {
                    document.getElementById('LBar').className = 'hide';
                    console.log("ERROR: Fallo la peticion hacia el servlet");
                }
            });
        }
    }
});

function validateNombre() {
    if (checkIfEmpty(nombre)) return;
    if (!checkIfOnlyLetters(nombre)) return;
    return true;
}
function validateApellido() {
    if (checkIfEmpty(apellido)) return;
    if (!checkIfOnlyLetters(apellido)) return;
    return true;
}
function validateNickname() {
    if (checkIfEmpty(nickname)) return;
    return true;
}
function validateEmail() {
    if (checkIfEmpty(email)) return;
    if (!containsCharacters(email, 5)) return;
    return true;
}
function validatePassword() {
    if (checkIfEmpty(password)) return;
    if (!meetLength(password, 4, 100)) return;
    if (!containsCharacters(password, 2)) return;
    return true;
}
function validateConfirmPassword() {
    if (password.className !== 'valid') {
        setInvalid(confirmPassword, 'La contraseña debe ser valida');
        return;
    }
    if (password.value !== confirmPassword.value) {
        setInvalid(confirmPassword, 'Las contraseñas deben coincidir');
        return;
    } else {
        setValid(confirmPassword);
    }
    return true;
}
function validateCanal() {
    setValid(canal);
    return true;
}

// Funciones de utilidad
function checkIfEmpty(field) {
    if (isEmpty(field.value.trim())) {
        setInvalid(field, `Este campo es obligatorio`);
        return true;
    } else {
        setValid(field);
        return false;
    }
}
function isEmpty(value) {
    return value === '';

}
function setInvalid(field, message) {
    field.className = 'invalid';
    field.nextElementSibling.innerHTML = message;
    field.nextElementSibling.style.color = red;
}
function setValid(field) {
    field.className = 'valid';
    field.nextElementSibling.innerHTML = '';
    field.nextElementSibling.style.color = green;
}
function checkIfOnlyLetters(field) {
    if (/^[a-zA-Z ]+$/.test(field.value)) {
        setValid(field);
        return true;
    } else {
        setInvalid(field, `Este campo solo admite letras`);
        return false;
    }
}
function meetLength(field, minLength, maxLength) {
    if (field.value.length >= minLength && field.value.length < maxLength) {
        setValid(field);
        return true;
    } else if (field.value.length < minLength) {
        setInvalid(
            field,
            `Este campo debe contener al menos ${minLength} carácteres`
        );
        return false;
    } else {
        setInvalid(
            field,
            `Este campo debe contener menos de ${maxLength} carácteres`
        );
        return false;
    }
}
function containsCharacters(field, code) {
    let regEx;
    switch (code) {
        case 1:
            // letters
            regEx = /(?=.*[a-zA-Z])/;
            return matchWithRegEx(regEx, field, 'Debe contener al menos una letra');
        case 2:
            // letter and numbers
            regEx = /(?=.*\d)(?=.*[a-zA-Z])/;
            return matchWithRegEx(
                regEx,
                field,
                'Debe contener al menos una letra y un número'
            );
        case 3:
            // uppercase, lowercase and number
            regEx = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/;
            return matchWithRegEx(
                regEx,
                field,
                'Debe contener al menos una letra, un número, una mayúscula y una minúscula'
            );
        case 4:
            // uppercase, lowercase, number and special char
            regEx = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)/;
            return matchWithRegEx(
                regEx,
                field,
                'Debe contener al menos una letra, un número, una mayúscula, una minúscula y un carácter especial'
            );
        case 5:
            // Email pattern
            regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return matchWithRegEx(regEx, field, 'Debe ser un email valido');
        default:
            return false;
    }
}
function matchWithRegEx(regEx, field, message) {
    if (field.value.match(regEx)) {
        setValid(field);
        return true;
    } else {
        setInvalid(field, message);
        return false;
    }
}