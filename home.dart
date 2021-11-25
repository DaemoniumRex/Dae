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
          ),
        ],
        centerTitle: true,
        elevation: 10,
        //shape: BeveledRectangleBorder(
        //borderRadius: BorderRadius.circular(20)
        //),
      ),
      body: PageView(controller: pageController, children: [
        Column(
          children: [
            Container(



              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            
            




              
              color: Colors.purple[100],
              



              ),

Card( 

              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading:Icon(Icons.my_location_sharp),
                  title: Text('Username'),
                  subtitle: Text('Ubicación'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),

                  ],
                ),
              ],
            ),
      ),
      Card( 

              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading:Icon(Icons.my_location_sharp),
                  title: Text('Username'),
                  subtitle: Text('Ubicación'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),

                  ],
                ),
              ],
            ),
      ),
      Card( 

              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading:Icon(Icons.my_location_sharp),
                  title: Text('Username'),
                  subtitle: Text('Ubicación'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),

                  ],
                ),
              ],
            ),
      ),


          ],
        ),


          
        Container(
          
          
          child: Column(
            children: [
              Row(
  mainAxisSize: MainAxisSize.max,
  children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
      child: Container(
        width: 66,
        height: 66,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
              shape: BoxShape.circle,
        ),
        child: Image.network(
              'https://picsum.photos/seed/254/600',
        ),
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
      child: Text(
        'Ivan',
        
      ),
    )
  ],
),

Divider(color: const Color(0x5e5e5e),),
Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('que mas?'),
                  trailing: Text("22:14"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('todo bien'),
                  trailing: Text("23:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('que mas?'),
                  trailing: Text("22:14"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('todo bien'),
                  trailing: Text("23:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('que mas?'),
                  trailing: Text("22:14"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('todo bien'),
                  trailing: Text("23:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
            ],
            
          ),
          
          
          
          
          
          
          
          
          color: Colors.deepPurple[100]),
        Container(

          child: Column(
            children: [
              Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Juan'),
                  subtitle: Text('Hola'),
                  trailing: Text("22:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Ivan'),
                  subtitle: Text('que mas?'),
                  trailing: Text("22:14"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('Jose'),
                  subtitle: Text('todo bien'),
                  trailing: Text("23:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('maria'),
                  subtitle: Text('no estoy'),
                  trailing: Text("24:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('pana'),
                  subtitle: Text('Mensaje'),
                  trailing: Text("02:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
      Card(

        child: Column(
              mainAxisSize: MainAxisSize.min,
	        	
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage("")),
                  title: Text('loco'),
                  subtitle: Text('Mensaje'),
                  trailing: Text("05:04"),
                ),
                //Image.asset('assets/img/icon.png'),

              ],
        ),
      ),
            ],
          ),
    
  

    
  

                    






    ),
          
          
    
  

          
          
          
          
          
          
          
          
          
          //color: Colors.lightBlue[100]),
        Container(color: Colors.pink[100]),
        Container(
          
          
           child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    
          
          
          
          
          
          //color: Colors.red[100]),
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
