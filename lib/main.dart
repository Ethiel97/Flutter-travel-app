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

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemClicked,
      backgroundColor: Colors.grey.shade50,
      selectedItemColor: Colors.blueGrey,
      elevation: 4.0,
      currentIndex: _currentPage,
      items: [
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blueGrey,
            ),
            title: Text('Home'),
            icon: Icon(
              Icons.home,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.blueGrey,
            ),
            title: Text('Favs'),
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.message,
              color: Colors.blueGrey,
            ),
            title: Text('Comments'),
            icon: Icon(
              Icons.message,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            title: Text('Account'),
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ))
      ],
    );

    /*   Material(
      color: Colors.grey.shade50,
      elevation: 4.0,
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        height: 54,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () => itemClicked(),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.favorite,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.message,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
   */
  }
}
