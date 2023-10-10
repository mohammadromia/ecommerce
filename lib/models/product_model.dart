

class ProductModel {
  String? name;
  String? description;
  String? image;
  int? price;
  int? oldPrice;
  int? id;
  int? discount;
  bool? in_favorites;
  bool? in_cart;
  List <String>?images;
  ProductModel({
    this.name,
    this.description,
    this.image,
    this.price,
    this.oldPrice,
    this.id,
    this.discount,
    this.in_favorites,
    this.in_cart,
     this.images,
  });
  ProductModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    description = data['description'].toString();
    name = data['name'].toString();
    image = data['image'].toString();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    in_favorites = data["in_favorites"]??true;
    in_cart = data["in_cart"]??true;
    images=List.from(data['images']);
  }
    ProductModel.fromJsoncart({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    description = data['description'].toString();
    name = data['name'].toString();
    image = data['image'].toString();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    in_favorites = data["in_favorites"]??true;
    in_cart = data["in_cart"]??true;
  }
  

  ProductModel copyWith({
    String? name,
    String? description,
    String? image,
    int? price,
    int? oldPrice,
    int? id,
    int? discount,
    bool? in_favorites,
    bool? in_cart,
  }) {
    return ProductModel(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      id: id ?? this.id,
      discount: discount ?? this.discount,
      in_favorites: in_favorites ?? this.in_favorites,
      in_cart: in_cart ?? this.in_cart, 
      images: images??  this.images,
    );
  }



  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 

      other.id == id ;

  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      price.hashCode ^
      oldPrice.hashCode ^
      id.hashCode ^
      discount.hashCode ^
      in_favorites.hashCode ^
      in_cart.hashCode;
  }

  @override
  String toString() {
    return 'ProductModel(name: $name,  image: $image, price: $price, oldPrice: $oldPrice, id: $id, discount: $discount, in_favorites: $in_favorites, in_cart: $in_cart)';
  }
}
