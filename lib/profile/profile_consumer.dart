import 'package:flutter/material.dart';

class ConsumerProfile extends StatefulWidget {
  const ConsumerProfile({super.key});

  @override
  State<ConsumerProfile> createState() => _ConsumerProfileState();
}

class _ConsumerProfileState extends State<ConsumerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView()),
    );
  }
}
