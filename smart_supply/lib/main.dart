import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/requests/new_request_step1_screen.dart';
import 'features/requests/new_request_step2_screen.dart';
import 'features/requests/new_request_step3_screen.dart';
import 'features/requests/new_request_step4_screen.dart';
import 'features/requests/new_request_step5_screen.dart';
import 'features/requests/draft_saved_screen.dart';
import 'features/requests/requests_list_screen.dart';
import 'features/catalog/catalog_screen.dart';
import 'features/orders/shopping_cart_screen.dart';
import 'features/orders/checkout_screen.dart';
import 'features/orders/checkout_payment_screen.dart';
import 'features/orders/checkout_review_screen.dart';
import 'features/orders/order_confirmation_screen.dart';
import 'features/orders/order_tracking_screen.dart';
import 'features/account/account_screen.dart';
import 'features/auth/signup_screen.dart';
import 'features/auth/login_screen.dart';
import 'core/theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const SmartSupplyApp());
}

class SmartSupplyApp extends StatelessWidget {
  const SmartSupplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Supply Sourcing China',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/shopping-cart': (context) => const ShoppingCartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/checkout-payment': (context) => const CheckoutPaymentScreen(),
        '/checkout-review': (context) => const CheckoutReviewScreen(),
        '/order-confirmation': (context) => const OrderConfirmationScreen(),
        '/order-tracking': (context) => const OrderTrackingScreen(),
        '/account': (context) => const AccountScreen(),
        '/requests-list': (context) => const RequestsListScreen(),
        '/new-request': (context) => const NewRequestStep1Screen(),
        '/new-request-step2': (context) => const NewRequestStep2Screen(),
        '/new-request-step3': (context) => const NewRequestStep3Screen(),
        '/new-request-step4': (context) => const NewRequestStep4Screen(),
        '/new-request-step5': (context) => const NewRequestStep5Screen(),
        '/draft-saved': (context) => const DraftSavedScreen(),
      },
    );
  }
}
