import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/themes.dart';
import 'package:ibadah_journey/core/services/notification_service.dart';
import 'package:ibadah_journey/pages/splash/splash_page.dart';
import 'package:ibadah_journey/providers/prayer_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'providers/target_provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  await NotificationService.init();

  tz.initializeTimeZones();

  runApp(const IbadahJourney());
}

class IbadahJourney extends StatelessWidget {
  const IbadahJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PrayerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TargetProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ibadah Journey',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: const SplashPage(),
      ),
    );
  }
}
