import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:projetflutter/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Initialisation de Firebase
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }





  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: _initializeFirebase(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return Log();
        }
        return Center(
          child: CircularProgressIndicator(),

        );
      },
    );




  }

}



class Log extends StatefulWidget {
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {





  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;



  void signIn(String email, String password) async{
     if(email=="sabbahlokmane79@gmail.com"){
       if(_formkey.currentState!.validate()){
         await _auth
             .signInWithEmailAndPassword(email: email, password: password)
             .then((uid) => {
           passwordController.text = "",
           Navigator.pushNamed(context, "/listeDates")
         }).catchError((e)
         {
           Fluttertoast.showToast(msg: e.message);
         }
         );
       }

     }
     else{
       if(_formkey.currentState!.validate()){
         await _auth
             .signInWithEmailAndPassword(email: email, password: password)
             .then((uid) => {
               passwordController.text = "",
           Navigator.pushNamed(context, "/home")

         }).catchError((e)
         {
           Fluttertoast.showToast(msg: e.message);
         }
         );

       }
     }


  }






  //const Log({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(

        margin: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Image.asset("images/goutte-de-sang.png", width: 100,),
              SizedBox(height: 40,),



              Form(
                key: _formkey,

                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,




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
                        textInputAction: TextInputAction.done,
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



                    SizedBox(height: 50,),

                    Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(

                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.redAccent,
                            elevation: 10
                        ),

                        onPressed: (){
                          signIn(emailController.text, passwordController.text);

                          /*if(!_formkey.currentState!.validate()){
                            return;

                          }
                          else if(_formkey.currentState!.validate()){
                            User? user = await loginUsingEmainPassword(email: emailController.text.trim(), password: passwordController.text.trim(), context: context);
                            if(user != null){
                              Navigator.pushNamed(context, "/listeDates");
                            }


                          }*/




                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Vous n'avez pas de compte? ",),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, "/signUp");
                          },
                          child: Text("S'inscrire", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.redAccent)),
                        )
                      ],
                    )


                  ],
                ),
              )

            ],
          ),
        ),

      ),
    );

  }
}

