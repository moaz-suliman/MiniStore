import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/custom_widgets/share_button.dart';
import 'package:small_shop/feature/HomePage/data/model/product_model.dart';
import 'package:small_shop/feature/HomePage/presintation/provider/prodcut_provider.dart';
import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';

class ProductPageDetails extends StatefulWidget {
  final Product product;
  const ProductPageDetails({super.key, required this.product});

  @override
  State<ProductPageDetails> createState() => _ProductPageDetailsState();
}

class _ProductPageDetailsState extends State<ProductPageDetails> {
  @override
  Widget build(BuildContext context) {
    final price = widget.product.price ?? 0;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColor.cardColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColor.textColor),
        ),
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            fontFamily: 'mmmm',
            color: AppColor.textColor,
          ),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    children: [
                      // الصورة
                      Container(
                        width: double.infinity,
                        height: 300,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.product.thumbnail ?? "",
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.broken_image, size: 40),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.title ?? "",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mmmm',
                                color: AppColor.textColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '\$${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mmmm',
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mmmm',
                                color: AppColor.textColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.product.description ?? "",
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                fontFamily: 'mmmm',
                                color: AppColor.subtitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.cardColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mmmm',
                                color: AppColor.textColor,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: AppColor.borderColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () {
                                      if (value.productPageDetailsQuantity >
                                          1) {
                                        value
                                            .productPageDetailsQuantityDecreese();
                                      }
                                    },
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.surfaceColor,
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      '${value.productPageDetailsQuantity}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'mmmm',
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () => value
                                        .productPageDetailsQuantityIncreese(),
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.surfaceColor,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'mmmm',
                                color: AppColor.subtitleColor,
                              ),
                            ),
                            Text(
                              '\$${(value.productPageDetailsQuantity * price).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mmmm',
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ShareButton(
                            onPressed: () {
                              context.read<CartProvider>().addProduct(
                                widget.product,
                                value.productPageDetailsQuantity,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  content: Container(
                                    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(child: Text('Data  added successfully.',style: TextStyle(color: Colors.white,fontSize: 18),))
                                    ),
                                ),
                              );
                            },
                            text: 'Add to Cart',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
