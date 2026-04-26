import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'product_details_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'All Equipment';

  final List<String> _categories = [
    'All Equipment',
    'Generators',
    'Pumps',
    'Solar Panels',
    'Drills',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': '5kVA Diesel Silent Generator',
      'series': 'PowerMax Pro Series',
      'price': 'KES 145,000',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuC6zRLXG3XRnPjJwdBTmgOwjq-vjOeJBdWqznKYnJT1y79vlDb9sHnOOQIQ2Mo9etGNSitsc1VzpXynzfWqWL8qXcJXkVLNCaXBGJQuNz_5Mzh44uTj44bTidtrogOqH7p9PeNdl0Y-jcq2_btVNV-di-k0XPJT2WqsXolDp2oQ7D4PtyQWc_WwgV_GApOLQxm3HEQ8QWsiCZP00zKSwQh-OQwPwYH2sQ16HfbJnnsZv1rAGs2TJYenEcv2lnwMx-L1cxyQmm8Ctzo',
      'status': 'IN STOCK',
      'statusColor': Colors.green,
    },
    {
      'name': 'High-Flow Centrifugal Pump',
      'series': 'HydroFlow 300 Series',
      'price': 'KES 32,500',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuC9OiPaopLhkwK6ZZRcUKSI1BRTcICctfS0oz7W7yTdLHTiGgy3XZO6zADEh4YcO5EvPEOYPoShzRuC9e-Xzur_0nNdcIs269bGs449q4ZiLRXwE26mxE1bv6nCFZV25ylvSqSJya5JdHaI7rxqDXU-IO2zllPo4W8YttuZkQhsAfLuJ06_n868xAiOdkMyWm4oPRszcu3xuB_UNLYPeZXH1oDKaiShJumhvsrkW0cHLk29zq4-p1Im5Ep2NXRJbZYL0DK-5v2ZXxQ',
      'status': 'LOW STOCK',
      'statusColor': Colors.orange,
    },
    {
      'name': '450W Monocrystalline Panel',
      'series': 'SunVantage Solar',
      'price': 'KES 18,900',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuD1jSjzm6f7_njibS-FzcPM5UqQApZQqk3ipUvi0A2-PM1ENmDamLtzu0xv2QfZZUuWZ0vvgD45vFpnVyZTLvHQbG3PGTUzQ7HLFN8MjFaKUmKJjbqKnKFPKor7DpvEVT8YPGlxnIlS-m_kUCnBpTthGb5WeVhy9me_4GL9Rcj0pI1fF8uGoIWQH2XmLZKC1D3sEOpqLuZAP2yBr1SXriU5W3efU5ied2wVrvVPEBjmDkjfb9jhoQk5xFGND9aLAabBvWalNXwd70',
      'status': 'IN STOCK',
      'statusColor': Colors.green,
    },
    {
      'name': 'Heavy-Duty Impact Drill Kit',
      'series': 'DeWalt XR Series',
      'price': 'KES 24,000',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCLP8DuzdnGp_8DNx9GXdLE85H_an3Van-_g9IUNu544OIzYqKEFdH9cMqJ3rq4926xx7on8CGNgx48qDYEDnwEGGT-ZnrWSG5sli4elk6F0bhvNLp07s4QJSqimGyR13kILeN_BQ9i4WFTZHYEYS3x29gP1WBpkhmVgHYWbRQp9MkHp1HjeOAoeLn2osXv_Dz4LPLKW4YT4Pgk2jM5tI9rZqqhlsp0B15CwN73Mx920QDaWNA3q9aA-DTkI_EKBFBKzJvH53YVKCI',
      'status': 'IN STOCK',
      'statusColor': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: () {},
        ),
        title: Text(
          'Product Catalog',
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
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryTabs(),
          Expanded(
            child: _buildProductGrid(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.search,
                color: AppColors.outline,
                size: 20,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search industrial equipment...',
                  hintStyle: TextStyle(
                    color: AppColors.outline.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.filter_list,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, bottom: 16, top: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories.map((category) {
            final isSelected = category == _selectedCategory;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => setState(() => _selectedCategory = category),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.outlineVariant,
                    ),
                  ),
                  child: Text(
                    category,
                    style: AppTextStyles.labelMd.copyWith(
                      color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_products[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with status badge
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        product['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.image, size: 48, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: product['statusColor'] == Colors.green
                          ? const Color(0x1A16a34a)
                          : const Color(0x1Af59e0b),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product['status'],
                      style: AppTextStyles.labelSm.copyWith(
                        color: product['statusColor'],
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 1.3,
                        color: AppColors.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['series'],
                      style: AppTextStyles.bodySm.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            'M-PESA',
                            style: AppTextStyles.labelSm.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 9,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Accepted',
                          style: AppTextStyles.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['price'],
                      style: AppTextStyles.headlineSm.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: Border(
          top: BorderSide(color: Colors.grey.shade100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', false, '/home'),
              _buildNavItem(Icons.description, 'Requests', false, '/requests-list'),
              _buildNavItem(Icons.grid_view, 'Catalog', true, '/catalog'),
              _buildNavItem(Icons.local_shipping, 'Orders', false, '/shopping-cart'),
              _buildNavItem(Icons.person, 'Account', false, '/home'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, String route) {
    return InkWell(
      onTap: () {
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primary : Colors.grey.shade400,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? AppColors.primary : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
