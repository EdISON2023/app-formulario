import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(40.0),
            child: CircleAvatar(
              radius: 150.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('images/user.png'),
            ),
          ),
          const Divider(
            height: 20.0,
          ),
          Text(
            'Formulario de Registro',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'cursiva',
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 160.0,
            height: 15.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'NOMBRE',
            icon: Icons.person_outline,
            suffixIcon: null,
            hintText: 'Ingrese su nombre',
            labelText: 'Nombre',
            helperText: 'Ingrese un nombre',
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'APELLIDO',
            icon: Icons.person_outline,
            suffixIcon: null,
            hintText: 'Ingrese su apellido',
            labelText: 'Apellido',
            helperText: 'Ingrese un apellido',
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'TELEFONO',
            icon: Icons.phone_outlined,
            suffixIcon: null,
            hintText: 'Ingrese su número de teléfono',
            labelText: 'Teléfono',
            helperText: 'Ingrese un número de teléfono',
            autofocus: false,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            obscureText: false,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'USER-NAME',
            icon: Icons.person_outline,
            suffixIcon: null,
            hintText: 'Ingrese su nombre de usuario',
            labelText: 'Nombre de usuario',
            helperText: 'Ingrese un nombre de usuario',
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'EMAIL',
            icon: Icons.alternate_email_outlined,
            suffixIcon: null,
            hintText: 'Ingrese su dirección de correo electrónico',
            labelText: 'Correo electrónico',
            helperText: 'Ingrese un correo electrónico',
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'PASSWORD',
            icon: Icons.lock_outline,
            suffixIcon: null,
            hintText: 'Ingrese una contraseña',
            labelText: 'Contraseña',
            helperText: 'Ingrese una contraseña',
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: _passwordController,
          ),
          const Divider(
            height: 20.0,
          ),
          buildTextField(
            'CONFIRMAR CONTRASEÑA',
            icon: Icons.lock_outline,
            suffixIcon: null,
            hintText: 'Confirme su contraseña',
            labelText: 'Confirmar contraseña',
            helperText: 'Confirme su contraseña',
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: _confirmPasswordController,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ElevatedButton(
              onPressed: () {
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                if (password == confirmPassword) {
                  print('¡Contraseñas coinciden!');
                  // Continuar con el proceso de inicio de sesión
                } else {
                  print('¡Las contraseñas no coinciden!');
                  // Mostrar un mensaje de error al usuario
                }
              },
              child: const Text(
                'Registrate Ahora',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.orange,
              ),
            ),
          ),
          const Divider(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String label, {
    required IconData icon,
    required IconData? suffixIcon,
    required String hintText,
    required String labelText,
    required String helperText,
    required bool autofocus,
    required TextInputType keyboardType,
    required bool obscureText,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        enableInteractiveSelection: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintText: hintText,
          helperText: helperText,
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(color: Colors.grey),
          helperStyle: const TextStyle(color: Colors.grey),
        ),
        autofocus: autofocus,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
