import 'dart:ui';
import 'package:flutter/material.dart';
import 'db_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  final List<StoreList> products;
  const ProductPage({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    //double height = window.physicalSize.height / window.devicePixelRatio;
    double width = window.physicalSize.width / window.devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fultter store'),
      ),
      body: Scrollbar(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ListView.builder(
                itemCount: widget.products.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 3.0,
                              spreadRadius: 1.0)
                        ],
                      ),
                      height: 120,
                      width: width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  key: UniqueKey(),
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                  maxHeightDiskCache: 75,
                                  imageUrl:
                                      "${widget.products[i].productUrl}$i",
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.products[i].productName,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  child: RatingBarIndicator(
                                    rating: widget.products[i].productRating
                                        .toDouble(),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    widget.products[i].productDescription
                                                .length >
                                            100
                                        ? '${widget.products[i].productDescription.substring(0, 97)}...'
                                        : widget.products[i].productDescription,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  snack({required String text}) {
    final snackBar = SnackBar(
      duration: const Duration(minutes: 10),
      content: Text(text),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
