import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage("assets/mario.png"),
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(child: Text("Kullanıcı Adı:      ")),
                              Expanded(child: Text("Level:     "))
                          ]
                          ),
                        ),
                        Expanded(child: Text("Sonraki Levela Yaklaşımınız: ")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage("assets/mario.png"),
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                      child: Text("50 kelimeye ulaştın.\nÇoğu kişi günde 50 kelimeden fazlasını kullanmaz.")),
                ],
              ),
            )
          ],
        ),
    );
  }
}
