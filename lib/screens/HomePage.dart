// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:navarrete/screens/Contactanos.dart';
import 'package:navarrete/screens/LoginPage.dart';
import 'package:navarrete/screens/Ofertas.dart';
import 'package:navarrete/screens/Ubicacion.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  const MyHome({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distribuciones Navarrete',
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaPrincipal(),
        '/Ofertas': (context) => Ofertas(),
        '/MyUbicacion': (context) => MyUbicacion(),
        '/Contacto': (context) => Contacto(),
      },
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

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _paginaActual = 0;

  List<String> images = [
    "https://i0.wp.com/enlacelatinonc.org/wp-content/uploads/2022/05/Di%CC%81a-de-la-Madre-2.jpg?fit=1300%2C732&ssl=1",
    "https://static.utilex.pe/images/home/main_section/mainbanner-secondary-banner-1C5JRRWY5ARKQI.jpeg",
    "https://uejn.org.ar/sites/default/files/field/image/Flyers%20Campan%CC%83a%20Escolar%202023.png",
    "https://static.vecteezy.com/system/resources/previews/001/237/934/non_2x/back-to-school-banner-with-school-supplies-and-calligraphy-vector.jpg",
  ];

  List<String> imagesmarca = [
    "https://pbs.twimg.com/profile_images/730485356794150912/3aYJAlIa_400x400.jpg",
    "https://pbs.twimg.com/profile_images/609924812773920768/ZHjn_MYh_400x400.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://previews.123rf.com/images/druzhinina/druzhinina1707/druzhinina170700214/82769810-fondo-transparente-de-diferentes-%C3%BAtiles-escolares-primer-d%C3%ADa-de-clases-iconos-de-l%C3%ADnea-de-regreso.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Pagina Principal"),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,//Esto es para ocultar la flecha del pag de inicio

          //Esto es para salir o cerrar sesion ,esta en la parte superior derecha
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
          
          
        ),
        body: ListView(
          children: [
            Text(
              'Navarrete',
              style: GoogleFonts.concertOne(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "-----",
              style: TextStyle(color: Colors.transparent),
            ),
            Container(
              child: _swiper(),
            ),
            Center(
              child: Text(
                "CATÁLOGOS PRODUCTOS",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://www.20milproductos.com/blog/wp-content/uploads/2017/07/oie_V5j9tD2023Ut.jpg",
                width: 140,
                height: 120,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "Útiles escolares",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://http2.mlstatic.com/D_NQ_NP_794680-MCO46650926895_072021-V.jpg",
                width: 140,
                height: 120,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "Artículos de Oficina",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://cdn.shopify.com/s/files/1/0452/6925/4301/products/7_f9a350b6-3e58-46e2-98be-cab64e0cc27d_large.jpg?v=1662143143",
                width: 140,
                height: 120,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "Arte y pintura",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "------------",
                style: GoogleFonts.aBeeZee(color: Colors.transparent),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.redAccent, backgroundColor: Colors.amber),
                child: Text(
                  "VER MÁS",
                  style: GoogleFonts.concertOne(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.red[800]),
                )),
            Center(
              child: Text(
                'Grandes marcas',
                style: GoogleFonts.concertOne(
                    fontSize: 45,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "------",
              style: TextStyle(color: Colors.transparent),
            ),
            Container(
              child: _swiper2(),
            ),
          ],
        ),

        //BARRA INFERIOR DE NAVEGACION
         
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == _paginaActual) {
                 return; // No hacer nada si se selecciona la misma página
                }
            setState(() {
              _paginaActual = index;
              if (index == 0) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                // );
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Ofertas()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyUbicacion()),
                );
              } else if (index == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Contacto()),
                );
              }
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Ofertas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Ubicación",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: "Contacto",
            ),
          ],
        ),
      ),
    );
  }


  //PRIMER CARRUSEL
  Widget _swiper() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

//SEGUNDO CARRUSEL
  Widget _swiper2() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imagesmarca[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imagesmarca.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}

//Dependencias en yaml para el proyecto de la pagina de HomePage
// PUBSPEC.YAML
// ----------------------------------------------
//   google_fonts: ^4.0.4 (DEBAJO DE CUPERTINO_ICONS LINEA 38)
//   flutter_swiper: ^1.1.6 (DEBAJO DE SDK:FLUTTER  LINEA 32)