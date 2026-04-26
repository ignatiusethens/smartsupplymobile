import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Centrifugal Water Pump',
      'sku': 'IND-29401',
      'price': 45000,
      'quantity': 2,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuByrDpG_GKiZ4aL8lMse6uneoKTWwOp-1NUY1bl5nsGCHv7AUiOO3DN80eHzzFj9rkByZexg1IcJagXhEmyL-gN4ntdoXmxRS_UdCmud6QeMyL4zwONF7RqfAGTXR09SrdHwlD3eikbSuRFgexXU-qu2KKHl_3p4pTWcbPz8lp6jUadqvmL-d-KtvBCDOZQsmZDLwaMgrCjRcMyyAQqOP1IzUkEP0_ibjpyTie7JohYcVJ_6btnaiy3oKNlzCqg24u1UzgTF_WuSwk',
    },
    {
      'name': 'Galvanized Steel Pipe',
      'sku': 'STL-4421',
      'price': 12800,
      'quantity': 10,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDPGp2RZB4R39_wMAzRrkROWe7FOA2rsvS64eIrj6A9ueeLy5l2gr3mbbKide5gmrZTJhs00hWq_CZYeL2svCfYJDNItauqN1nIzrV6ix6WwAPada0BWP2rzE35NfFzL_-g5u8QFM82Ed4sE2pc5ApfCZLaFnxKuNGqgsWWxgApMRsJTPo95VG_71IiUGoWwcW9Z-sczmsDXrLGDtjRp9_AoErok54qbcmxkHqxCk6cqs2pVFZXlpTahhJsUIRhXDac3QpuFNYsfKc',
    },
    {
      'name': 'Phase Circuit Breaker',
      'sku': 'ELEC-0091',
      'price': 5200,
      'quantity': 5,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDl2RqxqtRcdDLdfgWXoPqEcqnqJuQW_ju-zeNcYrcv-vnCl_qFl4D4JHlcNvkJ4m2ba8PJNR8By6aREzS9tQxrshLJMAvvAYhG6E3WHDBDdR4TxHI7RteiGBA0b3dV14RtBHCJAFLn9DL98pWH3Ynn1kmdnnnQugXoPA_x1Nfwl8jS99YKKcq-mk04RtQ_DEZp97mTktjmfFjAb5DYkx_iuZDnpkuNZVzl_W_KJkz27N_3cjuDwoxFMd9U6M-J69biqYUJsonNQAA',
    },
  ];

  double get _subtotal {
    return _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double get _sourcingFee => _subtotal * 0.02;

  double get _total => _subtotal + _sourcingFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: () {},
        ),
        title: Text(
          'Shopping Cart',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildCartItems(),
              const SizedBox(height: 16),
              _buildDeliveryNotice(),
              const SizedBox(height: 24),
              _buildInlineSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shopping Cart',
          style: AppTextStyles.headlineLg.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.onBackground,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${_cartItems.length} ITEMS',
            style: AppTextStyles.labelMd.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItems() {
    return Column(
      children: _cartItems.map((item) => _buildCartItem(item)).toList(),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.image, size: 32),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: AppTextStyles.headlineSm.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'SKU: ${item['sku']}',
                  style: AppTextStyles.bodySm.copyWith(
                    color: const Color(0xFF44474E),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'KES ${_formatPrice(item['price'])}',
                      style: AppTextStyles.headlineSm.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    _buildQuantityControl(item),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (item['quantity'] > 1) {
                setState(() => item['quantity']--);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: const Center(
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 32,
            child: Center(
              child: Text(
                '${item['quantity']}',
                style: AppTextStyles.bodySm.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() => item['quantity']++);
            },
            child: Container(
              width: 32,
              height: 32,
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryNotice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFADC6FF)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.local_shipping_outlined,
            color: AppColors.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySm.copyWith(
                  color: AppColors.onSecondaryContainer,
                ),
                children: [
                  const TextSpan(text: 'Bulk order qualifies for '),
                  TextSpan(
                    text: 'Free Delivery',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ' to Nairobi Metropolitan area.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInlineSummary() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', _formatPrice(_subtotal)),
          const SizedBox(height: 4),
          _buildSummaryRow('Sourcing Fee (2%)', _formatPrice(_sourcingFee)),
          const SizedBox(height: 8),
          Container(height: 1, color: const Color(0xFFF3F4F6)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: AppTextStyles.headlineLg.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                ),
              ),
              Text(
                'KES ${_formatPrice(_total)}',
                style: AppTextStyles.headlineLg.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: AppColors.primary.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Proceed to Checkout',
                    style: AppTextStyles.bodySm.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySm.copyWith(
            color: const Color(0xFF44474E),
          ),
        ),
        Text(
          'KES $value',
          style: AppTextStyles.bodySm.copyWith(
            color: const Color(0xFF44474E),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: Color(0xFFF3F4F6)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', false, '/home'),
              _buildNavItem(Icons.list_alt, 'Request', false, '/requests-list'),
              _buildNavItem(Icons.grid_view, 'Catalog', false, '/catalog'),
              _buildNavItem(Icons.local_shipping, 'Orders', true, '/shopping-cart'),
              _buildNavItem(Icons.person, 'Account', false, '/home'),
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
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
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    return price.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
