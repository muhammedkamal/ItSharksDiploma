import '../enums.dart';

class Vehicle {
  // feilds
  final String make;
  final int model;
  String color;
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

// inheritance
class Car extends Vehicle {
  final String carMake;
  final int model;
  final String color;
  final int maxSpeed;
  Status _VehicleStatus = Status.stopped;
  Car(
      {required this.carMake,
      required this.model,
      required this.color,
      required this.maxSpeed})
      : super(make: carMake, model: model, color: color);

  // Polymorphism
  @override
  void move(int distance, String direction) {
    print("this car is moving");
    super.move(distance, direction);
  }
}

void main() {
  // this how you declare an object of type class
  Car car = Car(carMake: "Honda", model: 1999, color: "Black", maxSpeed: 220);
  print(car.VehicleStatus);
  //this how to use setters
  car..status = Status.running;
  print(car.VehicleStatus);
  car.move(20, "East");
}
