import 'package:isar/isar.dart';

part 'formSchema.g.dart';

@Collection()
class FormsClass {
  Id caseId = Isar.autoIncrement;
  late int? userID;
  late String? caseNo;
  late String? police;
  late String? location;
}
