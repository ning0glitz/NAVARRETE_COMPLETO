// @dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:navarrete/screens/Contactanos.dart';
import 'package:navarrete/screens/HomePage.dart';
import 'package:navarrete/screens/Ubicacion.dart';

void main() => runApp(MyOferta());

class MyOferta extends StatelessWidget {
  const MyOferta({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distribuidora Navarrete',
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaPrincipal(),
        '/ofertas': (context) => Ofertas(),
        '/ubicaion': (context) => MyUbicacion(),
        '/contacto': (context) => Contacto(),
      },
      //Esto es para que cuando no encuentre un ruta te muestre este mensaje
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

//PAGINA OFERTAS
class Ofertas extends StatefulWidget {
  @override
  State<Ofertas> createState() => _OfertasState();
}

class _OfertasState extends State<Ofertas> {
  int _paginaActual = 1;

  List<String> images = [
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/84983265_10158439655118933_8283258722881372160_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeFGCieF-ej0MQrPJM7LgIQJBTnMdAWl2KUFOcx0BaXYpVC89zY_3mCgnTD8Eny45NIIa7SOCfSFsYcOL4BQ9hTj&_nc_ohc=A_xElSMvUiUAX8SNa0a&_nc_ht=scontent.flim4-3.fna&oh=00_AfB20-MLgB8zkOC4HsJQ9lfaUbxEWyxIJEaBsKnmF6Y_Fg&oe=64986BCD",
    "https://scontent.flim19-1.fna.fbcdn.net/v/t1.6435-9/69955017_10157930979463933_2781053721444876288_n.jpg?stp=dst-jpg_p526x296&_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeG2BZriQq7YHuR9Ps5SQBVeajXUI_v3hutqNdQj-_eG682A840eP9ClEal_BX7jY_ztXo_9ElaLePcXaIysC6JU&_nc_ohc=yKwIZHvGF8UAX-nmYCd&_nc_ht=scontent.flim19-1.fna&oh=00_AfD5l172OXrKKM9E-c9r8d33CFrXnoFgSflELRXCGPZ_3A&oe=64986120",
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/84157965_10158439928568933_297674287681110016_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeEGvrX9gfoo_2o0aUTUFtZYgvG2ZV0Y4gOC8bZlXRjiAw0MBod94Iea6UT79r-WMCNdAUN88PpL9hxnJ0n0sC44&_nc_ohc=lJMO26qygFgAX__0X3g&_nc_ht=scontent.flim4-3.fna&oh=00_AfBkh0YIzJPWHAqsMR9uaQEK7SZxq0kObq1m7mkkvkC96A&oe=649862C3",
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/57870561_10157526716053933_8901062194720931840_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeETD3l0tzRFp0NgBg3Q_byKZ7Qw2wj1CKZntDDbCPUIplOexYZmVpEB-uKQy4J6VO_e-H8rzTNTnktyLoOPi4CP&_nc_ohc=wYQ3LQWN7TYAX8dmf74&_nc_ht=scontent.flim4-3.fna&oh=00_AfCMsvJJ7xROG7BlyDhscU3xq2nohkMvCJqTULawz48Fkg&oe=64985C84",
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/84677935_10158439648898933_8335271296526974976_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeERXjlGi8xKlG8RNPPbJ0qo6XAh943SCHjpcCH3jdIIeLhW2_LVVXxpZJNNVLomzF3mTjJZ_d7UmR6U8HoqNl9a&_nc_ohc=vTu3gR8PxsQAX_vawO2&_nc_oc=AQkBAZYmzd0xsAudONdSHewrYAkE8uaSeDOCTMRZ3l3r6lXgnjEnS1Me5Ga24UZUkiA&_nc_ht=scontent.flim4-3.fna&oh=00_AfA7oLyzjgQPVvUphIO_mJskbqlmeuaywpg-fHzhrJbHRQ&oe=64988C3E",
  ];

  List<String> imagesmarca = [
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/117799863_10159150865503933_9020484166655280369_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeH5gXnK45V65kSSr0DwipVpZKJOz20CYKZkok7PbQJgpqtMpEl_jNtMC17Y8zKzfxOEmEAzVcAMHrCbAiE9pXE1&_nc_ohc=cLob7nfcNRAAX_EXEJw&_nc_ht=scontent.flim4-3.fna&oh=00_AfDeGKui8xy_Zi4s3CFoTUrsB-dP5C-b9FMkFpuWrY3g1A&oe=6498623A",
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/117829742_10159150865498933_7252871398332969155_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeGhLdkie3-PUqPop5W7Z4GgOUfzAsKVCM85R_MCwpUIz5SdneeW4hE57qo48AktME3qxPnVnqo552D5pahzsVVh&_nc_ohc=kiEWvBioS9sAX9gfWgC&_nc_ht=scontent.flim4-3.fna&oh=00_AfDnxaAEeAMGuvabssqMFOzTKmQeUvj4cw9-NMJRA7u89Q&oe=649862B6",
    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.6435-9/117440438_10159150865508933_3181981968550201715_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeErEy69BmR-fV4R9_mfoQPen8TVNS5cdGSfxNU1Llx0ZI6u0E5zgz2a1Xk2d2Sogw6erz-iGtLCmSgvpIRvoNtM&_nc_ohc=_tjO-DoTcK0AX_IRVbj&_nc_ht=scontent.flim4-3.fna&oh=00_AfBofRwCPwgeADhc77tAyV7AwskFGDfDwUL09lg0vXj_YA&oe=64987423",
    "https://scontent.flim4-2.fna.fbcdn.net/v/t1.6435-9/117413220_10159150865493933_4019230619501306619_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHRlD4oE7O0ONtYq5kRhOr2xm_YwRBVZN3Gb9jBEFVk3XoAa91Zh-gIuGu8cSvjy9VknEZSZDt2igedxG8St7nM&_nc_ohc=yHfdnHzXz_YAX9XlMsk&_nc_ht=scontent.flim4-2.fna&oh=00_AfC1ZtBO-37R_vAto1mYlqX4DK7BfFAQvXsx_gIMuazVgQ&oe=64986369",

    //"https://yt3.googleusercontent.com/ytc/AGIKgqPo6JE_7Wb22MRP7NOEim-uF5RD1nKOwWe1R_zY=s900-c-k-c0x00ffffff-no-rj",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://previews.123rf.com/images/druzhinina/druzhinina1707/druzhinina170700214/82769810-fondo-transparente-de-diferentes-%C3%BAtiles-escolares-primer-d%C3%ADa-de-clases-iconos-de-l%C3%ADnea-de-regreso.jpg'
                ),
            fit: BoxFit.cover),
            
      ),
    
      
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Ofertas"),
          automaticallyImplyLeading: false,
          
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            Text(
              'Super Descuento',
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
                "PROMO DEL DIA",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
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
                    color: Color.fromARGB(255, 185, 8, 8),
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
                "Entra al Sorteo ",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://scontent.flim19-1.fna.fbcdn.net/v/t1.6435-9/165824177_10159823075118933_812339263224061437_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeG6mIr6CNqnC7GbfRNC2q5aphCosjvhPV6mEKiyO-E9XpDokB25UY4MqPcccY7p_QjNLOJtNRl7u-b7yb7OU7VA&_nc_ohc=Qg5SfTJBnAkAX8T-4XT&_nc_ht=scontent.flim19-1.fna&oh=00_AfBr1SyRGyADadhDx6B6tMBrIfeBbOX2X76XDdSrDyZh-w&oe=649897C5",
                width: 250,
                height: 200,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(0, 0, 0, 0),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "De Vuelta a Clases",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
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
                'Nuevas Promociones',
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                );
              } else if (index == 1) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => Ofertas()),
                // );
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
