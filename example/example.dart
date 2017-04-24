import 'package:dss/src/generate_css.dart';
import 'package:dss/src/utils/kebabify.dart';

void main() {
  String omg = new GenerateCss(new Kebabify()).generateCssRuleSet('.jackieboy', {
    'color': 'yellow',
    'marginTop': '40%'
  });

  print('Reska: $omg');
}
