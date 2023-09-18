import 'package:isar/isar.dart';

part 'userSchema.g.dart';

@Collection()
class UsersClass {
  Id id = Isar.autoIncrement;
  late String? name;
  late String? password;
  late String? question;
  late String? passwordRestHint;
  List<int>? imageBytes;
}
