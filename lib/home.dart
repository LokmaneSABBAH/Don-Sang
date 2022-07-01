import 'package:projetflutter/donOfficiel.dart';
import 'package:projetflutter/tirerProfit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import './drawer.dart';


import 'donUrgent.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Don de sang'),
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.notification_add),
                onPressed: (){
                  //todo
                },
              ),

              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  //todo
                },
              ),

            ],

            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.purple]
                ),

              ),
            ),

            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  icon: ImageIcon(AssetImage("images/home.png"), size: 25,),
                  text: "Acceuil",
                  //child: Text("Acceuil", style: TextStyle(fontSize: 12),),
                ),
                Tab(
                  icon: ImageIcon(AssetImage("images/store.png"),size: 25),
                  text: "Don officiel",
                ),
                Tab(
                  icon: ImageIcon(AssetImage("images/urgent.png"), size: 30,),
                  text: "Don urgent",
                ),
                Tab(
                  icon: ImageIcon(AssetImage("images/drop-of-blood.png"), size: 25,),
                  text: "Tirer profit",
                )

              ],
            ),

          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 200.0,
                        width: 350.0,
                        child: SizedBox(
                            height: 200.0,
                            width: 350.0,
                            child: Carousel(
                              images: const [
                                NetworkImage(
                                    'https://i1.wp.com/www.leticketmode.xyz/wp-content/uploads/2019/05/don-du-sang.jpg?fit=1200%2C675&ssl=1'),
                                NetworkImage(
                                    'https://media.istockphoto.com/photos/blood-donorship-young-girl-in-red-tshirt-hand-taped-with-patch-with-picture-id1225040889?k=20&m=1225040889&s=612x612&w=0&h=WFVCkB9V71bve4Z_jG8zmDUtkc5TaTK_tYmRqTg14PE='),
                                NetworkImage(
                                    "https://www.weblex.fr/images/flux_actus/donsang.jpg")
                              ],
                              dotSize: 4.0,
                              dotColor: Colors.lightGreenAccent,
                              dotSpacing: 15.0,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.purple.withOpacity(0.5),
                              borderRadius: true,
                              moveIndicatorFromBottom: 180.0,
                              noRadiusForIndicator: true,
                            )),
                      ),
                    ),
                    SizedBox(height: 25,),

                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                               Navigator.pushNamed(context, "/Onboarding");

                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 25,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1)),
                                        margin: EdgeInsets.only(left: 30),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Text("Qui nous sommes ?",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/Onboarding");

                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFF23ed55),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 25,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1)),
                                        margin: EdgeInsets.only(left: 30),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Text("Situation nationale",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                          textAlign: TextAlign.center),
                                      SizedBox(
                                        height: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/Onboarding");

                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFFff0000),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 25,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1)),
                                        margin: EdgeInsets.only(left: 30),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        "Comment ça se passe ?",
                                        style:
                                        TextStyle(fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/Onboarding");

                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFF1af4f4),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 25,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1)),
                                        margin: EdgeInsets.only(left: 30),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        "Témoignages",
                                        style:
                                        TextStyle(fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 20, right: 250),
                      child: Text("Suivez nous sur :"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15, left: 70),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Image.asset(
                                  "images/facebook.png",
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () async {
                                  const url = "fb://profile/100002817775594";
                                  var encoded = Uri.encodeFull(url);
                                  launch(encoded);

                                  //final url = "https://www.facebook.com/profile.php?id=100002817775594";
                                  //launch(url);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  "images/instagram.png",
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  const url =
                                      "instagram://user?username=lokmane.sabbah/";
                                  var encoded = Uri.encodeFull(url);
                                  launch(encoded);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  "images/youtube.png",
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  const url =
                                      "https://www.youtube.com/channel/UC7o5LUnP6dsRqtP-Aadsz6w";
                                  var encoded = Uri.encodeFull(url);
                                  launch(encoded);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  "images/whatsapp.png",
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  const url =
                                      "whatsapp://send?phone=+212617955589&&text=Don de sang";
                                  var encoded = Uri.encodeFull(url);
                                  launch(encoded);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  "images/tiktok.png",
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  const url = "https://www.tiktok.com/@lokmane.sabbah";
                                  var encoded = Uri.encodeFull(url);
                                  launch(encoded);
                                }),
                          ],
                        )),
                  ],
                ),
              ),

              DonOfficiel(),

              DonUrgent(),

              TirerProfit()
            ],
          )
      ),
    );
  }
}
