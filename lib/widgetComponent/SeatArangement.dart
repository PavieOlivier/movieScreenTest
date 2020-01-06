import 'package:flutter/material.dart';
import 'package:movie_order/SizeConfig/sizeConfig.dart';

class SeatArrangement extends StatefulWidget {
  const SeatArrangement({
    Key key,
  }) : super(key: key);

  @override
  _SeatArrangementState createState() => _SeatArrangementState();
}

class _SeatArrangementState extends State<SeatArrangement>
    {

 
  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: SizeConfig.horizontalBloc * 95,
        height: SizeConfig.verticalBloc * 30,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Wrap(
            spacing: 4,
            runSpacing: 6,
            children: <Widget>[
              
              for (int i = 0; i < 35; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Seats(),
                ),
            ],
          ),
        ));
  }
}

class Seats extends StatefulWidget {
  const Seats({
    Key key,
    
  }) : super(key: key);

  

  @override
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> with SingleTickerProviderStateMixin {
    bool isSelected = false;
  double scale = 0 ;
  Color seatColor = Colors.white38;
  AnimationController scaleAnimationController;
   @override
  void initState() {
    super.initState();
    
    scaleAnimationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 0.1,
        duration: Duration(milliseconds: 100));
    scaleAnimationController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    scale = 1 - scaleAnimationController.value;
    return GestureDetector(
    onTapDown: (info){
      scaleAnimationController.forward();
    },
    onTapUp: (info){
      scaleAnimationController.reverse();
    },
      onTap: () {
        
        if (isSelected == true) {
          isSelected = false;
          seatColor = Colors.white38;
        } else {
          isSelected = true;
          seatColor = Colors.purple[300];
        }
      },
      child: Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
              color: seatColor,
              borderRadius: BorderRadius.circular(12)),
          width: SizeConfig.horizontalBloc * 12,
          height: SizeConfig.verticalBloc * 5,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/seat.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
