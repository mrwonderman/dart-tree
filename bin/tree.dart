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
        StringBuffer sb = new StringBuffer();
        
        Iterable<Match> matchs = new RegExp("/").allMatches(p.toString());
        int id = matchs.length;
        for (int i = 1; i < id; i++) {
          sb.write(" ");
        }
        sb.write("\\-$s");
        
        String finalString = sb.toString();
        print("$finalString");
      
      } else if(value is Directory){
        Directory d = value;
        Path p = new Path(d.path);
        String s = d.path;
        String name = p.filename;
        Iterable<Match> matchs = new RegExp("/").allMatches(s);
        int id = matchs.length;
        
        StringBuffer sb = new StringBuffer();
        
        for (int i = 0; i < id; i++) {
          sb.write(" ");
        }
        sb.write("$name");

        String finalString = sb.toString();
        
        print("$finalString");
      }
    });
  }
}