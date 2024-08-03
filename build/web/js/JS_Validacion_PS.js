const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input, #formulario select');

//Especificacion por productos [Expresiones regulares]
const productos = {
    // # 1
    "CAOMIN P055": {
        expresiones: {
            sol_promedio: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-2
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0        
            Brigh: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/, //Rango 78-84
            Whitness: /\b(?:6[1-9](\.\d+)?|70(?:\.0{1,2})?)\b/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-3]\d{1,2}?|\.40?))$/, // Rango Max 0.40
            Dv50: /^(?:8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-1](?:\.\d{1,2})?|12(?:\.0{1,2})?)$/, //Rango 8-12
            abs_Aceite: /^(?:4[2-9](?:\.\d{1,2})?|[5-7]\d(?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/ //Rango 42-84
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            r325: false,
            ku: false,
            Brigh: false,
            Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 2
    "CAOMIN C055-20": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0  
            Brigh: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/, //Rango 78-84
            Whitness: /\b(?:6[1-9](\.\d+)?|70(?:\.0{1,2})?)\b/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-3]\d{1,2}?|\.40?))$/, // Rango Max 0.40
            Dv50: /^(?:8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-1](?:\.\d{1,2})?|12(?:\.0{1,2})?)$/, //Rango 8-12
            abs_Aceite: /^(?:4[2-9](?:\.\d{1,2})?|[5-7]\d(?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/ //Rango 42-84
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 3
    "CAOMIN P085": {
        expresiones: {
            sol_promedio: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0        
            Brigh: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 4
    "CAOMIN P100": {
        expresiones: {
            sol_promedio: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0        
            Brigh: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 5
    "CAOMIN C085-20": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0       
            Brigh: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            // Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 6
    "CAOMIN C100": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0 
            Brigh: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            //  Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 7
    "CAOMIN C08-20": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.(?:[0-9]|[0-9]{2})|5(?:\.\d{1,2})?|6(?:\.0{1,2})?|7\.0{0,2})$/, //Rango 4.0-7.0          
            pH_promedio: /^(?:4\.(?:[0-9]|[0-9]{2})|5(?:\.\d{1,2})?|6(?:\.0{1,2})?|7\.0{0,2})$/, //Rango 4.0-7.0                
            // Brigh: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
            //Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-5]\d{0,2}?|\.60?)|1(?:\.\d{0,2}?)|2(?:\.\d{0,2}?)|3(?:\.\d{0,2}?)|4(?:\.\d{0,2}?)|5(?:\.\d{0,2}?)|6(?:\.0{0,2}))$/, // Rango Max 6
            Dv50: /^(?:10\.0{0,2}|1[0-6](?:\.\d{1,2})?|17\.0{0,2})$/ //Rango 10.0 ... HASTA 17.0

        },
        campos: {
            //solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            // Brigh: false,
            //  Whitness: false,
            retenido325: false,
            Dv50: false

        }
    },
    // # 8
    "CAOMIN C083-20": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0    
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0       
            Brigh: /^(?:70(?:\.\d{1,2})?|7[1-7](?:\.\d{1,2})?|80(?:\.0{0,2})?)$/, //Rango 70. .. hasta 80
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            // Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 9
    "CAOMIN P083 TJ": {
        expresiones: {
            sol_promedio: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
            pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0    
            pH_promedio: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0       
            Brigh: /^(?:70(?:\.\d{1,2})?|7[1-7](?:\.\d{1,2})?|80(?:\.0{0,2})?)$/, //Rango 70. .. hasta 80
            //  Whitness: /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
            abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
        },
        campos: {
            solidos: false,
            sol_promedio: false,
            pH: false,
            pH_promedio: false,
            Brigh: false,
            // Whitness: false,
            retenido325: false,
            Dv50: false,
            abs_Aceite: false
        }
    },
    // # 10
    "OPTIMIN P1015": {
        expresiones: {
            sol_promedio: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-2        
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50     
            Whitness: /^(?:8[0-9](?:\.\d{1,2})?|90(?:\.\d{1,2})?|91(?:\.\d{1,2})?|92(?:\.\d{1,2})?|93(?:\.0{0,2})?)$/, //Rango 80 - 93
            Dv50: /^(?:1(?:\.\d{1,2})?|2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.0{0,2})?)$/ //Rango 1.0-4.0

        },
        campos: {
            solidos: false,
            sol_promedio: false,
            Whitness: false,
            retenido325: false,
            Dv50: false

        }
    },
    // # 11
    "OPTIMIN P1025": {
        expresiones: {
            sol_promedio: /^(?:0(?:\.\d{1,2})?|1(?:\.0{0,2})?)$/, //Rango 0-2        
            retenido325: /^(?:0(?:\.[0-1]?\d?)?|0\.2|0\.20)$/, // Rango Max 0.20     
            Whitness: /^(?:8[1-7](?:\.\d{1,2})?|88(?:\.0{0,2})?)$/, //Rango 81-88
            Dv50: /^(?:2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.\d{1,2})?|5(?:\.0{0,2})?)$/  //Rango 2 -5
                    // abs_Aceite: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50

        },
        campos: {
            //  solidos: false,
            sol_promedio: false,
            Whitness: false,
            retenido325: false,
            Dv50: false

        }
    },
    // # 12
    "PTP 36 V2": {
        expresiones: {
            sol_promedio: /^(?:0(?:\.\d{1,2})?|1(?:\.\d{1,2})?|2(?:\.0{0,2})?)$/, //Rango0-2.0        
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Whitness: /^(?:8[1-7](?:\.\d{1,2})?|88(?:\.0{0,2})?)$/, //Rango 76,5 - 86,5
            Dv50: /^(?:2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.\d{1,2})?|5(?:\.0{0,2})?)$/  //Rango 2 -5


        },
        campos: {
            //  solidos: false,
            sol_promedio: false,
            //Whitness: false,
            retenido325: false
                    //Dv50: false

        }
    },
    // # 13
    "OPTIMIN P1050": {
        expresiones: {
            sol_promedio: /^(?:0(?:\.\d{1,2})?|1(?:\.0{0,2})?)$/, //Rango 0- 1.0        
            retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
            Whitness: /^(?:7[6-9](?:\.\d{1,2})?|8[0-5](?:\.\d{1,2})?|86(?:\.[0-5]?)?)$/, //Rango 76,5 - 86,5
            Dv50: /^(?:[2-6](?:\.\d{1,2})?|7(?:\.0{0,2})?)$/ //Rango 2.0  hasta 7.0


        },
        campos: {
            solidos: false,
            sol_promedio: false,
            Whitness: false,
            retenido325: false,
            Dv50: false

        }
    }


};

