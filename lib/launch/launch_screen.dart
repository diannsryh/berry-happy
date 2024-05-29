import 'package:berry_happy/login/login_screen.dart';
import 'package:flutter/material.dart';

class LaunchSceen extends StatefulWidget {
  const LaunchSceen({super.key});

  @override
  State<LaunchSceen> createState() => _LaunchSceenState();
}

class _LaunchSceenState extends State<LaunchSceen> {
  @override
  void initState() {
    super.initState();
    // Navigasi otomatis setelah 5 detik
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  LoginScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 229),
      body: Stack(
        //use to make text or image overlap each other
        children: [
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
            ],
          ))
        ],
      ),
    );
  }
}
