import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop_test/home_screen.dart';

void main() => runApp(TravelAppWrapper());

class TravelAppWrapper extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Travel',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: TravelApp(title: 'Flutter Travel App'),
    );
  }
}

class TravelApp extends StatefulWidget {
  TravelApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<Widget> _screens = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text("Second Screen"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Third Screen"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Fourth Screen"),
      ),
    ),
  ];
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
  }

  onItemClicked(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: buildBottomNavigationBar(context),
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: _screens[_currentPage],
    );
  }

  Widget buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          final SnackBar snackbar = SnackBar(
            content: Text('Account menu tapped'),
            backgroundColor: Colors.black,
          );

          scaffoldKey.currentState.showSnackBar(snackbar);
        },
        icon: Icon(
          Icons.account_circle,
          color: Colors.black54,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              final SnackBar snackbar = SnackBar(
                content: Text('Bell button tapped'),
                backgroundColor: Colors.black,
              );

              scaffoldKey.currentState.showSnackBar(snackbar);
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.black54,
            )),
      ],
    );
  }

  buildBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
        activeIcon: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        title: Text(title),
        icon: Icon(
          icon,
          color: Colors.black,
        ));
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemClicked,
      backgroundColor: Colors.grey.shade50,
      selectedItemColor: Colors.blueGrey,
      elevation: 4.0,
      currentIndex: _currentPage,
      items: [
        buildBarItem(Icons.home, 'Home'),
        buildBarItem(Icons.favorite, 'Favs'),
        buildBarItem(Icons.message, 'Comments'),
        buildBarItem(Icons.person, 'Account'),
      ],
    );
  }
}
