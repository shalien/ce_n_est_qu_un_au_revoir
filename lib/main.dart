import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:happy_new_year/src/const.dart';
import 'package:happy_new_year/src/theme.dart';

void main() {
  runApp(const MyApp());
}

final Color _choosenColor = randomColor();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        darkTheme: darkTheme(_choosenColor),
        theme: lightTheme(_choosenColor),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isTodayFirstDayOfYear() {
    final DateTime now = DateTime.now();
    return now.month == 1 && now.day == 1;
  }

  Future<String> getTitle() async {
    if (_isTodayFirstDayOfYear()) {
      return 'Happy New Year';
    } else {
      return '${AppLocalizations.of(context)!.incoming_year}... $incomingYear';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTitle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  elevation: 8,
                  titleTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                  centerTitle: true,
                  shape: const BeveledRectangleBorder(),
                  title: Text(snapshot.data!), // 'Happy New Year',
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.nextYealWillBehereIn,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.bold,
                          color: _choosenColor,
                        ),
                      ),
                      _TimerCountdown()
                    ],
                  ),
                ),
                bottomNavigationBar: _BottomAppBar());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class _TimerCountdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      endTime: endDate,
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      colonsTextStyle: TextStyle(
        fontSize: MediaQuery.of(context).size.width / 15,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).dividerColor,
      ),
      descriptionTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 25,
          fontWeight: FontWeight.bold,
          color: _choosenColor),
      timeTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 15,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary),
      daysDescription: AppLocalizations.of(context)!.days,
      hoursDescription: AppLocalizations.of(context)!.hours,
      minutesDescription: AppLocalizations.of(context)!.minutes,
      secondsDescription: AppLocalizations.of(context)!.seconds,
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.createdWith,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(
                  AppLocalizations.of(context)!.by,
                ),
                Text(
                  AppLocalizations.of(context)!.shalien,
                  style: const TextStyle(color: darkRoyalBlue),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: FilledButton(onPressed: null, child: Text('Github')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () => showLicensePage(context: context),
                child: Text(AppLocalizations.of(context)!.license)),
          ),
        ],
      ),
    );
  }
}
