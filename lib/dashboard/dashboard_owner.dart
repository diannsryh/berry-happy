import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:berry_happy/menu/add_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:berry_happy/services/data_service.dart';

class DashboardOwner extends StatefulWidget {
  const DashboardOwner({Key? key}) : super(key: key);

  @override
  State<DashboardOwner> createState() => _DashboardOwnerState();
}

class _DashboardOwnerState extends State<DashboardOwner> {
  Future<List<Menu>>? _menu;
  @override
  void initState() {
    super.initState();
    _menu = DataService.fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  padding: const EdgeInsets.all(20.0),
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

              // // Total Order Display
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, bottom: 5, left: 65, right: 65),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         children: [
              //           Text(
              //             "Rp.69.000",
              //             style: GoogleFonts.poppins(
              //                 fontWeight: FontWeight.bold, fontSize: 20),
              //           ),
              //           Text(
              //             "Total Income",
              //             style: GoogleFonts.poppins(
              //                 fontSize: 16, fontWeight: FontWeight.normal),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Menu List Container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FutureBuilder<List<Menu>>(
                    future: _menu,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final item = data[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${item.menuName}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: const Color.fromARGB(
                                                    255, 36, 31, 31),
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text('Rp. ${item.menuPrice}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: const Color.fromARGB(
                                                    255, 36, 31, 31),
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text('${item.descMenu}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: const Color.fromARGB(
                                                    255, 36, 31, 31),
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ],
                                      ),
                                    ),
                                    if (item.imageUrl != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                            Uri.parse(
                                                    '${Endpoints.baseUAS}/static/storages/${item.imageUrl!}')
                                                .toString(),
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMenu()),
          );
        },
        backgroundColor: const Color.fromARGB(225, 223, 6, 112),
        child: const Icon(Icons.add),
      ),
    );
  }
}
