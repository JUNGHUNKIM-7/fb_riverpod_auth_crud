enum SnackBarType { success, failed }

enum AuthLayoutType { login, logout, create }

enum AuthInputType { email, password, name, address }

enum StateNotifierType { darkMode }

enum CrudButtonType { create, update, delete }

enum CollTypes {
  user(val: "user"),
  post(val: "post");

  const CollTypes({
    required String val,
  }) : _val = val;
  final String _val;

  String get value => _val;
}
