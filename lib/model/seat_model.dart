class Seat {
  final int number;
  final String office;
  final String floor;
  final bool isCurrent;

  Seat({required this.number, required this.office, required this.floor, this.isCurrent = false});
}