class CostModel {
  String type;
  late DateTime date;
  String price;
  late bool status;
  late String day;
  CostModel(this.price, this.type) {
    status = false;
  }
}
