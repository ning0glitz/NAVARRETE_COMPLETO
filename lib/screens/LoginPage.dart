import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navarrete/screens/HomePage.dart';
import 'Ubicacion.dart';
import 'UserPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return _LoginState();
  }
}
class _LoginState extends State<LoginPage>{
  bool _obscureText = true;
  //Se crea las varibles que se utilzaran mas tarde
  late String email,password;
  //Se crea la llave 
  final _formKey = GlobalKey<FormState>();
  

  String error='';//String que cambiara de acuerdo al tipo de error que encuentre

  @override
  void initState(){
    super.initState();

  }
  //Esto es el cuerpo de Inicio de sesion
  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Distribuidora Navarrete SA"), // Título de la barra de la aplicación
      backgroundColor: Colors.red, // Color de fondo de la barra de la aplicación
    ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://previews.123rf.com/images/druzhinina/druzhinina1707/druzhinina170700214/82769810-fondo-transparente-de-diferentes-%C3%BAtiles-escolares-primer-d%C3%ADa-de-clases-iconos-de-l%C3%ADnea-de-regreso.jpg'), // URL de la imagen de fondo
          fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el fondo
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'https://lh3.googleusercontent.com/1lWlfjwJ-o1M-1K-gIIkwPU5pvWoQ9-1SBK7ovBLocav3FOKdLtsUCyd3xz_pY5SSwxslNHhk_4-Wj6SypIDUH9IIpX54rlu2W36gFPx',
                  width: 100,
                  height: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Inicia sesión en Navarrete", // Título principal
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Offstage(
                offstage: error == '', // Oculta el widget si no hay error
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: formulario(), // Renderiza el formulario
              ),
              buttonLogin(), // Renderiza el botón de inicio de sesión
              Registrarse(), // Renderiza el widget de registro
            ],
          ),
        ),
      ),
    ),
  );
}




  Widget formulario() {
  return Form(
    key: _formKey, // Clave única para identificar el formulario
    child: Column(
      children: [
        buildEmail(), // Campo de entrada de email
        const Padding(padding: EdgeInsets.only(top: 12)), // Espacio entre los campos
        buildPassword(), // Campo de entrada de contraseña
      ],
    ),
  );
}

  //Este es el input de Email
Widget buildEmail() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: "Email", // Etiqueta del campo de entrada de email
      border: OutlineInputBorder( // Estilo del borde del campo
        borderRadius: BorderRadius.circular(8), // Bordes redondeados con radio de 8
        borderSide: BorderSide(color: Colors.black), // Borde de color negro
      ),
      filled: true, // Rellenar el campo
      fillColor: Colors.white70, // Color de relleno del campo (blanco semitransparente)
      //fillColor: Colors.black.withOpacity(0.3),  // Fondo transparente (opcional)
    ),
    keyboardType: TextInputType.emailAddress, // Tipo de teclado para introducir el email
    style: TextStyle(color: Colors.black87), // Estilo de texto dentro del campo (color negro)
    cursorColor: Colors.black, // Color del cursor
    onSaved: (String? value) {
      email = value!; // Guardar el valor del campo de email en la variable 'email'
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo Obligatorio"; // Validar que el campo no esté vacío
      }
      return null;
    },
  );
}


  //Este es el input de Password
Widget buildPassword() {
  return Stack(
    alignment: Alignment.centerRight, // Alinea los elementos en el centro-derecha del Stack
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: "Password", // Etiqueta del campo de entrada de contraseña
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Borde redondeado
            borderSide: BorderSide(color: Colors.black), // Color del borde
          ),
          filled: true,
          fillColor: Colors.white70, // Color de fondo del campo de entrada de contraseña (fondo semitransparente)
        ),
        obscureText: _obscureText, // Controla la visibilidad de la contraseña
        style: TextStyle(color: Colors.black87), // Color del texto dentro del campo
        cursorColor: Colors.black, // Color del cursor
        validator: (value) {
          if (value!.isEmpty) {
            return "Campo Obligatorio"; // Valida que el campo no esté vacío
          }
          return null;
        },
        onSaved: (String? value) {
          password = value!; // Guarda el valor del campo de contraseña en la variable password
        },
      ),
      IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off, // Muestra el ícono de "visibility" si _obscureText es true, o el ícono de "visibility_off" si es false
          color: Colors.black, // Color del ícono
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText; // Cambia el estado de _obscureText para mostrar u ocultar la contraseña
          });
        },
      ),
    ],
  );
}





   //Este es el Boton de Iniciio se sesion en donde verifica si son correctas la crendenciales y si es 
   //asi entonces te dirige a la pantalla principal
  Widget buttonLogin() {
  return FractionallySizedBox(
    widthFactor: 0.6, // Factor de tamaño horizontal del botón (60% del ancho disponible)
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) { // Valida el formulario
          _formKey.currentState!.save(); // Guarda los valores del formulario
          UserCredential? credenciales = await login(email, password); // Realiza el inicio de sesión
          if (credenciales != null) {
            if (credenciales.user != null) {
              if (credenciales.user!.emailVerified) { // Verifica si el usuario ha verificado su correo electrónico
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()), // Navega a la página principal
                  (Route<dynamic> route) => false, // Elimina todas las rutas anteriores en la pila de navegación
                );
              } else {
                // El usuario no ha verificado su correo electrónico
                setState(() {
                  error = "Verifica tu Correo"; // Actualiza el mensaje de error
                });
              }
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[500], // Cambia el color de fondo del botón
      ),
      child: Text("Iniciar Sesion"), // Texto del botón
    ),
  );
}


  //Apartado en donde puedes Crear tu cuenta si esque no la tienes
Widget Registrarse() {
  return Container(
    width: 300, // Ancho del fondo transparente
    height: 60, // Alto del fondo transparente
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.4), // Fondo semitransparente
      borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
    ),
    padding: EdgeInsets.all(4.0), // Espacio interno para los textos
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¿No tienes cuenta?", // Texto "¿No tienes cuenta?"
            style: TextStyle(
              color: Colors.white, // Color del texto blanco
              fontSize: 16, // Tamaño de fuente 16
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()), // Navegación a la página UserPage()
              );
            },
            child: Text(
              "Registrarse", // Texto "Registrarse"
              style: TextStyle(
                color: Colors.redAccent, // Color del texto rojo acentuado
                fontSize: 18, // Tamaño de fuente 18
                fontWeight: FontWeight.bold, // Fuente en negrita
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



  //Aca es en donde se procede a validar la contraseña y devolver parametros de "Error"
   Future<UserCredential?> login(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // Usuario no encontrado
      setState(() {
        error = 'Usuario no encontrado'; // Actualiza el mensaje de error en el estado para mostrar al usuario
      });
    }
    if (e.code == 'wrong-password') {
      // Contraseña incorrecta
      setState(() {
        error = 'Contraseña incorrecta'; // Actualiza el mensaje de error en el estado para mostrar al usuario
      });
    }
  }
}

}

//-------------------------------------------------------
//Tener en cuenta que tienes que tener instalado las dependencias de 
//pubsepec.yaml

//firebase_core: ^2.12.0
//  firebase_auth: ^4.6.0

