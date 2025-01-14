
class AppExceptions implements Exception{
  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);
}


class InterNetException extends AppExceptions{
  InterNetException([String? message]):super(message,'No internet');
}

class ServerException extends AppExceptions{
  ServerException([String? message]):super(message,'Internal server error');
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]):super(message,'');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time out') ;
}

class BadRequestException extends AppExceptions {
  final dynamic errorResponse;
  BadRequestException([this.errorResponse])
      : super(errorResponse.toString(), 'Invalid Request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}