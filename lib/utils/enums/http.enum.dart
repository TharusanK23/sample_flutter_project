enum HttpCodeEnum {
  Ok,
  Created,
  Accepted,
  BadRequest,
  Unauthorized,
  Forbidden,
  NotFound,
  RequestTimeout,
  InternalServerError,
  RefereshTokenReguired
}

extension HttpCodeEnumExtenstion on HttpCodeEnum {
  int get status {
    switch (this) {
      case HttpCodeEnum.Ok:
        return 200;
      case HttpCodeEnum.Created:
        return 201;
      case HttpCodeEnum.Accepted:
        return 202;
      case HttpCodeEnum.BadRequest:
        return 400;
      case HttpCodeEnum.Unauthorized:
        return 401;
      case HttpCodeEnum.Forbidden:
        return 403;
      case HttpCodeEnum.NotFound:
        return 404;
      case HttpCodeEnum.RequestTimeout:
        return 408;
      case HttpCodeEnum.InternalServerError:
        return 500;
      case HttpCodeEnum.RefereshTokenReguired:
        return 410;
      default:
        return 400;
    }
  }
}