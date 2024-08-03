

const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');
const productos = {
    "OPTIMIN EXTEND MAX V5": {
        expresiones: {
            solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/,       
            pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.[0-6](\d{1,2})?|8\.70(\.0{1,2})?)\b/,
            ku: /\b(?:60(\.\d+)?|6[0-9](\.\d+)?|70\.0)\b/,
            cP: /\b(?:300(\.\d+)?|3\d{2}(\.\d+)?|4\d{2}(\.\d+)?|5\d{2}(\.\d+)?|600(\.0+)?)\b/,
            Brigh: /\b(?:89(\.\d+)?|9[0-2](\.\d+)?|93\.0)\b/,
            Wh: /\b(?:85(\.\d+)?|8[6-9](\.\d+)?|90\.0)\b/
        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            cP: false,
            Brigh: false,
            Wh: false
        }
    },
    "OPTIMIN L1117": {
        expresiones: {
            solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/,
            pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.[0-6](\d{1,2})?|8\.70(\.0{1,2})?)\b/,
            r325: /\b0\.(?:50|[1-4]?\d)\b/,    
            ku: /\b(?:60(\.\d+)?|6[0-9](\.\d+)?|70\.0)\b/,
            cP: /\b(?:300(\.\d+)?|3\d{2}(\.\d+)?|4\d{2}(\.\d+)?|5\d{2}(\.\d+)?|600(\.0+)?)\b/,
            Brigh: /\b(?:89(\.\d+)?|9[0-2](\.\d+)?|93\.0)\b/,
            Wh: /\b(?:85(\.\d+)?|8[6-9](\.\d+)?|90\.0)\b/
        },
        campos: {
            solidos: false,
            pH: false,
            r325: false,
            ku: false,
            cP: false,
            Brigh: false,
            Wh: false
        }
    }
};

let productoSeleccionado = "OPTIMIN EXTEND MAX V5"; // Producto por defecto

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
    // Aquí validamos si la expresión regular coincide con el valor del input
    const valor = input.value.trim();
    const mensajeError = document.getElementById(`error_${campo}`);
    if (!expReg.test(valor)) {
        mensajeError.style.display = 'block';
    } else {
        mensajeError.style.display = 'none';
    }
};

const validarFormulario = (e) => {
    const nombreCampo = e.target.name;
    const expReg = productos[productoSeleccionado].expresiones[nombreCampo];
    const nombreProducto = "Nombre del Producto"; // Aquí debes obtener el nombre del producto de alguna manera
    if (expReg) {
        validarCampo(expReg, e.target, nombreCampo, nombreProducto);
    }
};

inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormulario);
    input.addEventListener('blur', validarFormulario);
});



// Evento para cambiar el producto seleccionado
document.getElementById('producto').addEventListener('change', (e) => {
    const productoSeleccionadoId = e.target.value; // Obtiene el valor seleccionado del select
    const select = document.getElementById('producto');
    const productoSeleccionadoNombre = select.options[select.selectedIndex].text; // Obtiene el texto del option seleccionado
    productoSeleccionado = productoSeleccionadoNombre; // Actualiza el producto seleccionado
    // console.log(productoSeleccionado);
});






function validarCampo2(input) {
    // Obtener todos los inputs del formulario
    const inputs = document.querySelectorAll('#formulario input');

    // Iterar sobre cada input
    inputs.forEach(input => {
        // Obtener el valor del input y eliminar espacios en blanco al principio y al final
        let valor = input.value.trim();

        // Verificar si el valor está vacío
        if (valor === '') {
            // Si es el campo CONSECUTIVO, rellenarlo con "0001"
            if (input.id === 'Consecutivo') {
                input.value = '0001';
            } else {
                // Si es otro campo, rellenarlo con cero
                input.value = '0';
            }
        }
    });
}

function validarCampoCombo(input) {
    var valor = input.value;
    input.classList.toggle("campo-invalido", valor === "0" || valor === "");
    return valor !== "0" && valor !== "";
}

function validarFormularioEditar() {
    var camposObligatorios = [
        "Usuarios", "producto", "fecha", "idSeguimiento"];
    for (var i = 0; i < camposObligatorios.length; i++) {
        var input = document.getElementById(camposObligatorios[i]);
        if (input.tagName.toLowerCase() === "select") {
            validarCampoCombo(input);
        } else {
            validarCampo2(input);
        }
    }

    var camposInvalidos = camposObligatorios.some(function (campo) {
        var input = document.getElementById(campo);
        return input.classList.contains("campo-invalido");
    });
    if (camposInvalidos) {
        alert("Por favor, complete todos los campos obligatorios.");
        return false;
    }

    return true;
}

function calcularPromedioPH() {
// Obtener todos los campos de entrada de humedad
    var inputs = document.querySelectorAll('[id^="pH"]');
    // Inicializar variables para el cálculo del promedio
    var suma = 0;
    var cantidadValores = 0;
    // Recorrer los campos y calcular el promedio
    inputs.forEach(function (input) {
        var valor = parseFloat(input.value);
        if (!isNaN(valor) && valor > 0) {
            // Si el valor es un número válido y mayor que cero, sumarlo al total y aumentar la cantidad de valores
            suma += valor;
            cantidadValores++;
        }
    });
    // Calcular el promedio solo si hay al menos un valor válido
    if (cantidadValores > 0) {
        var promedio = suma / cantidadValores;
        document.getElementById('pH_promedio').value = promedio.toFixed(2);
    } else {
// Limpiar el campo si no hay valores válidos
        document.getElementById('pH_promedio').value = "";
    }
}


//Funsion Calculo de Humedad-Solidos
function calcularHumedad(solidosInput) {
    var valor = solidosInput.value;
    var humedadInput = document.getElementById("humedad");

    // Verificar si el valor ingresado es un número decimal válido
    var solidosDouble = parseFloat(valor); // Convertir a Double

    if (!isNaN(solidosDouble)) {
        var humedadDouble = 100 - solidosDouble;
        humedadInput.value = humedadDouble.toFixed(2); // Limitar a 2 decimales y asignar a Humedad
    } else {
        humedadInput.value = ''; // Limpiar el campo de "Humedad" si Solidos no es un número válido
    }
}



















