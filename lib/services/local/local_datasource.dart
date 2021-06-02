/* import 'package:kutilang_example/services/local/local_db_constants.dart';
import 'package:sembast/sembast.dart';
import 'local_database.dart';
 */

class AppDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map

 // static final _appsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  
  //static Future<Database> get _db async => await AppDatabase.instance.database;

  // Singleton instance
  static final AppDataSource _singleton = AppDataSource._();

  // A private constructor. Allows us to create instances of AppDataSource
  // only from within the AppDataSource class itself.
  AppDataSource._();

  // Singleton accessor
  static AppDataSource get instance => _singleton;
/* 
  // DB functions:--------------------------------------------------------------
  static Future<int> insert(AppData appData) async {
    return await _appsStore.add(await _db, appData.toMap());
  }

  static Future<int> token(String token) async {
    return await _appsStore.add(await _db, {'token':token});
  }

 /*  Future<int> fetchToken(int key) async {
    final finder = Finder(filter: Filter.byKey(key)); 
    return await _appsStore.add(await _db, {'token':token});
  } */

  static Future<int> update(AppData appData) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(appData.id));
    return await _appsStore.update(
      await _db,
      appData.toMap(),
      finder: finder,
    );
  }

  static Future<Map<String, Object?>> fetch(int key) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(key)); 
     Map<String, Object?>  value = (await _appsStore.findFirst( await _db,finder:finder))!.value;
     return value;
  }

  static Future<int> delete(AppData appData) async {
    final finder = Finder(filter: Filter.byKey(appData.id));
    return await _appsStore.delete(
      await _db,
      finder: finder,
    );
  }

  static Future deleteAll() async {
    await _appsStore.drop(
      await _db,
    );
  }

  static Future<List<AppData>> getAllSortedByFilter({required List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _appsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<AppData> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final appData = AppData.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      appData.id = snapshot.key;
      return appData;
    }).toList();
  }

  static Future<List<AppData>> getAllAppDatas() async {
    final recordSnapshots = await _appsStore.find(
      await _db,
    );

    // Making a List<AppData> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final appData = AppData.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      appData.id = snapshot.key;
      return appData;
    }).toList();
  } */
}


/* {
  store: "notes", 
  key: 2, 
  value: {title: "Welcome to NotePad kjbnkjnj", 
    content: "is the same in all tabs", 
    date: 1615207021001
    }
} */