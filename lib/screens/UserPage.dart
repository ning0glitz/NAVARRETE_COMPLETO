import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navarrete/screens/HomePage.dart';

class UserPage extends StatefulWidget {
  @override
  State createState() {
    return _UserPageState();
  }
}
class _UserPageState extends State<UserPage>{
  
  late String email,password;
  final _formKey = GlobalKey<FormState>();
  String error='';

  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrate'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Crear Usuario",style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          Offstage(
            offstage: error == '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(error,style: TextStyle(color: Colors.red,fontSize: 16),),
            ),
          ),
          Padding(
          padding:  const EdgeInsets.all(8.0),
            child: formulario()
            ),
            buttonCrearUsuario(), 
        ],
      ),
    );
  }

  Widget formulario(){
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmail(),
        const Padding(padding: EdgeInsets.only(top: 12)),
        buildPassword(),

    ],));
  }

  Widget buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black)
        )
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value){
        email = value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return "Campo Obligatorio";
        }
        return null;
      },
    );

  }
  Widget buildPassword(){
  
    return TextFormField(
       decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8),
          borderSide: new BorderSide(color:Colors.black)
        )
      ),
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          return "Campo Obligatorio";
        }
        return null;
      },
      onSaved: (String? value){
        password = value!;
      },
    );
    
  }

 Widget buttonCrearUsuario() {
  return FractionallySizedBox(
    widthFactor: 0.6,
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          UserCredential? credenciales = await crear(email, password);
          if (credenciales != null) {
            if (credenciales.user != null) {
              await credenciales.user!.sendEmailVerification();
              Navigator.of(context).pop();
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[500], // Cambia el color del botón aquí
      ),
      child: Text("Registrarse"),
    ),
  );
}

   Future<UserCredential?>crear(String email,String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use'){
          //Correo en uso
          setState(() {
            error = 'Usuario no encontrado';
          });
      }
      if (e.code == 'weak-password'){
         //Contraseña muy debil
         setState(() {
            error = 'Contraseña debil';
          });
      }
       
    }

   }
}
