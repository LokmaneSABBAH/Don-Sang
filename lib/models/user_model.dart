class UserModel{
  String? uid;
  String? email;
  String? nom;
  String? prenom;
  String? tel;

  UserModel({this.uid, this.email, this.nom, this.prenom, this.tel});

  //receiving data from server

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nom: map['nom'],
      prenom: map['prenom'],
      tel: map['tel']
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'nom': nom,
      'prenom' : prenom,
      'tel' : tel
    };
  }


}