import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';

import 'news_page.dart';

class MainNews extends StatelessWidget {
  static const String id = 'main_news';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            News(
              child: SafeArea(
                child: Padded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ),
              subject:
                  'Archbishop Alfred Adewale Martins 35th Ordination Anniversery (Press Release)',
              content:
                  'Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl'
                  ' Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl',
              stackedImages: [null, null, null],
              date: '3 days ago',
              likes: 10,
              comments: 10,
              shares: 10,
            ),
          ],
        ),
      ),
    );
  }
}
