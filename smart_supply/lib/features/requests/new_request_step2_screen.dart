import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class NewRequestStep2Screen extends StatefulWidget {
  const NewRequestStep2Screen({super.key});

  @override
  State<NewRequestStep2Screen> createState() => _NewRequestStep2ScreenState();
}

class _NewRequestStep2ScreenState extends State<NewRequestStep2Screen> {
  final List<String> _uploadedImages = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDbLU2YnQb2fIXQ0xuJFMKlxVs8pDfZW-gkrCQazHbVoJZfVPzQ3TujcGgigIWqAwD3AkkJmIc1EcCVsNT7IgftBMGViZBSeZP_dYOVwSCVi-T0NhS-Slu5lmZO6NzKSwfYzSu9syuofrqdc0jbMPmc6Z5BVUgirLevBCNrlCGSmrGy3JYONPJP7ykcy0MeAQVysxfI3Pjs6RSRMcDsPjx-OqElZXPHMCLhI2aOzwZqe_dD5oyRoNQhtE6_1YzEHh-DPDlX3t29s5A',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAQQHtT_LwZWQ6UPKc_C-qf1iycxUREsRL9KpStTCdt6ybhMJaLl1gIDwVKEio01DDIgJDTlO1Cv4TFDMJP5S6Y9XhZW-JhVDRfdQF-c59eXh6oO6Vlg8DX3EzFx_Nsejb37XN-Tq1He4q8YWFjQl4fiqEfEhITw1gvyl8DTURkodzOZ1zBPeMZDxwarYb3b3KyKZr2fBddAHZv3GM044xe_6vvrc6olkiZhBs9Djs06xSJgXJytG8QPxs3qQX7dCQSyppbHB3rZgI',
  ];

  void _removeImage(int index) {
    setState(() {
      _uploadedImages.removeAt(index);
    });
  }

  void _addImage() {
    // TODO: Implement image picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image picker will be implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Request',
          style: AppTextStyles.headlineSm.copyWith(
            fontSize: 18,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
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
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            _buildProgressSection(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildImageGrid(),
                  const SizedBox(height: 16),
                  _buildProTipsCard(),
                  const SizedBox(height: 24),
                  _buildContinueButton(),
                  const SizedBox(height: 12),
                  _buildSkipButton(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProgressSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STEP 2 OF 5',
                style: AppTextStyles.labelLg.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1.5,
                  fontSize: 12,
                ),
              ),
              Text(
                'REFERENCE MEDIA',
                style: AppTextStyles.labelLg.copyWith(
                  color: AppColors.secondary,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: 0.4, // 2/5 = 40%
              minHeight: 6,
              backgroundColor: AppColors.secondaryFixed,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Reference Images',
          style: AppTextStyles.headlineMd.copyWith(
            color: AppColors.onBackground,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Provide visual references to help our sourcing team find the exact industrial parts you need.',
          style: AppTextStyles.bodySm.copyWith(
            color: AppColors.secondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return SizedBox(
      height: 320,
      child: Row(
        children: [
          // Main preview (left side - 2/3 width)
          Expanded(
            flex: 2,
            child: _uploadedImages.isNotEmpty
                ? _buildMainImagePreview(_uploadedImages[0], 0)
                : _buildAddPhotoPlaceholder(isMain: true),
          ),
          const SizedBox(width: 12),
          // Right column (1/3 width)
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Secondary preview
                Expanded(
                  child: _uploadedImages.length > 1
                      ? _buildSecondaryImagePreview(_uploadedImages[1], 1)
                      : _buildAddPhotoPlaceholder(isMain: false),
                ),
                const SizedBox(height: 12),
                // Add photo button
                Expanded(
                  child: _buildAddPhotoButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainImagePreview(String imageUrl, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.image, size: 48, color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.delete,
                  size: 18,
                  color: AppColors.error,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Text(
                'Primary Reference',
                style: AppTextStyles.labelLg.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryImagePreview(String imageUrl, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.image, size: 32, color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.delete,
                  size: 16,
                  color: AppColors.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoPlaceholder({required bool isMain}) {
    return GestureDetector(
      onTap: _addImage,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.outlineVariant,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_a_photo,
                color: AppColors.primary,
                size: isMain ? 48 : 32,
              ),
              const SizedBox(height: 8),
              Text(
                'ADD PHOTO',
                style: AppTextStyles.labelLg.copyWith(
                  color: AppColors.primary,
                  fontSize: isMain ? 12 : 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: _addImage,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.outlineVariant,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_a_photo,
                color: AppColors.primary,
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                'ADD PHOTO',
                style: AppTextStyles.labelLg.copyWith(
                  color: AppColors.primary,
                  fontSize: 10,
                ),
              ),
              Text(
                '(${_uploadedImages.length}/5)',
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.secondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProTipsCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryFixed,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.lightbulb,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pro Tips for Better Sourcing',
                  style: AppTextStyles.labelLg.copyWith(
                    color: AppColors.onBackground,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                _buildTipItem('Show serial numbers or plate labels'),
                const SizedBox(height: 6),
                _buildTipItem('Capture multiple angles (Top, Side)'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
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

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-request-step3');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue to Step 3',
              style: AppTextStyles.headlineSm.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/new-request-step3');
      },
      child: Text(
        'SKIP FOR NOW',
        style: AppTextStyles.labelLg.copyWith(
          color: AppColors.secondary,
          letterSpacing: 1.2,
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
              _buildNavItem(Icons.description, 'Requests', true, '/new-request'),
              _buildNavItem(Icons.grid_view, 'Catalog', false, '/catalog'),
              _buildNavItem(Icons.local_shipping, 'Orders', false, '/home'),
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
