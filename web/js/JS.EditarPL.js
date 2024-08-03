const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input, #formulario select');

const productos = {
    "OPTIMIN EXTEND MAX V5": {
        expresiones: {
            solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/, //Rango 52-54
            pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.[0-6](\d{1,2})?|8\.70(\.0{1,2})?)\b/, //Rango 6,9-8,7
            ku: /\b(?:60(\.\d+)?|6[0-9](\.\d+)?|70\.0)\b/, //Rango 60-70   
            Brigh: /\b(?:89(\.\d+)?|9[0-2](\.\d+)?|93\.0)\b/, //Rango 89-93
            Wh: /\b(?:85(\.\d+)?|8[6-9](\.\d+)?|90\.0)\b///Rango 85-90

                    //   cP: /\b(?:300(\.\d+)?|3\d{2}(\.\d+)?|4\d{2}(\.\d+)?|5\d{2}(\.\d+)?|600(\.0+)?)\b/, //Rango

        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            //  cP: false,
            Brigh: false,
            Wh: false
        }
    },

    "OPTIMIN EXTEND MAX": {
        expresiones: {
            solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/, // Rango 52-54
            pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.0\d?|8\.1\d?)\b/, // Rango 6.9-8.1
            ku: /\b(?:6[4-9](\.\d+)?|7\d(\.\d+)?|8[0-5](\.\d+)?|86(?:\.0|(?=$)))\b/, //Rango 75-86 
            r325: /\b0\.(0[1-9]|[1-1](0))\b/, //Rango Max 0.10        
            Wh: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/  //Rango 78-84
        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            Wh: false
        }
    },

    "CAOMIN L055": {
        expresiones: {
            solidos: /\b(?:50(\.\d+)?|51(\.[0-9]{1,2})?)\b/, // Rango = 50-52
            pH: /\b(?:6(\.\d{1,2})?|7(\.\d{1,2})?|8(\.0))\b/, // Rango = 6.0-8.0
            r325: /\b0\.(0[1-9]|[1-3][0-9]|[1-3][0-9]{2}|40)\b/, // Rango = 0.40 Max
            ku: /^(?:7[5-9](?:\.\d{1,2})?|8[0-9](?:\.\d{1,2})?|90(?:\.\d{1,2})?|91(?:\.\d{1,2})?|92(?:\.\d{1,2})?|93(?:\.\d{1,2})?|94(?:\.\d{1,2})?|95(?:\.0{0,2})?)$/, // Rango = 75-95
            cP: /^(?:100(?:\.\d{1,2})?|[1-7]\d{2}(?:\.\d{1,2})?|800(?:\.0{0,2})?)$/, // Rango = MAx 800
            Brigh: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{0,2})?)$/, // Rango = 78-84
            Wh: /\b(?:61(\.\d+)?|6[2-9](\.\d+)?|70(\.0))\b/, // Rango = 61-70
            Dv50: /\b(?:8(\.\d+)?|9(\.\d+)?|10(\.\d+)?|11(\.\d+)?|12(\.0))\b/ // Rango = 8-12
        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            cP: false,
            Brigh: false,
            Wh: false,
            Dv50: false
        }
    },

    "OPTIMIN L1117": {
        expresiones: {
            solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/,
            pH: /\b(?:6(?:\.0{1,2}|(?:\.[0-9]{1,2})?)|7(?:\.0{1,2}|(?:\.[0-9]{1,2})?)|8\.0{1,2})\b/, //Rango 6  - 8.0
            r325:/^(?:0(?:\.[0-4]?\d?)?|0\.50)$/,
            ku: /\b(?:5[7-9](\.\d+)?|6[0-9](\.\d+)?|70(?:\.0{1,2})?)\b/, //Rango 57-70.0
            //  cP: /\b(?:300(\.\d+)?|3\d{2}(\.\d+)?|4\d{2}(\.\d+)?|5\d{2}(\.\d+)?|600(\.0+)?)\b/,
            Brigh: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/, //Rango 78-84
            Wh: /^(?:6[5-9](?:\.\d{1,2})?|70(?:\.\d{1,2})?|71(?:\.0{1,2})?)$/, //Rango 65-71
            Brigh_Leneta: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/, //Rango 78-84
            Wh_Leneta: /^(?:6[5-9](?:\.\d{1,2})?|70(?:\.\d{1,2})?|71(?:\.0{1,2})?)$/, //Rango 65-71
            Dv50: /^(?:7\.5\d*|7\.[6-9]\d*|8\.\d*|9\.\d*|10\.\d*|11\.\d*|12(?:\.0{1,2})?)$/, //Rango 7.5-12.0
            Dv90: /^(?:28\.0|28\.[0-9]{1,2}|29\.[0-9]{1,2}|30\.[0-9]{1,2}|31\.[0-9]{1,2}|32\.[0-9]{1,2}|33\.[0-9]{1,2}|34\.[0-9]{1,2}|35\.0)$/ //Rango 28-35
        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            cP: false,
            Brigh: false,
            Wh: false,
            Brigh_Leneta: false,
            Wh_Leneta: false,
            Dv50: false,
            Dv90: false
        }
    }



};

