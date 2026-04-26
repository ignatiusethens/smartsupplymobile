import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CheckoutReviewScreen extends StatefulWidget {
  const CheckoutReviewScreen({super.key});

  @override
  State<CheckoutReviewScreen> createState() => _CheckoutReviewScreenState();
}

class _CheckoutReviewScreenState extends State<CheckoutReviewScreen> {
  String _selectedPaymentMethod = 'bank';
  bool _agreedToTerms = true;

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
          'Checkout',
          style: AppTextStyles.headlineSm.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFC2C7CF),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDyD9g07LLiczsOdRSrJ95gdgAQ8RIzHY5_Pzmm3NaVXunb2pXSbkyQ6dJiA_U_poLEQWZt4_OwCae2GJPua4WhRXnPqMA0nFVAX-Wk0ZnT0TXNvAYaT6TbGm7lGkjBM8ULuMRYvb6BpPTqIPsL5BxbYGQhxZDuzlWl60UeFWZd-F7GL0pHOJwnCW_dQcaBXu74g3R_lxclzEqD621AFspjLtKE5dY0eWqX0Muh2rsxqvtD0DndyG_-ebmOkXkjEiuc5-1_MIxwruk',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 448),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _buildProgressIndicator(),
                  const SizedBox(height: 24),
                  _buildOrderSummarySection(),
                  const SizedBox(height: 16),
                  _buildCostBreakdownSection(),
                  const SizedBox(height: 16),
                  _buildShippingSection(),
                  const SizedBox(height: 16),
                  _buildPaymentDetailsSection(),
                  const SizedBox(height: 16),
                  _buildTermsCheckbox(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  // ── Progress Indicator ──────────────────────────────────────────────────────

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        _buildStep('1', 'Shipping', true),
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.primary,
            margin: const EdgeInsets.only(bottom: 24),
          ),
        ),
        _buildStep('2', 'Payment', true),
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.primary,
            margin: const EdgeInsets.only(bottom: 24),
          ),
        ),
        _buildStep('3', 'Review', true, isActive: true),
      ],
    );
  }

  Widget _buildStep(String number, String label, bool filled,
      {bool isActive = false}) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: filled ? AppColors.primary : AppColors.surfaceContainerHighest,
            shape: BoxShape.circle,
            border: isActive
                ? Border.all(color: const Color(0xFF99CBFF), width: 3)
                : null,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: filled ? Colors.white : AppColors.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.primary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // ── Order Summary ───────────────────────────────────────────────────────────

  Widget _buildOrderSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Summary',
              style: AppTextStyles.headlineSm.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.popUntil(
                  context, ModalRoute.withName('/shopping-cart')),
              child: Text(
                'Edit',
                style: AppTextStyles.labelMd.copyWith(
                  color: const Color(0xFF00325F),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
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
              _buildOrderItem(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDiTC2g9Wih_ofo055a43gxFFM2JFQZrbSbjIV4QxzopuI6MOvI9Vv06x0sgsHN0x97LolX027M4zs9D9GJ77dV5Fokw5HYQ-81YcSNWO81YogIedT93TcVqD6FApTXV_JgBot_k46d2AspfeTwayyUrL2WnLSDkQFBIEOTJ5clK3KtD01_5kusxpMed3qoS8ai32CnbBTDceZ4xURzJPo1U7AkkrIugbgLZh64W6hscHkEddNlas7R4yoEWpbxrJPbKQnVy9muQ98',
                name: 'Heavy Duty Centrifugal Pump',
                sku: 'SKU: IND-9920-XP',
                qty: 'Qty: 02',
                price: 'KES 45,000',
                isLast: false,
              ),
              _buildOrderItem(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBeTEF_JmjxVauWIYWkHs9J6w_dMV_4dyXrq1syzuLQFJ2-i6qFfkULmoPC2dXao9xpLpghg_JkRFPdB5qglpOsNbt5ITrlRgLRrP4okgSQYXX5NevxUG3Z3ja3BM_-T2sDiLdEMvbyLpXvlBi_HaygMh91m5OME3D_vCERIY2yulfQFsbFZ9UInIHTNxqrdvvT9ZqvqTA2neyXeOrpb3o0h3VK50W5teKdqJc2PV5n4g2WWKoUxAPEkq7oT9uOASudt24sEqmwick',
                name: 'Stainless Steel Ball Valve (2")',
                sku: 'SKU: VLV-441-SS',
                qty: 'Qty: 05',
                price: 'KES 12,500',
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem({
    required String imageUrl,
    required String name,
    required String sku,
    required String qty,
    required String price,
    required bool isLast,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFF9F9FC), width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: const Color(0xFFF3F3F6),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  sku,
                  style: AppTextStyles.bodySm.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      qty,
                      style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.02 * 18,
                        color: Color(0xFF00325F),
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

  // ── Cost Breakdown ──────────────────────────────────────────────────────────

  Widget _buildCostBreakdownSection() {
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
            'Cost Breakdown',
            style: AppTextStyles.headlineSm.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          _buildCostRow('Subtotal', 'KES 57,500.00'),
          const SizedBox(height: 10),
          _buildCostRow('Processing Fee', 'KES 250.00'),
          const SizedBox(height: 10),
          _buildCostRow('Logistics & Shipping', 'KES 1,200.00'),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total Amount',
                style: AppTextStyles.headlineSm.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onSurface,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'KES 58,950.00',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Including VAT (16%)',
                    style: AppTextStyles.labelMd.copyWith(
                      fontSize: 10,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: AppTextStyles.bodySm
                .copyWith(color: const Color(0xFF6B7280), fontSize: 14)),
        Text(value,
            style: AppTextStyles.bodySm
                .copyWith(color: const Color(0xFF6B7280), fontSize: 14)),
      ],
    );
  }

  // ── Shipping Section ────────────────────────────────────────────────────────

  Widget _buildShippingSection() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.local_shipping, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'SHIPPING TO',
                    style: AppTextStyles.labelMd.copyWith(
                      color: const Color(0xFF6B7280),
                      fontSize: 12,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.popUntil(
                    context, ModalRoute.withName('/checkout')),
                child: const Icon(Icons.edit, color: AppColors.primary, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Main Warehouse - Industrial Area',
            style: AppTextStyles.bodySm.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Enterprise Road, Plot 22B\nNairobi, Kenya',
            style: AppTextStyles.bodySm.copyWith(
              color: const Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.schedule, color: AppColors.primary, size: 16),
              const SizedBox(width: 4),
              Text(
                'Estimated: 2-3 Business Days',
                style: AppTextStyles.bodySm.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Payment Details Section ─────────────────────────────────────────────────

  Widget _buildPaymentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Details',
              style: AppTextStyles.headlineSm.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.popUntil(
                  context, ModalRoute.withName('/checkout-payment')),
              child: const Icon(Icons.edit, color: AppColors.primary, size: 18),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildMpesaCard(),
        const SizedBox(height: 12),
        _buildBankTransferCard(),
      ],
    );
  }

  Widget _buildMpesaCard() {
    final bool selected = _selectedPaymentMethod == 'mpesa';
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = 'mpesa'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : const Color(0xFFF3F4F6),
            width: selected ? 2 : 1,
          ),
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
            Row(
              children: [
                const Icon(Icons.payments, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'MOBILE MONEY',
                  style: AppTextStyles.labelMd.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: 12,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFB8C9D9)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF16A34A),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'M-PESA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 9,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lipa Na M-Pesa',
                          style: AppTextStyles.bodySm.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          '254 712 *** 890',
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Radio<String>(
                    value: 'mpesa',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (v) =>
                        setState(() => _selectedPaymentMethod = v!),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            if (selected) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.smartphone, size: 18),
                      label: const Text('Pay KES 58,950'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.done_all, size: 18),
                      label: const Text('Confirm Payment'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF16A34A),
                        side: const BorderSide(color: Color(0xFF16A34A)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBankTransferCard() {
    final bool selected = _selectedPaymentMethod == 'bank';
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = 'bank'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : const Color(0xFFF3F4F6),
            width: selected ? 2 : 1,
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_balance,
                        color: AppColors.primary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'BANK TRANSFER',
                      style: AppTextStyles.labelMd.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 12,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                Radio<String>(
                  value: 'bank',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (v) =>
                      setState(() => _selectedPaymentMethod = v!),
                  activeColor: AppColors.primary,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFB8C9D9)),
              ),
              child: Column(
                children: [
                  _buildBankRow('Account Name', 'SMART SUPPLY LTD'),
                  const SizedBox(height: 8),
                  _buildBankRow('Bank', 'Equity Bank'),
                  const SizedBox(height: 8),
                  _buildBankRow('Branch', 'Corporate'),
                  const SizedBox(height: 8),
                  _buildBankRow('Account Number', '0123 4567 8901 2345',
                      isAccNumber: true),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0xFFB8C9D9), height: 1),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          const ClipboardData(text: '0123456789012345'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account details copied'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.content_copy,
                            color: AppColors.primary, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Copy Account Details',
                          style: AppTextStyles.labelMd.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFB8C9D9),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.photo_camera,
                        color: AppColors.primary, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      'Upload Proof of Payment',
                      style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'JPG, PNG OR PDF (MAX. 5MB)',
                      style: AppTextStyles.labelMd.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 10,
                        letterSpacing: 0.5,
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

  Widget _buildBankRow(String label, String value,
      {bool isAccNumber = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
            letterSpacing: 0.3,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: isAccNumber ? 'monospace' : 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isAccNumber ? AppColors.primary : AppColors.onSurface,
            letterSpacing: isAccNumber ? 1.0 : 0,
          ),
        ),
      ],
    );
  }

  // ── Terms Checkbox ──────────────────────────────────────────────────────────

  Widget _buildTermsCheckbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: _agreedToTerms,
            onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.bodySm.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: 13,
                    height: 1.5,
                  ),
                  children: const [
                    TextSpan(text: 'I agree to the '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Industrial Sourcing Policy',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' for B2B transactions.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom Bar ──────────────────────────────────────────────────────────────

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFF3F3F6))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _agreedToTerms ? _confirmOrder : null,
              icon: const Icon(Icons.check_circle, size: 22),
              label: const Text(
                'Confirm Order',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.primary.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                shadowColor: AppColors.primary.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmOrder() {
    Navigator.pushNamed(context, '/order-confirmation');
  }
}
