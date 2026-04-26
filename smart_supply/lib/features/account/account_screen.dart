import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBUxqCbGTXWTxi3ghTbYD_AKDj9VsjlRl2bhMvf5yL9fuaPjMsWbOF4WjNoLS5reQhiT4oxRTLD3HVBez81OApntfFgXlYGW1MBTkSSErFLdzUgIW3W3D5yeHCNGbL07ivgcImUbLXO0WZQiKbe0QUmHRwDGX7N9LmxWF1VAF5VMKs9q-RxhJr8Pnld7wA7E8VMTF74a5jQRm5-aLOhhiO4EWJ1G3zpe-rA2PIT0dSnhTRapZWclyvLtTQ7n2yUSjPeF8G7ly1SEfY',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 40,
                  height: 40,
                  color: const Color(0xFFD4E3FF),
                  child: const Icon(Icons.person, color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Smart Supply Sourcing China',
                  style: TextStyle(
                    fontFamily: 'Work Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF004B8D),
                    letterSpacing: -0.2,
                  ),
                ),
                Text(
                  'Global Industrial Sourcing Ltd.',
                  style: AppTextStyles.bodySm.copyWith(
                    fontSize: 11,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: Color(0xFF004B8D)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileCard(),
                  const SizedBox(height: 20),
                  _buildMetricsSection(),
                  const SizedBox(height: 20),
                  _buildRecentTransactions(),
                  const SizedBox(height: 20),
                  _buildAccountInformation(),
                ],
              ),
            ),
          ),
          _buildBottomNav(context),
        ],
      ),
    );
  }

  // ── Profile Card ────────────────────────────────────────────────────────────

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC2C6D2).withOpacity(0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alex Morgan',
                style: TextStyle(
                  fontFamily: 'Work Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Senior Logistics Coordinator',
                style: AppTextStyles.bodySm.copyWith(
                  color: const Color(0xFF727782),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF004B8D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'PRO Account',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF004B8D),
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Metrics Section ─────────────────────────────────────────────────────────

  Widget _buildMetricsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Operational Overview',
          style: TextStyle(
            fontFamily: 'Work Sans',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF004B8D),
          ),
        ),
        const SizedBox(height: 12),
        // Row 1: Monthly Deliveries + Total Orders
        Row(
          children: [
            Expanded(child: _buildMetricCard(
              label: 'MONTHLY DELIVERIES',
              value: '124',
              badge: '+12%',
              badgeIcon: Icons.trending_up,
              badgeColor: const Color(0xFF059669),
              gradientColors: [const Color(0xFFECFDF5), const Color(0xFFF0FDF4)],
            )),
            const SizedBox(width: 12),
            Expanded(child: _buildMetricCard(
              label: 'TOTAL ORDERS',
              value: '842',
              badge: 'Steady',
              badgeIcon: Icons.horizontal_rule,
              badgeColor: const Color(0xFF9CA3AF),
              gradientColors: [const Color(0xFFF8FAFC), const Color(0xFFF1F5F9)],
            )),
          ],
        ),
        const SizedBox(height: 12),
        // Row 2: Avg Order Value (full width)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFFC2C6D2).withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AVG ORDER VALUE',
                    style: AppTextStyles.labelMd.copyWith(
                      color: const Color(0xFF727782),
                      fontSize: 10,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'KES 425,000',
                    style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1C1E),
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Text(
                '+5% this qtr',
                style: AppTextStyles.labelMd.copyWith(
                  color: const Color(0xFF004B8D),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Row 3: Pending + Invoices
        Row(
          children: [
            Expanded(child: _buildCounterCard(value: '12', label: 'PENDING')),
            const SizedBox(width: 12),
            Expanded(child: _buildCounterCard(value: '24', label: 'INVOICES')),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String label,
    required String value,
    required String badge,
    required IconData badgeIcon,
    required Color badgeColor,
    required List<Color> gradientColors,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0xFFC2C6D2).withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.labelMd.copyWith(
              color: const Color(0xFF727782),
              fontSize: 10,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Work Sans',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(width: 6),
              Row(
                children: [
                  Text(
                    badge,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: badgeColor,
                    ),
                  ),
                  Icon(badgeIcon, size: 12, color: badgeColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 28,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterCard({required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0xFFC2C6D2).withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1C1E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelMd.copyWith(
              color: const Color(0xFF727782),
              fontSize: 10,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  // ── Recent Transactions ─────────────────────────────────────────────────────

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF004B8D),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'View All',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF004B8D),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          iconBg: const Color(0xFFECFDF5),
          iconColor: const Color(0xFF059669),
          icon: Icons.payments_outlined,
          title: 'M-Pesa Business',
          ref: 'Ref: PK2910XJ • 2h ago',
          amount: 'KES 45,000',
          status: 'Successful',
          statusColor: const Color(0xFF059669),
        ),
        const SizedBox(height: 10),
        _buildTransactionItem(
          iconBg: const Color(0xFFEFF6FF),
          iconColor: const Color(0xFF004B8D),
          icon: Icons.account_balance_outlined,
          title: 'Equity Bank Transfer',
          ref: 'Ref: TR829011 • Yesterday',
          amount: 'KES 380,000',
          status: 'Successful',
          statusColor: const Color(0xFF059669),
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required Color iconBg,
    required Color iconColor,
    required IconData icon,
    required String title,
    required String ref,
    required String amount,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0xFFC2C6D2).withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1C1E),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  ref,
                  style: AppTextStyles.labelMd.copyWith(
                    color: const Color(0xFF727782),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: AppTextStyles.bodySm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1C1E),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                status,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Account Information ─────────────────────────────────────────────────────

  Widget _buildAccountInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Information',
          style: TextStyle(
            fontFamily: 'Work Sans',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF004B8D),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: const Color(0xFFC2C6D2).withOpacity(0.4)),
          ),
          child: Column(
            children: [
              _buildInfoRow(
                label: 'NAME',
                value: 'Alex Morgan',
                isFirst: true,
                isLast: false,
              ),
              _buildInfoRow(
                label: 'PHONE NUMBER',
                value: '+254 7XX XXX XXX',
                isFirst: false,
                isLast: false,
              ),
              _buildInfoRow(
                label: 'PASSWORD',
                value: '••••••••••••',
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required bool isFirst,
    required bool isLast,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(
                    color: Color(0xFFE2E2E5), width: 0.8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF727782),
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.bodyMd.copyWith(
                  color: const Color(0xFF1A1C1E),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined,
                color: Color(0xFF004B8D), size: 20),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // ── Bottom Nav ──────────────────────────────────────────────────────────────

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE2E2E5))),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF004B8D).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              _navItem(
                context: context,
                icon: Icons.home_outlined,
                label: 'HOME',
                active: false,
                onTap: () => Navigator.of(context)
                    .popUntil((route) => route.isFirst),
              ),
              _navItem(
                context: context,
                icon: Icons.list_alt_outlined,
                label: 'REQUESTS',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/requests-list'),
              ),
              _navItem(
                context: context,
                icon: Icons.grid_view_outlined,
                label: 'CATALOG',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/catalog'),
              ),
              _navItem(
                context: context,
                icon: Icons.local_shipping_outlined,
                label: 'ORDERS',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/shopping-cart'),
              ),
              _navItem(
                context: context,
                icon: Icons.person,
                label: 'ACCOUNT',
                active: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    final color =
        active ? const Color(0xFF004B8D) : const Color(0xFF9CA3AF);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: active
              ? const Color(0xFF004B8D).withOpacity(0.04)
              : Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Work Sans',
                  fontSize: 10,
                  fontWeight:
                      active ? FontWeight.w700 : FontWeight.w500,
                  color: color,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
