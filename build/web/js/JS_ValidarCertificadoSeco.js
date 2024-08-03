const productSpecs = {
    // # 1
    "CAOMIN P055": {
        humedad: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, // Rango 0-3
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/, // Rango 78-84
        Wh: /\b(?:6[1-9](\.\d+)?|70(?:\.0{1,2})?)\b/, // Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-3]\d{1,2}?|\.40?))$/, // Rango Máx 0.40
        Dv50: /^(?:8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-1](?:\.\d{1,2})?|12(?:\.0{1,2})?)$/, // Rango 8-12
        AA: /^(?:4[2-9](?:\.\d{1,2})?|[5-7]\d(?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/ // Rango 42-84
    },
    // # 2
    "CAOMIN C055-20": {
        humedad: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/, // Rango 78-84
        Wh: /\b(?:6[1-9](\.\d+)?|70(?:\.0{1,2})?)\b/, // Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-3]\d{1,2}?|\.40?))$/, // Rango Máx 0.40
        Dv50: /^(?:8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-1](?:\.\d{1,2})?|12(?:\.0{1,2})?)$/, // Rango 8-12
        AA: /^(?:4[2-9](?:\.\d{1,2})?|[5-7]\d(?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{1,2})?)$/ // Rango 42-84
    },
    // # 3
    "CAOMIN P085": {
        humedad: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.[6-9]|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{1,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 4
    "CAOMIN P100": {
        humedad: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.[6-9]|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{1,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 5
    "CAOMIN C085-20": {
        humedad: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.[6-9]|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{1,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 6
    "CAOMIN C100": {
        humedad: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.[6-9]|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{1,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 7
    "CAOMIN C08-20": {
        humedad: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
        pH: /^(?:4\.(?:[0-9]|[0-9]{2})|5(?:\.\d{1,2})?|6(?:\.0{1,2})?|7\.0{0,2})$/, //Rango 4.0-7.0   
        //  Br: /^(?:77(?:\.\d{1,2})?|7[8-9](?:\.\d{1,2})?|8[0-2](?:\.\d{1,2})?|83(?:\.0{1,2})?)$/, //Rango 77-83
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-5]\d{0,2}?|\.60?)|1(?:\.\d{0,2}?)|2(?:\.\d{0,2}?)|3(?:\.\d{0,2}?)|4(?:\.\d{0,2}?)|5(?:\.\d{0,2}?)|6(?:\.0{0,2}))$/, // Rango Max 0.60
        Dv50: /^(?:10\.0{0,2}|1[0-6](?:\.\d{1,2})?|17\.0{0,2})$/ //Rango 10.0 ... HASTA 17.0

    },
    // # 8
    "CAOMIN C083-20": {
        humedad: /^(?:1[8-9](?:\.\d{1,2})?|2[0-1](?:\.\d{1,2})?|22(?:\.0{1,2})?)$/, //Rango 18-22
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:70(?:\.\d{1,2})?|7[1-7](?:\.\d{1,2})?|80(?:\.0{0,2})?)$/, //Rango 70. .. hasta 80
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 9
    "CAOMIN P083 TJ": {
        humedad: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3
        pH: /^(?:4\.[5-9]\d*|4\.5\d*|5(?:\.\d{1,2})?|6(?:\.0{0,2})?)$/, // Rango 4.5-6.0
        Br: /^(?:70(?:\.\d{1,2})?|7[1-7](?:\.\d{1,2})?|80(?:\.0{0,2})?)$/, //Rango 70. .. hasta 80
        //  Wh:  /^(?:6[1-9](?:\.\d{1,2})?|70(?:\.0{1,2})?)$/, //Rango 61-70.0
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:7\.6\d{1}|7\.[7-9]\d?|8(?:\.\d{1,2})?|9(?:\.\d{1,2})?|1[0-2](?:\.\d{1,2})?|13(?:\.0{0,2})?)$/, //Rango 7.6-13
        AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 10
    "OPTIMIN P1015": {
        humedad: /^(?:[0-1](?:\.\d{1,2})?|3(?:\.0{1,2})?)$/, //Rango 0-3  
        Wh: /^(?:8[0-9](?:\.\d{1,2})?|90(?:\.\d{1,2})?|91(?:\.\d{1,2})?|92(?:\.\d{1,2})?|93(?:\.0{0,2})?)$/, //Rango 80 - 93
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Dv50: /^(?:1(?:\.\d{1,2})?|2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.0{0,2})?)$/ //Rango 1.0-4.0

    },
    // # 11
    "OPTIMIN P1025": {
        humedad: /^(?:0(?:\.\d{1,2})?|1(?:\.0{0,2})?)$/, //Rango 0-2        
        retenido325: /^(?:0(?:\.[0-1]?\d?)?|0\.2|0\.20)$/, // Rango Max 0.20    


        Wh: /^(?:8[1-7](?:\.\d{1,2})?|88(?:\.0{0,2})?)$/, //Rango 81-88
        Dv50: /^(?:2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.\d{1,2})?|5(?:\.0{0,2})?)$/  //Rango 2 -5

    },
    // # 11
    "PTP 36 V2": {
        humedad: /^(?:0(?:\.\d{1,2})?|1(?:\.\d{1,2})?|2(?:\.0{0,2})?)$/, //Rango0-2.0        
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/// Rango Max 0.50
                //  Wh: /^(?:8[1-7](?:\.\d{1,2})?|88(?:\.0{0,2})?)$/, //Rango 81-88
                // Dv50: /^(?:2(?:\.\d{1,2})?|3(?:\.\d{1,2})?|4(?:\.\d{1,2})?|5(?:\.0{0,2})?)$/  //Rango 2 -5
                // AA: /^(?:3[8-9](?:\.\d{1,2})?|4\d(?:\.\d{1,2})?|50(?:\.0{1,2})?)$/ //Rango minimo 38.0 hasta 50
    },
    // # 13
    "OPTIMIN P1050": {
        humedad: /^(?:0(?:\.\d{1,2})?|1(?:\.0{0,2})?)$/, //Rango 0- 1.0     
        retenido325: /^(?:0(?:\.[0-4]?\d{0,1})?|0\.50)$/, // Rango Max 0.50
        Wh: /^(?:7[6-9](?:\.\d{1,2})?|8[0-5](?:\.\d{1,2})?|86(?:\.[0-5]?)?)$/, //Rango 76,5 - 86,5
        Dv50: /^(?:[2-6](?:\.\d{1,2})?|7(?:\.0{0,2})?)$/ //Rango 2.0  hasta 7.0

    }
};

function validateFields() {
    const product = document.getElementById('IdProductos').value.trim();
    const humedad = document.getElementById('humedad').value.trim();
    const pH = document.getElementById('pH').value.trim();
    const Br = document.getElementById('Br').value.trim();
    const Wh = document.getElementById('Wh').value.trim();
    const retenido325 = document.getElementById('retenido325').value.trim();
    const Dv50 = document.getElementById('Dv50').value.trim();
    const AA = document.getElementById('AA').value.trim();

    const specs = productSpecs[product];

    if (specs) {
        let errors = [];
        if (!validateField(humedad, specs.humedad, 'humedad'))
            errors.push('humedad');
        if (!validateField(pH, specs.pH, 'pH'))
            errors.push('pH');
        if (!validateField(Br, specs.Br, 'Br'))
            errors.push('Br');
        if (!validateField(Wh, specs.Wh, 'Wh'))
            errors.push('Wh');
        if (!validateField(retenido325, specs.retenido325, 'retenido325'))
            errors.push('retenido325');
        if (!validateField(Dv50, specs.Dv50, 'Dv50'))
            errors.push('Dv50');
        if (!validateField(AA, specs.AA, 'AA'))
            errors.push('AA');

        if (errors.length > 0) {

            Swal.fire({
                title: 'Error',
                html: 'Los siguientes campos tienen error !, <span style="color: #09f; font-weight: bold;">Editar! Producto Terminado Seco:</span>',
                icon: 'error'
            });

        } else {
            Swal.fire({
                title: 'Éxito',
                html: 'Aprobado! Seleccione un <span style="color: #09f; font-weight:bold;">Cliente</span> & Generar PDF',
                icon: 'success'
            });

        }
    } else {
        console.warn(`Producto no reconocido: ${product}`);
    }
}

function validateField(value, regex, fieldId) {
    const field = document.getElementById(fieldId);
    if (!value || (regex && !regex.test(value))) {
        field.style.borderColor = 'red';
        field.style.backgroundColor = '#ffcccc'; // fondo rojo claro
        field.style.fontWeight = 'bold'; // texto en negrita
        return false;
    } else {
        field.style.borderColor = 'green';
        field.style.backgroundColor = '#ccffcc'; // fondo verde claro
        field.style.fontWeight = 'bold'; // texto en negrita
        return true;
    }
}

function showAlert(title, text, icon) {
    Swal.fire({
        title: title,
        text: text,
        icon: icon,
        confirmButtonText: 'OK'
    });
}

// Llamar a la función validateFields en la carga inicial de la página si es necesario
document.addEventListener('DOMContentLoaded', validateFields);


