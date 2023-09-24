// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formSchema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFormsClassCollection on Isar {
  IsarCollection<FormsClass> get formsClass => this.collection();
}

const FormsClassSchema = CollectionSchema(
  name: r'FormsClass',
  id: 913439223812849769,
  properties: {
    r'caseNo': PropertySchema(
      id: 0,
      name: r'caseNo',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 1,
      name: r'location',
      type: IsarType.string,
    ),
    r'police': PropertySchema(
      id: 2,
      name: r'police',
      type: IsarType.string,
    ),
    r'userID': PropertySchema(
      id: 3,
      name: r'userID',
      type: IsarType.long,
    )
  },
  estimateSize: _formsClassEstimateSize,
  serialize: _formsClassSerialize,
  deserialize: _formsClassDeserialize,
  deserializeProp: _formsClassDeserializeProp,
  idName: r'caseId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _formsClassGetId,
  getLinks: _formsClassGetLinks,
  attach: _formsClassAttach,
  version: '3.1.0+1',
);

int _formsClassEstimateSize(
  FormsClass object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.caseNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.police;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _formsClassSerialize(
  FormsClass object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.caseNo);
  writer.writeString(offsets[1], object.location);
  writer.writeString(offsets[2], object.police);
  writer.writeLong(offsets[3], object.userID);
}

FormsClass _formsClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FormsClass();
  object.caseId = id;
  object.caseNo = reader.readStringOrNull(offsets[0]);
  object.location = reader.readStringOrNull(offsets[1]);
  object.police = reader.readStringOrNull(offsets[2]);
  object.userID = reader.readLongOrNull(offsets[3]);
  return object;
}

P _formsClassDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _formsClassGetId(FormsClass object) {
  return object.caseId;
}

List<IsarLinkBase<dynamic>> _formsClassGetLinks(FormsClass object) {
  return [];
}

void _formsClassAttach(IsarCollection<dynamic> col, Id id, FormsClass object) {
  object.caseId = id;
}

extension FormsClassQueryWhereSort
    on QueryBuilder<FormsClass, FormsClass, QWhere> {
  QueryBuilder<FormsClass, FormsClass, QAfterWhere> anyCaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FormsClassQueryWhere
    on QueryBuilder<FormsClass, FormsClass, QWhereClause> {
  QueryBuilder<FormsClass, FormsClass, QAfterWhereClause> caseIdEqualTo(
      Id caseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: caseId,
        upper: caseId,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterWhereClause> caseIdNotEqualTo(
      Id caseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: caseId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: caseId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: caseId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: caseId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterWhereClause> caseIdGreaterThan(
      Id caseId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: caseId, includeLower: include),
      );
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterWhereClause> caseIdLessThan(
      Id caseId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: caseId, includeUpper: include),
      );
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterWhereClause> caseIdBetween(
    Id lowerCaseId,
    Id upperCaseId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerCaseId,
        includeLower: includeLower,
        upper: upperCaseId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FormsClassQueryFilter
    on QueryBuilder<FormsClass, FormsClass, QFilterCondition> {
  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caseNo',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      caseNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caseNo',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caseNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'caseNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> caseNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caseNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      caseNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'caseNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'police',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      policeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'police',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'police',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'police',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'police',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> policeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'police',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      policeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'police',
        value: '',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> userIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition>
      userIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> userIDEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userID',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> userIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userID',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> userIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userID',
        value: value,
      ));
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterFilterCondition> userIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FormsClassQueryObject
    on QueryBuilder<FormsClass, FormsClass, QFilterCondition> {}

extension FormsClassQueryLinks
    on QueryBuilder<FormsClass, FormsClass, QFilterCondition> {}

extension FormsClassQuerySortBy
    on QueryBuilder<FormsClass, FormsClass, QSortBy> {
  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByCaseNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByCaseNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByPolice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'police', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByPoliceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'police', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> sortByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension FormsClassQuerySortThenBy
    on QueryBuilder<FormsClass, FormsClass, QSortThenBy> {
  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByCaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByCaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByCaseNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByCaseNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByPolice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'police', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByPoliceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'police', Sort.desc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QAfterSortBy> thenByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension FormsClassQueryWhereDistinct
    on QueryBuilder<FormsClass, FormsClass, QDistinct> {
  QueryBuilder<FormsClass, FormsClass, QDistinct> distinctByCaseNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caseNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QDistinct> distinctByPolice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'police', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FormsClass, FormsClass, QDistinct> distinctByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userID');
    });
  }
}

extension FormsClassQueryProperty
    on QueryBuilder<FormsClass, FormsClass, QQueryProperty> {
  QueryBuilder<FormsClass, int, QQueryOperations> caseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caseId');
    });
  }

  QueryBuilder<FormsClass, String?, QQueryOperations> caseNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caseNo');
    });
  }

  QueryBuilder<FormsClass, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<FormsClass, String?, QQueryOperations> policeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'police');
    });
  }

  QueryBuilder<FormsClass, int?, QQueryOperations> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userID');
    });
  }
}
