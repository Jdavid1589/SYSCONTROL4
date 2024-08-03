
let contadorCamposHumedad = 1; // Inicializar la variable fuera de la función

/***** Función para Agregar Campos Humedad Dinámicos **********/
function agregarCampoHumedad() {
    const divCamposHumedad = document.getElementById('campos-humedad');
    const nuevoCampoHumedad = document.createElement('div');

    // Encontrar el valor máximo actual de los campos de humedad
    let maxId = 0;
    const camposExistentes = document.querySelectorAll('.campo-humedad');
    camposExistentes.forEach(campo => {
        const id = parseInt(campo.id.split('_')[1], 80);
        if (!isNaN(id) && id > maxId) {
            maxId = id;
        }
    });

    contadorCamposHumedad = maxId + 1;
    const campoId = `campo-humedad-${contadorCamposHumedad}`;
    nuevoCampoHumedad.id = campoId;
    nuevoCampoHumedad.classList.add('formulario__grupo', 'row', 'align-items-center');

    // Concatenar el nombre del campo correctamente
    const nombreCampo = "humedad_" + contadorCamposHumedad.toString();
    
    

    nuevoCampoHumedad.innerHTML = `
        <div class="formulario__grupo col-md-6">
            <label class="formulario__label" for="humedad_${contadorCamposHumedad}">%Humedad-${contadorCamposHumedad}</label>
            <input type="number" step="0.01" class="form-control campo-humedad" id="humedad_${contadorCamposHumedad}"
                name="${nombreCampo}"
                placeholder="Ingrese % Hum" onkeyup="calcularPromedioHumedad()">
        </div>
        <div class="col-md-1">
            <button class="btn btn-sm ml-2 mt-5 btn-danger" type="button" onclick="eliminarCampoHumedad(${contadorCamposHumedad})">
                <i class="fas fa-trash"></i>
            </button>
        </div>
    `;

    divCamposHumedad.appendChild(nuevoCampoHumedad);

    // Imprimir el nuevo campo en la consola
  // console.log(`Nuevo campo agregado: ${campoId}`);
  console.log(`Nombre del campo: ${nombreCampo}`);
}

function eliminarCampoHumedad(id) {
    const campoHumedad = document.getElementById(`campo-humedad-${id}`);
    if (campoHumedad) {
        campoHumedad.remove();
        console.log(`Campo humedad eliminado: ${id}`);
    }
    calcularPromedioHumedad(); // Recalcular el promedio al eliminar un campo
}

function calcularPromedioHumedad() {
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
    const campoPromedio = document.getElementById('sol_promedio');
    
    if (campoPromedio) {
        campoPromedio.value = promedio;
    } else {
        console.error('Elemento Humedad_Promedio no encontrado');
    }
}


/***** Función para Agregar Campos pH Dinámicos **********/

function agregarCampopH() {
    const divCampospH = document.getElementById('campos-ph');
    const nuevoCampopH = document.createElement('div');

    // Encontrar el valor máximo actual de los campos de pH
    let maxId = 0;
    const camposExistentes2 = document.querySelectorAll('.campo-ph');
    camposExistentes2.forEach(campo => {
        const idPartes = campo.id.split('_');
        if (idPartes.length > 1) {
            const id = parseInt(idPartes[1], 30); // Use base 10 for parsing
            if (!isNaN(id) && id > maxId) {
                maxId = id;
            }
        }
    });

    const contadorCamposph = maxId + 1;
    const campoId = `campo-ph_${contadorCamposph}`;
    nuevoCampopH.id = campoId;
    nuevoCampopH.classList.add('formulario__grupo', 'row', 'align-items-center');

    // Concatenar el nombre del campo correctamente
    const nombreCampo = `pH_${contadorCamposph}`;

    nuevoCampopH.innerHTML = `
        <div class="formulario__grupo col-md-6">
            <label class="formulario__label" for="${nombreCampo}">%pH-${contadorCamposph}</label>
            <input type="number" step="0.01" class="form-control campo-ph" id="${nombreCampo}"
                name="${nombreCampo}"
                placeholder="Ingrese % pH" onkeyup="calcularPromedioph2()">
        </div>
        <div class="col-md-1">
            <button class="btn btn-sm ml-2 mt-5 btn-danger" type="button" onclick="eliminarCampopH(${contadorCamposph})">
                <i class="fas fa-trash"></i>
            </button>
        </div>
    `;

    divCampospH.appendChild(nuevoCampopH);

    // Imprimir el nuevo campo en la consola
    console.log(`Nuevo campo agregado: ${campoId}`);
    console.log(`Name del campo: ${nombreCampo}`);

    // Recalcular el promedio
    calcularPromedioph2();
}

function eliminarCampopH(id) {
    const campopH = document.getElementById(`campo-ph_${id}`);
    if (campopH) {
        campopH.remove();
        console.log(`Campo pH eliminado: ${id}`);
    }
    calcularPromedioph2(); // Recalcular el promedio al eliminar un campo
}

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
    const campoPromedio2 = document.getElementById('pH_promedio');
    
    if (campoPromedio2) {
        campoPromedio2.value = promedio;
    } else {
        console.error('Elemento pH_promedio no encontrado');
    }
}

// Agregar campos de pH y humedad inicialmente al cargar la página
window.onload = function () {
    const numCamposInicialesPH = 2; // Puedes ajustar este valor según tus necesidades
    for (let i = 0; i < numCamposInicialesPH; i++) {
        agregarCampopH();
    }

    const numCamposInicialesHumedad = 2; // Puedes ajustar este valor según tus necesidades
    for (let i = 0; i < numCamposInicialesHumedad; i++) {
        agregarCampoHumedad();
    }

    calcularPromedioph2(); // Calcular el promedio de pH inicialmente
    calcularPromedioHumedad(); // Calcular el promedio de humedad inicialmente
};