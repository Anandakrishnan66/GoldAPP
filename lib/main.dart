

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'GullApp';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
     home: MyHomePage(title: appTitle),



    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _selectedIndex1=0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    navHome(),
    profile(),

  ];
final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();

  static const List<Widget> _pageOptions=<Widget>[
    // MyHomePage(title: "hello gul"),
    Home(),
    gullack(),
    dashboard(),
    Text("hello moto"),

  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavTapped(int index){
    setState(() {
      _selectedIndex1=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.align_horizontal_left),onPressed: ()=>{
        _scaffoldKey.currentState!.openDrawer(),

    }
      ),
        title: Text(widget.title),backgroundColor: Colors.black,

      ),

      body: Container(

        child: Column(
          children: [

          _pageOptions[_selectedIndex1]],
          // _widgetOptions[_selectedIndex]]
        ),
      ),
      backgroundColor: Colors.black,

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.


        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [

             Stack(

               children:[ Container(
                 width: 400,
                 child: DrawerHeader(


                  decoration: BoxDecoration(
                    color: Colors.amber,

                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey,


                    ),
                    child: Text("A",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),),

                  ),


            ),
               ),
      ]
             ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                 _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                 _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile settings'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
             mouseCursor: MouseCursor.defer,
             selectedFontSize: 15,


             items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(icon:Icon(Icons.home,size: 30,weight: 20,color: Colors.black38),
               label: "Home",
                 backgroundColor: Colors.amber,



               ),
               BottomNavigationBarItem(icon: Icon(Icons.circle_sharp,

                  size: 30,
                 color: Colors.black54,
               ),
               label: "Gullack",
               backgroundColor: Colors.amber
               ),
               BottomNavigationBarItem(icon: Icon(Icons.arrow_forward_ios,
               size: 30,
               color: Colors.black54,),
               label: "Dashboard",
               backgroundColor: Colors.amber,


               )


             ],

        type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex1,
        selectedItemColor: Colors.black54
        ,
        iconSize: 40,
        onTap: _onNavTapped,
        elevation: 5,
      ),

    );
  }
}

class gullack extends StatefulWidget{
  const gullack({super.key});

  @override
  State<gullack> createState() => _gullackState();
}

class _gullackState extends State<gullack> {
  final List<String> subheading=<String>["Dream","Perfect","Comfortable","Higher","Vehicle"];
  final List<String> heading=<String>["House","Wedding","Retirement","Education","Car"];
  final List<int> subColor=<int>[40,40,40,40];
  final List<int> headColor=<int>[800,800,800,800];


  @override
  Widget build(BuildContext context){

    return
       Expanded(
         child: SingleChildScrollView(
           child: Column(

             children: [

               Container(
                 alignment: Alignment.topLeft,
                 child: const Text('Lets Start',style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 40,


             ),),
               ),
               SizedBox(
                 height: 500,

                 child: ListView.separated(

                  padding:const EdgeInsets.all(8),
                  itemCount: heading.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [

                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.elliptical(30, 50)),

                            color: Colors.amber[600],
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,


                            children: [
                              Text('${subheading[index]}',style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20),),
                              Center(child: Text(' ${heading[index]}',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.grey,offset: Offset(4.0,4.0),blurRadius: 3)]),),),

                            ],
                          ),

                        ),
                      ],
                    );

                  },

                   separatorBuilder: (BuildContext context,int index)=>const Divider(),




    ),
               ),
             ],
           ),
         ),
       );

  }
}

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,


          child: Container(
            height: 500,
            width: 600,
            child: Row(


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,

              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration:const  BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(80)),

                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(20),
                  decoration:const  BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(80)),

                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(20),
                  decoration:const  BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(80)),

                  ),
                ),

              ],
            ),
          ),
        ),

        Container(
          height: 40,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child:const  ElevatedButton(onPressed: null, child: Text("CLick ME",style: TextStyle(
              color: Colors.red,
            backgroundColor: Colors.lime,
            
            
          ),)),
        )

      ],
    );
  }
}


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Expanded(


      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(

          children:<Widget> [

            Container(
              height: 500,
              width: 500,

              alignment: AlignmentDirectional.center,

             margin : EdgeInsets.only(top:20),

              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.amber

              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4),
                      alignment:Alignment.topLeft,
                      child: const Text(
                        "Hey You Welome!",
                        style: TextStyle(color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,

                        ),
                        textAlign: TextAlign.start,),
                   ),

                  Container(
                    width: 50,
                    height: 30,
                    color: Colors.amber,
                    alignment: Alignment.topLeft,
                  ),

                  Container(
                    height: 400,
                    width: 300,
                    alignment: Alignment.center,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))


                    ),
                    child: const Row(

                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        Text("GoldApp",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38
                        ),)
                      ],
                    )
                  ),


                  




                ],

              ),







              ),




            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Container(
                height: 180,
                width: 500,
                  margin: EdgeInsets.only(top: 20),

                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.amberAccent,
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(top: 20),


                        alignment: Alignment.center,
                        decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white70,
                        ),

                        child: const Text("24K Gold",style: TextStyle(
                          color: Colors.black87,
                          fontWeight:FontWeight.bold ,
                          fontSize:22.0,
                          fontFamily: AutofillHints.addressCity,


                        ),),




                      ),

                      Container(
                        width: 1,
                        color: Colors.black38,
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        width: 220,

                        margin: EdgeInsets.only(top: 20),

                        decoration:const  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white70,
                        ),

                        child: const Text("Withdraw Any Time",style: TextStyle(
                          color: Colors.black87,
                          fontWeight:FontWeight.bold ,
                          fontSize:22.0,


                        ),),


                      ),

                    ],
                  ),



              ),
            ),
            Remain(),



          ],
        ),
      ),
    );


  }
}

