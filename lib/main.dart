import 'package:fltrello/service_locator.dart';
import 'package:fltrello/ui/screens/app/trello.dart';
import 'package:fltrello/ui/widgets/global/global_error_handler.dart';

void main() {
  setupContainer();
  GlobalErrorHandler(
    child: const Trello()
  );
}
