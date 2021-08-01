phoneNumberValidator(String value) {
  RegExp regex = new RegExp(r'^(?:[7]9)?[0-9]{9}$');
  if (regex.hasMatch(value))
    return true;
  else
    return false;
}

emailValidator(String value) {
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!regex.hasMatch(value))
    return true;
  else
    return false;
}
