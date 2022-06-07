class StoreList {
  final String productName;
  final String productUrl;
  final String productDescription;
  final int productRating;

  StoreList({
    required this.productName,
    required this.productUrl,
    required this.productDescription,
    required this.productRating,
  });
  factory StoreList.fromJson(Map<String, dynamic> json) {
    return StoreList(
        productName: json['productName'] ?? 'no data',
        productUrl: json['productUrl'] ?? 'no data',
        productDescription: json['productDescription'] ?? 'no data',
        productRating: json['productRating'] ?? 0);
  }
}
