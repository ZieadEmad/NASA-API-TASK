import 'package:flutter_test/flutter_test.dart';
import 'package:mega_task/business_layer/get_next_launch_cubit/cubit.dart';
import 'package:mega_task/data_layer/models/next_launch_model/main_model.dart';
import 'package:mockito/mockito.dart';

class MockCubit extends GetNextLaunchCubit with Mock {}

class MockNextLaunch extends NextLaunchModelTest with Mock {}

void main() {
  group('Test Next Launch Cubit', () {
    test('define next launch object', () {
      var newNextLaunch = MockNextLaunch();
      newNextLaunch.id = 7888885665;
      newNextLaunch.name = 'Rocket1';
      newNextLaunch.type = 'Rocket';

      expect(newNextLaunch.id, 1);
      expect(newNextLaunch.name, 'Rocket1');
      expect(newNextLaunch.type, 'Rocket');
    });
  });
}
