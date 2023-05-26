// ignore_for_file: file_names

import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = "https://pymlptbocdgfrpgompeu.supabase.co";
  final _key =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB5bWxwdGJvY2RnZnJwZ29tcGV1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDk4MSwiZXhwIjoxOTk5ODA2OTgxfQ.xT7rAbGXfJr5jNps_Uw2ovDEXQfPwThkojaNl3wucEk";

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
