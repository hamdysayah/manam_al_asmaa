import 'package:manjam_asmaa/medel/namesModel.dart';

import 'dbhelper.dart';

class DatabaseQueries {
  DBHelper dbHelper = DBHelper();
  late List<Namesmodel> globalNameList = [];

  // late List<CategoryModel> categoriesList = [];
  // late List<MessageModel> favoriteMessagesList = [];

  Future<List<Namesmodel>> getGlobalNamesFirstThreeOptions(String text, int option) async {
    if (globalNameList.isNotEmpty) {
      globalNameList.clear();
    }
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    if (option == 1) {
      list = await dbClient!.rawQuery(
          "SELECT * from GlobalNameTbl WHERE nameNoTashkel like'$text%'");
    } else if (option == 2) {
      list = await dbClient!.rawQuery(
          "SELECT * from GlobalNameTbl WHERE nameNoTashkel like'%$text'");
    } else {
      list = await dbClient!.rawQuery(
          "SELECT * from GlobalNameTbl WHERE nameNoTashkel like'%$text%'");
    }
    for (var item in list) {
      globalNameList.add(Namesmodel.fromMap(item));
    }
    return globalNameList;
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
