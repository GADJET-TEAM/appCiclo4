NOMBRE DEL PROYECTO: touristapp.

ESTADO: Sprint 3 en proceso.

DESCRIPCION: Guía para el desarrollo del Sprint 3 del Ciclo 4b.

ARCHIVOS: Para el Sprint 3 se van a desarrollar los siguientes archivos:

1. images del directorio assets: 
     Se van a insertar dentro de la carpeta images las imágenes de todos los sitios turísticos a mostrar.

2. "subdirectorios" models, pages y repository de lib y archivos main.dart y firebase_options.dart
    Dentro de lib se realizarà lo siguiente:

        * En models: Se creará el archivo site.dart y se modificará el archivo user.dart

                  + site.dart: Con este se va a modelar el identificador del sitio (UID), foto del sitio 
                               (photo), nombre del sitio (nameSite), descripción general del sitio
                               (generalDescription), puntuación (rating), ciudad (town), departamento
                               (department), descripción detallada del sitio (detaileddescription) e 
                               informaciòn extra sobre el sitio turístico (moreInformation). También se
                               van a crear el método fromJson, toJson y los respectivos getters y setters.

                  + user.dart: La modificación consistirá en agregar el atributo UID, el cual se refiere 
                               al identificador del usuario, asì como su getter, setter e incorporación
                               dentro de los métodos fromJson y toJson.

        * En pages: Dentro de pages se va a crear el archivo poidetails_page.dart y se van a modificar los
                    archivos login_page, register_page y home_page.

                 + poidetails_page.dart: Este archivo va a contener una interfaz que mostrará el nombre,
                                         foto ampliada, ciudad, departamento, descripcion detallada e
                                         información extra sobre el sitio(POI) turistico; està interfaz
                                         se ejecutarà una vez se haya oprimido el POI en la interfaz 
                                         de HomePage.

                 + login_page.dart: La modificación consiste en agregar código referente a las 
                                    excepciones más comunes cuando el proceso de login no es exitoso.
                                    Estas son: coreo y contraseña sin digitar, correo mal escrito 
                                    (invalid-email), correo no registrado (user-not-found), contraseña
                                    incorrecta (wrong-password) y conexion no exitosa a internet
                                    (network-request-failed).

                 + register_page.dart: La modificación consiste en agregar código referente a las 
                                    excepciones más comunes cuando el proceso de Registro no es exitoso.
                                    Estas son: correo mal escrito (invalid-email), contraseña con menos
                                    de 6 caracteres (weak-password), correo ya registrado (email-already-
                                    in-use) y conexión no exitosa a internet (network-request-failed).

                 + home_page.dart: En este archivo se desarrollará código para una interfaz que muestre
                                  un listado de los POI a visitar de la ciudad. Cada POI tendrá una foto
                                  pequeña, el nombre del POI, una descripción corta o general y una
                                  puntuación. Con esta interfaz se debe asegurar que al oprimir un POI
                                  se muestre en otra pantalla (PoiDetailsPage) información detallada.

        * Creación de repository: Se creará un "subdrirectorio" denominado repository y contendrá un archivo
                                  con nombre firebase_api.dart.

                + firebase_api.dart: En este archivo se crearán métodos para el proceso de registro y login
                                     en firebase authentication y el método para crear un usuario en
                                     firestore database (es decir para almacenar los datos que ingresa el
                                     usuario en el registro).
        
        * main.dart: Para el Sprint 3 aquí se pegará líneas de código que provee la página de firebase para
                     terminar de configurar firebase en el proyecto.

        * firebase_options.dart: Es un archivo que automáticamente se crea después de que el proceso de 
                                 configuración de firebase sea exitoso. Aquí no se hace ninguna modificación.

3. pubspec.yaml: Dentro de este se crearán las dependencias para que Firebase funcione en el proyecto.

4. Archivo build.gradle:
    A) Ruta relativa: touristapp\android\app\build.gradle
    B)¿Archivo preexistente?: SI.
    C) Modificaciòn: Se debe agregar en la línea 50 lo siguiente: minSdkVersion 19; y en la línea 54:
                     multiDexEnabled true
