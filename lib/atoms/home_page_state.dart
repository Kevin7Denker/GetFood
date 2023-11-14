import 'package:rx_notifier/rx_notifier.dart';
//classe responsável por definir o estado da página home.
class HomePageState {
  final lanchesList = RxList([]);
  final fetchList = RxNotifier.action();
}
