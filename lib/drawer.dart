

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);


  @override
  Widget build(BuildContext context) {
    final nom = "lokmane sabbah";
    final email = "lokmane@sabbah.net";
    final urlImage = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.youtube.com%2Fchannel%2FUCEQJyPsq1GLGPBFilN36_wg&psig=AOvVaw3Qwn4sfhBdQyEZd7xLkOnj&ust=1651540244295000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOjSsP_Qv_cCFQAAAAAdAAAAABAD";
    return Drawer(


      child: Material(
        color: Colors.blueGrey,
        child: ListView(
          //padding: padding,
          children: [
            buildHeader(
                urlImage: "https://yt3.ggpht.com/ytc/AKedOLSPjt7srCsUwWOb5W-Y-QqhQMdwcTenKpW2_ou6kg=s900-c-k-c0x00ffffff-no-rj",
                nom: nom,
                email: email,
                onClicked: ()=>Navigator.pushNamed(context, "/Onboarding"),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  buildMenuItem(text: "Acceuil", icon: "images/home.png", onClicked: ()=>selectedItem(context, 0)),

                  SizedBox(height: 12,),
                  buildMenuItem(text: "Don officiel", icon: "images/store.png", onClicked: ()=>selectedItem(context, 1)),

                  SizedBox(height: 12,),
                  buildMenuItem(text: "Don urgent", icon: "images/urgent.png", onClicked: ()=>selectedItem(context, 2)),

                  SizedBox(height: 12,),
                  buildMenuItem(text: "Tirer profit", icon: "images/drop-of-blood.png", onClicked: ()=>selectedItem(context, 3)),

                  SizedBox(height: 24,),
                  Divider(color: Colors.white70,),
                  SizedBox(height: 24,),

                  buildMenuItem(text: "Découvrir", icon: "images/decouvrir.png", onClicked: ()=>selectedItem(context, 4)),

                  SizedBox(height: 12,),
                  buildMenuItem(text: "Notifications", icon: "images/notification.png"),





                ],
              ),
            )





          ],
        ),
      )

    );
}

Widget buildHeader({
  required String urlImage,
  required String nom,
  required String email,
  required VoidCallback onClicked,

})=>
  InkWell(
    onTap: onClicked,
    child: Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage),),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 8,),
              Text(
                email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    ),

  );

Widget buildMenuItem({
  required String text,
  required String icon,
  VoidCallback? onClicked,
}){
    final color = Colors.white;
    final hoverColor = Colors.white70;


    return ListTile(
      leading: ImageIcon(AssetImage(icon), color: color,size: 20),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );

}

  void selectedItem(BuildContext context,   int index){
    switch(index){
      case 0:
        Navigator.of(context).pop();
        //Navigator.pushNamed(context, "/home");
        break;

      case 1:
        Navigator.of(context).pop();
        Navigator.pushNamed(context, "/donOfficiel");
        break;

      case 2:
        Navigator.of(context).pop();
        Navigator.pushNamed(context, "/DonUrgent");
        break;

      case 3:
        Navigator.of(context).pop();
        Navigator.pushNamed(context, "/tirerProfit");
        break;

      case 4:
        Navigator.of(context).pop();
        Navigator.pushNamed(context, "/Onboarding");
        break;

      case 6:
        Navigator.of(context).pop();
        Navigator.pushNamed(context, "/login");
        break;







    }


  }
}
