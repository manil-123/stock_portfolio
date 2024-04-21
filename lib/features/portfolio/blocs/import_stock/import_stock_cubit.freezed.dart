// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_stock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImportStockState {
  String get fileName => throw _privateConstructorUsedError;
  List<ExcelStockDataModel> get excelDataList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImportStockStateCopyWith<ImportStockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportStockStateCopyWith<$Res> {
  factory $ImportStockStateCopyWith(
          ImportStockState value, $Res Function(ImportStockState) then) =
      _$ImportStockStateCopyWithImpl<$Res, ImportStockState>;
  @useResult
  $Res call({String fileName, List<ExcelStockDataModel> excelDataList});
}

/// @nodoc
class _$ImportStockStateCopyWithImpl<$Res, $Val extends ImportStockState>
    implements $ImportStockStateCopyWith<$Res> {
  _$ImportStockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? excelDataList = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      excelDataList: null == excelDataList
          ? _value.excelDataList
          : excelDataList // ignore: cast_nullable_to_non_nullable
              as List<ExcelStockDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImportStockStateImplCopyWith<$Res>
    implements $ImportStockStateCopyWith<$Res> {
  factory _$$ImportStockStateImplCopyWith(_$ImportStockStateImpl value,
          $Res Function(_$ImportStockStateImpl) then) =
      __$$ImportStockStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, List<ExcelStockDataModel> excelDataList});
}

/// @nodoc
class __$$ImportStockStateImplCopyWithImpl<$Res>
    extends _$ImportStockStateCopyWithImpl<$Res, _$ImportStockStateImpl>
    implements _$$ImportStockStateImplCopyWith<$Res> {
  __$$ImportStockStateImplCopyWithImpl(_$ImportStockStateImpl _value,
      $Res Function(_$ImportStockStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? excelDataList = null,
  }) {
    return _then(_$ImportStockStateImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      excelDataList: null == excelDataList
          ? _value._excelDataList
          : excelDataList // ignore: cast_nullable_to_non_nullable
              as List<ExcelStockDataModel>,
    ));
  }
}

/// @nodoc

class _$ImportStockStateImpl implements _ImportStockState {
  _$ImportStockStateImpl(
      {required this.fileName,
      required final List<ExcelStockDataModel> excelDataList})
      : _excelDataList = excelDataList;

  @override
  final String fileName;
  final List<ExcelStockDataModel> _excelDataList;
  @override
  List<ExcelStockDataModel> get excelDataList {
    if (_excelDataList is EqualUnmodifiableListView) return _excelDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excelDataList);
  }

  @override
  String toString() {
    return 'ImportStockState(fileName: $fileName, excelDataList: $excelDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportStockStateImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality()
                .equals(other._excelDataList, _excelDataList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName,
      const DeepCollectionEquality().hash(_excelDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportStockStateImplCopyWith<_$ImportStockStateImpl> get copyWith =>
      __$$ImportStockStateImplCopyWithImpl<_$ImportStockStateImpl>(
          this, _$identity);
}

abstract class _ImportStockState implements ImportStockState {
  factory _ImportStockState(
          {required final String fileName,
          required final List<ExcelStockDataModel> excelDataList}) =
      _$ImportStockStateImpl;

  @override
  String get fileName;
  @override
  List<ExcelStockDataModel> get excelDataList;
  @override
  @JsonKey(ignore: true)
  _$$ImportStockStateImplCopyWith<_$ImportStockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
