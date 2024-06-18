import 'package:berry_happy/cart/cart_screen.dart';
import 'package:berry_happy/components/customsearch.dart';
import 'package:berry_happy/dashboard/dashboard_owner.dart';
import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:berry_happy/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardConsumer extends StatefulWidget {
  const DashboardConsumer({Key? key}) : super(key: key);

  @override
  State<DashboardConsumer> createState() => _DashboardConsumerState();
}

class _DashboardConsumerState extends State<DashboardConsumer> {
  Future<List<Menu>>? _menu;
  late TextEditingController _searchController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchData(currentPage);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchData(int page) {
    setState(() {
      _menu = DataService.fetchMenu1(currentPage, _searchController.text);
    });
  }

  void _incrementPage() {
    setState(() {
      currentPage++;
      _fetchData(currentPage);
    });
  }

  void _decrementPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
        _fetchData(currentPage);
      });
    }
  }

  void _showMenuDetails(Menu menu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                                  '${Endpoints.baseUAS}/static/storages/${menu.imageUrl!}')
                              .toString(),
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    Text(
                      menu.descMenu,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
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

  void _navigateToCart() {
    // Implement navigation to cart page
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CartScreen()), // Replace with your cart page widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 204, 229),
          title: Text('Berry Happy'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: _navigateToCart,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 204, 229),
                ),
                child: Text(
                  'Berry Happy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                //combination with list view to make items organized
                title: const Text('Owner Screen'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardOwner()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 255, 204, 229),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSearchBox(
                    controller: _searchController,
                    onChanged: (value) => _fetchData(currentPage),
                    onClear: () => _fetchData(currentPage),
                    hintText: 'Search',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  color:
                                      index < 4 ? Colors.yellow : Colors.grey,
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
                const SizedBox(height: 20),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _decrementPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.pink, // Mengatur warna tombol menjadi pink
                        ),
                        child: Text(
                          "Previous Page",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _incrementPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.pink, // Mengatur warna tombol menjadi pink
                        ),
                        child: Text(
                          "Next Page",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
