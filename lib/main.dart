import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/router/app_router.dart';
import 'package:rate_my_app/rate_my_app.dart';


void main() async{
  await Firebase.initializeApp();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 1,
    minLaunches: 3,
    remindLaunches: 5,
    remindDays: 5,
  );

  @override
  void initState() {
    super.initState();

    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(
          context,
          title: 'NEXT WAVE',
          message: 'Please rate the app',
          starRatingOptions:
              const StarRatingOptions(), // Custom star bar rating options.
          onDismissed: () => _rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside )
          actionsBuilder: (context, stars) {
            return [
              DefaultElevatedButton(
                  text: const Text('Done'),
                  showArrowBack: false,
                  showArrowFoward: false,
                  onPressed: () {
                    if (stars != null) {
                      _rateMyApp.save().then((value) => Navigator.pop(context));

                      if (stars <= 3) {
                        //let send the user to our contact page
                      } else if (stars <= 5) {
                        // let send him to appStore|playStore
                      }
                    } else {
                      Navigator.pop(context);
                    }
                  })
            ];
          },
          dialogStyle: const DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20.0),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NextWafe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: widget.appRouter.onGenerateRoute);
  }
}
