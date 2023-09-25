// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docFilesSchema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDocFIlesClassCollection on Isar {
  IsarCollection<DocFIlesClass> get docFIlesClass => this.collection();
}

const DocFIlesClassSchema = CollectionSchema(
  name: r'DocFIlesClass',
  id: 1185470850241882617,
  properties: {
    r'caseNo': PropertySchema(
      id: 0,
      name: r'caseNo',
      type: IsarType.string,
    ),
    r'docName': PropertySchema(
      id: 1,
      name: r'docName',
      type: IsarType.string,
    ),
    r'documentBytes': PropertySchema(
      id: 2,
      name: r'documentBytes',
      type: IsarType.longList,
    ),
    r'userID': PropertySchema(
      id: 3,
      name: r'userID',
      type: IsarType.long,
    )
  },
  estimateSize: _docFIlesClassEstimateSize,
  serialize: _docFIlesClassSerialize,
  deserialize: _docFIlesClassDeserialize,
  deserializeProp: _docFIlesClassDeserializeProp,
  idName: r'docId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _docFIlesClassGetId,
  getLinks: _docFIlesClassGetLinks,
  attach: _docFIlesClassAttach,
  version: '3.1.0+1',
);

int _docFIlesClassEstimateSize(
  DocFIlesClass object,
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
    final value = object.docName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.documentBytes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _docFIlesClassSerialize(
  DocFIlesClass object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.caseNo);
  writer.writeString(offsets[1], object.docName);
  writer.writeLongList(offsets[2], object.documentBytes);
  writer.writeLong(offsets[3], object.userID);
}

DocFIlesClass _docFIlesClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DocFIlesClass();
  object.caseNo = reader.readStringOrNull(offsets[0]);
  object.docId = id;
  object.docName = reader.readStringOrNull(offsets[1]);
  object.documentBytes = reader.readLongList(offsets[2]);
  object.userID = reader.readLongOrNull(offsets[3]);
  return object;
}

P _docFIlesClassDeserializeProp<P>(
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
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _docFIlesClassGetId(DocFIlesClass object) {
  return object.docId;
}

List<IsarLinkBase<dynamic>> _docFIlesClassGetLinks(DocFIlesClass object) {
  return [];
}

void _docFIlesClassAttach(
    IsarCollection<dynamic> col, Id id, DocFIlesClass object) {
  object.docId = id;
}

extension DocFIlesClassQueryWhereSort
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QWhere> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhere> anyDocId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DocFIlesClassQueryWhere
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QWhereClause> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhereClause> docIdEqualTo(
      Id docId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: docId,
        upper: docId,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhereClause> docIdNotEqualTo(
      Id docId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: docId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: docId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: docId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: docId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhereClause>
      docIdGreaterThan(Id docId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: docId, includeLower: include),
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhereClause> docIdLessThan(
      Id docId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: docId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterWhereClause> docIdBetween(
    Id lowerDocId,
    Id upperDocId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerDocId,
        includeLower: includeLower,
        upper: upperDocId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DocFIlesClassQueryFilter
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QFilterCondition> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caseNo',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caseNo',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoEqualTo(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoGreaterThan(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoLessThan(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoBetween(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoStartsWith(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoEndsWith(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'caseNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'caseNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caseNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      caseNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'caseNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docId',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'docId',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'docId',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'docId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'docName',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'docName',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'docName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'docName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'docName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docName',
        value: '',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      docNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'docName',
        value: '',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentBytes',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentBytes',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      documentBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userID',
        value: value,
      ));
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDGreaterThan(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDLessThan(
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

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterFilterCondition>
      userIDBetween(
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

extension DocFIlesClassQueryObject
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QFilterCondition> {}

extension DocFIlesClassQueryLinks
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QFilterCondition> {}

extension DocFIlesClassQuerySortBy
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QSortBy> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByCaseNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByCaseNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.desc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByDocName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docName', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByDocNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docName', Sort.desc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> sortByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension DocFIlesClassQuerySortThenBy
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QSortThenBy> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByCaseNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByCaseNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseNo', Sort.desc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByDocId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docId', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByDocIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docId', Sort.desc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByDocName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docName', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByDocNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docName', Sort.desc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QAfterSortBy> thenByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension DocFIlesClassQueryWhereDistinct
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QDistinct> {
  QueryBuilder<DocFIlesClass, DocFIlesClass, QDistinct> distinctByCaseNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caseNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QDistinct> distinctByDocName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'docName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QDistinct>
      distinctByDocumentBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentBytes');
    });
  }

  QueryBuilder<DocFIlesClass, DocFIlesClass, QDistinct> distinctByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userID');
    });
  }
}

extension DocFIlesClassQueryProperty
    on QueryBuilder<DocFIlesClass, DocFIlesClass, QQueryProperty> {
  QueryBuilder<DocFIlesClass, int, QQueryOperations> docIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'docId');
    });
  }

  QueryBuilder<DocFIlesClass, String?, QQueryOperations> caseNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caseNo');
    });
  }

  QueryBuilder<DocFIlesClass, String?, QQueryOperations> docNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'docName');
    });
  }

  QueryBuilder<DocFIlesClass, List<int>?, QQueryOperations>
      documentBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentBytes');
    });
  }

  QueryBuilder<DocFIlesClass, int?, QQueryOperations> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userID');
    });
  }
}
