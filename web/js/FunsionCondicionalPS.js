
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

function validarFormularioEditar() {
    var camposObligatorios = [
        "idUsuarios", "idProductos", "fecha"];
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

    return true;
}



let contadorCamposPh; // Contador para los campos de pH
let contadorCamposHumedad; // Contador para los campos de humedad

// Función para inicializar los contadores
function inicializarContador() {
    let maxIdpH = 0;
    let maxIdHumedad = 0;

    const camposExistentespH = document.querySelectorAll('.campo-ph');
    camposExistentespH.forEach(campo => {
        const id = parseInt(campo.id.split('_')[1], 10);
        if (!isNaN(id) && id > maxIdpH) {
            maxIdpH = id;
        }
    });
    contadorCamposPh = maxIdpH + 1;

    const camposExistentesHumedad = document.querySelectorAll('.campo-humedad');
    camposExistentesHumedad.forEach(campo => {
        const id = parseInt(campo.id.split('_')[1], 10);
        if (!isNaN(id) && id > maxIdHumedad) {
            maxIdHumedad = id;
        }
    });
    contadorCamposHumedad = maxIdHumedad + 1;
}

// Función para agregar un nuevo campo de pH
function agregarCampoph3() {
    if (contadorCamposPh === undefined) {
        inicializarContador();
    }

    const divCampospH = document.getElementById('campos-ph');
    const nuevoCampopH = document.createElement('div');

    const campoId = `campo-ph-${contadorCamposPh}`;
    nuevoCampopH.id = campoId;
    nuevoCampopH.classList.add('formulario__grupo', 'row', 'align-items-center');

    const nombreCampo = "pH_" + contadorCamposPh.toString();

    nuevoCampopH.innerHTML = `
        <div class="formulario__grupo col-md-6">
            <label class="formulario__label" for="pH_${contadorCamposPh}">%pH-${contadorCamposPh}</label>
            <input type="number" step="0.01" class="form-control campo-ph" id="pH_${contadorCamposPh}"
                name="${nombreCampo}"
                placeholder="Ingrese pH" onkeyup="calcularPromedioph2()">
        </div>
        <div class="col-md-1">
            <button class="btn btn-sm ml-2 mt-5 btn-danger" type="button" onclick="eliminarCampo('ph', ${contadorCamposPh})">
                <i class="fas fa-trash"></i>
            </button>
        </div>
    `;

    divCampospH.appendChild(nuevoCampopH);
    contadorCamposPh++;
    console.log(`Nombre del campo: ${nombreCampo}`);
}

// Función para agregar un nuevo campo de humedad
function agregarCampoHumedadEditar() {
    if (contadorCamposHumedad === undefined) {
        inicializarContador();
    }

    const divCamposHumedad = document.getElementById('campos-humedad');
    const nuevoCampoHumedad = document.createElement('div');

    const campoId = `campo-humedad-${contadorCamposHumedad}`;
    nuevoCampoHumedad.id = campoId;
    nuevoCampoHumedad.classList.add('formulario__grupo', 'row', 'align-items-center');

    const nombreCampo = "humedad_" + contadorCamposHumedad.toString();

    nuevoCampoHumedad.innerHTML = `
        <div class="formulario__grupo col-md-6">
            <label class="formulario__label" for="humedad_${contadorCamposHumedad}">%Humedad-${contadorCamposHumedad}</label>
            <input type="number" step="0.01" class="form-control campo-humedad" id="humedad_${contadorCamposHumedad}"
                name="${nombreCampo}"
                placeholder="Ingrese % Hum" onkeyup="calcularPromedioHumedadEditar()">
        </div>
        <div class="col-md-1">
            <button class="btn btn-sm ml-2 mt-5 btn-danger" type="button" onclick="eliminarCampo('humedad', ${contadorCamposHumedad})">
                <i class="fas fa-trash"></i>
            </button>
        </div>
    `;

    divCamposHumedad.appendChild(nuevoCampoHumedad);
    contadorCamposHumedad++;
    console.log(`Nombre del campo: ${nombreCampo}`);
}

// Función para eliminar un campo de pH o humedad
function eliminarCampo(tipo, id) {
    const campo = document.getElementById(`campo-${tipo}-${id}`);
    if (campo) {
        campo.remove();
        console.log(`Campo ${tipo} eliminado: ${id}`);
    }

    if (tipo === 'ph') {
        calcularPromedioph2();
    } else if (tipo === 'humedad') {
        calcularPromedioHumedadEditar();
    }
}

// Función para calcular el promedio de pH
function calcularPromedioph2() {
    const camposExistentes = document.querySelectorAll('.campo-ph');
    let sum = 0;
    let count = 0;

    camposExistentes.forEach(campo => {
        const valor = parseFloat(campo.value);
        if (!isNaN(valor)) {
            sum += valor;
            count++;
        }
    });

    const promedio = count > 0 ? (sum / count).toFixed(2) : 0;
    const campoPromedio = document.getElementById('pH_promedio');

    if (campoPromedio) {
        campoPromedio.value = promedio;
    } else {
        console.error('Elemento pH_promedio no encontrado');
    }
}

// Función para calcular el promedio de humedad
function calcularPromedioHumedadEditar() {
    const camposExistentes = document.querySelectorAll('.campo-humedad');
    let sum = 0;
    let count = 0;

    camposExistentes.forEach(campo => {
        const valor = parseFloat(campo.value);
        if (!isNaN(valor)) {
            sum += valor;
            count++;
        }
    });

    const promedio = count > 0 ? (sum / count).toFixed(2) : 0;
    const campoPromedio = document.getElementById('Humedad_Promedio');

    if (campoPromedio) {
        campoPromedio.value = promedio;
    } else {
        console.error('Elemento Humedad_Promedio no encontrado');
    }
}

window.onload = function () {
    inicializarContador(); // Inicializa el contador para los campos de pH y Humedad existentes

    calcularPromedioph2(); // Calcular el promedio de pH inicialmente
    calcularPromedioHumedadEditar(); // Calcular el promedio de humedad inicialmente
};





















