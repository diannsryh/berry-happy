import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:berry_happy/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:berry_happy/components/assets_image_widget.dart';

class DashboardConsumer extends StatefulWidget {
  const DashboardConsumer({Key? key}) : super(key: key);

  @override
  State<DashboardConsumer> createState() => _DashboardConsumerState();
}

class _DashboardConsumerState extends State<DashboardConsumer> {
  Future<List<Menu>>? _menu;

  @override
  void initState() {
    super.initState();
    _menu = DataService.fetchMenu();
  }

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
            FutureBuilder<List<Menu>>(
                future: _menu,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return ListTile(
                            title: Column(children: [
                              Text('Menu Name : ${item.menuName}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color:
                                        const Color.fromARGB(255, 36, 31, 31),
                                    fontWeight: FontWeight.normal,
                                  )),
                              Text('Deskripsi : ${item.descMenu}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color:
                                        const Color.fromARGB(255, 36, 31, 31),
                                    fontWeight: FontWeight.normal,
                                  )),
                              Text('Price: ${item.menuPrice}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color:
                                        const Color.fromARGB(255, 36, 31, 31),
                                    fontWeight: FontWeight.normal,
                                  )),
                            ]),
                            subtitle: item.imageUrl != null
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              width: 100,
                                              Uri.parse(
                                                      '${Endpoints.baseURL}/public/${item.imageUrl!}')
                                                  .toString(),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Icon(Icons
                                                      .error), // Display error icon if image fails to load
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : null,
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }
}
