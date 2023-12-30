import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../const.dart';

class TimerCountdownWidget extends StatelessWidget {
  const TimerCountdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      endTime: endDate,
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      colonsTextStyle: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).dividerColor,
      ),
      descriptionTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      timeTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary),
      daysDescription: AppLocalizations.of(context)!.days,
      hoursDescription: AppLocalizations.of(context)!.hours,
      minutesDescription: AppLocalizations.of(context)!.minutes,
      secondsDescription: AppLocalizations.of(context)!.seconds,
    );
  }
}
