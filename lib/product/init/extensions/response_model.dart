import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';

extension IResponseModelExt on IResponseModel<dynamic, ProjectErrorModel?> {
  bool get hasError => error != null;
  bool get hasData => data != null;
  bool get hasErrorModel => error != null && error!.model != null;
  bool get connectionError => error != null && error!.model!.noConnection;
  ProjectErrorModel? get errorModel =>
      error != null && error!.model != null ? error!.model : null;

  ResponseType get responseType {
    if (hasData) {
      return ResponseType.hasData;
    } else if (connectionError) {
      return ResponseType.noConnection;
    } else if (hasErrorModel) {
      var errorModel = error!.model!;
      return errorModel.data == null
          ? ResponseType.errorModelWithoutData
          : ResponseType.errorModelWithData;
    } else {
      return ResponseType.unknown;
    }
  }
}

enum ResponseType {
  noConnection,
  errorModelWithoutData,
  errorModelWithData,
  hasData,
  unknown
}
