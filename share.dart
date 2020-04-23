import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as EsysFlutterShare;

void shareMeme(String url) async {
  http.Response response = await http.get(url);
  var bytes = response.bodyBytes;
  await EsysFlutterShare.Share.file("Meme", "Meme.png", bytes, 'image/png');
}

void saveMeme(String url) async {
  var response = await http.get(url);
  await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
}
