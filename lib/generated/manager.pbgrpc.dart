///
//  Generated code. Do not modify.
//  source: manager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'manager.pb.dart' as $1;
export 'manager.pb.dart';

class RoomManagerClient extends $grpc.Client {
  static final _$listRoom = $grpc.ClientMethod<$0.Empty, $1.ListRoomResponse>(
      '/chat.RoomManager/ListRoom',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListRoomResponse.fromBuffer(value));
  static final _$acknowledgeRoom =
      $grpc.ClientMethod<$1.AcknowledgeRoomRequest, $1.Room>(
          '/chat.RoomManager/AcknowledgeRoom',
          ($1.AcknowledgeRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Room.fromBuffer(value));
  static final _$roomHeartbeat =
      $grpc.ClientMethod<$1.RoomHeartbeatRequest, $1.RoomHeartbeatResponse>(
          '/chat.RoomManager/RoomHeartbeat',
          ($1.RoomHeartbeatRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.RoomHeartbeatResponse.fromBuffer(value));
  static final _$closeRoom = $grpc.ClientMethod<$1.Room, $0.Empty>(
      '/chat.RoomManager/CloseRoom',
      ($1.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  RoomManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ListRoomResponse> listRoom($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.Room> acknowledgeRoom(
      $1.AcknowledgeRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acknowledgeRoom, request, options: options);
  }

  $grpc.ResponseStream<$1.RoomHeartbeatResponse> roomHeartbeat(
      $1.RoomHeartbeatRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$roomHeartbeat, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> closeRoom($1.Room request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$closeRoom, request, options: options);
  }
}

abstract class RoomManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.RoomManager';

  RoomManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListRoomResponse>(
        'ListRoom',
        listRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AcknowledgeRoomRequest, $1.Room>(
        'AcknowledgeRoom',
        acknowledgeRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AcknowledgeRoomRequest.fromBuffer(value),
        ($1.Room value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.RoomHeartbeatRequest, $1.RoomHeartbeatResponse>(
            'RoomHeartbeat',
            roomHeartbeat_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $1.RoomHeartbeatRequest.fromBuffer(value),
            ($1.RoomHeartbeatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Room, $0.Empty>(
        'CloseRoom',
        closeRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Room.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.ListRoomResponse> listRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listRoom(call, await request);
  }

  $async.Future<$1.Room> acknowledgeRoom_Pre($grpc.ServiceCall call,
      $async.Future<$1.AcknowledgeRoomRequest> request) async {
    return acknowledgeRoom(call, await request);
  }

  $async.Stream<$1.RoomHeartbeatResponse> roomHeartbeat_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RoomHeartbeatRequest> request) async* {
    yield* roomHeartbeat(call, await request);
  }

  $async.Future<$0.Empty> closeRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Room> request) async {
    return closeRoom(call, await request);
  }

  $async.Future<$1.ListRoomResponse> listRoom(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Room> acknowledgeRoom(
      $grpc.ServiceCall call, $1.AcknowledgeRoomRequest request);
  $async.Stream<$1.RoomHeartbeatResponse> roomHeartbeat(
      $grpc.ServiceCall call, $1.RoomHeartbeatRequest request);
  $async.Future<$0.Empty> closeRoom($grpc.ServiceCall call, $1.Room request);
}
