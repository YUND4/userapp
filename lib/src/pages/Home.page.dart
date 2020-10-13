import 'package:flutter/material.dart';
import 'package:userapp/src/Blocs/TypedBloc.bloc.dart';
import 'package:userapp/src/utils/AppBarMenu.utils.dart';
import 'package:userapp/src/utils/HexColor.util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bloc<List> _contacts = Bloc<List>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'CONTACTOS',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            _renderContacts()
          ],
        ),
      ),
    );
  }

  Widget _renderContacts() {
    return StreamBuilder(
        stream: _contacts.stream,
        builder: (streamContext, snapshot) {
          if (snapshot.hasError == true) {
            return Opacity(opacity: 1.0);
          } else if (snapshot.hasData == false) {
            return Column(
              children: [
                _contact(),
              ],
            );
          } else {
            return Opacity(opacity: 1.0);
          }
        });
  }

  Widget _contact() => Card(
        color: HexColor('#FFF4D6'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            _expandedImage(image: 'Imagen 1.png'),
            _expandedText(),
            _iconButton(callback: () {})
          ],
        ),
      );

  Widget _contactLoading() => Card(
        color: HexColor('#FFF4D6'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            _expandedImage(image: 'Imagen 1.png'),
            _expandedText(),
            _iconButton(callback: () {})
          ],
        ),
      );

  Widget _expandedText({int flex = 6, String name, String, username}) =>
      Expanded(
        flex: 4,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'JORGE ROBLES',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Gatitotraviso04',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      );

  Widget _iconButton({int flex = 1, void Function() callback}) => Expanded(
        flex: flex,
        child: GestureDetector(
          onTap: callback,
          child: Icon(
            Icons.chevron_right_rounded,
            color: HexColor('#FEDD7C'),
          ),
        ),
      );

  Widget _expandedImage({int flex = 1, String image}) => Expanded(
        flex: flex,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/$image',
            height: 60,
            width: 65,
            centerSlice: Rect.zero,
            alignment: Alignment(-0.64, 0.5),
          ),
        ),
      );
}
