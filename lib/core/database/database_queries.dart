import 'package:manjam_asmaa/medel/namesModel.dart';

import 'dbhelper.dart';

class DatabaseQueries {
  DBHelper dbHelper = DBHelper();
  late List<String> globalNameList = [];

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

  Future<List<String>> getNamesFromDb() async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery("SELECT nameNoTashkel from GlobalNameTbl");

    for (var item in list) {
      theObjectList.add(item['nameNoTashkel']);
    }
    return theObjectList;
  }

  //جلب الوزن للاسم لجلب جميع الاسماء التي تحمل نفس الوزن
  Future<List<String>> getWightForNameAndAllName(
      String name, int maleOrFemale) async {
    String nameWight = '';
    String typeOfName = '';
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    typeOfName = maleOrFemale == 1 ? 'مذكر' : 'مؤنث';

    list = await dbClient!.rawQuery(
        "SELECT nameWight from GlobalNameTbl where nameNoTashkel='$name' ");

    for (var item in list) {
      nameWight = item['nameWight'];
    }

    list = await dbClient.rawQuery(
        "SELECT name from GlobalNameTbl where nameWight='$nameWight' And typeOfName='$typeOfName'");

    for (var item in list) {
      theNamesList.add(item['name']);
    }

    print(
        "'thee nooo SELECT name from GlobalNameTbl where nameWight='$nameWight' And typeOfName='$typeOfName'");

    return theNamesList;
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

    list = await dbClient!.rawQuery("SELECT result from theWightTable");

    for (var item in list) {
      theWightList.add(item['result']);
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
}
