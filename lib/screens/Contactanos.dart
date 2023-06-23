import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'Ofertas.dart';
import 'Ubicacion.dart';

void main() => runApp(MyContac());

class MyContac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distribuidora Navarrete',
      initialRoute: '/',
      routes: {
        
        '/ofertas': (context) => Ofertas(),
        '/ubicacion': (context) => MyUbicacion(),
        '/contacto': (context) => Contacto(),
      },
      //Esto es para cuando no encuentre una ruta aparesca este mensaje
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      },
      
    );
  }
}
//Cuerpo de la Pagina Contactanos
class Contacto extends StatefulWidget {
  const Contacto({Key? key}) : super(key: key);

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  int _paginaActual = 3;

  TextEditingController nombrecontroller = TextEditingController();
  TextEditingController apellidoscontroller = TextEditingController();
  TextEditingController correocontroller = TextEditingController();
  TextEditingController telefonocontroller = TextEditingController();
  TextEditingController asuntocontroller = TextEditingController();
  TextEditingController mensajecontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Contactanos'),
        automaticallyImplyLeading: false,
        //Esto seria una accion para cuando se cierre la sesion
        //Esto es en la parte superior derecha
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app),
            ),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 45),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nombrecontroller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    helperText: "Nombre",
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.amber, width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: apellidoscontroller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Apellidos',
                    helperText: "Apellidos",
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.amber, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: correocontroller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Correo electronico',
                    helperText: "Correo electronico",
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.amber, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: telefonocontroller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Telefono',
                    helperText: "Telefono",
                    prefixIcon: Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.amber, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: asuntocontroller,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Asunto',
                    helperText: "Asunto",
                    prefixIcon: Icon(Icons.message),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.amber, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: mensajecontroller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Mensaje',
                    helperText: "Mensaje",
                    prefixIcon: Icon(Icons.message),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.amber, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> info = {
                        'nombre': nombrecontroller.text,
                        'apellido': apellidoscontroller.text,
                        'correo': correocontroller.text,
                        'telefono': telefonocontroller.text,
                        'asunto': asuntocontroller.text,
                        'mensaje': mensajecontroller.text,
                      };
                      print(info);
                    }
                  },
                  child: Text('Enviar'),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),

      //BARRA DE NAVEGACION EN LA PARTE INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _paginaActual,
        onTap: (index) {
          if (index == _paginaActual) {
                 return; // No hacer nada si se selecciona la misma página
                }
          setState(() {
            _paginaActual = index;
          });
          if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaPrincipal()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Ofertas()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyUbicacion()),
        );
      } else if (index == 3) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Contacto()),
        // );
      }
    
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Ofertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contacto',
          ),
        ],
      ),
    );
  }
}
