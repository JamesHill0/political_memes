import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as EsysFlutterShare;

class ShareMeme {
  String memeUrl;

  void shareMeme(String url) async {
    memeUrl = url;
    http.Response response = await http.get(memeUrl);
    var bytes = response.bodyBytes;
    await EsysFlutterShare.Share.file("Meme", "Meme.png", bytes, 'image/png');
  }
}

class SaveMeme {
  var filePath;
  String memeUrl;

  void saveMeme(String url) async {
    memeUrl = url;
    var response = await http.get(memeUrl);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }
}
