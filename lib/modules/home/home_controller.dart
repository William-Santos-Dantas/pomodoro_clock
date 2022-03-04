import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final _percent = 0.0.obs;
  get percent => _percent.value;
  final _currentTime = 0.obs;
  get currentTime => _currentTime.value;

  final _totalSeconds = 0.obs;
  get totalSeconds => _totalSeconds.value;
  final _displayMinutes = 0.obs;
  get displayMinutes => _displayMinutes.value;
  final _displaySeconds = ''.obs;
  get displaySeconds => _displaySeconds.value;

  final _init = false.obs;
  get init => _init.value;

  final _pause = false.obs;

  // ignore: prefer_typing_uninitialized_variables
  var interval;

  @override
  void onReady() {
    setCurrentTime(25);
    super.onReady();
  }

  void setCurrentTime(int time) {
    _totalSeconds(time * 60);
    _displayMinutes(totalSeconds ~/ 60);
    _currentTime(totalSeconds);
    int seconds = totalSeconds % 60;
    if (seconds < 10) {
      _displaySeconds("0$seconds");
    } else {
      _displaySeconds(seconds.toString());
    }
  }

  void playTimer() {
    if (currentTime == 0) {}
    interval = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _init(true);
        _percent.value += 1 / totalSeconds;
        if (percent > 1) _percent.value = 1;
        _currentTime.value -= 1;
        _displayMinutes(currentTime ~/ 60);
        int seconds = currentTime % 60;
        if (seconds < 10) {
          _displaySeconds("0$seconds");
        } else {
          _displaySeconds(seconds.toString());
        }

        if (currentTime == 0) {
          _percent(0.0);
          if (!_pause.value) {
            setCurrentTime(5);
            _pause.toggle();
          } else {
            setCurrentTime(25);
            _pause.toggle();
          }
        }
      },
    );
  }

  void stop() {
    if (init) interval.cancel();
     reset();
    _init(false);
  }

  void reset(){
    setCurrentTime(25);
    _percent(0);
  }
}
