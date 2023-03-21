// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfoEntity _$UpdateInfoEntityFromJson(Map<String, dynamic> json) {
  return _UpdateInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$UpdateInfoEntity {
  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion => throw _privateConstructorUsedError;

  /// アップデートを後回し可能にするかどうか
  bool get canCancel => throw _privateConstructorUsedError;

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoEntityCopyWith<UpdateInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoEntityCopyWith<$Res> {
  factory $UpdateInfoEntityCopyWith(
          UpdateInfoEntity value, $Res Function(UpdateInfoEntity) then) =
      _$UpdateInfoEntityCopyWithImpl<$Res, UpdateInfoEntity>;
  @useResult
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$UpdateInfoEntityCopyWithImpl<$Res, $Val extends UpdateInfoEntity>
    implements $UpdateInfoEntityCopyWith<$Res> {
  _$UpdateInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredVersion = null,
    Object? canCancel = null,
    Object? enabledAt = null,
  }) {
    return _then(_value.copyWith(
      requiredVersion: null == requiredVersion
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: null == enabledAt
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateInfoEntityCopyWith<$Res>
    implements $UpdateInfoEntityCopyWith<$Res> {
  factory _$$_UpdateInfoEntityCopyWith(
          _$_UpdateInfoEntity value, $Res Function(_$_UpdateInfoEntity) then) =
      __$$_UpdateInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$$_UpdateInfoEntityCopyWithImpl<$Res>
    extends _$UpdateInfoEntityCopyWithImpl<$Res, _$_UpdateInfoEntity>
    implements _$$_UpdateInfoEntityCopyWith<$Res> {
  __$$_UpdateInfoEntityCopyWithImpl(
      _$_UpdateInfoEntity _value, $Res Function(_$_UpdateInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredVersion = null,
    Object? canCancel = null,
    Object? enabledAt = null,
  }) {
    return _then(_$_UpdateInfoEntity(
      requiredVersion: null == requiredVersion
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: null == enabledAt
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfoEntity implements _UpdateInfoEntity {
  const _$_UpdateInfoEntity(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$_UpdateInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateInfoEntityFromJson(json);

  /// 要求バージョン e.g., '1.0.0'
  @override
  final String requiredVersion;

  /// アップデートを後回し可能にするかどうか
  @override
  @JsonKey()
  final bool canCancel;

  /// 有効日（この日時以降のみ有効とする）
  @override
  final DateTime enabledAt;

  @override
  String toString() {
    return 'UpdateInfoEntity(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfoEntity &&
            (identical(other.requiredVersion, requiredVersion) ||
                other.requiredVersion == requiredVersion) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            (identical(other.enabledAt, enabledAt) ||
                other.enabledAt == enabledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, requiredVersion, canCancel, enabledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoEntityCopyWith<_$_UpdateInfoEntity> get copyWith =>
      __$$_UpdateInfoEntityCopyWithImpl<_$_UpdateInfoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateInfoEntityToJson(
      this,
    );
  }
}

abstract class _UpdateInfoEntity implements UpdateInfoEntity {
  const factory _UpdateInfoEntity(
      {required final String requiredVersion,
      final bool canCancel,
      required final DateTime enabledAt}) = _$_UpdateInfoEntity;

  factory _UpdateInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfoEntity.fromJson;

  @override

  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion;
  @override

  /// アップデートを後回し可能にするかどうか
  bool get canCancel;
  @override

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoEntityCopyWith<_$_UpdateInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
