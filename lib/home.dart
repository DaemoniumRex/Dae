import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        //title: Image.asset('./assets/icon.png', fit: BoxFit.cover),
      title: Text("GLAMOUR"),
    
      backgroundColor: Colors.deepPurple[800],
      elevation: 10,

  ),*/
      appBar: AppBar(
        backgroundColor: Color(0xFF330054),
        leading: Container(
          width: 120,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/img/icon.png',
          ),
        ),
        title: Image.asset(
          'assets/img/glamtext.png',
          width: 125,
          fit: BoxFit.contain,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 6),
            child: InkWell(
              
              child: Image.asset(
                'assets/img/pclosedeyeico.png',
                height: 6,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 10,
        //shape: BeveledRectangleBorder(
        //borderRadius: BorderRadius.circular(20)
        //),
      ),
      
      body: PageView(controller: pageController, children: [
        Container(
          
          
        child: Text('hi'),  
         
          
          color: Colors.purple[100]
        
        
        
        
        
        ),
        Container(color: Colors.deepPurple[100]),
        Container(color: Colors.lightBlue[100]),
        Container(color: Colors.pink[100]),
        Container(color: Colors.red[100]),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple.shade800,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.purple[800],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Espejo',
              backgroundColor: Colors.deepPurple[800],
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.lightBlue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Busqueda',
                backgroundColor: Colors.pink[800]),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                label: 'Pics',
                backgroundColor: Colors.red[900]),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.blueGrey[600],
          onTap: onTapped),
    );
  }
}
