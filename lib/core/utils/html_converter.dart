import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

String convert(String htmlString) {
  var unescape = HtmlUnescape();
  var text = unescape.convert(htmlString);
  return text;
}
