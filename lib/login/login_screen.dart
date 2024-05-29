import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 229),
      body: Column(
        children: [
          SizedBox(height: 100),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/dashboard-consumer'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 85, 27, 124)),
              child: const Text(
                'dasboard',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              )),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/payment'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 85, 27, 124)),
              child: const Text(
                'payment',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              )),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 85, 27, 124)),
              child: const Text(
                'Cart',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              ))
        ],
      ),
    );
  }
}
