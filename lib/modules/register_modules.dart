import 'package:kutilang_example/models/module.dart';
import 'package:kutilang_example/modules/godummy/go_module.dart';
import 'main_module.dart';
// kutilang-needle-import-module -- don't remove this line

List<Module> registerModules(){
  return [
    MainModule(),
    GoModule(),
    // kutilang-needle-add-module -- don't remove this line
  ];
}