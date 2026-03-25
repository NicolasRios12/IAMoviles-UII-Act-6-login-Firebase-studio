import 'package:flutter/material.dart';
import 'package:myapp/Pages/insesion.dart';
import 'package:myapp/Pages/registro.dart';



void main() {
  runApp(const DogClubApp());
}

// Simulación de LocalStorage básica en memoria
class LocalStorage {
  static String? userEmail;
  static String? userPassword;
  static String? userName;
}

class DogClubApp extends StatelessWidget {
  const DogClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Club',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1976D2)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.pets, color: Color(0xFF1976D2), size: 40),
                  SizedBox(width: 10),
                  Text(
                    "Dog Club",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1)),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildButton(context, "Iniciar Sesión", const InSesionPage()),
              const SizedBox(height: 15),
              _buildButton(context, "Registrarse", const RegistroPage()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color(0xFFBBDEFB),
        child: const Center(child: Text("© 2026 Dog Club - Guardería Canina")),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D47A1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}