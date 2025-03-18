import '../models/user_model.dart';
import '../models/profile_model.dart';

class AuthService {
  User? _currentUser;
  final List<User> _users = [];

  Future<User?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // Simulation of API call

    _currentUser = _users.firstWhere(
      (user) => user.email == email,
      orElse:
          () => User(
            id: '1',
            email: 'test@example.com',
            username: 'VintageUser',
            isAdmin: false,
            profiles: [
              Profile(
                id: '101',
                name: 'Perfil 1',
                avatarUrl: 'assets/images/user_icon.png',
              ),
              Profile(
                id: '102',
                name: 'Perfil 2',
                avatarUrl: 'assets/images/user_icon.png',
              ),
            ],
          ),
    );

    return _currentUser;
  }

  Future<User> createUser(String email, String username, bool isAdmin) async {
    await Future.delayed(Duration(seconds: 1)); // Simulation of API call

    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: username,
      isAdmin: isAdmin,
      profiles: [],
    );

    _users.add(newUser);
    return newUser;
  }

  User? get currentUser => _currentUser;

  void logout() {
    _currentUser = null;
  }
}
