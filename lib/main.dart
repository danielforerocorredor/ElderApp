import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación de Salud',
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuOptions = [
    {'title': 'Calendario', 'icon': Icons.calendar_today},
    {'title': 'Medicamentos', 'icon': Icons.local_pharmacy},
    {'title': 'Alarma de Medicamentos', 'icon': Icons.alarm},
    {'title': 'Contactos', 'icon': Icons.contacts},
    {'title': 'Registro de Datos de Salud', 'icon': Icons.assignment},
    {'title': 'Emergencia', 'icon': Icons.warning},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Salud'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Opciones de Salud',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: menuOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Lógica para abrir la ventana correspondiente al ítem del menú
                    _handleMenuItemClick(context, index);
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          menuOptions[index]['icon'],
                          size: 40.0,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          menuOptions[index]['title'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleMenuItemClick(BuildContext context, int index) {
    // Lógica para abrir la ventana correspondiente al ítem del menú
    switch (index) {
      case 0:
        _navigateToScreen(context, CalendarScreen());
        break;
      case 1:
        _navigateToScreen(context, MedicationsScreen());
        break;
      case 2:
        _navigateToScreen(context, AlarmScreen());
        break;
      case 3:
        _navigateToScreen(context, ContactsScreen());
        break;
      case 4:
        _navigateToScreen(context, HealthDataScreen());
        break;
      case 5:
        _navigateToScreen(context, EmergencyScreen());
        break;
    }
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido del Calendario'),
      ),
    );
  }
}

class MedicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido de Medicamentos'),
      ),
    );
  }
}

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarma de Medicamentos'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido de la Alarma de Medicamentos'),
      ),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido de Contactos'),
      ),
    );
  }
}

class HealthDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Datos de Salud'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido del Registro de Datos de Salud'),
      ),
    );
  }
}

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergencia'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Contenido de Emergencia'),
      ),
    );
  }
}
