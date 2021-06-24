///
//  Generated code. Do not modify.
//  source: manager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listRoomResponseDescriptor instead')
const ListRoomResponse$json = const {
  '1': 'ListRoomResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.chat.Room', '10': 'rooms'},
  ],
};

/// Descriptor for `ListRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRoomResponseDescriptor = $convert.base64Decode('ChBMaXN0Um9vbVJlc3BvbnNlEiAKBXJvb21zGAEgAygLMgouY2hhdC5Sb29tUgVyb29tcw==');
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhgKB2FkZHJlc3MYAyABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use roomHeartbeatRequestDescriptor instead')
const RoomHeartbeatRequest$json = const {
  '1': 'RoomHeartbeatRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `RoomHeartbeatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomHeartbeatRequestDescriptor = $convert.base64Decode('ChRSb29tSGVhcnRiZWF0UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use roomHeartbeatResponseDescriptor instead')
const RoomHeartbeatResponse$json = const {
  '1': 'RoomHeartbeatResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
  ],
};

/// Descriptor for `RoomHeartbeatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomHeartbeatResponseDescriptor = $convert.base64Decode('ChVSb29tSGVhcnRiZWF0UmVzcG9uc2USDgoCaWQYASABKAlSAmlkEjgKCXRpbWVzdGFtcBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcA==');
@$core.Deprecated('Use acknowledgeRoomRequestDescriptor instead')
const AcknowledgeRoomRequest$json = const {
  '1': 'AcknowledgeRoomRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `AcknowledgeRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acknowledgeRoomRequestDescriptor = $convert.base64Decode('ChZBY2tub3dsZWRnZVJvb21SZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYWRkcmVzcxgCIAEoCVIHYWRkcmVzcw==');
