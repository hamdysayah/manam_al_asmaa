import 'package:manjam_asmaa/medel/namesModel.dart';

import 'dbhelper.dart';

class DatabaseQueries {
  DBHelper dbHelper = DBHelper();
  late List<String> globalNameList = [];

  // late List<CategoryModel> categoriesList = [];
  // late List<MessageModel> favoriteMessagesList = [];

  Future<List<String>> getGlobalNamesFirstThreeOptions(
      String text, int option) async {
    if (globalNameList.isNotEmpty) {
      globalNameList.clear();
    }
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    if (option == 1) {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'$text%'");
    } else if (option == 2) {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text'");
    } else {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text%'");
    }
    for (var item in list) {
      globalNameList.add(item['name']);
    }
    return globalNameList;
  }

  Future<List<String>> getObjectsNames() async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery("SELECT theObject from theObjectsTbl");

    for (var item in list) {
      theObjectList.add(item['theObject']);
    }
    return theObjectList;
  }

  Future<List<String>> getNamesFromObject(String theObject) async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT theNames from theObjectsTbl WHERE theObject='$theObject'");

    for (var item in list) {
      theObjectList.add(item['theNames']);
    }
    return theObjectList;
  }

  Future<List<String>> getNamesFromWight(String wight) async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!
        .rawQuery("SELECT name from GlobalNameTbl WHERE nameWight='$wight'");

    for (var item in list) {
      theObjectList.add(item['name']);
    }
    return theObjectList;
  }

  Future<List<String>> getWightsFromDb() async {
    List<String> theWightList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery("SELECT theWight from theWightTable");

    for (var item in list) {
      theWightList.add(item['theWight']);
    }
    return theWightList;
  }

  Future<Namesmodel> getNameDetails(String theName) async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    Namesmodel result = Namesmodel(
        id: 1,
        name: 'name',
        typeOfName: 'typeOfName',
        nameWight: 'nameWight',
        domainName: 'domainName',
        root: 'root',
        origin: 'origin',
        meaning: 'meaning');
    list = await dbClient!
        .rawQuery("select * from globalnametbl where name='$theName'");

    print("select * from globalnametbl where name='$theName'");
    for (var item in list) {
      result = Namesmodel.fromMap(item);
    }
    return result;
  }

//
// // جلب الرسائل من خلال الكلمه
// Future<List<MessageModel>> getMessagesByWord(String word) async {
//   if (messagesList.isNotEmpty) {
//     messagesList.clear();
//   }
//   var dbClient = await dbHelper.db;
//   List<Map<String, dynamic>> list;
//   list = await dbClient!
//       .rawQuery("SELECT * from Messages  where  message  like '%$word%' ");
//   for (var item in list) {
//     messagesList.add(MessageModel.fromMap(item));
//   }
//   print('the length is ${messagesList.length}');
//
//   return messagesList;
// }
//
// Future<List<MessageModel>> getMessagesByRandomly() async {
//   if (messagesList.isNotEmpty) {
//     messagesList.clear();
//   }
//   var dbClient = await dbHelper.db;
//   List<Map<String, dynamic>> list;
//   list = await dbClient!
//       .rawQuery("select * from Messages order by random() limit 200;");
//   for (var item in list) {
//     messagesList.add(MessageModel.fromMap(item));
//   }
//   return messagesList;
// }
//
// Future<List<CategoryModel>> getCategories() async {
//   if (categoriesList.isNotEmpty) {
//     categoriesList.clear();
//   }
//   var dbClient = await dbHelper.db;
//   List<Map<String, dynamic>> list;
//   list = await dbClient!.rawQuery("SELECT * from Categories");
//   for (var item in list) {
//     categoriesList.add(CategoryModel.fromMap(item));
//   }
//   return categoriesList;
// }
//
// Future<List<MessageModel>> getFavoriteMessages() async {
//   if (favoriteMessagesList.isNotEmpty) {
//     favoriteMessagesList.clear();
//   }
//   var dbClient = await dbHelper.db;
//   List<Map<String, dynamic>> list;
//   list =
//       await dbClient!.rawQuery("SELECT * from Messages where IsFavorite = 1");
//   for (var item in list) {
//     favoriteMessagesList.add(MessageModel.fromMap(item));
//   }
//   return favoriteMessagesList;
// }
}
