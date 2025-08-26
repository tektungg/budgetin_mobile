import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(obfuscate: true, varName: 'KEY')
  static final String key = _Env.key;

  @EnviedField(obfuscate: true, varName: 'SUPABASE_URL')
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(obfuscate: true, varName: 'SUPABASE_ANON_KEY')
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField(obfuscate: true, varName: 'SUPABASE_GOOGLE_CALLBACK_URL')
  static final String supabaseGoogleCallbackUrl =
      _Env.supabaseGoogleCallbackUrl;

  @EnviedField(obfuscate: true, varName: 'GOOGLE_CLIENT_ID_ANDROID')
  static final String googleClientIdAndroid = _Env.googleClientIdAndroid;

  @EnviedField(obfuscate: true, varName: 'GOOGLE_CLIENT_ID_IOS')
  static final String googleClientIdIos = _Env.googleClientIdIos;
}
