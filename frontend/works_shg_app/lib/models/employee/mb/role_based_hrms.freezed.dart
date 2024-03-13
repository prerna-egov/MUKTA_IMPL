// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_based_hrms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HRMSResponse _$HRMSResponseFromJson(Map<String, dynamic> json) {
  return _HRMSResponse.fromJson(json);
}

/// @nodoc
mixin _$HRMSResponse {
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HRMSResponseCopyWith<HRMSResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HRMSResponseCopyWith<$Res> {
  factory $HRMSResponseCopyWith(
          HRMSResponse value, $Res Function(HRMSResponse) then) =
      _$HRMSResponseCopyWithImpl<$Res, HRMSResponse>;
  @useResult
  $Res call({@JsonKey(name: 'Employees') List<HRMSEmployee>? employees});
}

/// @nodoc
class _$HRMSResponseCopyWithImpl<$Res, $Val extends HRMSResponse>
    implements $HRMSResponseCopyWith<$Res> {
  _$HRMSResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_value.copyWith(
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<HRMSEmployee>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HRMSResponseCopyWith<$Res>
    implements $HRMSResponseCopyWith<$Res> {
  factory _$$_HRMSResponseCopyWith(
          _$_HRMSResponse value, $Res Function(_$_HRMSResponse) then) =
      __$$_HRMSResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Employees') List<HRMSEmployee>? employees});
}

/// @nodoc
class __$$_HRMSResponseCopyWithImpl<$Res>
    extends _$HRMSResponseCopyWithImpl<$Res, _$_HRMSResponse>
    implements _$$_HRMSResponseCopyWith<$Res> {
  __$$_HRMSResponseCopyWithImpl(
      _$_HRMSResponse _value, $Res Function(_$_HRMSResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_$_HRMSResponse(
      employees: freezed == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<HRMSEmployee>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HRMSResponse implements _HRMSResponse {
  const _$_HRMSResponse(
      {@JsonKey(name: 'Employees') final List<HRMSEmployee>? employees})
      : _employees = employees;

  factory _$_HRMSResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HRMSResponseFromJson(json);

  final List<HRMSEmployee>? _employees;
  @override
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees {
    final value = _employees;
    if (value == null) return null;
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HRMSResponse(employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HRMSResponse &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_employees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HRMSResponseCopyWith<_$_HRMSResponse> get copyWith =>
      __$$_HRMSResponseCopyWithImpl<_$_HRMSResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HRMSResponseToJson(
      this,
    );
  }
}

abstract class _HRMSResponse implements HRMSResponse {
  const factory _HRMSResponse(
          {@JsonKey(name: 'Employees') final List<HRMSEmployee>? employees}) =
      _$_HRMSResponse;

  factory _HRMSResponse.fromJson(Map<String, dynamic> json) =
      _$_HRMSResponse.fromJson;

  @override
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees;
  @override
  @JsonKey(ignore: true)
  _$$_HRMSResponseCopyWith<_$_HRMSResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

HRMSEmployee _$HRMSEmployeeFromJson(Map<String, dynamic> json) {
  return _HRMSEmployee.fromJson(json);
}

/// @nodoc
mixin _$HRMSEmployee {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfAppointment')
  int? get dateOfAppointment => throw _privateConstructorUsedError;
  @JsonKey(name: 'employeeType')
  String? get employeeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HRMSEmployeeCopyWith<HRMSEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HRMSEmployeeCopyWith<$Res> {
  factory $HRMSEmployeeCopyWith(
          HRMSEmployee value, $Res Function(HRMSEmployee) then) =
      _$HRMSEmployeeCopyWithImpl<$Res, HRMSEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'dateOfAppointment') int? dateOfAppointment,
      @JsonKey(name: 'employeeType') String? employeeType});
}

/// @nodoc
class _$HRMSEmployeeCopyWithImpl<$Res, $Val extends HRMSEmployee>
    implements $HRMSEmployeeCopyWith<$Res> {
  _$HRMSEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? dateOfAppointment = freezed,
    Object? employeeType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfAppointment: freezed == dateOfAppointment
          ? _value.dateOfAppointment
          : dateOfAppointment // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HRMSEmployeeCopyWith<$Res>
    implements $HRMSEmployeeCopyWith<$Res> {
  factory _$$_HRMSEmployeeCopyWith(
          _$_HRMSEmployee value, $Res Function(_$_HRMSEmployee) then) =
      __$$_HRMSEmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'dateOfAppointment') int? dateOfAppointment,
      @JsonKey(name: 'employeeType') String? employeeType});
}

/// @nodoc
class __$$_HRMSEmployeeCopyWithImpl<$Res>
    extends _$HRMSEmployeeCopyWithImpl<$Res, _$_HRMSEmployee>
    implements _$$_HRMSEmployeeCopyWith<$Res> {
  __$$_HRMSEmployeeCopyWithImpl(
      _$_HRMSEmployee _value, $Res Function(_$_HRMSEmployee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? dateOfAppointment = freezed,
    Object? employeeType = freezed,
  }) {
    return _then(_$_HRMSEmployee(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfAppointment: freezed == dateOfAppointment
          ? _value.dateOfAppointment
          : dateOfAppointment // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HRMSEmployee implements _HRMSEmployee {
  const _$_HRMSEmployee(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'dateOfAppointment') this.dateOfAppointment,
      @JsonKey(name: 'employeeType') this.employeeType});

  factory _$_HRMSEmployee.fromJson(Map<String, dynamic> json) =>
      _$$_HRMSEmployeeFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'dateOfAppointment')
  final int? dateOfAppointment;
  @override
  @JsonKey(name: 'employeeType')
  final String? employeeType;

  @override
  String toString() {
    return 'HRMSEmployee(id: $id, uuid: $uuid, code: $code, isActive: $isActive, dateOfAppointment: $dateOfAppointment, employeeType: $employeeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HRMSEmployee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateOfAppointment, dateOfAppointment) ||
                other.dateOfAppointment == dateOfAppointment) &&
            (identical(other.employeeType, employeeType) ||
                other.employeeType == employeeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uuid, code, isActive, dateOfAppointment, employeeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HRMSEmployeeCopyWith<_$_HRMSEmployee> get copyWith =>
      __$$_HRMSEmployeeCopyWithImpl<_$_HRMSEmployee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HRMSEmployeeToJson(
      this,
    );
  }
}

abstract class _HRMSEmployee implements HRMSEmployee {
  const factory _HRMSEmployee(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'uuid') final String? uuid,
          @JsonKey(name: 'code') final String? code,
          @JsonKey(name: 'isActive') final bool? isActive,
          @JsonKey(name: 'dateOfAppointment') final int? dateOfAppointment,
          @JsonKey(name: 'employeeType') final String? employeeType}) =
      _$_HRMSEmployee;

  factory _HRMSEmployee.fromJson(Map<String, dynamic> json) =
      _$_HRMSEmployee.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'dateOfAppointment')
  int? get dateOfAppointment;
  @override
  @JsonKey(name: 'employeeType')
  String? get employeeType;
  @override
  @JsonKey(ignore: true)
  _$$_HRMSEmployeeCopyWith<_$_HRMSEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}