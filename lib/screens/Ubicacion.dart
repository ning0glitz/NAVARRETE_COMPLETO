import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Contactanos.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'Ofertas.dart';

void main() {
  runApp(MyUbicacion());
}

class Location {
  final String name;
  final double latitude;
  final double longitude;
  final String address;
  final String contact;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.contact,
  });
}

final List<Location> locations = [
  Location(
    name: 'Cercado de Lima',
    latitude: -12.0453,
    longitude: -77.0308,
    address: 'Av. Nicolás de Piérola 1463, Lima 15001',
    contact:
        'Tel.: 981 414 361 / 946 094 402\nserviciocliente@navarrete.com.pe',
  ),
  Location(
    name: 'Santa Anita',
    latitude: -12.0424,
    longitude: -76.9742,
    address: 'Carr. Central 2, Santa Anita 15008',
    contact:
        'Tel: 362-0606 Anexo: 1030\n940 442 955\ntda.sanita@navarrete.com.pe',
  ),
  Location(
    name: ' Los Olivos',
    latitude: -12.10954,
    longitude: -77.01884,
    address: 'Av. Carlos Izaguirre 544-546',
    contact: 'Tel.: 529 0732 / 998 357 740\tda.olivos@navarrete.com.pe',
  ),
  Location(
    name: 'Tienda Surquillo',
    latitude: -12.0453,
    longitude: -77.0308,
    address: 'Av. República de Panamá 4490.',
    contact: 'Tel.: 444 0793 /977 326 940\tda.surquillo@navarrete.com.pe',
  ),
];

class MyUbicacion extends StatefulWidget {
  @override
  _MyUbicacionState createState() => _MyUbicacionState();
}

class _MyUbicacionState extends State<MyUbicacion>
    with SingleTickerProviderStateMixin {
  int _paginaActual = 2;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: locations.length, vsync: this);
  }

//---------------------
//Esto seria el tab en donde te dirige a otras pestañas de los Mapas
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/ofertas': (context) => Ofertas(),
        '/ubicacion': (context) => MyUbicacion(),
        '/contacto': (context) => Contacto(),
      },

      //Esto es para que cuando no encuentre un ruta ,te aparesca este mensaje
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      },

      home: Scaffold(
        appBar: AppBar(
          title: Text("Tiendas"),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
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
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: locations
                  .map((location) => Tab(
                        child: Text(
                          location.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: locations
                    .map((location) => buildMapPage(location))
                    .toList(),
              ),
            ),
          ],
        ),

        //BARRA INFERIOR DE NAVEGACION
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PaginaPrincipal()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Ofertas()),
              );
            } else if (index == 2) {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyUbicacion()),
              // );
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Contacto()),
              );
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
      ),
    );
  }

//-----------------------
  Widget buildMapPage(Location location) {
    return Column(
      children: [
        Container(
          height: 200,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(location.latitude, location.longitude),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(location.latitude, location.longitude),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          location.name,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inspiration'),
        ),
        SizedBox(height: 5.0),
        Text(
          location.address,
          style: TextStyle(fontSize: 16.0, fontFamily: 'Inspiration'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.0),
        Text(
          location.contact,
          style: TextStyle(fontSize: 16.0, fontFamily: 'Inspiration'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            openMaps(location.latitude, location.longitude);
          },
          label: const Text(
            "Abrir en Google Maps",
            style: TextStyle(fontFamily: 'Inspiration'),
          ),
          icon: const Icon(Icons.directions),
        ),
      ],
    );
  }

  Future<void> openMaps(double latitude, double longitude) async {
    //Esta es otra forma de poder implementar el final tipo uri ,es una version mas extendida
    // final httpsUri = Uri(
    // scheme: 'https',
    // host: 'www.google.com',
    // path: 'maps/search',
    // queryParameters: {
    //   'api': '1',
    //   'query': '$latitude,$longitude'
    // });
    final httpsUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    // Uri httpsUri = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(httpsUri)) {
      await launchUrl(httpsUri);
    } else {
      throw 'No se pudo abrir Google Maps.';
    }
  }
}
//Tener en cuenta tener instalado las dependencias para el maps ,en el pubpec.yaml
//flutter_map: ^0.13.1
//##Dependencias de home
//url_launcher: ^6.0.3
//
