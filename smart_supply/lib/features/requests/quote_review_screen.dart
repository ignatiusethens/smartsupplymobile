import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class QuoteReviewScreen extends StatefulWidget {
  final Map<String, dynamic> request;

  const QuoteReviewScreen({
    super.key,
    required this.request,
  });

  @override
  State<QuoteReviewScreen> createState() => _QuoteReviewScreenState();
}

class _QuoteReviewScreenState extends State<QuoteReviewScreen> {
  int _currentImageIndex = 0;

  final List<String> _productImages = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDf28sjoJJg9kbUiZDdNc5-2wimm4VdlPuc-vOXuB5nix4rQMPEKDhS-_PvsVC7epBs5n0_GF9PGVvy7jpjI5U21OdwO9sWdPS8reFKnbaMSBFf59U0mgWuCbLxGQynzpS6Q95oXO3mzJ_NbQX5czueAgGvTsXf9o96VxijUlt7_st61Zmqh_f6ZrMliC-zBUPZ1FjFOaLCqSmwksZLoB8kAXH5ZbmExscqjv3dq6b0s8DYFKnwfpGqZAOigRVwJAZy76Q9vr7lR0_M',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCz4QYJ5XkHTCKmOxXE6tvnYQMqoZeF7Lsq5CRnUVVtzFOGN3o_XpIx6azkscj7jDHgpEkJIxIaSDyjvHpBWs-Hq9cwKON952aBp7RZGSk-eL6-RebfdZD31mDsm6oQz9sh6LZOh3ENgihxRYFIEXsBaP2sbQnz_32vQ9qPvfrTao2wcn63TK7PBbuyxP9n9ps8JWOd7HC1QUCuHImLPq4TjZ3pBk7XANAKBnBpHhCxQR96Ok1FhNkPwTP22EmmZuB45OTZ0poB5Ic',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuASCMrNLa5tpzNI-ZNY6FA1Y-KuuUTmOUt1oAo1y3j9xrA9WSDg0qjit3c7M3-oZ72t4YDMhPGXjVa7uFyuXAsP2Dc2BhjOBRIsI_lljcU6mUE5mcEdB3NmguGvk-lCxyggq4gv0D_uYhth94MkQ7hgqe9z6uL3qalozlF0SGETbNYO48OHQgCkmMkcfiFeyM1ckvRAfou1zy64z-mdzdxZJwXGU2M0yfgwVzFPqBkvieeP0vNcrnxqyy5EksRkhqHIsqjVgC-dI7U',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Quote Review',
          style: AppTextStyles.headlineSm.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildQuoteHeader(),
                  const SizedBox(height: 16),
                  _buildProductCard(),
                  const SizedBox(height: 16),
                  _buildSpecificationsCard(),
                  const SizedBox(height: 16),
                  _buildPricingCard(),
                  const SizedBox(height: 16),
                  _buildLogisticsCard(),
                ],
              ),
            ),
          ),
          _buildBottomActionBar(),
        ],
      ),
    );
  }

  Widget _buildQuoteHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QUOTE REFERENCE',
              style: AppTextStyles.labelMd.copyWith(
                color: const Color(0xFF6B7280),
                fontSize: 10,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '#QT-4421',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x1A16a34a),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'ACTIVE',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16a34a),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ISSUED DATE',
              style: AppTextStyles.labelMd.copyWith(
                color: const Color(0xFF6B7280),
                fontSize: 10,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Oct 20, 2023',
              style: AppTextStyles.bodySm.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Title and Details
          Text(
            'High-Grade Industrial Carbon Steel Sheets',
            style: AppTextStyles.headlineLg.copyWith(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER QUANTITY',
                      style: AppTextStyles.labelMd.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '500 ',
                            style: AppTextStyles.headlineLg.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: 'Units',
                            style: AppTextStyles.bodySm.copyWith(
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 32,
                color: const Color(0xFFF3F4F6),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SUPPLIER',
                      style: AppTextStyles.labelMd.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Industrial Steel Ltd.',
                      style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Image Gallery
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: _productImages.length,
                  onPageChanged: (index) {
                    setState(() => _currentImageIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          _productImages[index],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Center(
                            child: Icon(Icons.image, size: 48),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _productImages.length,
                    (index) => Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${_productImages.length} IMAGES',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Verified Badge
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.verified,
                  color: AppColors.primary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'VERIFIED PREMIUM INDUSTRIAL SUPPLIER',
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRODUCT SPECIFICATIONS',
            style: AppTextStyles.bodySm.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.primary,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 1,
            color: const Color(0xFFF3F4F6),
          ),
          const SizedBox(height: 12),
          Text(
            'ASTM A36 cold-rolled carbon steel sheets. Designed for heavy industrial fabrication with superior weldability and high tensile strength. Surface treated for corrosion resistance.',
            style: AppTextStyles.bodySm.copyWith(
              color: AppColors.onSurface,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F3F8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PRICING BREAKDOWN',
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.primary,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  'All prices in KES',
                  style: AppTextStyles.labelSm.copyWith(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildPriceRow('Unit Price (500 units)', '1,250.00'),
                const SizedBox(height: 12),
                _buildPriceRow('Subtotal', '625,000.00'),
                const SizedBox(height: 12),
                _buildPriceRow('Shipping & Logistics', '15,400.00'),
                const SizedBox(height: 12),
                _buildPriceRow('Sourcing Fee', '2,500.00'),
                const SizedBox(height: 12),
                _buildPriceRow('Consolidation Fee', '1,500.00'),
                const SizedBox(height: 16),
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xFFF3F4F6),
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Quote Value',
                      style: AppTextStyles.headlineSm.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      'KES 644,400.00',
                      style: AppTextStyles.headlineSm.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySm.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodySm.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  Widget _buildLogisticsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F3F8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fact_check,
                  color: AppColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'LOGISTICS & TERMS',
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.primary,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Weight and Volume
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildLogisticsItem(
                          'SHIPMENT WEIGHT',
                          Icons.scale,
                          '2,500 kg',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.primary.withOpacity(0.1),
                      ),
                      Expanded(
                        child: _buildLogisticsItem(
                          'SHIPMENT VOLUME',
                          Icons.inventory_2,
                          '4.2 CBM',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLogisticsItem(
                        'PROCESSING TIME',
                        Icons.precision_manufacturing,
                        '3-5 Business Days',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildLogisticsItem(
                        'SHIPPING METHOD',
                        Icons.directions_boat,
                        'Sea Freight (LCL)',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  color: const Color(0xFFF9FAFB),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildLogisticsItem(
                        'ESTIMATED DELIVERY',
                        Icons.event_available,
                        'Oct 24 - Nov 5',
                        isPrimary: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildLogisticsItem(
                        'PAYMENT METHOD',
                        Icons.account_balance_wallet,
                        'M-Pesa Business',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogisticsItem(
    String label,
    IconData icon,
    String value, {
    bool isPrimary = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMd.copyWith(
            color: const Color(0xFF6B7280),
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 14,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                value,
                style: AppTextStyles.bodySm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? AppColors.primary : AppColors.onSurface,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomActionBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 24,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              icon: const Icon(Icons.check_circle, size: 20),
              label: const Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
