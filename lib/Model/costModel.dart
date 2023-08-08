// ignore: file_names
class CostModel {
  late int id;
  String type;
  late DateTime date;
  double price;
  late bool status;
  late String day;
  late double remainPrice;
  CostModel(this.price, this.type) {
    status = false;
  }
}
