import 'package:flutter/material.dart';

class KoHome extends StatefulWidget {
  KoHome({Key? key}) : super(key: key);

  @override
  _KoHomeState createState() => _KoHomeState();
}

class _KoHomeState extends State<KoHome> {


  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1.0,
        minChildSize: 0.3,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  color: Colors.white),
              margin: EdgeInsets.only(top: 20),
              height: 900,
              child: Stack(children: [
                SingleChildScrollView(
                    controller: scrollController,
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 500,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _searchRow(),
                            _headerRow(),
                            _orderHistory(),
                            _starsOrder(),
                            _others(),
                            _others(),
                            _others()
                          ],
                        ))),
                //_bottomNav()
              ]));
        });
  }

  _searchRow() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 320,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                ]),
            child: TextField(
              decoration: InputDecoration(
                  enabled: false,
                  enabledBorder: InputBorder.none,
                  //disabledBorder: InputBorder.none,
                  hintText: 'Search GoDummy service...',
                  hintStyle: TextStyle(fontSize: 14),
                  icon: Icon(Icons.search)),
            )),
        Spacer(),
        Container(
            margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Center(
              child: IconButton(
                  color: Colors.white,
                  splashRadius: 10,
                  onPressed: () => {},
                  icon: Icon(Icons.person)),
            ))
      ],
    );
  }

  _headerRow() {
    return Flexible(
        child: Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: 400,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 26, 129, 160),
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
          width: 140,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('KuPay'),
                Text('Rp 180.000'),
                Text(
                  'Tap for history',
                  style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(children: [
              boxBtn(Icons.arrow_upward, 'Pay'),
              boxBtn(Icons.add, 'Top Up'),
              boxBtn(Icons.explore, 'Explore')
            ]))
      ]),
    ));
  }

  boxBtn(icon, text) {
    return Column(children: [
      TextButton(
          onPressed: () => {},
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Icon(icon))),
      Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )
    ]);
  }

  _orderHistory() {
    return Flexible(
        child: Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
      width: 400,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
          ]),
      child: Row(children: [
        Text('Order History'),
        Spacer(),
        Container(
            margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
            //width: 140,
            //height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Icon(Icons.arrow_forward, size: 20, color: Colors.white))
      ]),
    ));
  }

  _starsOrder() {
    return /* Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: */
        Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text('Stars for your orders, please'),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_driver(), _driver(), _driver(), _driver()],
              )))
          //)
        ]) //)
        ;
  }

  _driver() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.greenAccent,
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
          ]),
      child: Text('fulan'),
    );
  }


  _others() {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        width: 400,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 26, 129, 160),
        ),
        child:  Text('')
        );
  }
}
