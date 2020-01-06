import 'package:flutter/material.dart';
import 'package:movie_order/SizeConfig/sizeConfig.dart';

import 'package:movie_order/widgetComponent/heather.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _movieScrollController = ScrollController();
  ScrollController _secondScrool = ScrollController();
  double value = 0;
  @override
  void initState() {
    super.initState();
    _movieScrollController.addListener((){

      //print(_movieScrollController.offset);
      
      //_secondScrool.animateTo(_movieScrollController.offset,duration: Duration(milliseconds: 100),curve: Curves.linear);
      if (_movieScrollController.offset <= 0.0)
      {
        // we don't need to scroll 
      }
      if (_movieScrollController.offset >0.0)
      {
       // _secondScrool.jumpTo(-5);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print('The hight of the screen is '+ (SizeConfig.safeBlockVertical*100).toString());
    return Scaffold(
      body: CustomScrollView(
        controller: _movieScrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: MoviePageHeader (
              parentScrollController: _movieScrollController,
              movieScrollController: _secondScrool,
              maxExtent: SizeConfig.verticalBloc*65,
              minExtent: SizeConfig.verticalBloc*35,
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                for(int i=0;i<21;i++)
                Container(
                  width: 100,
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
