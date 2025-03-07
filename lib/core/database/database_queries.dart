import 'package:manjam_asmaa/medel/namesModel.dart';

import 'dbhelper.dart';

class DatabaseQueries {
  DBHelper dbHelper = DBHelper();
  late List<String> globalNameList = [];

  Future<List<String>> getGlobalNamesFirstThreeOptions(
      String text, int option, String maleOfFemale) async {
    if (globalNameList.isNotEmpty) {
      globalNameList.clear();
    }
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    if (option == 1) {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'$text%' And  (typeOfName='${maleOfFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    } else if (option == 2) {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text' And   (typeOfName='${maleOfFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')'");
    } else {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text%' And   (typeOfName='${maleOfFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')'");
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

    list = await dbClient!.rawQuery(
        "SELECT nameNoTashkel from GlobalNameTbl where  nameWight !=''");

    for (var item in list) {
      theObjectList.add(item['nameNoTashkel']);
    }
    return theObjectList;
  }

  // جلب جميع الجذور للعرض كقائمه منسدلة
  Future<List<String>> getAllRoot() async {
    List<String> theRootList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!
        .rawQuery("SELECT DISTINCT root FROM GlobalNameTbl WHERE root !='0'");

    for (var item in list) {
      theRootList.add(item['root']);
    }
    return theRootList;
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
        "SELECT name from GlobalNameTbl where nameWight='$nameWight' And (typeOfName='${maleOrFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    for (var item in list) {
      theNamesList.add(item['name']);
    }
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

  // بحث من خلال الجذر
  Future<List<String>> getAllNamesFromRoot(
      String root, String maleOrFemale) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT name from GlobalNameTbl WHERE root='$root' AND (typeOfName='${maleOrFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");

    for (var item in list) {
      theNamesList.add(item['name']);
    }
    return theNamesList;
  }

  //جلب الجذر للاسم لجلب جميع الاسماء التي تحمل نفس الجذر
  Future<List<String>> getRootForNameAndAllName(
      String name, String maleOrFemale) async {
    String nameRoot = '';
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!
        .rawQuery("SELECT root from GlobalNameTbl where nameNoTashkel='$name'");
    for (var item in list) {
      nameRoot = item['root'];
    }
    list = await dbClient.rawQuery(
        "SELECT name from GlobalNameTbl where root='$nameRoot' And (typeOfName='${maleOrFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    for (var item in list) {
      theNamesList.add(item['name']);
    }
    return theNamesList;
  }

  //جلب الوزن للاسم لجلب جميع الاسماء التي تحمل نفس الوزن
  Future<List<String>> getEstenatRootForNameAndAllName(String name) async {
    String nameRoot = '';
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!.rawQuery(
        "SELECT root from GlobalNameTbl where nameNoTashkel='$name' ");
    for (var item in list) {
      nameRoot = item['root'];
    }
    list = await dbClient.rawQuery(
        "SELECT * FROM EstenbatNamesMa3rofahTBL WHERE root='$nameRoot'");

    for (int x = 8; x < 236; x++) {
      if (list[0]['field$x'] != '3') {
        theNamesList.add(list[0]['field$x']);
      }
    }
    return theNamesList;
  }

  // جلب الجذر الخاص بالاسم المختار
  Future<String> getRootForName(String name) async {
    String nameRoot = '';
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!
        .rawQuery("SELECT root from GlobalNameTbl where nameNoTashkel='$name'");
    for (var item in list) {
      nameRoot = item['root'];
    }

    return nameRoot;
  }

  // النوع الثاني من القسم الثاني
// البحث من خلال حرفين المستخدم يختارهم
//جلب الوزن للاسم لجلب جميع الاسماء التي تحمل نفس الوزن
  Future<List<String>> getEstenatForNameFromTowChar(
      String char1, String char2, String columnName) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char1='$char1' and char2='$char2'");

    for (var item in list) {
      theNamesList.add(item[columnName]);
    }
    return theNamesList;
  }

// معرفة العامود المطابق لوزن الكلمه
  Future<String> getWightFromName(String name) async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!.rawQuery(
        "SELECT nameWight from GlobalNameTbl WHERE nameNoTashkel='$name'");

    return list[0]['nameWight'];
  }
}
