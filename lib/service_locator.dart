import 'package:fltrello/ui/navigation/app_navigation.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // service locator

// dependency injection
void setupContainer(){
  sl.registerLazySingleton<AppNavigator>(() => AppNavigator()); // if there is an instance return if not create when needed
}