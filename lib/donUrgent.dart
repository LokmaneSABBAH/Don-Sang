import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'models/user_model.dart';


class DonUrgent extends StatefulWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();



  //const FaireDon({Key? key}) : super(key: key);

  @override
  State<DonUrgent> createState() => _DonUrgentState();
}

class _DonUrgentState extends State<DonUrgent> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  CollectionReference d = FirebaseFirestore.instance.collection("donateurs");



  final _formkey = GlobalKey<FormState>();
  String error = "";
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;

  String valueChoose="";
  final items = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"];

  String dropdownValue = "Choisir";

  String? value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => {
      this.loggedInUser = UserModel.fromMap(value.data())


    });
  }


  var nomController = new TextEditingController();
  var prenomController = new TextEditingController();
  var ageController = new TextEditingController();
  var villeController = new TextEditingController();
  var telController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();





  @override
  Widget build(BuildContext context) {

      return Scaffold(
        resizeToAvoidBottomInset: false,
          //appBar: AppBar(title: Text('Je fais un don'), backgroundColor: Colors.redAccent, centerTitle: true),

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                 child: Image(image: AssetImage("images/sign-up.png"),width: 100,)

                ),
                SizedBox(height: 20,),
                Form(



                  key: _formkey,

                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [




                        TextFormField(
                          controller: ageController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Merci de sisair l'age";
                            }

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              prefixIcon: Icon(Icons.people_alt, color: Colors.black,),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: "Age",
                              labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black
                              )
                          ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          controller: villeController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Merci de sisair la ville";
                            }

                          },

                          decoration: InputDecoration(

                              prefixIcon: Icon(Icons.location_city, color: Colors.black,),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: "Ville",
                              labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black
                              )
                          ),
                        ),

                        SizedBox(height: 20,),

                        DropdownButtonFormField(
                            decoration: InputDecoration(

                                prefixIcon: Icon(Icons.bloodtype_sharp, color: Colors.black,),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: "Groupe sanguin",
                                labelStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black
                                )
                            ),



                          value: value,

                          items: items
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                              .toList(),

                          validator: (value){
                            if(value == null){
                              return "Merci de choisir le groupe sanguin";
                            }

                          },

                            onChanged: (value)=> setState(() {
                              this.value = value as String;
                              print(value);
                            })









                        ),





                      ],

                    ),
                  ),
                ),

                Row(
                  children: [
                    /*Container(
                      margin: EdgeInsets.only(left: 22),
                        child: Text("Choisir le groupe sanguin :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                    ),

                    Container(

                      margin: EdgeInsets.only(left: 80, top: 20),
                      padding: EdgeInsets.only(left: 30 ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(12)

                      ),
                      child: DropdownButtonHideUnderline(



                        child: DropdownButton<String>(



                            value: value,

                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value)=> setState(() {


                              this.value = value;



                              print(value);
                            })
                        ),
                      ),
                    ),*/



                  ],

                ),

                Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    child: Text("Envoyer"),

                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      elevation: 10,
                      primary: Colors.redAccent,

                    ),
                    onPressed: (){
                      if(value == null){
                        print("nulllllll");
                      }
                      if(!_formkey.currentState!.validate()){
                        return;

                      }
                      else if(_formkey.currentState!.validate()){



                        insertData(loggedInUser.nom.toString(), loggedInUser.prenom.toString(), ageController.text, villeController.text, loggedInUser.tel.toString(), value!);
                        print("ajouter");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Merci pour votre don, au revoir."),
                        ));
                        Navigator.pushNamed(context, "/home");
                      }
                    }
                  ),
                )

              ],
            ),
          ),



        );


  }

  //Insert method
  void insertData(String nom, String prenom, String age, String ville, String tel, String sanguin){
    d.add(
      {
        'nom':nom,
        'prenom':prenom,
        'age':age,
        'ville':ville,
        'tel':tel,
        'sanguin':sanguin
      }

    );
    /*databaseRef.child("donateurs").push().set({
      'nom':nom,
      'prenom':prenom,
      'age':age,
      'ville':ville,
      'tel':tel,
      'sanguin':sanguin
    });
    //nomController.clear();
    //prenomController.clear();*/
    ageController.clear();
    villeController.clear();
    telController.clear();

  }



  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(
    value: item,

    child: Text(

      item,

    ),
  );
}

