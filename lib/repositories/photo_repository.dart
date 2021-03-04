import 'package:social_media/models/photo_model.dart';
import 'package:social_media/services/photo_server.dart';

class PhotoRepository {
  PhotoService server = PhotoService();
  Future<List<PhotoModel>> photoList() async => server.getPhoto();
}
