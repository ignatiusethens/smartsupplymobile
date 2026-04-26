import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  String _freightType = 'air';

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
          'Track Shipment',
          style: const TextStyle(
            fontFamily: 'Work Sans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.primary),
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
                  _buildKeyInfoCard(),
                  const SizedBox(height: 16),
                  _buildTimelineCard(),
                  const SizedBox(height: 16),
                  _buildBentoCards(),
                ],
              ),
            ),
          ),
          _buildBottomNav(context),
        ],
      ),
    );
  }

  // ── Key Info Card ───────────────────────────────────────────────────────────

  Widget _buildKeyInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFC2C6D2)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER ID',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'SS-82941-X',
                      style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              _buildFreightToggle(),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFFC2C6D2), height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WEIGHT',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '42.5 KG',
                      style: AppTextStyles.bodyLg.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VOLUME',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1.2 CBM',
                      style: AppTextStyles.bodyLg.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                        fontSize: 17,
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

  Widget _buildFreightToggle() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8EA),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _freightTab('Air Freight', 'air'),
          _freightTab('Sea Freight', 'sea'),
        ],
      ),
    );
  }

  Widget _freightTab(String label, String value) {
    final bool active = _freightType == value;
    return GestureDetector(
      onTap: () => setState(() => _freightType = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  // ── Timeline Card ───────────────────────────────────────────────────────────

  Widget _buildTimelineCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipment Progress',
            style: AppTextStyles.labelMd.copyWith(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFC2C6D2), height: 1),
          const SizedBox(height: 20),
          _buildTimeline(),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    final stages = [
      _TrackingStage(
        icon: Icons.factory,
        title: 'Supplier',
        status: 'COMPLETED',
        subtitle: 'Guangzhou Logistics Hub',
        state: _StageState.completed,
      ),
      _TrackingStage(
        icon: Icons.inventory_2,
        title: 'Repackaging',
        status: 'COMPLETED',
        subtitle: 'Export quality inspection passed',
        state: _StageState.completed,
      ),
      _TrackingStage(
        icon: Icons.flight,
        title: 'In Transit',
        status: 'CURRENT STAGE',
        subtitle: 'En route to Nairobi Jomo Kenyatta International Airport',
        state: _StageState.active,
      ),
      _TrackingStage(
        icon: Icons.account_balance,
        title: 'Custom Clearance',
        status: 'PENDING',
        subtitle: null,
        state: _StageState.pending,
      ),
      _TrackingStage(
        icon: Icons.warehouse,
        title: 'Nairobi Warehouse',
        status: 'PENDING',
        subtitle: null,
        state: _StageState.pending,
      ),
      _TrackingStage(
        icon: Icons.local_shipping,
        title: 'Final Delivery',
        status: 'PENDING',
        subtitle: null,
        state: _StageState.pending,
      ),
    ];

    return Stack(
      children: [
        // Background line
        Positioned(
          left: 23,
          top: 0,
          bottom: 0,
          child: Container(width: 2, color: const Color(0xFFE2E2E5)),
        ),
        // Active line (covers first 2 completed + partial 3rd ≈ 40%)
        Positioned(
          left: 23,
          top: 0,
          child: FractionallySizedBox(
            heightFactor: 0.40,
            child: Container(width: 2, color: const Color(0xFF004B8D)),
          ),
        ),
        Column(
          children: List.generate(stages.length, (i) {
            final stage = stages[i];
            return Padding(
              padding: EdgeInsets.only(bottom: i < stages.length - 1 ? 32 : 0),
              child: _buildStageRow(stage),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStageRow(_TrackingStage stage) {
    final bool isPending = stage.state == _StageState.pending;
    final bool isActive = stage.state == _StageState.active;
    final bool isCompleted = stage.state == _StageState.completed;

    Color iconBg;
    Color iconColor;
    if (isCompleted) {
      iconBg = AppColors.primary;
      iconColor = Colors.white;
    } else if (isActive) {
      iconBg = const Color(0xFF004B8D).withOpacity(0.15);
      iconColor = const Color(0xFF004B8D);
    } else {
      iconBg = const Color(0xFFE2E2E5);
      iconColor = AppColors.onSurfaceVariant;
    }

    return Opacity(
      opacity: isPending ? 0.4 : 1.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon circle
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(
                      color: const Color(0xFFD4E3FF).withOpacity(0.6),
                      width: 6,
                    )
                  : Border.all(color: Colors.white, width: 3),
            ),
            child: Icon(stage.icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          // Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stage.title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isActive
                          ? AppColors.primary
                          : AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    stage.status,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isCompleted
                          ? AppColors.primary
                          : isActive
                              ? const Color(0xFF004B8D).withOpacity(0.7)
                              : AppColors.onSurfaceVariant,
                    ),
                  ),
                  if (stage.subtitle != null) ...[
                    const SizedBox(height: 4),
                    if (isActive)
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F6),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.primary.withOpacity(0.1)),
                        ),
                        child: Text(
                          stage.subtitle!,
                          style: AppTextStyles.bodySm.copyWith(
                            color: AppColors.onSurface,
                            fontSize: 13,
                          ),
                        ),
                      )
                    else
                      Text(
                        stage.subtitle!,
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bento Cards ─────────────────────────────────────────────────────────────

  Widget _buildBentoCards() {
    return Column(
      children: [
        // Verified Sourcing
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF8BD2FE).withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: const Color(0xFF8BD2FE).withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.verified, color: Color(0xFF01658C), size: 24),
              const SizedBox(height: 8),
              Text(
                'Verified Sourcing',
                style: AppTextStyles.labelMd.copyWith(
                  color: const Color(0xFF01658C),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Supplier documentation audited and cleared for export.',
                style: AppTextStyles.bodySm.copyWith(
                  color: const Color(0xFF005A7E),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Global Tracking
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD4E3FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFA6C8FF)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAwo983i7dQlR0r0-aLACcfNRy1BqaYrebtJxiu03ZfW-N_WkfGbfEOVYyQWiLwMnxEVdTh6-jWYzTYLRW5SARbfF3jK9CrYayVSXX7WMT4FxuFOsbFMYBMOeV15hShZXTSB7nC__tkS7l_TZOoO1P4DK3PJ9HvR5X2IGLAQuQKkHbJ_8GYX2-cool1ZFUBCJsAv7IOpBgoFLs-xdD0wFpbU47VahrqypuaSC6JbnvkqkR4PIiMoqgSw9NA5Ue1sKdKKO7obWyu-TA',
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 88,
                    height: 88,
                    color: const Color(0xFFA6C8FF),
                    child: const Icon(Icons.warehouse,
                        color: AppColors.primary, size: 36),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Global Tracking',
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Real-time satellite updates and priority customs processing active for this shipment ID.',
                      style: AppTextStyles.bodySm.copyWith(
                        color: const Color(0xFF004786),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
              _navItem(
                icon: Icons.home_outlined,
                label: 'HOME',
                active: false,
                onTap: () => Navigator.of(context)
                    .popUntil((route) => route.isFirst),
              ),
              _navItem(
                icon: Icons.list_alt_outlined,
                label: 'REQUESTS',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/requests-list'),
              ),
              _navItem(
                icon: Icons.grid_view_outlined,
                label: 'CATALOG',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/catalog'),
              ),
              _navItem(
                icon: Icons.local_shipping,
                label: 'ORDERS',
                active: true,
                onTap: () {},
              ),
              _navItem(
                icon: Icons.person_outline,
                label: 'ACCOUNT',
                active: false,
                onTap: () => Navigator.pushNamed(context, '/account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    final color =
        active ? AppColors.primary : const Color(0xFF9CA3AF);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: active
            ? BoxDecoration(
                color: const Color(0xFFF3F3F6),
                borderRadius: BorderRadius.circular(4),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: color,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data Models ───────────────────────────────────────────────────────────────

enum _StageState { completed, active, pending }

class _TrackingStage {
  final IconData icon;
  final String title;
  final String status;
  final String? subtitle;
  final _StageState state;

  const _TrackingStage({
    required this.icon,
    required this.title,
    required this.status,
    required this.subtitle,
    required this.state,
  });
}
