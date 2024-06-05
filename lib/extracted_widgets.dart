import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:neru_lending/provider_engine.dart';
import 'package:provider/provider.dart';


class MainButton extends StatelessWidget {
  Function buttonFunction;
  String? buttonText;

  MainButton(
      {super.key, required this.buttonFunction, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white
          ], // Violet to pink gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors
              .transparent, // Ensure background is transparent to show gradient
        ),
        onPressed: () {
          buttonFunction();
        },
        child: Text(
          buttonText!,
          style: TextStyle(
              color: Color(0xFF35B079),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              fontFamily: 'highland'
          ),
        ),
      ),
    );
  }
}


class MainTextField extends StatelessWidget {
  Function changeFunction;
  String? label;
  final _formKey = GlobalKey<FormState>();

  MainTextField({super.key, required this.label, required this.changeFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: _formKey,
        child: TextFormField(

          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            changeFunction(value);
          },
          textAlign: TextAlign.left,
          decoration: MainTextFieldInputDecoration(label),
          validator: _validateEmail,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}

class MainTextFieldPassword extends StatelessWidget {
  Function changeFunction;
  String? label;
  final _formKey = GlobalKey<FormState>();

  MainTextFieldPassword(
      {super.key, required this.label, required this.changeFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: _formKey,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {
            changeFunction(value);
          },
          textAlign: TextAlign.left,
          decoration: MainTextFieldInputDecoration(label),
          validator: _validatePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
        ),
      ),
    );
  }
}

String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password.';
  }
  if (value.length < 7) {
    return 'Password should contain min 6 characters';
  }
  return null;
}

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address.';
  }
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

InputDecoration MainTextFieldInputDecoration(String? label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(letterSpacing: 3),
    filled: true,
    fillColor: Colors.black,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  );
}




class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black], // Violet to pink gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
class ProgressIndicatorContainer extends StatelessWidget {
  const ProgressIndicatorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 200,
        maxWidth: 300,
        minHeight: 100,
        minWidth: 100,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading Please Wait',
            style: TextStyle(fontSize: 20),
          ),
          SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}

class buildSocialButton extends StatelessWidget {
  const buildSocialButton({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[200],
      ),
      child: Image.asset(imagePath),
    );
  }
}


Widget buildSocialLoginSection(BuildContext context) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialButton(imagePath: 'images/google.png'),
            buildSocialButton(imagePath: 'images/apple.png'),
            buildSocialButton(imagePath: 'images/facebook.png'),
          ],
        ),
      ],
    ),
  );
}

class BlurryHUD extends StatelessWidget {
  Widget childWidget;

  BlurryHUD({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: Provider.of<MainEngine>(context).getLoadingBool(),
      blurEffectIntensity: 4,
      progressIndicator: ProgressIndicatorContainer(),
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      child: childWidget,
    );
  }
}
