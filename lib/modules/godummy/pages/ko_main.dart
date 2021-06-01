import 'package:flutter/material.dart';
import 'package:kutilang_example/modules/godummy/pages/ko_chat.dart';
import 'package:kutilang_example/modules/godummy/pages/ko_home.dart';
import 'package:kutilang_example/modules/godummy/pages/ko_promo.dart';
import 'package:kutilang_example/modules/godummy/widgets/capsule_indicator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  _tab(text, icon) {
    return Tab(
        icon: Row(children: [
      Icon(icon, color: Colors.white),
      Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(text, style: TextStyle(color: Colors.white)))
    ]));
  }
}
