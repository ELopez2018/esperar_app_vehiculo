import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class SocketService {
  late StompClient client;

  Future init(String socketUrl) async {
    client = StompClient(
        config: StompConfig.sockJS(
            url: socketUrl,
            onStompError: (p0) {
              print(p0);
            },
            onConnect: (StompFrame connectFrame) {
              print('client connect .....................');
            }));
    client.activate();
  }

  StompClient getStompClient() => client;
}
