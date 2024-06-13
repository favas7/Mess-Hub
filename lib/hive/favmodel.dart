


import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String favourites ='favourit';
List <String> favouritelist =[];
addfav({required String mess,required String id})async{
   try {
    final datas = await Hive.openBox<String>(favourites);
    await datas.put(id, mess);
   await addfavList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}
addfavList()async{
  favouritelist.clear();
  
  final favourites = await getfav();
  favouritelist = List.from(favourites);

}
Future<List<String>> getfav()async{
  final fav = await Hive.openBox<String>(favourites);
  if (kDebugMode) {
    print(fav.values);
  }
  return fav.values.toList();
}
deletefav({required String id})async{
  final fav = await Hive.openBox<String>(favourites);
  await fav.delete(id);
  await addfavList();
}