let productoSeleccionado = "OPTIMIN EXTEND MAX V5".trim(); // Producto por defecto

const validarCampo = (expReg, input, campo, nombreProducto) => {
    const grupo = input.parentElement;
    const iconoExito = input.nextElementSibling;
    const iconoError = input.nextElementSibling.nextElementSibling;

    if (expReg.test(input.value)) {
        grupo.classList.remove('formulario__grupo-incorrecto');
        grupo.classList.add('formulario__grupo-correcto');
        iconoExito.classList.add('fa-check-circle');
        iconoExito.classList.remove('fa-times-circle');
        if (iconoError) {
            iconoError.classList.remove('formulario__input-error-activo');
        }
        const rangoExp = grupo.querySelector(`#rango_expresion_${campo}`);
        if (rangoExp) {
            rangoExp.textContent = expReg.toString();
        }
        const nombreProductoSpan = grupo.querySelector('#nombre_producto');
        if (nombreProductoSpan) {
            nombreProductoSpan.textContent = nombreProducto;
        }
        productos[productoSeleccionado].campos[campo] = true;
    } else {
        grupo.classList.add('formulario__grupo-incorrecto');
        grupo.classList.remove('formulario__grupo-correcto');
        iconoExito.classList.add('fa-times-circle');
        iconoExito.classList.remove('fa-check-circle');
        if (iconoError) {
            iconoError.classList.add('formulario__input-error-activo');
        }
        const rangoExp = grupo.querySelector(`#rango_expresion_${campo}`);
        if (rangoExp) {
            rangoExp.textContent = expReg.toString();
        }
        const nombreProductoSpan = grupo.querySelector('#nombre_producto');
        if (nombreProductoSpan) {
            nombreProductoSpan.textContent = nombreProducto;
        }
        productos[productoSeleccionado].campos[campo] = false;
    }
    const valor = input.value.trim();
    const mensajeError = document.getElementById(`error_${campo}`);
    if (!expReg.test(valor)) {
        mensajeError.style.display = 'block';
    } else {
        mensajeError.style.display = 'none';
    }
};

const validarFormularioEditarPL = (e) => {
    const nombreCampo = e.target.name;
    const expReg = productos[productoSeleccionado].expresiones[nombreCampo];
    const nombreProducto = productoSeleccionado; // Usar el nombre del producto seleccionado
    if (expReg) {
        validarCampo(expReg, e.target, nombreCampo, nombreProducto);
    }
};


inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormularioEditarPL);
    input.addEventListener('blur', validarFormularioEditarPL);
});

