class ResidenceModel {
  late double debt;
  late int id;
  String name;
  String block;
  String floor;
  int unit;
  int parking;
  late String status;
  late String price;
  String phone; 
  bool isDisabled;
  ResidenceModel(this.name, this.block, this.floor,
      this.parking, this.unit , this.phone,{this.isDisabled=false});
}
