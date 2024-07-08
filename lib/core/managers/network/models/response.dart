import '../../../base/base_response_model.dart';
import 'error.dart';

abstract class IResponse<T extends BaseResponseModel> {
  final T? response;
  final IError? error;
  final List<T>? responseList;

  IResponse({
    this.response,
    this.responseList,
    this.error,
  });

  void data({
    Function(T)? onSucces,
    Function(List<T>)? onSuccesList,
    required Function(IError) onError,
  }) {
    if (response != null) {
      onSucces!(response!);
    } else if (responseList != null) {
      onSuccesList!(responseList!);
    } else {
      onError(error!);
    }
  }
}

class Response<T extends BaseResponseModel> extends IResponse<T> {
  Response({
    super.response,
    super.responseList,
    super.error,
  });
}