// Evento para cambiar el producto seleccionado
document.getElementById('producto').addEventListener('change', (e) => {
    const productoSeleccionadoId = e.target.value; // Obtiene el valor seleccionado del select
    const select = document.getElementById('producto');
    const productoSeleccionadoNombre = select.options[select.selectedIndex].text; // Obtiene el texto del option seleccionado
    productoSeleccionado = productoSeleccionadoNombre; // Actualiza el producto seleccionado
    // console.log(productoSeleccionado);
});

// Evento para enviar el formulario
document.getElementById('formulario').addEventListener('submit', function (event) {
    // Validar y rellenar los campos del formulario
    if (validarCamposVacios() && validarFormularioPL()) {
        rellenarCamposVacios();
        this.submit();
    } else {
        // Prevenir el envío del formulario si la validación falla
        event.preventDefault();
    }
});


// Evento para el botón cancelar
document.getElementById('cancelarBtn').addEventListener('click', function (event) {
    event.preventDefault(); // Prevenir el comportamiento predeterminado del botón

    // Redirigir a la página de listar
    window.location.href = 'ControladorPL?accion=listar';
});

// Función para rellenar campos vacíos
function rellenarCamposVacios() {
    const inputs = document.querySelectorAll('#formulario input');

    inputs.forEach(input => {
        let valor = input.value.trim();
        if (valor === '') {
            if (input.id === 'Consecutivo') {
                input.value = '0001';
            } else {
                input.value = '0';
            }
        }
    });
}

// Función para validar campos vacíos
const validarCamposVacios = () => {
    var camposObligatorios = [
        "Usuarios", "fecha", "producto", "idSeguimiento"
    ];

    var camposValidos = true;

    for (var i = 0; i < camposObligatorios.length; i++) {
        var input = document.getElementById(camposObligatorios[i]);
        if (input.value.trim() === "" || input.value === "0") {
            input.classList.add("campo-invalido");
            camposValidos = false;
        } else {
            input.classList.remove("campo-invalido");
        }
    }

    if (!camposValidos) {
        Swal.fire({
            icon: "error",
            title: "Error!",
            text: "Por favor, complete todos los campos obligatorios."
        });
    }

    return camposValidos;
};

// Función para validar un campo de texto
function validarCampoPL(input) {
    var valor = input.value.trim();
    input.classList.toggle("campo-invalido", valor === "");
}

// Función para validar un campo de selección
function validarCampoComboPL(input) {
    var valor = input.value;
    input.classList.toggle("campo-invalido", valor === "0" || valor === "");
    return valor !== "0" && valor !== "";
}

// Función para validar el formulario completo
function validarFormularioPL() {
    var camposObligatorios = [
        "Usuarios", "fecha", "producto", "idSeguimiento"
    ];

    var camposValidos = true;

    for (var i = 0; i < camposObligatorios.length; i++) {
        var input = document.getElementById(camposObligatorios[i]);
        if (input.tagName.toLowerCase() === "select") {
            if (!validarCampoComboPL(input)) {
                camposValidos = false;
            }
        } else {
            validarCampoPL(input);
            if (input.classList.contains("campo-invalido")) {
                camposValidos = false;
            }
        }
    }

    if (camposValidos) {
        Swal.fire({
            position: "center",
            icon: "success",
            title: "Reporte Registrado con Exito",
            showConfirmButton: false,
            timer: 6000,
            customClass: {
                popup: 'swal2-popup-centered'
            }
        });

        return true;
    } else {
        Swal.fire({
            icon: "error",
            title: "Error!",
            text: "Por favor, complete todos los campos obligatorios."
        });
        return false;
    }
}

function calcularHumedad(solidosInput) {
    var valor = solidosInput.value;
    var humedadInput = document.getElementById("humedad");

    var solidosDouble = parseFloat(valor); // Convertir a Double

    if (!isNaN(solidosDouble)) {
        var humedadDouble = 100 - solidosDouble;
        humedadInput.value = humedadDouble.toFixed(2); // Limitar a 2 decimales y asignar a Humedad
    } else {
        humedadInput.value = ''; // Limpiar el campo de "Humedad" si Solidos no es un número válido
    }
}




