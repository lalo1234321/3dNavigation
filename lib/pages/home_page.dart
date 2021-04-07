import 'package:flutter/material.dart';
import 'package:animate_menu/pages/animal_page.dart';
import 'dart:math';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[800]
                ],
                begin: Alignment.bottomCenter,
                end:Alignment.topCenter
              )
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage("https://competenciasdelsiglo21.com/wp-content/uploads/2019/04/disc-perfil-c-azul-948x640.jpg"),

                      ),
                      SizedBox( height: 10.0,),
                      Text('Alejandro Álvarez',style: TextStyle(color: Colors.white),),
                    ],
                  )),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            print("hola mundo");
                          },
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text('Home',style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            print("navegando al profile");
                          },
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text('Profile',style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text('Settings',style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text('Log out',style: TextStyle(color: Colors.white),),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value), 
            duration: Duration(milliseconds: 500), 
            builder: (_, double val, __) {
              return(
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi/6) * val),
                  child: AnimalPage()
                )

              );
            }
          ),
          GestureDetector(
            // el onTap no es una buena solución 
            onHorizontalDragUpdate: (e) {
              if(e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },

            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          )
        ],
      )
    );
  }
}
