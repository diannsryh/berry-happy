import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:berry_happy/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void _showMenuDetails(Menu menu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow the modal to be scrollable
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (menu.imageUrl != null)
                      Center(
                        child: Image.network(
                          Uri.parse(
                                  '${Endpoints.urlUAS}/static/storages/${menu.imageUrl!}')
                              .toString(),
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    SizedBox(height: 10),
                    Text(
                      menu.menuName,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp. ${menu.menuPrice}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      menu.descMenu,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement add to cart functionality here
                          Navigator.pop(context);
                        },
                        child: Text('Add to Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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

            // Total Order Display Container
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 204, 229),
                borderRadius: BorderRadius.circular(20.0),
              ),
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

            // Menu List Container
            Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
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
                        return InkWell(
                          onTap: () => _showMenuDetails(item),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.menuName,
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: const Color.fromARGB(
                                              255, 36, 31, 31),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Rp. ${item.menuPrice}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                              255, 36, 31, 31),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        item.descMenu,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 36, 31, 31),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (item.imageUrl != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                        Uri.parse(
                                                '${Endpoints.urlUAS}/static/storages/${item.imageUrl!}')
                                            .toString(),
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
