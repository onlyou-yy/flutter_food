class ProductsModel {
  int? totalSize;
  int? typeId;
  int? offset;
  List<Products>? products;

  ProductsModel({this.totalSize, this.typeId, this.offset, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['totalSize'];
    typeId = json['typeId'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalSize'] = this.totalSize;
    data['typeId'] = this.typeId;
    data['offset'] = this.offset;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  String? location;
  String? createAt;
  int? typeId;
  String? updateAt;
  int? stars;
  String? img;

  Products(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.location,
      this.createAt,
      this.typeId,
      this.updateAt,
      this.stars,
      this.img});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    createAt = json['createAt'];
    typeId = json['typeId'];
    updateAt = json['updateAt'];
    stars = json['stars'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['location'] = this.location;
    data['createAt'] = this.createAt;
    data['typeId'] = this.typeId;
    data['updateAt'] = this.updateAt;
    data['stars'] = this.stars;
    data['img'] = this.img;
    return data;
  }
}