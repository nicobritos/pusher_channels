import 'package:pusher_dart/pusher_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Channel', () {
    final channel = Channel(name: 'channel-name');

    setUp(() {});

    test('bind and handleEvent', () {
      var value = '';
      channel.bind('event-name', (data) {
        value = 'event with data $data has been executed';
      });
      channel.handleEvent('event-name', {'key': 'value'});
      expect(value, 'event with data {key: value} has been executed');
    });

    test('bindGlobal', () {
      var value = '';
      channel.bindGlobal((eventName, data) {
        value = 'event $eventName with data $data has been executed';
      });
      channel.handleEvent('event-name', {'key': 'value'});
      expect(
        value,
        'event event-name with data {key: value} has been executed',
      );
    });
  });
}
