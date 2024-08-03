

function validarCampo(input) {
    var valor = input.value.trim();
    input.classList.toggle("campo-invalido", valor === "");
    if (valor === "") {
        input.value = "0"; // Auto-rellena con cero si el campo está vacío
    }
}

function validarCampoCombo(input) {
    var valor = input.value;
    input.classList.toggle("campo-invalido", valor === "0" || valor === "");
    return valor !== "0" && valor !== "";
}


function validarFormularioRegistro() {
    var camposObligatorios = [
        "idUsuarios", "idProductos", "fecha",
        "cant_noconf","lote"];
    for (var i = 0; i < camposObligatorios.length; i++) {
        var input = document.getElementById(camposObligatorios[i]);
        if (input.tagName.toLowerCase() === "select") {
            validarCampoCombo(input);
        } else {
            validarCampo(input);
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
    validarYRellenarCampos();

    return true;
}


// Función para validar y rellenar campos
function validarYRellenarCampos() {
    // Obtener todos los inputs del formulario
    const inputs = document.querySelectorAll('#formulario input');

    // Iterar sobre cada input
    inputs.forEach(input => {
        // Obtener el valor del input y eliminar espacios en blanco al principio y al final
        let valor = input.value.trim();

        // Verificar si el valor está vacío
        if (valor === '') {
            // Si es el campo CONSECUTIVO, rellenarlo con "0001"
            if (input.id === 'idConsecutivo') {
                input.value = '0001';
            } else {
                // Si es otro campo, rellenarlo con cero
                input.value = '0';
            }
        }
    });
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



