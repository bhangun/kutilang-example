// import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/services/navigation.dart';


class AlertStore {


  String get title => dialogTitle ;

  
  String dialogTitle = 'Title';

  
  String judullg = 'Title';

  
  String dialogContent = 'Content';

  
  bool isOk=false;

  
  bool isCancel=false;

  
  onDialogOk(){
    isOk =true;
    isCancel=false;
   // FLog.info(text:'Ok');
    NavigationServices.close();
  }

  
  onDialogCancel(){
    isOk =false;
    isCancel=true;
    // FLog.info(text:'Cancel');
    NavigationServices.close();
  }

  
  setTitleDialog(String text){
    dialogTitle = text;
  }

  
  setContentDialog(String text){
    dialogContent = text;
  }

  

}