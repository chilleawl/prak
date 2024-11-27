class AllProduk {
  List<Products> products;
  int total;
  int skip;
  int limit;

  AllProduk({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory AllProduk.fromJson(Map<String, dynamic> json) {
    return AllProduk(
      products:
          (json['products'] as List).map((e) => Products.fromJson(e)).toList(),
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}

class Products {
  int id;
  String title;
  String description;
  double price; // Menggunakan double agar fleksibel
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      description: json['description'] ?? 'No Description',
      price: json['price']?.toDouble() ?? 0.0, // Pastikan type-casting aman
      discountPercentage:
          json['discountPercentage']?.toDouble() ?? 0.0, // Pastikan aman
      rating: json['rating']?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'Unknown Brand',
      category: json['category'] ?? 'Unknown Category',
      thumbnail: json['thumbnail'] ?? '',
      images: (json['images'] as List?)?.map((e) => e as String).toList() ?? [],
    );
  }
}
