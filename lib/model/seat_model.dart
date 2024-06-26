class Seat {
  final int number;
  final String office;
  final String floor;
  final bool isCurrent;
  final String? employeeId;
  final String? employeeName;

  Seat({
    required this.number,
    required this.office,
    required this.floor,
    required this.isCurrent,
    this.employeeId,
    this.employeeName,
  });
}