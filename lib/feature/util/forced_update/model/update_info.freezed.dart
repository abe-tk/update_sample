// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

/// @nodoc
mixin _$UpdateInfo {
  /// 要求バージョン（任意）
  String get latestVer => throw _privateConstructorUsedError;

  /// 要求バージョン（強制）
  String get requiredVer => throw _privateConstructorUsedError;

  /// RemoteConfigが有効になる日時
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoCopyWith<UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res, UpdateInfo>;
  @useResult
  $Res call({String latestVer, String requiredVer, DateTime enabledAt});
}

/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res, $Val extends UpdateInfo>
    implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestVer = null,
    Object? requiredVer = null,
    Object? enabledAt = null,
  }) {
    return _then(_value.copyWith(
      latestVer: null == latestVer
          ? _value.latestVer
          : latestVer // ignore: cast_nullable_to_non_nullable
              as String,
      requiredVer: null == requiredVer
          ? _value.requiredVer
          : requiredVer // ignore: cast_nullable_to_non_nullable
              as String,
      enabledAt: null == enabledAt
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateInfoCopyWith<$Res>
    implements $UpdateInfoCopyWith<$Res> {
  factory _$$_UpdateInfoCopyWith(
          _$_UpdateInfo value, $Res Function(_$_UpdateInfo) then) =
      __$$_UpdateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latestVer, String requiredVer, DateTime enabledAt});
}

/// @nodoc
class __$$_UpdateInfoCopyWithImpl<$Res>
    extends _$UpdateInfoCopyWithImpl<$Res, _$_UpdateInfo>
    implements _$$_UpdateInfoCopyWith<$Res> {
  __$$_UpdateInfoCopyWithImpl(
      _$_UpdateInfo _value, $Res Function(_$_UpdateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestVer = null,
    Object? requiredVer = null,
    Object? enabledAt = null,
  }) {
    return _then(_$_UpdateInfo(
      latestVer: null == latestVer
          ? _value.latestVer
          : latestVer // ignore: cast_nullable_to_non_nullable
              as String,
      requiredVer: null == requiredVer
          ? _value.requiredVer
          : requiredVer // ignore: cast_nullable_to_non_nullable
              as String,
      enabledAt: null == enabledAt
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfo implements _UpdateInfo {
  const _$_UpdateInfo(
      {required this.latestVer,
      required this.requiredVer,
      required this.enabledAt});

  factory _$_UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateInfoFromJson(json);

  /// 要求バージョン（任意）
  @override
  final String latestVer;

  /// 要求バージョン（強制）
  @override
  final String requiredVer;

  /// RemoteConfigが有効になる日時
  @override
  final DateTime enabledAt;

  @override
  String toString() {
    return 'UpdateInfo(latestVer: $latestVer, requiredVer: $requiredVer, enabledAt: $enabledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfo &&
            (identical(other.latestVer, latestVer) ||
                other.latestVer == latestVer) &&
            (identical(other.requiredVer, requiredVer) ||
                other.requiredVer == requiredVer) &&
            (identical(other.enabledAt, enabledAt) ||
                other.enabledAt == enabledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latestVer, requiredVer, enabledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      __$$_UpdateInfoCopyWithImpl<_$_UpdateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateInfoToJson(
      this,
    );
  }
}

abstract class _UpdateInfo implements UpdateInfo {
  const factory _UpdateInfo(
      {required final String latestVer,
      required final String requiredVer,
      required final DateTime enabledAt}) = _$_UpdateInfo;

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfo.fromJson;

  @override

  /// 要求バージョン（任意）
  String get latestVer;
  @override

  /// 要求バージョン（強制）
  String get requiredVer;
  @override

  /// RemoteConfigが有効になる日時
  DateTime get enabledAt;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
