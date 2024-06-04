import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:berry_happy/components/assets_image_widget.dart';

class DashboardConsumer extends StatefulWidget {
  const DashboardConsumer({super.key});

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
            const Divider(
              color: Colors.white,
            ),
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
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 122, 122, 122))),
                    prefixIcon: const Icon(Icons.search, size: 35),
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.white),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 65, right: 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Rp.69.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Total Order"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "15-30 min",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Delivery Time")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class DashboardConsumer extends StatefulWidget {
//   const DashboardConsumer({super.key});

//   @override
//   State<DashboardConsumer> createState() => _DashboardConsumerState();
// }

// class _DashboardConsumerState extends State<DashboardConsumer> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Divider(),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 16, right: 20),
//                       child: Icon(Icons.search),
//                     ),
//                     hintText: 'Find Courses'),
//               )),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }
