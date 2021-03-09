import 'package:kutilang_example/bloc/alert/alert_bloc.dart';
import 'package:kutilang_example/modules/account/services/user_routes.dart';
import 'package:kutilang_example/modules/account/services/user_services.dart';
import 'package:kutilang_example/services/auth_jwt_services.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:kutilang_example/modules/account/models/user_model.dart';
import 'package:kutilang_example/utils/helper.dart';

class UserStore {

  // store variables:-----------------------------------------------------------
  AlertStore _alertStore = AlertStore();
  // User itemDetail;

  
  bool islistEmpty = true;

  
  bool isItemEmpty = true;

  User? itemDetail;

  
  User? get userProfile => profile2;

  
  User? profile2;

  
  User? person;

  
  bool isModified = false;

  
  List<User>? userList;

  
  int totalUser = 0;

  
  bool success = false;

  
  bool loading = false;

  
  int? id;

  
  String? username;

  
  String? firstname;

  
  String? lastname;

  
  String? email;

  
  String? activated;

  
  String? profile;

  
  bool? showError;

  
  String? errorMessage;

  // actions:-------------------------------------------------------------------
  
  void setUserId(int value) {
    id = value;
  }

  
  void setUsername(String? value) {
    username = value;
  }

  
  void setFirstname(String? value) {
    firstname = value;
  }

  
  void setLastname(String? value) {
    lastname = value;
  }

  
  void setEmail(String? value) {
    email = value;
  }

  
  void setActivated(String? value) {
    activated = value;
  }

  
  void setProfile(String? value) {
    profile = value;
  }

  
  void count(List<User> list) {
    if (list != null) {
      totalUser = list.length;
      islistEmpty = false;
      showError = false;
    } else {
      showError = true;
      errorMessage = 'Data Empty';
    }
  }

  
  User? get userDetail => itemDetail;

  
  setItemData(int data) {
    isItemEmpty = false;
    itemDetail = userList![data];
    //userDetail = data;
    
  }

  
  int currentPosition = 0;

  
  itemTapById(int _position) {
      currentPosition = _position;
     // UserServices.user(_position).then((value) => itemDetail = value);
      isItemEmpty = false;
      NavigationServices.navigateTo(UserRoutes.userDetail);
  }


  /* 
  itemTapByLogin(String? login) {
      UserServices.user(login!).then((value) => itemDetail = value);
      isItemEmpty = false;
      NavigationServices.navigateTo(UserRoutes.userDetail);

  }

  
  itemTap(User data) {
    NavigationServices.navigateTo(UserRoutes.userDetail);
    itemDetail = data;
  }

  
  add() {
    NavigationServices.navigateTo(UserRoutes.userForm);
  }

  
  save() {
    isModified = false;
    UserServices.createUser(mapping());
    //dialogDelete();
    NavigationServices.navigateTo(UserRoutes.userList);
  }

  
  delete(String? userid) {
    dialogDelete();
    //isModified =true;
    UserServices.deleteUser(userid!);
    getUserList();
  }

  
  update(int id) {
    dialogDelete();
  }

  
  Future getUserList() async {
    UserServices.users().then((data) => userList = data);
  }

  
  getProfile() async {
    profile2 = await AuthServices.profileInfo();
    //setPrefs(PROFILE, profile);

    //userProfile = User.fromJson(json.decode(profile));
    
  } */

  dialogDelete([String? item]) {
    _alertStore.setTitleDialog('Delete');
    _alertStore.setContentDialog('This item $item would be delete');
   
  }

  dialogUpdate([String? item]) {
    _alertStore.setTitleDialog('Update');
    _alertStore.setContentDialog('This item $item would be update');
  }

  mapping() {
    return User(
        id: 0,
        login: username,
        firstName: firstname,
        lastName: lastname,
        email: email,
        activated: true,
        createdBy: username,
        createdDate: instantToDate(DateTime.now()),
        langKey: "en",
        imageUrl: "",
        authorities: ['"ROLE_USER"'],
        lastModifiedBy: username,
        lastModifiedDate: instantToDate(DateTime.now()));
  }
}
