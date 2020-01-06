import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_order/SizeConfig/sizeConfig.dart';


class MoviePageHeader implements SliverPersistentHeaderDelegate {
  MoviePageHeader(
    
      {@required this.minExtent,
      @required this.maxExtent,
      @required this.movieScrollController,
      @required this.parentScrollController,
      
      });
  final double minExtent;
  final double maxExtent;
  final ScrollController movieScrollController, parentScrollController;
  
  //PageController _moviePageController = PageController(viewportFraction: 0.7);
  double scaleValue=0;
  double value = 1;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
        // scaleValue = 1 -((max(0, shrinkOffset / 200) /(maxExtent * 2)));
        // parentScrollController.addListener((){
        //   //print(shrinkOffset);
        //  movieScrollController.jumpTo(movieScrollController.offset / (scaleValue)); 
        //  print(movieScrollController.offset);
        // });
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: SizeConfig.horizontalBloc * 100,
            color: Colors.green,
            child: SafeArea(
              child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            scale: 1 -
                ((max(0, shrinkOffset / 550) / (maxExtent * 2))),
                            origin: Offset(-SizeConfig.verticalBloc * 35,
                -SizeConfig.verticalBloc * 30),
                            child: Text(
              'Popular now',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 8 -
                      (max(SizeConfig.safeBlockHorizontal * 9,
                              shrinkOffset * 10) /
                          (maxExtent)),
                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 12,
                      child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        controller: movieScrollController,
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: movieScrollController,
                            builder: (BuildContext context, Widget child) {
              if (movieScrollController.position.haveDimensions) {
                value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
              }
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Transform.scale(
                  scale: 1 -
                      ((max(0, shrinkOffset / 200) /
                          (maxExtent * 2))),
                  origin: Offset(-SizeConfig.verticalBloc * 35,
                      -SizeConfig.verticalBloc * 30),
                  child: Container(
                    width: SizeConfig.horizontalBloc * 55 -((max(0, shrinkOffset * 100) /(maxExtent))),
                     //(SizeConfig.horizontalBloc * 55)+((max(0, shrinkOffset/200) / (maxExtent*2))),
                    color: Colors.pink,
                  ),
                ),
              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent;
  }

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration(
    stretchTriggerOffset: 2333,
    onStretchTrigger: (){
      print('hii');
      return null;
    }
  );

 
}
