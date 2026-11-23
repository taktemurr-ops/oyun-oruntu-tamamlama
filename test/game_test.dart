import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_oruntu_tamamlama/oyun_oruntu_tamamlama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(oruntuConfig.title.length, 33);
    expect(oruntuConfig.tagline.length, 33);
    for (final s in oruntuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(oruntuConfig.gameId, oruntuId);
    expect(oruntuRules.gameId, oruntuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(oruntuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: oruntuId, optionalMechanics: oruntuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(oruntuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
