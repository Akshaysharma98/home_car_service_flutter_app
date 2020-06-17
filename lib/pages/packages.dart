import 'package:flutter/material.dart';
import 'dart:math';
import 'data.dart';

class PackagesPage extends StatefulWidget {

  @override
  _PackagesPageState createState() => _PackagesPageState();
}

  var cardAspectRatio = 12.0 / 16.0 ;
  var widgetAspectRatio = cardAspectRatio * 1.2;

class _PackagesPageState extends State<PackagesPage> {
  var currentPage = images.length - 1.0;

  @override

  PageController controller = PageController(initialPage: images.length - 1);


  Widget build(BuildContext context) {
      controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Column(
          children: <Widget>[
            SizedBox(height:30.0),
            Align(
              alignment: Alignment(-0.38, - 0.88),
              child: Container(
                child:Text("Trending",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height:30.0),
            Stack(
            
              children: <Widget>[
                CardScrollWidget(currentPage),
                
                Positioned(
                  top: 110,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {

  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child:LayoutBuilder(
      builder: (context,contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          
          bool isOnRight = delta>0;
          var start = padding +max(primaryCardLeft - horizontalInset * -delta *(isOnRight ? 15 : 1 ), 0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta,0.0),
            bottom: padding + verticalInset * max(-delta,0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Container(
              child: AspectRatio(
                aspectRatio: cardAspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(images[i] , fit:BoxFit.cover),
                  ],
                ), 
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }
    ),
    );
  }
}