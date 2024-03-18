import 'package:shared_preferences/shared_preferences.dart';

// UserPreferences is a Singleton class that manages user preferences.
class UserPreferences {
  // _instance is a static instance of UserPreferences, initially null.
  static UserPreferences? _instance;

  // Private constructor.
  UserPreferences._internal();

  // Getter for the instance of UserPreferences.
  // If _instance is null, it initializes _instance before returning it.
  static UserPreferences get instance {
    if (_instance == null) {
      _instance = UserPreferences._internal();
    }
    return _instance!;
  }

  // _preferences is an instance of SharedPreferences to store and retrieve data.
  late SharedPreferences _preferences;

  // init is a method to initialize SharedPreferences.
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Getter for the username preference.
  // If the username is not set, it returns an empty string.
  String get username => _preferences.getString('username') ?? '';

  // Setter for the username preference.
  set username(String value) {
    _preferences.setString('username', value);
  }
}