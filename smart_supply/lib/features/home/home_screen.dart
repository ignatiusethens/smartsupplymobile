import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        title: Text(
          'Smart Supply',
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
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primaryContainer,
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAJNKXazquC3AhlXeSYfOOUoZtNlePzzkcsN7gZyqSzySkgU8yAz60WObcuvwFtqtm4aUP2nkbdeA00poVak-ErTu-GDsPnz7DpAbc5oBkJ1qqEe7ACbsk187HxTsLmgGp7V9GOWE90UbfENYEpewfsjZ290wyNdDjEi0CZDeyhg458nM-utUkUNe6KeUbfkFkQRuYwc6xTr1ZOoftYzW5jCF1-4x3NmgKNIDSYPgmbqE_EszQN9Vhrapvb7WxjUopB7flfAbZTNP8',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.person),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            _buildGreetingSection(),
            const SizedBox(height: 24),

            // Primary Action Card
            _buildPrimaryActionCard(context),
            const SizedBox(height: 24),

            // Notification Alert
            _buildNotificationAlert(),
            const SizedBox(height: 24),

            // Featured Catalog
            _buildFeaturedCatalog(),
            const SizedBox(height: 24),

            // Recent Activity
            _buildRecentActivity(),
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildGreetingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WELCOME BACK,',
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.onSecondaryContainer,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Alex',
          style: AppTextStyles.headlineLg.copyWith(
            color: AppColors.onBackground,
            fontSize: 32,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryActionCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decorations
          Positioned(
            right: -32,
            bottom: -32,
            child: Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.precision_manufacturing,
              size: 80,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Streamline Your Supply Chain',
                  style: AppTextStyles.headlineMd.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Connect with verified industrial manufacturers across East Africa instantly.',
                  style: AppTextStyles.bodySm.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new-request');
                  },
                  icon: const Icon(Icons.add_box),
                  label: const Text('Start Sourcing'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

  Widget _buildNotificationAlert() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryFixedDim.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.request_quote,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Quote Received!',
                      style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      '2m ago',
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.secondary,
                    ),
                    children: [
                      const TextSpan(text: 'A new proposal for '),
                      TextSpan(
                        text: 'Industrial Grade Steel Valves',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const TextSpan(text: ' is ready for review.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View Quote'),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Go to Requests',
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
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

  Widget _buildFeaturedCatalog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Catalog',
              style: AppTextStyles.headlineSm.copyWith(
                color: AppColors.onBackground,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: AppTextStyles.bodySm.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProductCard(
                'Hydraulic Press X2',
                'PR-9023',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDnMR7UUjOF37k-Ck4luhmlq6W7E-rAtsi_Llm1rsx8K2PftmJIXRmsS0C6WzeLnqbP4pgSfFKaPFFeXII2b1PCwqZYPzXxPrmvW_cyg3NjSUeTrbjpt43KVS28lSt5SH0Vn0AiwSghjZUASEAhVX1uW3frzN1U94B6Ax0wT-YnY7ehF2JhnIJhbwHRLzajc_3kxjQYnTABQRBqy8n6gaC2OmjLickUiWtCILPxIy9ZAsyqOGeqBRU0dXZT7nsoJubn3RHOZrn0rtU',
              ),
              _buildProductCard(
                'Safety Pro Helmet',
                'SF-1102',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBK42Kmo8MEd5PNHC8aW6rVkmUDYViARDG7zGjX0HFgEIl4yFVljFV_9u3hcfaumDeyspWCgOZgy9s-mQJ9r5vnuT2WByCJw90SnzlNgWo1tMs-udQ3II7nR5SKFyrRch6HBKtnB57IDkFpl7Pf_90dh2ERCuj8x7piZ3PeQuc6hh90-bdjJ7datVqanrVxMwPfHHfvVkjlbxg-kjzIVglW3YPr4icm55A0kMqYGXZ6Ciig_qVcNSZcereiRnpOtAn9XbpAhYG3zvg',
              ),
              _buildProductCard(
                'Steel Pipeline Kit',
                'MT-4451',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuA2EsD3AL5xhdNkOgKW8082MaGZlx6dUrgxQx3kcc-d4pD27o1c41884vUhxXP0zOlADPOcXGAsHs-QKP_3jGSCeU7iZIsWwxYim_5ERFV2mgo5pE3y988Z-gWcBTolknjSjcf1PFp9ei_l6-FZlQoQEciBSrtJ3u9D5bHehXH-ziKByHXrvyFF_17rI9HpQwLJGXDSACGUZtSf0x09TQ7Yi1Cttyr0NhqwOaRcQsDozLdRUDywTJCbYSN2eDblckL7mHSftmKKjG0',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, String id, String imageUrl) {
    return Container(
      width: 176,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 140,
              color: AppColors.surfaceContainerLow,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.image, size: 48),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: $id',
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.onSecondaryContainer,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: AppTextStyles.headlineSm.copyWith(
            color: AppColors.onBackground,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildActivityItem(
                Icons.local_shipping,
                Colors.green,
                'Order Shipped',
                'PO-8829 for Copper Wiring',
                '1h ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                Icons.timer,
                Colors.amber,
                'Quote Expiring',
                'Industrial Generator Quote #2',
                '4h ago',
              ),
              const Divider(height: 1),
              _buildActivityItem(
                Icons.receipt_long,
                AppColors.primary,
                'Payment Verified',
                'Invoice #INV-229-B',
                'Yesterday',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    IconData icon,
    Color iconColor,
    String title,
    String subtitle,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: AppTextStyles.labelSm.copyWith(
              color: AppColors.onSecondaryContainer,
              fontFamily: 'monospace',
            ),
          ),
        ],
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
              _buildNavItem(Icons.home, 'Home', true, '/home'),
              _buildNavItem(Icons.description, 'Requests', false, '/requests-list'),
              _buildNavItem(Icons.grid_view, 'Catalog', false, '/catalog'),
              _buildNavItem(Icons.local_shipping, 'Orders', false, '/shopping-cart'),
              _buildNavItem(Icons.person, 'Account', false, '/account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, String route) {
    return Builder(
      builder: (context) => InkWell(
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
      ),
    );
  }
}
