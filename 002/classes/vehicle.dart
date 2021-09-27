import '../enums.dart';

class Vehicle {
  // feilds
  final String make;
  final int model;
  final String color;
  Status _VehicleStatus = Status.stopped;
  // constractor
  Vehicle({required this.make, required this.model, required this.color});
  // getters
  Status get VehicleStatus {
    return _VehicleStatus;
  }

  String get Vehiclemake => make;
  // setters
  void set status(Status newStatus) {
    _VehicleStatus = newStatus;
  }

  // methods
  void move(int distance, String direction) {
    print("$make moved $distance in $direction");
  }
}
