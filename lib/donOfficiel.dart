import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:projetflutter/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';



class DonOfficiel extends StatefulWidget {


  @override
  State<DonOfficiel> createState() => _DonOfficielState();
}

class _DonOfficielState extends State<DonOfficiel> {


  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();






  final NomController = TextEditingController();
  final TelController = TextEditingController();


   final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(34.033471, -5.014700),
    zoom: 12,
  );

   final databaseRef = FirebaseDatabase.instance.reference();
   late String dateDonation;

   CollectionReference d = FirebaseFirestore.instance.collection("dates");














   void setCustomMarker() async{
    myMarker.add( Marker(

        markerId: MarkerId('1'),
        position: LatLng(34.05792326835968, -4.9797866),
        infoWindow: InfoWindow(
          title: "Bab El hadid",
          onTap: (){

            Alert(
              context: context,
              type: AlertType.none,
              title: "Bab El hadid",
              desc: "Don de sang, don de vie.",
              content: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home_outlined),
                      title:  Text("Fès"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title:  Text("+212623318305"),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: StadiumBorder(),
                        elevation: 10,

                      ),

                      onPressed: (){

                        showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023)
                        ).then((date){
                          final DateFormat formatter = DateFormat('dd-MM-yyyy');
                          final String dateFormatted = formatter.format(date!);
                          dateDonation = dateFormatted;
                          //databaseRef.child("dates").push().set({
                           // 'date':dateFormatted,
                          //});
                          print("${loggedInUser.prenom}");
                          print("${loggedInUser.tel}");

                          d.add({"date":dateDonation, "hospital":"Bab El hadid", "nom":loggedInUser.prenom, "tel":loggedInUser.tel});

                        });

                      },
                      child: Wrap(
                        children: [

                          SizedBox(
                            width:10,
                          ),
                          Text("Je choisis mes dates", style:TextStyle(fontSize:20, color: Colors.black)),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.pink,
                            size: 24.0,
                          ),
                        ],
                      ),

                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: StadiumBorder(),
                        elevation: 10,

                      ),




                      onPressed: (){
                        if(dateDonation!=null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Merci pour le don, au revoir."),
                          ));
                          //logout(context);
                          Navigator.of(context).pop();
                          //Navigator.of(context).pop();

                          //Navigator.pushNamed(context, "/login");
                        }






                      },
                      child: Wrap(
                        children: [

                          SizedBox(
                            width:10,
                          ),
                          Text("Je promets de donner", style:TextStyle(fontSize:20, color: Colors.black)),
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 24.0,
                          ),
                        ],
                      ),

                    ),

                  ],
                ),
              ),
              buttons: [
                DialogButton(
                  child: Text(
                    "Annuler",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  width: 120,
                )
              ],


            ).show();


          }
        ),


        icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/hospital-2.png")
    ));


    myMarker.add(
      Marker(
          markerId: MarkerId('2'),
          position: LatLng(34.00470203223227, -4.963092315346465),
          infoWindow: InfoWindow(
              title: "Centre Hospitalier Universitaire Hassan II",
              onTap: (){


                Alert(
                  context: context,
                  type: AlertType.none,
                  title: "CHU",
                  desc: "Don de sang, don de vie.",
                  content: Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.home_outlined),
                          title:  Text("Fès"),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title:  Text("+212623318305"),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            elevation: 10,

                          ),

                          onPressed: (){

                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2023)
                            ).then((date){
                              final DateFormat formatter = DateFormat('dd-MM-yyyy');
                              final String dateFormatted = formatter.format(date!);
                              dateDonation = dateFormatted;
                              //databaseRef.child("dates").push().set({
                                //'date':dateFormatted,
                              //});
                              d.add({"date":dateDonation, "hospital":"CHU", "nom":loggedInUser.prenom, "tel":loggedInUser.tel});
                              //d.add({"date":dateDonation, "hospital":"CHU", "nom":NomController.text, "tel":TelController.text});

                            });

                          },
                          child: Wrap(
                            children: [

                              SizedBox(
                                width:10,
                              ),
                              Text("Je choisis mes dates", style:TextStyle(fontSize:20, color: Colors.black)),
                              Icon(
                                Icons.calendar_month,
                                color: Colors.pink,
                                size: 24.0,
                              ),
                            ],
                          ),

                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            elevation: 10,

                          ),




                          onPressed: (){
                            if(dateDonation!=null){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Merci pour le don, au revoir."),
                              ));
                              //logout(context);
                              //Navigator.of(context).pop();
                              Navigator.of(context).pop();

                              //Navigator.pushNamed(context, "/login");
                            }



                          },
                          child: Wrap(
                            children: [

                              SizedBox(
                                width:10,
                              ),
                              Text("Je promets de donner", style:TextStyle(fontSize:20, color: Colors.black)),
                              Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 24.0,
                              ),
                            ],
                          ),

                        ),

                      ],
                    ),
                  ),
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Annuler",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      width: 120,
                    )
                  ],


                ).show();


              }
          ),
          icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/hospital-2.png")
      ),

    );

    myMarker.add(
      Marker(
          markerId: MarkerId('3'),
          position: LatLng(34.063634238131165, -4.990494153960606),
          infoWindow: InfoWindow(
              title: "Hopital Ibn El Khatib",
              onTap: (){


                Alert(
                  context: context,
                  type: AlertType.none,
                  title: "Hopital Ibn El Khatib",
                  desc: "Don de sang, don de vie.",
                  content: Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.home_outlined),
                          title:  Text("Fès"),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title:  Text("+212623318305"),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            elevation: 10,

                          ),

                          onPressed: (){

                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2023)
                            ).then((date){
                              final DateFormat formatter = DateFormat('dd-MM-yyyy');
                              final String dateFormatted = formatter.format(date!);
                              dateDonation = dateFormatted;
                              //databaseRef.child("dates").push().set({
                               // 'date':dateFormatted,
                             // });
                              d.add({"date":dateDonation, "hospital":"Hopital Ibn El Khatib", "nom":loggedInUser.prenom, "tel":loggedInUser.tel});
                              //d.add({"date":dateDonation, "hospital":"Hopital Ibn El Khatib", "nom":NomController.text, "tel":TelController.text});

                            });

                          },
                          child: Wrap(
                            children: [

                              SizedBox(
                                width:10,
                              ),
                              Text("Je choisis mes dates", style:TextStyle(fontSize:20, color: Colors.black)),
                              Icon(
                                Icons.calendar_month,
                                color: Colors.pink,
                                size: 24.0,
                              ),
                            ],
                          ),

                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            elevation: 10,

                          ),




                          onPressed: (){
                            if(dateDonation!=null){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Merci pour le don, au revoir."),
                              ));
                              //logout(context);
                              //Navigator.of(context).pop();
                              Navigator.of(context).pop();

                              //Navigator.pushNamed(context, "/login");
                            }



                          },
                          child: Wrap(
                            children: [

                              SizedBox(
                                width:10,
                              ),
                              Text("Je promets de donner", style:TextStyle(fontSize:20, color: Colors.black)),
                              Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 24.0,
                              ),
                            ],
                          ),

                        ),

                      ],
                    ),
                  ),
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Annuler",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      width: 120,
                    )
                  ],


                ).show();


              }

          ),
          icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/hospital-2.png")
      ),
    );

   }


   @override
   void initState() {

       setCustomMarker();
       super.initState();

       FirebaseFirestore.instance
       .collection("users")
       .doc(user!.uid)
       .get()
       .then((value) => {
         this.loggedInUser = UserModel.fromMap(value.data())


       });


   }












   late GoogleMapController gmc;
   late Set<Marker> myMarker = {
     //34.05792326835968, -4.9797866
     //34.00470203223227, -4.963092315346465
     //34.063634238131165, -4.990494153960606
   };

   void insertData(DateTime date){
     print(date);
     databaseRef.child("dates").push().set({
       'date':date,
     });


   }

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      //appBar: AppBar(title: Text("map")),
      body: GoogleMap(
        markers: myMarker,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            gmc = controller;



          });


        },
      ),







    );
  }

  Future<void> logout(BuildContext context) async{
     await FirebaseAuth.instance.signOut();
  }

}

//AIzaSyCPmnLxb0cbbkDhWNrBWkOCJR-AkxGwVfw
