import 'package:flutter/material.dart';
import 'package:hraccoon/model/seat_model.dart';

class HomeViewModel extends ChangeNotifier {
  static const List<String> officeDropdownList = ['잠실 오피스', '마포 오피스', '성북 오피스'];
  static const List<String> floorDropdownList = ['1F', '2F', '3F'];

  String _selectedOffice = officeDropdownList.first;
  String _selectedFloor = floorDropdownList.first;
  int? _currentSeatNum;
  bool _isSeatCanceled = false;
  int? _expandedSeatNum;

  final List<Seat> _seats = [
    Seat(number: 1, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 2, office: '잠실 오피스', floor: '3층', isCurrent: true, employeeId: '12345', employeeName: '홍길동'),
    Seat(number: 3, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 4, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 5, office: '잠실 오피스', floor: '3층', isCurrent: true, employeeId: '12346', employeeName: '김철수'),
    Seat(number: 6, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 7, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 8, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 9, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 10, office: '잠실 오피스', floor: '3층', isCurrent: true, employeeId: '12347', employeeName: '이영희'),
    Seat(number: 11, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 12, office: '잠실 오피스', floor: '3층', isCurrent: true, employeeId: '12348', employeeName: '박민수'),
    Seat(number: 13, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 14, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 15, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 16, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 17, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 18, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 19, office: '잠실 오피스', floor: '3층', isCurrent: false),
    Seat(number: 20, office: '잠실 오피스', floor: '3층', isCurrent: false),
  ];

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
      int seatIndex = _seats.indexWhere((seat) => seat.number == _currentSeatNum);
      if (seatIndex != -1) {
        _seats[seatIndex] = Seat(number: _currentSeatNum!, office: _seats[seatIndex].office, floor: _seats[seatIndex].floor, isCurrent: false,);
      }
      _currentSeatNum = null;
      _isSeatCanceled = true;
      notifyListeners();
    }
  }

  void selectSeat(int seatNum) {
    if (_currentSeatNum != null) {
      int currentSeatIndex = _seats.indexWhere((seat) => seat.number == _currentSeatNum);
      if (currentSeatIndex != -1) {
        _seats[currentSeatIndex] = Seat(number: _currentSeatNum!, office: _seats[currentSeatIndex].office, floor: _seats[currentSeatIndex].floor, isCurrent: false,);
      }
    }

    int seatIndex = _seats.indexWhere((seat) => seat.number == seatNum);

    if (seatIndex != -1) {
      _currentSeatNum = seatNum;
      _seats[seatIndex] = Seat(number: seatNum, office: _seats[seatIndex].office, floor: _seats[seatIndex].floor, isCurrent: true, employeeId: '99999', employeeName: '사용자명',);
      _isSeatCanceled = false;
      notifyListeners();
    }
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