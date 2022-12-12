class FruitModel{
  int? id;
  String? fruitname;
  int? quantity;
  int? price;
  int? total =0 ;

  FruitModel({this.id,this.fruitname,this.quantity ,this.price,this.total});

  factory FruitModel.fromMap(Map<String, dynamic> json) {
    int id = json['id'];
    String fruitname = json['fruitname'];
    int quantity = json['quantity'];
    int price = json['price'];
    int total = price * quantity;

    return FruitModel(id: id, fruitname:  fruitname, quantity: quantity, price: price,total: total);
  }
  }