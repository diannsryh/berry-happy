import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardConsumer extends StatefulWidget {
  const DashboardConsumer({Key? key}) : super(key: key);

  @override
  State<DashboardConsumer> createState() => _DashboardConsumerState();
}

class _DashboardConsumerState extends State<DashboardConsumer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 255, 204, 229),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Divider(color: Colors.white),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                height: 55.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 224, 224, 224),
                    hintText: 'Search...',
                    hintStyle: GoogleFonts.poppins(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 122, 122, 122)),
                    ),
                    prefixIcon: const Icon(Icons.search, size: 35),
                  ),
                ),
              ),
            ),

            const Divider(color: Colors.white),

            // Profile, Restaurant Name, and Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/logo.png'), // Add your image asset here
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berry Happy Cafe',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < 4 ? Colors.yellow : Colors.grey,
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Divider(color: Colors.white),

            // Total Order Display
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 65, right: 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Rp.69.000",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Total Order",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
