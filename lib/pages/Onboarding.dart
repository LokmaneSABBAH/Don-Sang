import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  final controller = PageController();


  Widget buildPagee({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle
})=>Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SizedBox(height: 64,),
        Text(
          title,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 24,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subtitle,
            //style: TextStyle(color: Colors.redAccent),
          ),
        )
      ],
    ),
  );



  //const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
           buildPagee(
               color: Colors.blue.shade100,
               urlImage: "images/question.png",
               title: "Qui nous sommes?",
               subtitle: "Être entreprise partenaire de l’Établissement marocain du sang (EMS), c’est être engagé dans des actions de promotion en faveur du don de sang et faire le choix de vous investir dans la responsabilité sociétale de votre entreprise (RSE). Cet engagement sociétal valorise l’image de votre entreprise autour des valeurs de partage et de solidarité."
           ),
            buildPagee(
                color: Colors.blue.shade100,
                urlImage: "images/maroc.png",
                title: "Situation nationale",
                subtitle: "La moyenne nationale des donneurs volontaires est de 93%, ce qui laisse près de 7% de dons comme dons de compensation. Depuis le début de l'apparition de la pandémie Covid-19, notre pays a enregistré une diminution importante du nombre de dons de sang."
            ),
            buildPagee(
                color: Colors.blue.shade100,
                urlImage: "images/signpost.png",
                title: "Comment ça marche ?",
                subtitle: "Se présenter avec une pièce d'identité : carte nationale d'identité, passeport ou titre de séjour. tout document mentionnant vos noms et prénoms avec une photo. Pour les donneurs réguliers, la carte de donneur n'est plus acceptée. Seules les pièces avec photo sont acceptées (carte de transport ou une carte vitale)."
            ),
            buildPagee(
                color: Colors.blue.shade100,
                urlImage: "images/testimonials.png",
                title: "Témoignages",
                subtitle: "La première fois, c’était de la curiosité et l’envie d’aider quelqu’un dans le besoin. Par la suite, mon grand-père qui est du même groupe sanguin que moi a fait une hémorragie ; cela m’a motivé encore plus à continuer. Maintenant, j’essaie de le faire dès que je peux. Cela me prend un peu de temps, mais donner son sang permet d’aider tellement de personnes.\nLokmane sabbah"
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text("Passer"),
              onPressed: (){
                controller.jumpToPage(3);
              },
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
                onDotClicked: (index){
                  controller.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),

            ),
            TextButton(
              child: Text("Suivant"),
              onPressed: (){
                controller.nextPage(
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeInOut
                );
              },
            )

          ],
        ),

      ),
    );
  }
}
