class ServicesURLs {
  static const development_environment = "https://vrooomtech.com/";
  static const development_environment_without_http = "vrooomtech.com";
  static const development_environment_scheme = 'https';

  //Auth endPoints
  static const LOGIN = "api/v1/client/login";
  static const REGISTER = "api/v1/client/register";
  static const FORGET_PASSWORD = "api/v1/client/reset";
  static const RESET_PASSWORD = "api/v1/client/newpassword";

  //Home endPoints
  static const TRUCK_TYPES = "api/v1/truck_types";

  //orders endPoints
  static const ADD_ORDER = "api/v1/client/new_order";
  static const GET_ORDER = "api/v1/client/get_order";
  static const EDIT_ORDER = "api/v1/client/edit_order";
  static const ALL_ORDER = "api/v1/client/orders";

}
