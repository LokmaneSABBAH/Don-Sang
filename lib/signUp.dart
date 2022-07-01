import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutter/models/user_model.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final telController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formkey,

              child: Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(

                  children: [

                    Image.asset("images/goutte-de-sang.png", width: 100,),
                    SizedBox(height: 40,),
                    TextFormField(
                      controller: nomController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,




                      decoration: InputDecoration(

                          prefixIcon: Icon(Icons.person, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: "Nom",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Merci de saisir votre nom";
                        }

                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: prenomController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,




                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                          hintText: "Prénom",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){

                        if(value!.isEmpty){
                          return "Merci de saisir votre prénom";
                        }

                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      controller: telController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,




                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                          hintText: "Tél",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){

                        if(value!.isEmpty){
                          return "Merci de saisir votre téléphone";
                        }

                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,




                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                          hintText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){

                        if(value!.isEmpty){
                          return "Merci de saisir votre email";
                        }

                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: true,





                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                          hintText: "Mot de passe",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){

                        if(value!.isEmpty){
                          return "Merci de saisir votre mot de passe";
                        }

                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      controller: confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,





                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black,),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                          hintText: "Confirmez le mot de passe",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          )
                      ),
                      validator: (value){

                        if(passwordController.text != value){
                          return "Les mots de passes ne sont pas identiques";
                        }

                      },
                    ),



                    SizedBox(height: 50,),

                    Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(

                        child: Text("S'inscrire"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.redAccent,
                            elevation: 10
                        ),

                        onPressed: () async{
                          signUp(emailController.text, passwordController.text);
                          //Navigator.of(context).pop();
                          //Navigator.pushNamed(context, "/login");

                          /*if(!_formkey.currentState!.validate()){
                            return;

                          }
                          else if(_formkey.currentState!.validate()){
                            //todo


                          }*/




                        },
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async{
    if(_formkey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      }
      );

    }

  }

  postDetailsToFirestore() async{
    //calling our firebase
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writting all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nom = nomController.text;
    userModel.prenom = prenomController.text;
    userModel.tel = telController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/login");




  }
}
