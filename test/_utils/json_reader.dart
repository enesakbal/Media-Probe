import 'dart:convert';
import 'dart:io';

dynamic readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return jsonDecode(File('$dir/test/_utils/dummy/$name').readAsStringSync());
}
