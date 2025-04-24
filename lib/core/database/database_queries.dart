import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/medel/nameTashkelAndNo.dart';
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
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text' And   (typeOfName='${maleOfFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    } else {
      list = await dbClient!.rawQuery(
          "SELECT name from GlobalNameTbl WHERE nameNoTashkel like'%$text%' And   (typeOfName='${maleOfFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
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

  // جلب الاسماء حسب الجنس
  Future<List<String>> getNamesFromDbForWight(String maleOrFemale) async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT  DISTINCT nameNoTashkel from GlobalNameTbl where  nameWight !=''  and (typeOfName='$maleOrFemale' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث') ");

    for (var item in list) {
      theObjectList.add(item['nameNoTashkel']);
    }
    return theObjectList;
  }


  Future<List<String>> getNamesFromDb() async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT  DISTINCT nameNoTashkel from GlobalNameTbl where  nameWight !='' ");

    for (var item in list) {
      theObjectList.add(item['nameNoTashkel']);
    }
    return theObjectList;
  }

//خاص بقسم البحث من خلال الجذر
  Future<List<String>> getNamesFromDbForRootSection(String maleOrFemale) async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    showToast(maleOrFemale);
    list = await dbClient!.rawQuery(
        "SELECT  DISTINCT nameNoTashkel from GlobalNameTbl where  nameWight !='' and (typeOfName='$maleOrFemale' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");

    for (var item in list) {
      theObjectList.add(item['nameNoTashkel']);
    }
    return theObjectList;
  }

  // جلب جميع الجذور للعرض كقائمه منسدلة
  Future<List<String>> getAllRoot(String maleOrFemale) async {
    List<String> theRootList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT DISTINCT root FROM GlobalNameTbl WHERE root !='0' and (typeOfName='$maleOrFemale' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");

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
    String maleOrFemaleVir = maleOrFemale == 1 ? 'مذكر' : 'مؤنث';
    list = await dbClient.rawQuery(
        "SELECT name from GlobalNameTbl where nameWight='$nameWight' And (typeOfName='${maleOrFemaleVir}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    print(
        'the query is ${"SELECT name from GlobalNameTbl where nameWight='$nameWight' And (typeOfName='${maleOrFemale}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')"}');
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

  Future<List<String>> getNamesFromWight(String wight, int maleOrFemale) async {
    List<String> theObjectList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT name from GlobalNameTbl WHERE nameWight='$wight' AND (typeOfName='${maleOrFemale == 1 ? 'مذكر' : 'مؤنث'}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
    print(
        "SELECT name from GlobalNameTbl WHERE nameWight='$wight' AND (typeOfName='${maleOrFemale == 1 ? 'مذكر' : 'مؤنث'}' or typeOfName='عائلي' or  typeOfName='مذكر ومؤنث')");
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

    for (int x = 8; x < 201; x++) {
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

  // جلب الجذر من الاسم بالتشكيل

  Future<String> getRootForTashkelName(String name) async {
    String nameRoot = '';
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!
        .rawQuery("SELECT root from GlobalNameTbl where name='$name'");
    for (var item in list) {
      nameRoot = item['root'];
    }

    return nameRoot;
  }

  // النوع الثاني من القسم الثاني
// البحث من خلال حرفين المستخدم يختارهم
//جلب الوزن للاسم لجلب جميع الاسماء التي تحمل نفس الوزن
  Future<List<String>> getEstenatForNameFromTowChar(String char1, String char2,
      String columnName, List<int> chooseRoot) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    if (chooseRoot[0] == 0 && chooseRoot[1] == 1) {
      list = await dbClient!.rawQuery(
          "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char1='$char1' and char2='$char2'");
    } else if (chooseRoot[0] == 0 && chooseRoot[1] == 2) {
      list = await dbClient!.rawQuery(
          "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char1='$char1' and char3='$char2'");
    } else {
      list = await dbClient!.rawQuery(
          "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char2='$char1' and char3='$char2'");
    }

    for (var item in list) {
      if (item[columnName] != '3') {
        theNamesList.add(item[columnName]);
      }
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

  // جلب الوزن من خلال الاسم بالتشكيل
  Future<String> getWightFromTashkelName(String name) async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!
        .rawQuery("SELECT nameWight from GlobalNameTbl WHERE name='$name'");

    return list[0]['nameWight'];
  }

  Future<Map<String, String>> getNamesTashkelAndNoTashkel() async {
    Map<String, String> namesWithTashkel = {};
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT name,nameNoTashkel from GlobalNameTbl where nameWight !=''");

    for (var item in list) {
      namesWithTashkel.addAll({item['name']: item['nameNoTashkel']});
    }
    return namesWithTashkel;
  }

  //فحص اذا الاسم له اكثر من تشكيل
  Future<bool> checkNoFoundMoreName(String name) async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT name from GlobalNameTbl where  nameNoTashkel ='$name'");

    if (list.length > 1) {
      return false;
    } else {
      return true;
    }
  }

  // جلب الاسم مع التشكيل
  Future<List<String>> getNameWithTashkel(String name) async {
    List<String> namesWithTashkel = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    list = await dbClient!.rawQuery(
        "SELECT name from GlobalNameTbl where  nameNoTashkel ='$name'");
    for (var item in list) {
      namesWithTashkel.add(item['name']);
    }
    return namesWithTashkel;
  }

  // جلب جميع الاسماء من جدول الاستنباط لجذر من ٣ حروف
  Future<List<String>> getNamesFromRootEstenbat(
      String char1, String char2, String char3) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT * FROM EstenbatNamesMa3rofahTBL WHERE char1='$char1' AND char2='$char2' and char3='$char3'");

    for (int x = 8; x < 201; x++) {
      if (list[0]['field$x'] != '3') {
        theNamesList.add(list[0]['field$x']);
      }
    }
    return theNamesList;
  }

  // جلب جميع الاسماء من جدول الاستنباط لجذر حرفين و اختيار الوزن
  Future<List<String>> getNamesFromTowCharAndWightEstenbat(
      String char1, String char2, String columnName) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char1='$char1' AND char2='$char2'");

    for (var item in list) {
      if (item[columnName] != '3') {
        theNamesList.add(item[columnName]);
      }
    }

    return theNamesList;
  }

  // جلب جميع الاسماء من جدول الاستنباط لجذر حرفين و اختيار الوزن
  Future<List<String>> getNamesFromLastTowCharAndWightEstenbat(
      String char1, String char2, String columnName) async {
    List<String> theNamesList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT $columnName FROM EstenbatNamesMa3rofahTBL WHERE char2='$char1' AND char3='$char2'");

    for (var item in list) {
      if (item[columnName] != '3') {
        theNamesList.add(item[columnName]);
      }
    }

    return theNamesList;
  }

  // جلب الجذر والوزن ومنتقى او غير منتقى حتى يتم عرضهم
  Future<List<String>> getResultFormEstenbat(String name) async {
    List<String> resultList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;
    String theColumnName = '';
    for (int x = 8; x < 201; x++) {
      list = await dbClient!.rawQuery(
          "SELECT * FROM EstenbatNamesMa3rofahTBL WHERE field$x='$name'");

      if (list.isNotEmpty) {
        theColumnName = 'field$x';
        list = await dbClient!.rawQuery(
            "SELECT $theColumnName FROM EstenbatNamesMa3rofahTBL WHERE id='no'");
        resultList.add(list[0][theColumnName]);
        break;
      }
    }

    list = await dbClient!.rawQuery(
        "SELECT root FROM EstenbatNamesMa3rofahTBL WHERE $theColumnName='$name'");
    resultList.add(list[0]['root']);

    list = await dbClient!.rawQuery(
        "SELECT ma3rofOrNot FROM EstenbatNamesMa3rofahTBL WHERE $theColumnName='$name'");
    resultList.add(list[0]['ma3rofOrNot']);

    return resultList;
  }

  // جلب الجذر ومنتقى او غير منتقى حتى يتم عرضهم
  Future<List<String>> getResultFormEstenbatWithNoWight(
      String name, String theColumnName) async {
    List<String> resultList = [];
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> list;

    list = await dbClient!.rawQuery(
        "SELECT $theColumnName FROM EstenbatNamesMa3rofahTBL WHERE  id ='no'");
    resultList.add(list[0][theColumnName]);

    list = await dbClient.rawQuery(
        "SELECT root FROM EstenbatNamesMa3rofahTBL WHERE $theColumnName='$name'");
    resultList.add(list[0]['root']);

    list = await dbClient!.rawQuery(
        "SELECT ma3rofOrNot FROM EstenbatNamesMa3rofahTBL WHERE $theColumnName='$name'");
    resultList.add(list[0]['ma3rofOrNot']);

    return resultList;
  }
}
