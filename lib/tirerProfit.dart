import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './drawer.dart';
import 'dart:math' as math;

class TirerProfit extends StatefulWidget {
  const TirerProfit({Key? key}) : super(key: key);

  @override
  State<TirerProfit> createState() => _TirerProfitState();
}

class _TirerProfitState extends State<TirerProfit> {
  //late Query _ref;
  Map donateurs = {};

  //rgba(255, 121, 121,1)
  //rgba(34, 166, 179,1.0)
  /*#ff7979
  #7ed6df
  #be2edd*/
  //#f6e58d

  List<Color> colors = [
    Color(0xffff7979),
    Color(0xffbadc58),
    Color(0xff7ed6df),
    Color(0xffbe2edd),
    Color(0xfff6e58d)
  ];

  @override
  void initState() {
    //_ref = FirebaseDatabase.instance.reference().child("donateurs").orderByChild("nom");

    super.initState();
  }

  Widget _buildContactItem({required Map donateurs}) {
    return Column(
      children: [
        Container(
          //color: Colors.blueGrey,
          margin: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              color: colors[Random().nextInt(colors.length)],
              borderRadius: BorderRadius.circular(20)),

          height: 180,
          //color: Colors.white,

          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //SizedBox(width: 30),

              //SizedBox(width: 10,),
              //Divider(indent: 50,),

              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  donateurs['prenom'],
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              ListTile(
                  leading: Icon(
                    Icons.bloodtype_sharp,
                    color: Colors.white,
                  ),
                  title: Text(
                    donateurs['sanguin'],
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),

              ListTile(
                title: ElevatedButton.icon(
                  icon: Icon(Icons.phone),
                  label: Text(donateurs['tel']),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    String tel = donateurs['tel'];
                    var url = "tel:$tel";
                    var encoded = Uri.encodeFull(url);
                    launch(encoded);
                  },
                ),
              ),

              //SizedBox(width: 2),
              //Divider(height: 50, color: Colors.purple,),

              //SizedBox(width: 6,),

              //Text(contact['tel'], style: TextStyle(fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.w600),)

              //Divider(height: 20, color: Colors.purple,)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text('Je cherche du sang'), backgroundColor: Colors.redAccent, centerTitle: true),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('donateurs').snapshots(),
          builder: (_, snapshot) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('donateurs');

        //Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
        print("***");
        print(snapshot.data.toString());

        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;

          final user = docs[0].data()['prenom'];
          print(user);
          /*print("test");
            print(user);




             int i;
            int j;
            List liste = [];

            List liste1=[];
            List liste2=[];
            List liste3=[];




            for(i=0;i<docs.length;i++){
              liste.add(docs[i].data().values.toString().trim());
            }
            print(liste);
            //print("type");
            //print(liste[0].runtimeType);

            print("\n////////////////////////////////////////////////////\n");

            String str = liste[0];
            var arr = str.split(',');
            print(arr);

            for(i=0;i<liste.length;i++){
              String str = liste[i];
              var arr = str.split(',');
              liste1.add(arr[0]);
              liste2.add(arr[1]);
            }
            print("voila la liste1 : \n");
            print(liste1);
            print("\n\n");
            print("voila la liste2 : \n");
            print(liste2);






            var map = Map();
            liste.forEach((element) {
              if(!map.containsKey(element)) {
                map[element] = 1;
              } else {
                map[element] +=1;
              }
            });

            var t1 = [];

            var t2 = [];
            var t3 = [];
            var inter = [];

            //print(map);
            map.forEach((k,v) => {
              t1.add(k),
              t2.add(v)
              //print('${k}: ${v}')
            });
            inter = t1;
            //print("salam");
            //print(inter);



            for(i=0;i<t1.length;i++){

              t1[i]  = t1[i].replaceAll(RegExp('[^0-9-a-zA-Z ]'), '');
              //t3[i]  = inter[i].replaceAll(RegExp('[^a-zA-Z]'), '');
            }

            for(i=0;i<t1.length;i++){

              t3.add(t1[i].replaceAll(RegExp('[^a-zA-Z ]'), ''));
              //t3[i]  = inter[i].replaceAll(RegExp('[^a-zA-Z]'), '');
            }

            for(i=0;i<t3.length;i++){

             if(t3[i]==""){
               t3.removeAt(i);
             }
            }





            //print("salam");
            //print(t1);*/

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (_, i) {
              //final data = t1[i];


              return Column(
                children: [
                  Container(
                    //color: Colors.blueGrey,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    decoration: BoxDecoration(
                        color:  colors[Random().nextInt(colors.length)],
                        borderRadius: BorderRadius.circular(20)),


                    height: 190,
                    //color: Colors.white,

                    child: Column(





                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,


                      children: [
                        //SizedBox(width: 30),


                        //SizedBox(width: 10,),
                        //Divider(indent: 50,),

                        ListTile(
                          leading: Icon(Icons.person, color: Colors.white),
                          title:  Text(docs[i].data()['prenom'], style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),

                        ListTile(
                            leading: Icon(Icons.bloodtype_sharp, color: Colors.white,),
                            title:   Text(docs[i].data()['sanguin'], style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),)
                        ),

                        ListTile(
                          title: ElevatedButton.icon(
                            icon: Icon(Icons.phone),


                            label: Text(docs[i].data()['tel']),
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),

                            onPressed: (){
                              String tel = donateurs['tel'];
                              var url = "tel:$tel";
                              var encoded = Uri.encodeFull(url);
                              launch(encoded);

                            },

                          ),
                        ),

                       

                        //SizedBox(width: 2),
                        //Divider(height: 50, color: Colors.purple,),




                        //SizedBox(width: 6,),


                        //Text(contact['tel'], style: TextStyle(fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.w600),)












                        //Divider(height: 20, color: Colors.purple,)

                      ],

                    ),

                  ),

                  i==docs.length-1 ? SizedBox(height: 20,) :  SizedBox.shrink()

                ],

              );
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}
