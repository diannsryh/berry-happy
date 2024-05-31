import 'package:berry_happy/cart/cart_screen.dart';
// import 'package:berry_happy/cart/payment_screen.dart';
import 'package:berry_happy/dashboard/dashboard_consumer.dart';
import 'package:berry_happy/launch/launch_screen.dart';
import 'package:berry_happy/login/main_login.dart';
import 'package:berry_happy/profile/profile_consumer.dart';
import 'package:berry_happy/setting/setting_screen.dart';
import 'package:berry_happy/sign up/signup_screen.dart';
import 'package:berry_happy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LaunchScreen(),
      routes: {
        '/dashboard-consumer': (context) => const DashboardConsumer(),
        // '/payment': (context) => const PaymentScreen(),
        '/cart': (context) => const CartScreen(),
        '/main-login': (context) => const MainLogin(),
        '/signup-screen': (context) => const SignUp(),
        '/my-homepage': (context) => MyHomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex =
      0; //var use to save active screen index, initialize by 0 meanns that the fisrt screen in list  screens is set as default.
  // int _selectedIndex = 0;

  final List<Widget> screens = [
    //a list of widget objects that represent the various screens available in the application.
    DashboardConsumer(), //index 0
    const ConsumerProfile(), //index 1
    const SettingScreen(), //index 2
  ];

  // void _onItemTapped(int index) {//method called when user on tap item in navigation
  //   setState(() {//to update the state index
  //     activeIndex = index;//active index will updated according to the idex selected
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 255, 65, 158)), // recolor the icon
        ),
        body: screens[activeIndex], //body will display the current active index
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Constants.scaffoldBackgroundColor,
            buttonBackgroundColor: Constants.primaryColor,
            items: [
              Icon(
                Icons.home,
                size: 30.0,
                color: activeIndex == 0 ? Colors.white : Constants.activeMenu,
              ),
              Icon(
                Icons.person,
                size: 30.0,
                color: activeIndex == 1 ? Colors.white : Constants.activeMenu,
              ),
              Icon(
                Icons.settings,
                size: 30.0,
                color: activeIndex == 2 ? Colors.white : Constants.activeMenu,
              ),
            ],
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            }),
        drawer: Drawer(
            child: ListView(
          //is used to display a list of items in order, either vertically or horizontally.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 126, 188),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              //combination with list view to make items organized
              title: const Text('API'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => NewsScreen()));
              },
            ),
            ListTile(
              title: const Text('CRUD SQLITE'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AddCourse()));
              },
            ),
            ListTile(
              title: const Text('Data Screen'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => DatasScreen()));
              },
            ),
            ListTile(
              title: const Text('Customer Service'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CsScreen()));
              },
            ),
            ListTile(
              title: const Text('Counter Screen'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CounterScreen()));
              },
            ),
            ListTile(
              title: const Text('Welcome Screen'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Balances Screen'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => BalanceScreen()));
              },
            ),
            ListTile(
              title: const Text('Spendings Screen'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SpendingScreen()));
              },
            ),
          ],
        )));
  }
}
