import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'registro.dart';

class InSesionPage extends StatefulWidget {
  const InSesionPage({super.key});

  @override
  State<InSesionPage> createState() => _InSesionPageState();
}

class _InSesionPageState extends State<InSesionPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    if (_emailController.text == LocalStorage.userEmail && 
        _passController.text == LocalStorage.userPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Bienvenido de nuevo, ${LocalStorage.userName}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Credenciales incorrectas o usuario no registrado")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ingresar"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.pets, size: 80, color: Color(0xFF1976D2)),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Correo electrónico",
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1976D2)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF1976D2)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _login,
              child: const Text("Iniciar Sesión", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistroPage())),
              child: const Text("¿No tienes cuenta? Regístrate", style: TextStyle(color: Color(0xFF1976D2))),
            )
          ],
        ),
      ),
    );
  }
}