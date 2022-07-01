
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListeDates extends StatefulWidget {
  const ListeDates({Key? key}) : super(key: key);

  @override
  State<ListeDates> createState() => _ListeDatesState();
}

class _ListeDatesState extends State<ListeDates> {

   //late Query _ref;
   Map dates = {};


  @override
  void initState() {
    super.initState();

    //_ref = FirebaseDatabase.instance.reference().child("dates");



  }







  /*Widget _buildContactItem({required Map dates}){


    return Container(

      height: 100,
      //color: Colors.white,

      child: Column(
        children: [
          Row(

            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              //SizedBox(width: 30),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.black, size: 20,),
                        //SizedBox(width: 6,),
                        Text(dates['date'], style: TextStyle(fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.w600),),
                      ],
                    ),

                  ],
                ),
              ),

              //SizedBox(width: 10,),
              //Divider(indent: 50,),














            ],
          ),
          Divider(height: 20, color: Colors.purple,)

        ],

      ),

    );
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('dates').snapshots(),
        builder: (_, snapshot) {
          CollectionReference users = FirebaseFirestore.instance.collection('dates');

          //Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
          print("***");
          print(snapshot.data.toString());

          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.hasData) {






            final docs = snapshot.data!.docs;







            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                //final data = t1[i];
                String? hopital;
                if(docs[i].data()['hospital']=="Bab El hadid"){
                  hopital = "bab el hadid.jpg";
                }
                else if(docs[i].data()['hospital']=="CHU"){
                  hopital = "CHU_Fes.jpg";
                }
                else{
                  hopital = "Hopital Ibn El Khatib.jpg";
                }



                return Container(
                  //margin: EdgeInsets.only(left: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                              child: Image.asset("images/"+hopital, width: 150,)
                          ),


                              Expanded(
                                child: Column(
                                  children: [
                                    Text(docs[i].data()['hospital'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    Text(docs[i].data()['nom'], style: TextStyle(fontSize: 15, ),),
                                    Text(docs[i].data()['tel'], style: TextStyle(fontSize: 15, ),),
                                    Text(docs[i].data()['date'], style: TextStyle(fontSize: 15, ),),
                                  ],
                                ),

                              ),









                        ],

                      ),

                      SizedBox(height: 10,)

                    ],

                  ),

                );




              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
