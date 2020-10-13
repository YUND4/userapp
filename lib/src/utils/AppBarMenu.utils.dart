import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'HexColor.util.dart';

class AppBarMenu extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarMenuState createState() => _AppBarMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(75);
}

class _AppBarMenuState extends State<AppBarMenu> {
  Key _selctedKey = GlobalKey();
  Map<Key, Map> _menuButtons = {
    GlobalKey(): {
      'icon': 'assets/icons/001-home.svg',
      'label': 'Home',
    },
    GlobalKey(): {
      'icon': 'assets/icons/002-speech-bubble.svg',
      'label': 'Message',
    },
    GlobalKey(): {
      'icon': 'assets/icons/003-heart.svg',
      'label': 'Likes',
    },
    GlobalKey(): {
      'icon': 'assets/icons/004-user.svg',
      'label': 'Profile',
    },
  };

  @override
  void initState() {
    assert(_menuButtons.length > 0);
    _selctedKey = _menuButtons.keys.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: _menu(buttons: _menuButtons),
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }

  List<Widget> _menu({Map buttons}) {
    List<Widget> menu = [];
    buttons.forEach((key, value) {
      menu.add(SizedBox(
        width: 5,
      ));
      menu.add(
        _menuButton(
          key: key,
          icon: value['icon'],
          label: value['label'],
        ),
      );
    });
    return menu;
  }

  void _animatedButton({Key key}) {
    _selctedKey = key;
    String originalLabel = _menuButtons[key]['label'].toString();
    String viewLabel = '';
    Future.forEach(
      List.generate(originalLabel.length, (i) => i),
      (e) async {
        await Future.delayed(
          Duration(milliseconds: 35),
          () {
            setState(() {
              viewLabel += originalLabel.substring(e, e + 1);
              _menuButtons[key]['label'] = viewLabel;
            });
          },
        );
      },
    );
  }

  Widget _menuButton({String label, String icon, Key key}) => Expanded(
        flex: key == _selctedKey ? 2 : 1,
        child: FlatButton.icon(
          key: key,
          onPressed: () {
            _animatedButton(key: key);
          },
          color: key == _selctedKey ? HexColor('#FEDD7C') : null,
          icon: SvgPicture.asset(icon),
          label: key == _selctedKey
              ? Text(
                  label,
                  style: Theme.of(context).textTheme.headline5,
                )
              : Opacity(opacity: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );
}
