///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $2;
import 'google/protobuf/empty.pb.dart' as $0;
export 'room.pb.dart';

class ChatManagerClient extends $grpc.Client {
  static final _$receiveMessage = $grpc.ClientMethod<$2.User, $2.Message>(
      '/chat.ChatManager/ReceiveMessage',
      ($2.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Message.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$2.Message, $0.Empty>(
      '/chat.ChatManager/SendMessage',
      ($2.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$2.User, $2.ListUser>(
      '/chat.ChatManager/ListUsers',
      ($2.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListUser.fromBuffer(value));
  static final _$exitRoom = $grpc.ClientMethod<$2.User, $0.Empty>(
      '/chat.ChatManager/ExitRoom',
      ($2.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  ChatManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$2.Message> receiveMessage($2.User request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$receiveMessage, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> sendMessage($2.Message request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseStream<$2.ListUser> listUsers($2.User request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> exitRoom($2.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$exitRoom, request, options: options);
  }
}

abstract class ChatManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatManager';

  ChatManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.User, $2.Message>(
        'ReceiveMessage',
        receiveMessage_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.User.fromBuffer(value),
        ($2.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Message, $0.Empty>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Message.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.User, $2.ListUser>(
        'ListUsers',
        listUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.User.fromBuffer(value),
        ($2.ListUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.User, $0.Empty>(
        'ExitRoom',
        exitRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.User.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Stream<$2.Message> receiveMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$2.User> request) async* {
    yield* receiveMessage(call, await request);
  }

  $async.Future<$0.Empty> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Message> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$2.ListUser> listUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$2.User> request) async* {
    yield* listUsers(call, await request);
  }

  $async.Future<$0.Empty> exitRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$2.User> request) async {
    return exitRoom(call, await request);
  }

  $async.Stream<$2.Message> receiveMessage(
      $grpc.ServiceCall call, $2.User request);
  $async.Future<$0.Empty> sendMessage(
      $grpc.ServiceCall call, $2.Message request);
  $async.Stream<$2.ListUser> listUsers($grpc.ServiceCall call, $2.User request);
  $async.Future<$0.Empty> exitRoom($grpc.ServiceCall call, $2.User request);
}
