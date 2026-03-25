import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'insesion.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  void _registrar() {
    if (_passController.text == _confirmPassController.text && _emailController.text.isNotEmpty) {
      // Guardar en "LocalStorage"
      LocalStorage.userName = _userController.text;
      LocalStorage.userEmail = _emailController.text;
      LocalStorage.userPassword = _passController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario registrado con éxito")),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InSesionPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Cuenta"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _buildField("Nombre de usuario", _userController, Icons.person),
            _buildField("Correo electrónico", _emailController, Icons.email),
            _buildField("Contraseña", _passController, Icons.lock, obscure: true),
            _buildField("Confirmar contraseña", _confirmPassController, Icons.lock_outline, obscure: true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _registrar,
              child: const Text("Registrarse", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const InSesionPage())),
              child: const Text("¿Ya tienes cuenta? Inicia Sesión", style: TextStyle(color: Color(0xFF1976D2))),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(String hint, TextEditingController controller, IconData icon, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF1976D2)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}