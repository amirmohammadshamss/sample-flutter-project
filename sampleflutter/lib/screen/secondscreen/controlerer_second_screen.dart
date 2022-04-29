import 'package:sampleflutter/service/web_service_album.dart';
import 'package:sampleflutter/models/album.dart';

class ControlereSencondScreen {
  WebServiceAlbum webServiceAlbum = WebServiceAlbum();

  Future<Album> getAlbum(text) {
    return webServiceAlbum.createAlbumServise(text);
  }
}