let productoSeleccionado = "CAOMIN P055"; // Producto por defecto

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

const validarFormularioS = (e) => {
    const nombreCampo = e.target.name;
    const expReg = productos[productoSeleccionado].expresiones[nombreCampo];
    const nombreProducto = productoSeleccionado; // Usar el nombre del producto seleccionado
    if (expReg) {
        validarCampo(expReg, e.target, nombreCampo, nombreProducto);
    }
};

inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormularioS);
    input.addEventListener('blur', validarFormularioS);
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
    window.location.href = 'ControladorPs?accion=listar';
});

// Función para rellenar campos vacíos
function rellenarCamposVacios() {
    const inputs = document.querySelectorAll('#formulario input');
    inputs.forEach(input => {
        let valor = input.value.trim();
        if (valor === '') {
            if (input.id === 'idConsecutivo') {
                input.value = '0001';
            } else if (input.id === 'observacion' || input.id === 'Comentarios') {
                input.value = ''; // Puedes dejarlo vacío o poner un valor predeterminado si lo deseas
            }else if (input.id === 'causas') {
                input.value = 'XX'; 
            } 
            else {
                input.value = '0';
            }
        }
    });
}


// Función para validar campos vacíos
const validarCamposVacios = () => {
    var camposObligatorios = [
        "idUsuarios", "fecha", "producto"
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
        "idUsuarios", "fecha", "producto"
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


