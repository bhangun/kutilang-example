

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutilang_example/modules/register_modules.dart';

import 'modules.dart';

class ModulesRegistry {
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  ModulesRegistry._(){
    _registry();
  }
 
  static final _blocProvider = <BlocProvider<Bloc<Object?, Object?>>>[];

  _registry(){
    registerModules().forEach((m){
        m.pages().forEach((p){
          p.name = m.name;
          Modules.addPages(p);
        });

        print(m.providers());


       // _blocProvider.add(m.providers());
        m.routes();
        m.services();
    });
  }

  static providers(){
    return _blocProvider;
  }
}



