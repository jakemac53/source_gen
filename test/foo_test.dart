import 'dart:async';
import 'package:analyzer/src/generated/element.dart';
import 'package:source_gen/source_gen.dart';

main(List<String> args) {
  build(args, [new IssueGenerator()],
      librarySearchPaths: ['test/foo_test.dart']);
}

class IssueGenerator extends Generator {
  IssueGenerator();

  Future<String> generate(Element element) async {
    if (element is ClassElement && element.isAbstract) {
      element.methods.forEach((m) => print(m.name + ':' + m.node.toString()));
    }

    return null;
  }
}

abstract class _JsFoo {
  String m1() => null;
  m2();
}
