import 'package:dss/src/utils/kebabify.dart';
import 'package:dss/src/utils/unitless_prop.dart';

class GenerateCss {
  final Kebabify kebabify;
  GenerateCss(this.kebabify);
  String generateCssRuleSet(String selector, Map<String, Object> declarations) {
    List<String> rules = _getRules(selector, declarations);

    return '${selector}:{${rules.join('')}}';
  }

  List<String> _getRules(String selector, Map<String, Object> declarations) {
    return declarations.keys.fold(<String>[], (List<String> acc, String key) {
      Object value = declarations[key];
      acc.add(transformRule(key, value, stringifyValue));
      return acc;
    });
  }
  String transformRule(String key, String value, Function transformValue) {
    return '${kebabify.process(key)}:${transformValue(key, value)};';
  }

  String stringifyValue(
    String key,
    Object prop
  ) {
    if (prop is num) {
      if (unitlessProps[key]) {
          return "$prop";
      } else {
          return "${prop}px";
      }
    } else {
        return '$prop';
    }
  }
}
