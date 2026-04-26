import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  int _currentImageIndex = 0;
  String _selectedTab = 'Description';

  final List<String> _carouselImages = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAX7yTUKOvkrKQQPofHGe2l2_fBIWE0UjQWTMWpkFS9ZIQlsbdWVdCevTPlclwospbw3IsAvK6LL6liNR1SpMh5os9olBspfYV7SIuFxzvvfxfVQT0IRfsrAPIp76wl1QqfpnDiBsEdgCZEt0JPiivid7M09T4Rv3AaDSbNGdkBc5GGZp89UywNYVqPYu23UmWS39CR171kDdUMlyEuc5WXixxP6Dwg3Ms3Ux_ZR78hTnBAdtlkwjC_wdq371v7ADF3QuJewPl_CKA',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBbzay5f6ggPLLJLt2qF8ZPvBZPxVbTQKs0uSggMu4xnoNizcr7cfbiOUxbeCt69EklPqAfeFIy6hg0JUZsqEh7GPaI3b8gYIO5v4Htb23WAPaK3i2FYB6kHSnR7nbJb4Pxl3oA7JUHkIZ2riRw4V8VjlGHlezy6ENvLfnXot0m6fz8kMJOs4_ONKCjIuJrYjUwNQrnHYTvbilh9n3qom7GqykeEElXP3bvWRimSl52EkDGZ_z7kZVSheUe4mT7MMmENBHo1CrkQUg',
  ];

  final List<Map<String, dynamic>> _relatedProducts = [
    {
      'name': 'Auto Transfer Switch 630A',
      'category': 'ATS PANEL',
      'price': 'KES 145,000',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBuWL25JQXABvcyD4uuEspM8wsPAwblCE1dQd29HaI2ol41NwCTjJGR7Ckk1371nPS0mH4Z9zh498ejdeC3Hm4DJ51vVXWz-Tw2vfiR4WmPMzm_o80UetB4NovpOE1HLT98-6l8yz4cz4Cx_2tMkW7d2whnynCElwWRHyOCvr5iNQFxOCfzZu2XQHImihTK1y3vCvEXgjFWmnpfbi4Btm2Iu_ZiZiGyH14lOnOmkQa1hbpHdE21wXriksYjWGflGxZmVCs8PECx5ZA',
    },
    {
      'name': '70mm Armored Cable (10m)',
      'category': 'CABLING',
      'price': 'KES 35,000',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCP9GsPqxuTwZg58sFcNFguqILdWqOaLSAWuqDLduuW1ePT91XkNmdp3usJddP1NlXQpSwjOIPeJEVOly1_96T8qvG03L26hAXvTNqkHWH-Hell0jOkekgx6ezJdkXkh_xfm96LtaG1Vlh0xHmKiH2uqVXY-25bQDxt3IZztz8clApK2cid02uF1coHPhLUMjBzx3bzoAxG4Of2ceG_TKkJrruFfyrtkegAoA9xmsJNZ9bBsczZPTPZdq97XypCfCczAODpH_Rmi_M',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Product Details',
          style: AppTextStyles.headlineSm.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: AppColors.primary,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageCarousel(),
                _buildProductSummary(),
                _buildTabSection(),
                _buildRelatedProducts(),
              ],
            ),
          ),
          _buildBottomActionBar(),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: PageView.builder(
              itemCount: _carouselImages.length,
              onPageChanged: (index) {
                setState(() => _currentImageIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  _carouselImages[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade100,
                    child: const Icon(Icons.image, size: 64),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _carouselImages.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSummary() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'POWER GENERATION',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.secondary,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Titan-X 500kVA Diesel Generator',
                      style: AppTextStyles.headlineLg.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.share_outlined),
                color: AppColors.secondary,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KES 2,450,000',
                    style: AppTextStyles.headlineLg.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'Excl. VAT & Delivery',
                    style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.outlineVariant),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (_quantity > 1) {
                          setState(() => _quantity--);
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      child: Center(
                        child: Text(
                          '$_quantity',
                          style: AppTextStyles.headlineSm.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() => _quantity++);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0x1A006d3a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Color(0xFF006d3a),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'In Stock',
                      style: AppTextStyles.labelMd.copyWith(
                        color: const Color(0xFF006d3a),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_shipping_outlined,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '3-5 Days Delivery',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
            child: Row(
              children: [
                _buildTab('Description'),
                _buildTab('Specifications'),
                _buildTab('Shipping'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: _selectedTab == 'Description'
                ? _buildDescriptionContent()
                : _selectedTab == 'Specifications'
                    ? _buildSpecificationsContent()
                    : _buildShippingContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    final isSelected = _selectedTab == title;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedTab = title),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySm.copyWith(
              color: isSelected ? AppColors.primary : AppColors.secondary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Titan-X 500kVA is a robust, heavy-duty industrial generator designed for mission-critical power supply. Engineered for the East African climate, it features an advanced cooling system and sound-attenuated enclosure for outdoor operation.',
          style: AppTextStyles.bodyLg.copyWith(
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        _buildFeatureItem('Fuel-efficient Cummins engine technology'),
        const SizedBox(height: 8),
        _buildFeatureItem('Intelligent control panel with remote monitoring'),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.verified,
          color: AppColors.primary,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodySm.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecificationsContent() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F3F8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'FEATURE',
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.secondary,
                      letterSpacing: 0.5,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'DETAIL',
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.secondary,
                      letterSpacing: 0.5,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildSpecRow('Prime Power', '500kVA / 400kW'),
          _buildSpecRow('Engine', 'Cummins QSZ13-G3'),
          _buildSpecRow('Fuel Tank', '1000 Liters', isLast: true),
        ],
      ),
    );
  }

  Widget _buildSpecRow(String feature, String detail, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6)),
              ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              feature,
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              detail,
              style: AppTextStyles.bodySm.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Information',
          style: AppTextStyles.headlineSm.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Standard delivery takes 3-5 business days within Nairobi and surrounding areas. For upcountry deliveries, please allow 5-7 business days.',
          style: AppTextStyles.bodyLg.copyWith(
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        _buildFeatureItem('Free delivery for orders above KES 500,000'),
        const SizedBox(height: 8),
        _buildFeatureItem('Professional installation available'),
      ],
    );
  }

  Widget _buildRelatedProducts() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related Equipment',
            style: AppTextStyles.headlineLg.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: _relatedProducts.map((product) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF3F4F6)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.image,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['category'],
                        style: AppTextStyles.labelMd.copyWith(
                          color: AppColors.primary,
                          letterSpacing: 0.5,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['name'],
                        style: AppTextStyles.bodySm.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['price'],
                        style: AppTextStyles.bodySm.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          border: const Border(
            top: BorderSide(color: Color(0xFFF3F4F6)),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart, size: 20),
                      label: const Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                      label: const Text('Go to Cart'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
