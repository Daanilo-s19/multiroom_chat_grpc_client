///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listUserDescriptor instead')
const ListUser$json = const {
  '1': 'ListUser',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.chat.User', '10': 'users'},
  ],
};

/// Descriptor for `ListUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUserDescriptor = $convert.base64Decode('CghMaXN0VXNlchIgCgV1c2VycxgBIAMoCzIKLmNoYXQuVXNlclIFdXNlcnM=');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.chat.User', '10': 'user'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'room', '3': 3, '4': 1, '5': 11, '6': '.chat.Room', '10': 'room'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEh4KBHVzZXIYASABKAsyCi5jaGF0LlVzZXJSBHVzZXISGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRIeCgRyb29tGAMgASgLMgouY2hhdC5Sb29tUgRyb29t');
