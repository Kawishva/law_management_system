import 'package:flutter/src/widgets/editable_text.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;
  late String? name;
  late String? email;
  late String? password;
}
