import 'package:clock_app/widgets/digital_clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_view_page.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({
    Key? key,
    required this.offsetSign,
    required this.timezoneString,
  }) : super(key: key);

  final String offsetSign;
  final String timezoneString;

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {

  var now = DateTime.now();
  var formattedDate = DateFormat('EEE, d MMM').format(DateTime.now());
  var timezoneString = DateTime.now().timeZoneOffset.toString().split('.').first;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      color: const Color(0xFF2D2F41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children:  [
                DigitalClockWidget(),
                Text(
                  formattedDate,
                  style:
                  TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              children: const [
                Text(
                  'Clock',
                  style:
                  TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Align(
                  alignment: Alignment.center,
                  child: ClockView(
                    size: 250,
                  ))),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Timezone',
                  style:
                  TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'UTC ${widget.offsetSign}  ${widget.timezoneString}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 24),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
