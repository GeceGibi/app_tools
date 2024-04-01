part of 'worker.dart';

enum Printer {
  black('\x1B[30m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  magenta('\x1B[35m'),
  cyan('\x1B[36m'),
  white('\x1B[37m');

  const Printer(this.value);
  final String value;

  void log(Object? obj) {
    print('$value$obj\x1B[0m');
  }
}
