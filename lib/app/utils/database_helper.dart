import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:technical_test_fast8/app/model/explore-wellness/explore_wellness.dart';
import 'package:technical_test_fast8/app/model/profile/model_profile.dart';

// Import the model class
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _profileDatabase;
  static Database? _wellnessDatabase;

  DatabaseHelper.internal();

  Future<Database> get profileDatabase async {
    if (_profileDatabase != null) return _profileDatabase!;
    _profileDatabase = await initProfileDb();
    return _profileDatabase!;
  }

  Future<Database> get wellnessDatabase async {
    if (_wellnessDatabase != null) return _wellnessDatabase!;
    _wellnessDatabase = await initWellnessDb();
    return _wellnessDatabase!;
  }

  Future<Database> initProfileDb() async {
    String path = join(await getDatabasesPath(), 'user_profile.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profiles(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            tanggalLahir TEXT,
            gender TEXT,
            email TEXT,
            number TEXT,
            pendidikan TEXT,
            status TEXT,
            pathImage TEXT,
            namaUsaha TEXT,
            alamatUsaha TEXT,
            jabatan TEXT,
            lamaBekerja TEXT,
            sumberPendapatan TEXT,
            pendapatanKotorPerTahun TEXT,
            namaBank TEXT,
            cabangBank TEXT,
            nomorRekening TEXT,
            namaPemilikRekening TEXT,
            nik TEXT,
            alamatKTP TEXT,
            provinsi TEXT,
            kotaKabupaten TEXT,
            kecamatan TEXT,
            kelurahan TEXT,
            kodePos TEXT
          )
        ''');
      },
    );
  }

  Future<Database> initWellnessDb() async {
    String path = join(await getDatabasesPath(), 'explore_wellness.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE explore_wellness(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price TEXT,
            imageAssetPath TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertProfile(Profile profile) async {
    Database db = await profileDatabase;
    return await db.insert('profiles', profile.toMap());
  }

  Future<List<Profile>> getProfiles() async {
    Database db = await profileDatabase;
    List<Map<String, dynamic>> maps = await db.query('profiles');
    return List.generate(maps.length, (i) {
      return Profile.fromMap(maps[i]);
    });
  }

  Future<int> updateProfile(Profile profile) async {
    Database db = await profileDatabase;
    return await db.update(
      'profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(int id) async {
    Database db = await profileDatabase;
    return await db.delete(
      'profiles',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertExploreWellness(ExploreWellness exploreWellness) async {
    Database db = await wellnessDatabase;
    return await db.insert('explore_wellness', exploreWellness.toMap());
  }

  Future<List<ExploreWellness>> getExploreWellness() async {
    Database db = await wellnessDatabase;
    List<Map<String, dynamic>> maps = await db.query('explore_wellness');
    return List.generate(maps.length, (i) {
      return ExploreWellness.fromMap(maps[i]);
    });
  }

  Future<int> updateExploreWellness(ExploreWellness exploreWellness) async {
    Database db = await wellnessDatabase;
    return await db.update(
      'explore_wellness',
      exploreWellness.toMap(),
      where: 'id = ?',
      whereArgs: [exploreWellness.id],
    );
  }

  Future<int> deleteExploreWellness(int id) async {
    Database db = await wellnessDatabase;
    return await db.delete(
      'explore_wellness',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
