import 'package:protection_app/app/core/hive/hive.dart';
import 'package:protection_app/app/data/models/local/local_media_model.dart';

class LocalMediaRepository {
  Future<void> create(LocalMediaModel model) async {
    try {
      await mediaBox.put(model.key, model);
    } catch (e) {
      throw Exception(e);
    }
  }

  LocalMediaModel getAll() {
    try {
      var localMediaModel = mediaBox.get('media');
      if (localMediaModel != null) {
        return localMediaModel;
      }
      return LocalMediaModel();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(LocalMediaModel model) async {
    try {
      await mediaBox.put(model.key, model);
    } catch (e) {
      throw Exception(e);
    }
  }
}
