// GENERATED CODE - DO NOT MODIFY BY HAND

part of api.model;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ApiErrorSerializer implements Serializer<ApiError> {
  @override
  Map<String, dynamic> toMap(ApiError model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'message', model.message);
    setMapValue(ret, 'field', model.field);
    setMapValue(ret, 'status', model.status);
    return ret;
  }

  @override
  ApiError fromMap(Map map) {
    if (map == null) return null;
    final obj = ApiError(
        code: map['code'] as String ?? getJserDefault('code'),
        message: map['message'] as String ?? getJserDefault('message'),
        field: map['field'] as String ?? getJserDefault('field'),
        status: map['status'] as String ?? getJserDefault('status'));
    return obj;
  }
}

abstract class _$NotFoundSerializer implements Serializer<NotFound> {
  @override
  Map<String, dynamic> toMap(NotFound model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'message', model.message);
    return ret;
  }

  @override
  NotFound fromMap(Map map) {
    if (map == null) return null;
    final obj = NotFound(
        message: map['message'] as String ?? getJserDefault('message'));
    return obj;
  }
}

abstract class _$UnauthorizedSerializer implements Serializer<Unauthorized> {
  @override
  Map<String, dynamic> toMap(Unauthorized model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'message', model.message);
    setMapValue(ret, 'field', model.field);
    return ret;
  }

  @override
  Unauthorized fromMap(Map map) {
    if (map == null) return null;
    final obj = Unauthorized(
        code: map['code'] as String ?? getJserDefault('code'),
        message: map['message'] as String ?? getJserDefault('message'),
        field: map['field'] as String ?? getJserDefault('field'));
    return obj;
  }
}
