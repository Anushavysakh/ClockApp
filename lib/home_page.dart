import 'package:clock_app/clock_view_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '';
    print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildElevatedButton('Clock', 'assets/clock_icon.png'),
              buildElevatedButton('Alarm', 'assets/alarm.png'),
              buildElevatedButton('Timer', 'assets/timer_icon.png'),
              buildElevatedButton('Stopwatch', 'assets/stopwatch_icon.png')
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              color: const Color(0xFF2D2F41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Flexible(flex: 2,
                    child: Column(
                      children: [
                        const Text(
                          'Clock',
                          style: TextStyle(color: Colors.white, fontSize: 64),
                        ),
                      ],
                    ),
                  ),
                  Flexible(flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      children: const [
                        Text(
                          'Clock',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Align(
                          alignment: Alignment.center,
                          child: const ClockView(size: 250,))),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Timezone',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),SizedBox(height: 16,),
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
                              'UTC $offsetSign  $timezoneString',
                              style:
                              const TextStyle(color: Colors.white, fontSize: 24),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildElevatedButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(style: ButtonStyle(
      ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                scale: 1.5,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          )),
    );
  }
}
