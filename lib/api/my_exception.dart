class MyException implements Exception{

  String? heading;
  String? msg;

  MyException({this.heading,this.msg});
  String toString(){
    return '$heading :$msg';
  }
}

class UnauthorisedException extends MyException{
  UnauthorisedException(String msg)
      :super(heading: 'Unauthorised Exception',msg: msg);
}

class FetchDataException extends MyException{
  FetchDataException(String msg):super(heading: "DataException",msg: msg);
}

class BadRequestException extends MyException{
  BadRequestException(String msg):super(heading: "BadRequestException",msg: msg);
}

class InvalidInputException extends MyException{
  InvalidInputException(String msg):super(heading: "Invalid input Exception",msg: msg);
}