import 'package:meta/meta.dart';

class Reservation {
  Reservation(
      {@required this.cinemaName,
      @required this.orderNumber,
      @required this.reservationDate,
      @required this.reservationName,
      @required this.reservationPrice,
      @required this.reservationTime,
      @required this.seatNumber});
  String reservationName;
  String reservationDate;
  String reservationTime;
  String reservationPrice;
  String cinemaName;
  String orderNumber;
  String seatNumber;
}
