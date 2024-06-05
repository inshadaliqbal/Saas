import 'package:flutter/material.dart';
import 'package:neru_lending/bottom_bar.dart';
import 'package:neru_lending/extracted_widgets.dart';
import 'package:neru_lending/provider_engine.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  static const welcomPage = 'Welcome Page';
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<MainEngine>(context, listen: false).intializeApp();
  }

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: BlurryHUD(
        childWidget: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/city.jpg'), fit: BoxFit.fill),
              ),
              // child: Image(
              //   image: AssetImage('images/city.jpg'),
              //   fit: BoxFit.fitHeight,
              // ),
            ),
            GradientContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Neru Lending',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  MainTextField(
                    label: 'Email',
                    changeFunction: (value) {
                      email = value;
                    },
                  ),
                  MainTextFieldPassword(
                    label: 'Password',
                    changeFunction: (value) {
                      password = value;
                    },
                  ),
                  MainButton(
                      buttonFunction: () async {
                        var loginVar = await Provider.of<MainEngine>(context,
                                listen: false)
                            .signIN(email, password);

                        if (loginVar) {
                          Navigator.pushNamed(context, BottomBar.bottomBar);
                        } else {}
                      },
                      buttonText: 'Sign In'),
                  buildSocialLoginSection(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
