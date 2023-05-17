import 'package:sembast/sembast.dart';
import 'package:share_portfolio/model/share_info_list.dart';
import '../../config/database.dart';

class ShareInfoListDAO {
  static const String SHARE_INFO_LIST_STORE_NAME = 'shareinfolist';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _shareInfoListStore =
      intMapStoreFactory.store(SHARE_INFO_LIST_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<ShareInfoList?> getShareInfoList() async {
    var finder = Finder();
    final data = await _shareInfoListStore.find(
      await _db,
      finder: finder,
    );
    // print(data.map((e) => ShareInfoList.fromMap(e.value)).toList()[0]);

    if (data.isNotEmpty) {
      try {
        return data.map((e) => ShareInfoList.fromMap(e.value)).toList()[0];
      } catch (e) {
        // print("get Matched Data DB ${e.toString()}");
      }
    }
    return null;
  }

  Future<int> insert(ShareInfoList shareInfoList) async {
    await _shareInfoListStore.delete(await _db);
    return await _shareInfoListStore.add(await _db, shareInfoList.toMap());
  }
}
