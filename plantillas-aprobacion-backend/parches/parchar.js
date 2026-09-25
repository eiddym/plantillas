const fs = require('fs');
const path = require('path');

const basename=path.basename(module.filename);
const rutaParches=`${__dirname}`;
const configuracion=require(`./config.parchar.json`);

// Itera y verifica la existencia del directorio.
configuracion.parches.forEach((parche) => {

  // Verifica la existencia del directorio destino.
  fs.exists(parche.ruta_destino,(resultadoLectura) => {
    console.log(`verificando la existencia de la ruta destino >>>>  ${parche.ruta_destino}`, resultadoLectura);

    // Si éxiste el directorio.
    if(resultadoLectura){
      // Ruta del archivo origen.
      const rutaOrigen = `${rutaParches}/${parche.ruta_origen}`;

      // Realiza la lectura del directorio origen, al cual le aplica un filtro.
      fs.readdirSync(rutaOrigen).filter((archivo) =>
      // Que sea un directorio && que no sea este mismo archivo && que no sea del tipo "json".
      (archivo.indexOf('.')!==0) && (archivo!==basename) && (archivo.substr(archivo.lastIndexOf('.')+1,archivo.length)!='json')
      )
      // Itera los archivos obtenidos de la ruta origen.
      .forEach((archivo) => {

      // Realiza la lectura del archivo de origen.
      fs.readFile(`${rutaOrigen}/${archivo}`,{flag:"r"},(errorLeer,dataLeer) => {
        // Si no existe error en la lectura.
        if(!errorLeer){
          // Realiza la escritura del archivo destino, con la data obtenida en la lectura.
          fs.writeFile(`${parche.ruta_destino}/${archivo}`,dataLeer,{flag:'w'},(errorEscritura) => {
            // Si no existe error de escritura.
            if(!errorEscritura)
              console.log(`Archivo ${archivo} -- reemplazado correctamente `);
            else
              console.log(`Archivo ${archivo} -- Error en el remplazo.`, errorEscritura);
          });
        }
        // Si existe error en la lectura.
        else{
          console.log("Error en la lectura del archivo >> ", archivo);
        }
      });
    });
    }
    // Si no existe el directorio destino.
    else{
      console.log(`La ruta destino no existe. <<< ${parche.ruta_destino} >>>`);
    }
  });
});

// Remueve la versión desactualizada e incompatible ldapjs 1.0.2 anidada en ldapauth-fork
try {
  const nestedLdapjs = path.join(__dirname, '../node_modules/ldapauth-fork/node_modules/ldapjs');
  if (fs.existsSync(nestedLdapjs)) {
    console.log(`[PARCHE] Eliminando ldapjs anidado incompatible en: ${nestedLdapjs}`);
    fs.rmdirSync(nestedLdapjs, { recursive: true, force: true });
  }
} catch(e) {
  console.log("[PARCHE] Error al remover ldapjs anidado:", e.message);
}
