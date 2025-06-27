import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProvider extends ChangeNotifier {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  String _nama = '';
  String _email = '';
  // ignore: unused_field
  String _password = '';
  String _jenisKelamin = '';
  String _tanggalLahir = '';
  String _noHp = '';

  // Getter
  String get nama => _nama;
  String get email => _email;
  String get jenisKelamin => _jenisKelamin;
  String get tanggalLahir => _tanggalLahir;
  String get noHp => _noHp;

  // Load user dari SharedPreferences
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _nama = prefs.getString('nama') ?? '';
    _email = prefs.getString('email') ?? '';
    _password = await secureStorage.read(key: 'password') ?? '';
    _jenisKelamin = prefs.getString('jenisKelamin') ?? '';
    _tanggalLahir = prefs.getString('tanggalLahir') ?? '';
    _noHp = prefs.getString('noHp') ?? '';
    notifyListeners();
  }

  // Simpan user saat register
  Future<void> register(
    String name,
    String email,
    String password,
    String jenisKelamin,
    String tanggalLahir,
    String noHp,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', name);
    await prefs.setString('email', email);
    await secureStorage.write(key: 'password', value: password);
    await prefs.setString('jenisKelamin', jenisKelamin);
    await prefs.setString('tanggalLahir', tanggalLahir);
    await prefs.setString('noHp', noHp);

    _nama = name;
    _email = email;
    _password = password;
    _jenisKelamin = jenisKelamin;
    _tanggalLahir = tanggalLahir;
    _noHp = noHp;

    notifyListeners();
  }

  // Login sederhana
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email') ?? '';
    final savedPassword = await secureStorage.read(key: 'password') ?? '';

    if (email == savedEmail && password == savedPassword) {
      _nama = prefs.getString('nama') ?? '';
      _email = savedEmail;
      _password = savedPassword;
      _jenisKelamin = prefs.getString('jenisKelamin') ?? '';
      _tanggalLahir = prefs.getString('tanggalLahir') ?? '';
      _noHp = prefs.getString('noHp') ?? '';
      notifyListeners();
      return true;
    }
    return false;
  }

  // Logout dan bersihkan semua data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nama');
    await prefs.remove('email');
    await secureStorage.delete(key: 'password');
    await prefs.remove('jenisKelamin');
    await prefs.remove('tanggalLahir');
    await prefs.remove('noHp');

    _nama = '';
    _email = '';
    _password = '';
    _jenisKelamin = '';
    _tanggalLahir = '';
    _noHp = '';
    notifyListeners();
  }

  // Update data individual
  Future<void> setNama(String namaBaru) async {
    _nama = namaBaru;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', namaBaru);
    notifyListeners();
  }

  Future<void> setEmail(String emailBaru) async {
    _email = emailBaru;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailBaru);
    notifyListeners();
  }

  Future<void> setPassword(String passwordBaru) async {
    _password = passwordBaru;
    await secureStorage.write(key: 'password', value: passwordBaru);
    notifyListeners();
  }

  Future<void> setJenisKelamin(String jenisKelaminBaru) async {
    _jenisKelamin = jenisKelaminBaru;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jenisKelamin', jenisKelaminBaru);
    notifyListeners();
  }

  Future<void> setTanggalLahir(String tanggalLahirBaru) async {
    _tanggalLahir = tanggalLahirBaru;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tanggalLahir', tanggalLahirBaru);
    notifyListeners();
  }

  Future<void> setNoHp(String noHpBaru) async {
    _noHp = noHpBaru;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('noHp', noHpBaru);
    notifyListeners();
  }

  // Hapus semua data user
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nama');
    await prefs.remove('email');
    await secureStorage.delete(key: 'password');
    await prefs.remove('jenisKelamin');
    await prefs.remove('tanggalLahir');
    await prefs.remove('noHp');
    logout();
  }
}
