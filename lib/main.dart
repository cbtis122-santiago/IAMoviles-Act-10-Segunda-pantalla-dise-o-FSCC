import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alaburger',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginAlaburger(),
    );
  }
}


// Agrega esta clase a tu archivo actual
class LoginAlaburger extends StatefulWidget {
  const LoginAlaburger({super.key});

  @override
  State<LoginAlaburger> createState() => _LoginAlaburgerState();
}

class _LoginAlaburgerState extends State<LoginAlaburger> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          // Mantenemos las llamas sutiles de fondo para consistencia
          Positioned(
            right: -50,
            top: -20,
            child: Icon(Icons.local_fire_department, size: 300, color: Colors.orange),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  // TÍTULO SEGÚN BOCETO
                  const Center(
                    child: Text(
                      'INICIO Sesión',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(color: Colors.orange, blurRadius: 15),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // CAMPO CORREO
                  _buildLabel("Correo Electrónico"),
                  _buildTextField(Icons.email_outlined, "ejemplo@mail.com"),
                  
                  const SizedBox(height: 25),

                  // CAMPO CONTRASEÑA
                  _buildLabel("Contraseña"),
                  _buildTextField(Icons.lock_outline, "********", isPassword: true),

                  const SizedBox(height: 15),

                  // RECORDARME (CHECKBOX)
                  Row(
                    children: [
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.orange),
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: Colors.orange,
                          checkColor: Colors.black,
                          onChanged: (val) => setState(() => _rememberMe = val!),
                        ),
                      ),
                      const Text("Recordarme", style: TextStyle(color: Colors.white70)),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // BOTÓN INGRESAR
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí navegarías al Menú que ya hiciste
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => const MenuAlaburger())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 10,
                        shadowColor: Colors.orange,
                      ),
                      child: const Text(
                        'INGRESAR',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // BOTÓN REGISTRATE
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Registrate',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // NAVBAR IGUAL AL MENÚ PARA CONTINUIDAD
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // Widget auxiliar para las etiquetas
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 5),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget auxiliar para los inputs
  Widget _buildTextField(IconData icon, String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white24),
          prefixIcon: Icon(icon, color: Colors.orange),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Colors.orange)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.arrow_back_ios_new, color: Colors.white70),
          const Icon(Icons.person_pin, color: Colors.orange, size: 38),
          const Icon(Icons.home_filled, color: Colors.white70),
        ],
      ),
    );
  }
}


class MenuAlaburger extends StatelessWidget {
  const MenuAlaburger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: const Center(
        child: Text('Welcome to the menu!'),
      ),
    );
  }
}