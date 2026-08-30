import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/get_config.dart';
import 'core/routes/app_routes_names.dart';
import 'core/routes/routes.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const EmaStore());
}

class EmaStore extends StatelessWidget {
  const EmaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: AppRoutesNames.login,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}