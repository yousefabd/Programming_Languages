import 'package:flutter/material.dart';
import 'package:prog_languages/screens/home.dart';
import 'package:prog_languages/screens/login.dart';
import 'package:prog_languages/screens/register.dart';

class PharmaStore extends StatefulWidget {
  const PharmaStore({super.key});

  @override
  State<PharmaStore> createState() {
    return _PharmaStoreState();
  }
}

class _PharmaStoreState extends State<PharmaStore> {
  //method that will push log in screen to the side to replace it with register screen
  void _pushRegister() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset(0.0, 0.0);
          const curve = Curves.easeInOutQuart;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _loginAccount(String number, String password) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(onLogout: _logoutAccount),
      ),
    );
  }

  void _logoutAccount() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // return LogInScreen(
    //   onRegisterAccount: _pushRegister,
    //   onLoginAccount: _loginAccount,
    // );
    return HomeScreen(onLogout: _logoutAccount);
  }
}
