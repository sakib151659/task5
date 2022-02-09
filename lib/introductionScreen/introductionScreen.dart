import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
   }) => Container(
       color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 64,),
        Text(
          title,
          style: TextStyle(
              color: Colors.teal.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 24,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.teal.shade900),
          ),
        )
      ],
    ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 80,
        ),
        child: PageView(
          controller: controller,
          children: [

            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/car2.png',
              title: 'LAMBORGHINI',
              subtitle: 'sgsd sdg  g sereh erye  h erh er herherher  er h ewegw eg herh sdgsdgsgs sdgsdegsdv sgsdegsd  sd sd fssdfsd dsf sdfsd  ds fsdf sdfgsd  sdfsd sgsdgsgs sd gsd g sdg  dsgsgds'
            ),

            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/images/bmw.png',
                title: 'BMW I8',
                subtitle: 'sgsd sdg  g sereh erye  h erh er herherher  er h ewegw eg herh sdgsdgsgs sdgsdegsdv sgsdegsd  sd sd fssdfsd dsf sdfsd  ds fsdf sdfgsd  sdfsd sgsdgsgs sd gsd g sdg  dsgsgds'
            ),

            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/images/bugatti.png',
                title: 'BUGATTI',
                subtitle: 'sgsd sdg  g sereh erye  h erh er herherher  er h ewegw eg herh sdgsdgsgs sdgsdegsdv sgsdegsd  sd sd fssdfsd dsf sdfsd  ds fsdf sdfgsd  sdfsd sgsdgsgs sd gsd g sdg  dsgsgds'
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: const Text("Skip", style: TextStyle(color: Colors.green),)
            ),

            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 16,
                  dotColor: Colors.green,
                  activeDotColor: Colors.greenAccent
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),

            TextButton(
                onPressed: () => controller.nextPage(
                    duration: const Duration(milliseconds:500) ,
                    curve: Curves.easeInOut),
                child: const Text("Next", style: TextStyle(color: Colors.blue),)
            ),

          ],
        ),
      ),
    );
  }
}
