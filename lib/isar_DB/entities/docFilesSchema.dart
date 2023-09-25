import 'package:isar/isar.dart';

part 'docFilesSchema.g.dart';

@Collection()
class DocFIlesClass {
  Id docId = Isar.autoIncrement;
  late int? userID;
  late String? docName;
  late String? caseNo;
  List<int>? documentBytes;
}
