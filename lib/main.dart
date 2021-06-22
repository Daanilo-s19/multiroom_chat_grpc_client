import 'package:aplication_flutter_grpc/services.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  GrpcServicesClient client = GrpcServicesClient(ClientChannel(
      'todoworld.servicestack.net',
      port: 50054,
      options: ChannelOptions(credentials: ChannelCredentials.insecure())));

  void _callGrpcService() async {
    var response = await client.getHello(Hello()..name = "Flutter gRPC");
    setState(() {
      result = response.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'gRPC Service Example:',
            ),
            Text(
              '$result',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callGrpcService,
        tooltip: 'gRPC Service Example',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
