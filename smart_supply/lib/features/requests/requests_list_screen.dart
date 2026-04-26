import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'quote_review_screen.dart';

class RequestsListScreen extends StatefulWidget {
  const RequestsListScreen({super.key});

  @override
  State<RequestsListScreen> createState() => _RequestsListScreenState();
}

class _RequestsListScreenState extends State<RequestsListScreen> {
  String _selectedFilter = 'All';

  final List<String> _filters = [
    'All',
    'In Review',
    'Quotes Received',
    'Completed',
  ];

  final List<Map<String, dynamic>> _requests = [
    {
      'id': '#SR-99210',
      'title': 'Industrial Centrifugal Pump',
      'description': 'High-pressure system for chemical processing plant with corrosion resistance.',
      'quantity': '12 Units',
      'quantityLabel': 'Quantity',
      'date': 'Oct 24, 2023',
      'status': 'Quotes Received',
      'statusColor': const Color(0xFFF59E0B),
      'statusBgColor': const Color(0xFFFEF3C7),
      'statusBorderColor': const Color(0xFFFDE68A),
      'hasQuote': true,
    },
    {
      'id': '#SR-99215',
      'title': 'Heavy Duty Diesel Generator',
      'description': '500kVA Standby Power Unit with acoustic enclosure.',
      'quantity': '02 Units',
      'quantityLabel': 'Quantity',
      'date': 'Oct 26, 2023',
      'status': 'In Review',
      'statusColor': AppColors.primary,
      'statusBgColor': const Color(0xFFDEEBF7),
      'statusBorderColor': const Color(0xFFBBDEFB),
      'hasQuote': false,
    },
    {
      'id': '#SR-99222',
      'title': 'Grade 80 Lifting Chains',
      'description': '10mm diameter, 6-meter length with safety hooks.',
      'quantity': '50 Meters',
      'quantityLabel': 'Length',
      'date': 'Oct 27, 2023',
      'status': 'In Review',
      'statusColor': AppColors.primary,
      'statusBgColor': const Color(0xFFDEEBF7),
      'statusBorderColor': const Color(0xFFBBDEFB),
      'hasQuote': false,
    },
    {
      'id': '#SR-99201',
      'title': 'Stainless Steel Valves (Gate)',
      'description': 'ANSI 150 Flanged, 4-inch diameter.',
      'quantity': '120 Units',
      'quantityLabel': 'Quantity',
      'date': 'Oct 20, 2023',
      'status': 'Quotes Received',
      'statusColor': const Color(0xFFF59E0B),
      'statusBgColor': const Color(0xFFFEF3C7),
      'statusBorderColor': const Color(0xFFFDE68A),
      'hasQuote': true,
    },
  ];

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
          'Requests and Quotes',
          style: AppTextStyles.headlineSm.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFCBD5E1),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBn_OEBoFydRzLPoDjYHAt-E_8w9DtrZUMcxf1wlj2vuEqdI3YqLWCP9DaU2UpPg4ZJAcTiRjr5cKKb0w4YvEeUvs0Ffi8jNUzRnyK51XhmECxGFaVbaiWn1T-B5YAMjbNabRQ2hyvSUmiihUixtos52o3p3mtdHDDqKNWjOrU2tjQBP9-Kfz74gZsw1xX6xuFVfHc7AFKojx4kXZV80DjFKR6CM8ibjvlfMd7988uPF8yS-TnAeon2ttOZQ8cY-tC-uX-PCewbsqE',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndFilters(),
          Expanded(
            child: _buildRequestsList(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchAndFilters() {
    return Container(
      color: const Color(0xFFF9F9FC),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Search Bar
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
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
                      hintText: 'Search ID, product, or supplier...',
                      hintStyle: TextStyle(
                        color: AppColors.outline.withOpacity(0.6),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _filters.map((filter) {
                final isSelected = filter == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedFilter = filter),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFFE5E7EB),
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        filter,
                        style: AppTextStyles.labelMd.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.onSurfaceVariant,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestsList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: _requests.length,
      itemBuilder: (context, index) {
        return _buildRequestCard(_requests[index]);
      },
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: ID and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    request['id'],
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.outline,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: request['statusBgColor'],
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: request['statusBorderColor']),
                  ),
                  child: Text(
                    request['status'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: request['statusColor'],
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              request['title'],
              style: AppTextStyles.bodySm.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.onSurface,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            // Description
            Text(
              request['description'],
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
                fontSize: 12,
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Details Grid
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFF9FAFB)),
                  bottom: BorderSide(color: Color(0xFFF9FAFB)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request['quantityLabel'].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.outline,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          request['quantity'],
                          style: AppTextStyles.bodySm.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'REQUESTED ON',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.outline,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          request['date'],
                          style: AppTextStyles.bodySm.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // View Quote Button (only for quotes received)
            if (request['hasQuote']) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuoteReviewScreen(request: request),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Quote',
                        style: AppTextStyles.bodySm.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
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
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
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
              _buildNavItem(Icons.home_outlined, 'Home', false, '/home'),
              _buildNavItem(Icons.request_quote, 'Requests', true, '/requests-list'),
              _buildNavItem(Icons.grid_view, 'Catalog', false, '/catalog'),
              _buildNavItem(Icons.local_shipping_outlined, 'Orders', false, '/shopping-cart'),
              _buildNavItem(Icons.person_outline, 'Account', false, '/account'),
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
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