class Remain extends StatelessWidget{
   Remain({super.key});
 final _scrollController=ScrollController();
 Color _color=Colors.red;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 400,
      child: Scrollbar(
        child: ListView(


                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,


                        children: [
                          FittedBox(

                            fit: BoxFit.scaleDown,

                            

                              child:  Container(

                                alignment: Alignment.bottomCenter,

                                  
                                margin: EdgeInsets.only(top: 20),
                                width: 310,
                                height: 130,

                                decoration:const  BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.amber,
                                ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:[
                                    Text("Gold Price to Hit 65k soon" ,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,

                                    ),),
                                    
                                    ElevatedButton(

                                    onPressed: null,





                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue), // Background color
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      ), // Padding

                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10), // Rounded corners
                                        ),
                                      ),
                                    ),


                                    child:const  Text("Invest Now"),
                              ),
                                    
                                ]
                                ),
                          ),

          
                            
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: const Text("Trending",style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                          fontSize: 20,

                        ),
                        textAlign: TextAlign.start,
                        ),
                      ),
                      
                      SingleChildScrollView(
                        
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.all(20),

                          child: Scrollbar(
                            thumbVisibility: true,
                            controller: _scrollController,


                            child: Row(
                              children: [
                                Container(
                                  margin:const EdgeInsets.only(right: 20),
                                  width: 180,
                                  height: 80,

                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                    
                                  ),

                                  child:Column(
                                    children: [
                                      Text("Setup Gold Sip",style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20


                                      ),textAlign: TextAlign.center,),
                                      ElevatedButton(onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue), // Background color
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          ), // Padding

                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20), // Rounded corners
                                            ),
                                          ),
                                        ),
                                        child: Text("Invest"),)

                                    ],
                                  ),
                                ),
                                Container(

                                  width: 190,
                                  height: 80,
                                  decoration:const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Column(
                                    children: [
                                       Text("Setup Gold Sip",style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                         fontSize: 20


                                      ),textAlign: TextAlign.center,),
                                      ElevatedButton(onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue), // Background color
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          ), // Padding

                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10), // Rounded corners
                                            ),
                                          ),
                                        ),
                                      child: Text("Start Sip"),)

                                    ],
                                  ),

                                ),


                              ],


                            ),
                          ),
                        ),
                      ),


                          Row(
                            children: [AnimatedContainer(
                              duration: const Duration(seconds: 3),

                            height: 500,
                            width: 340,

                            decoration:const  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,


                            ),
                            margin: EdgeInsets.all(10),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                 const Text("Discover\n Gullak",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                   fontSize: 40,
                                  shadows: [Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.grey,
                                    offset: Offset(5.0, 5.0),
                                  )
                                ]
                                ),textAlign: TextAlign.start,),
                                Container(
                                  alignment: Alignment.bottomRight,
                                    child: ElevatedButton(onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                          ), // Padding

                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20), // Rounded corners
                                            ),
                                          ),
                                        ),


                                        child: Text('Click me')))





                              ]
                            )
                          ),


                            ]


                        ),

                      Text("Support" ,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,

                      ),textAlign: TextAlign.start),

                      Container(
                        margin: EdgeInsets.all(10),
                        child: const TextField(
                          decoration: InputDecoration(
                            filled: true,
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                              hintText: 'Enter a search term',
                              fillColor: Colors.amber,
                            

                        ),
                          style: TextStyle(color: Colors.black54),
                          scrollPadding: EdgeInsets.all(34),
                        ),
                      )






                    ]

                      ),
      ),

















            );


  }

}

class navHome extends StatelessWidget{
  const navHome({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 500,
      child: ListView(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          )

        ],


      ),
    );
  }
}

class profile extends StatelessWidget{
  const profile({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
      height: 500,
      child: ListView(
        children: [
          Container(
            color: Colors.grey,
            height: 150,
            width: 150,
          )
        ],
      ),
    );
  }
}