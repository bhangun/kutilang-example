import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kutilang_example/widgets/bottom_bar_widget.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/progress_indicator_widget.dart';

class UserList extends StatefulWidget {
  final String? title;
  UserList({this.title});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _listKey = GlobalKey<ScaffoldState>();
  var _userBloc; // = UserStore();

  @override
  void initState() {
    super.initState();
    // _userBloc.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _listKey,
      // cannot be used using this form $_userBloc.totalUser
      appBar: KutAppBar(title: 'User List ( ${_userBloc.totalUser} )'),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, //_userBloc.add,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: KutBotomBar(),
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _userBloc.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildSlidelist(context)),

        /*   _userBloc.success
                ? Container()
                : showErrorMessage(context, _userBloc.errorMessage)
          ,
         */
        /*  Observer(
          key: Key('dialog'),
          builder: (context) {
            return _userBloc.isModified ? KutAlert():Container();
        }), */
      ],
    );
  }

  _buildSlidelist(BuildContext context) {
    return !_userBloc.islistEmpty
        ? ListView.separated(
            itemCount: 2, // _userBloc.userList.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.grey.shade200,
                    icon: Icons.more_horiz,
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    // onTap: ()=> _userBloc.delete(_userBloc.userList[index].login),
                  ),
                ],
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  /* title: Text('${_userBloc.userList[index].id} - '+
                  '${_userBloc.userList[index].login}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  '${_userBloc.userList[index].email } ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ), */
                  // onTap: ()=>_userBloc.itemTapByLogin(_userBloc.userList[index].login)
                ),
              );
            })
        : Center(child: Text('Data empty'));
  }
}
