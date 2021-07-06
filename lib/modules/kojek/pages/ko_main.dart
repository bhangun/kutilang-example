import 'package:flutter/material.dart';
import 'package:kutilang_example/modules/kojek/pages/ko_chat.dart';
import 'package:kutilang_example/modules/kojek/pages/ko_home.dart';
import 'package:kutilang_example/modules/kojek/pages/ko_promo.dart';
import 'package:kutilang_example/modules/kojek/widgets/capsule_indicator.dart';

class KoMain extends StatefulWidget {
  KoMain({Key? key}) : super(key: key);

  @override
  _KoMainState createState() => _KoMainState();
}

class _KoMainState extends State<KoMain> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  bool _isOpen = false;
  double _bottomHeight = 100;
  double _bottomWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.green,
              bottom: TabBar(
                isScrollable: true,
                indicator: CapsuleTabIndicator(
                    indicatorHeight: 30, indicatorColor: Colors.green[300]!),
                automaticIndicatorColorAdjustment: true,
                controller: _tabController,
                tabs: <Widget>[
                  _tab('Promos', Icons.shop_two),
                  _tab('Home', Icons.home),
                  _tab('Chat', Icons.chat)
                ],
              )),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[KoPromo(), KoHome(), KoChat()],
          ),
        ),
        _bottomNav()
      ],
    );
  }

  _tab(text, icon) {
    return Tab(
        icon: Row(children: [
      Icon(icon, size: 20, color: Colors.white),
      Padding(
          padding: EdgeInsets.only(left: 5),
          child:
              Text(text, style: TextStyle(fontSize: 13, color: Colors.white)))
    ]));
  }

  _bottomNav() {
    return DraggableScrollableSheet(
        initialChildSize: 0.23,
        minChildSize: 0.23,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          scrollController.addListener(() {
            setState(() {
              _isOpen = _isOpen ? false : true;
              if (_isOpen) {
                _bottomHeight = 1000;
                _bottomWidth = 500;
              } else {
                _bottomHeight = 100;
                _bottomWidth = 400;
              }
            });
          });
          return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  height: _bottomHeight,
                  width: _bottomWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          offset: Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 4.0,
                          spreadRadius: 0.5,
                        ),
                      ],
                      borderRadius: _borderRadius()),
                  child: Scaffold(body: _bottomRowBtn())));
        });
  }

  _borderRadius() {
    return _isOpen
        ? BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18))
        : BorderRadius.circular(50);
  }

  _bottomRowBtn() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _bottomBtn('KoRide', Icons.electric_bike),
          _bottomBtn('KoRide', Icons.food_bank),
          _bottomBtn('KoRide', Icons.car_rental),
          _bottomBtn('KoRide', Icons.mail),
        ]);
  }

  _bottomBtn(label, icon, {Color color = Colors.green}) {
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child:
              IconButton(iconSize: 20, onPressed: () => {}, icon: Icon(icon))),
      Text(label)
    ]);
  }
}
