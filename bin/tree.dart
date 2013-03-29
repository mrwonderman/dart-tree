import 'dart:io';
import 'dart:async';

void main() {
  List<String> arguments = (new Options()).arguments;
  if(arguments.isEmpty){
  print("no directory selected.. \ntry : ./dart.exe tree.dart folder");
  } else {
    Directory dir = new Directory.fromPath(new Path(arguments.first));
    print(dir.path);
    Stream s = dir.list(recursive:true);
    s.listen((value) {
      if(value is File){
        File file = value;
        Path p = new Path(file.path);
        String s = p.filename;
        print(" \\-$s");
      } else if(value is Directory){
        Directory d = value;
        Path p = new Path(d.path);
        String s = d.path;
        print("-$s");
      }
    });
  }
}