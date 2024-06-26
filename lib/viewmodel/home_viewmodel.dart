import 'package:flutter/material.dart';
import 'package:hraccoon/model/seat_model.dart';

class HomeViewModel extends ChangeNotifier {
  static const List<String> officeDropdownList = ['잠실 오피스', '마포 오피스', '성북 오피스'];
  static const List<String> floorDropdownList = ['1F', '2F', '3F'];

  String _selectedOffice = officeDropdownList.first;
  String _selectedFloor = floorDropdownList.first;
  int? _currentSeatNum = 14; // 사용 중인 좌석 번호
  bool _isSeatCanceled = false;
  int? _expandedSeatNum;

  List<Seat> _seats = List.generate(
    20,
        (index) => Seat(number: index + 1, office: '잠실 오피스', floor: '3층', isCurrent: index + 1 == 14),
  );

  String get selectedOffice => _selectedOffice;
  String get selectedFloor => _selectedFloor;
  List<Seat> get seats => _seats;
  bool get isSeatCanceled => _isSeatCanceled;
  int? get currentSeatNum => _currentSeatNum;
  int? get expandedSeatNum => _expandedSeatNum;

  void setSelectedOffice(String value) {
    _selectedOffice = value;
    notifyListeners();
  }

  void setSelectedFloor(String value) {
    _selectedFloor = value;
    notifyListeners();
  }

  void cancelSeat() {
    if (_currentSeatNum != null) {
      _seats[_currentSeatNum! - 1] = Seat(
        number: _currentSeatNum!,
        office: _seats[_currentSeatNum! - 1].office,
        floor: _seats[_currentSeatNum! - 1].floor,
        isCurrent: false,
      );
      _currentSeatNum = null;
      _isSeatCanceled = true;
      notifyListeners();
    }
  }

  void selectSeat(int seatNum) {
    if (_currentSeatNum != null) {
      _seats[_currentSeatNum! - 1] = Seat(
        number: _currentSeatNum!,
        office: _seats[_currentSeatNum! - 1].office,
        floor: _seats[_currentSeatNum! - 1].floor,
        isCurrent: false,
      );
    }
    _currentSeatNum = seatNum;
    _seats[seatNum - 1] = Seat(
      number: seatNum,
      office: _seats[seatNum - 1].office,
      floor: _seats[seatNum - 1].floor,
      isCurrent: true,
    );
    _isSeatCanceled = false;
    notifyListeners();
  }

  void expandSeat(int seatNum) {
    _expandedSeatNum = seatNum;
    notifyListeners();
  }

  void collapseSeat() {
    _expandedSeatNum = null;
    notifyListeners();
  }
}