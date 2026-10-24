import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/config/get_config.dart';
import 'core/routes/app_routes_names.dart';
import 'core/routes/routes.dart';
import 'core/services/storage_service.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  Stripe.publishableKey = dotenv.env['PUBLISHABLE_KEY']!;
  final isLoggedIn = await StorageService.getToken();
  configureDependencies();

  runApp(EmaStore(isLoggedIn: isLoggedIn != null && isLoggedIn.isNotEmpty));
}

class EmaStore extends StatelessWidget {
  final bool isLoggedIn;

  const EmaStore({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => getIt<AuthCubit>()..restoreUser(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: isLoggedIn
                ? AppRoutesNames.layout
                : AppRoutesNames.login,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}

// Future<void> initPaymentSheet() async {
//   try {
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         // Main params
//         paymentIntentClientSecret: data['paymentIntent'],
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//
//         applePay: PaymentSheetApplePay(
//           merchantCountryCode: 'US',
//         ),
//         googlePay: PaymentSheetGooglePay(
//           merchantCountryCode: 'US',
//           testEnv: true,
//         ),
//         style: ThemeMode.dark,
//         billingDetails: billingDetails,
//       ),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//     rethrow;
//   }
// }