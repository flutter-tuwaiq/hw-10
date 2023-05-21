import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = 'https://tdejkmpjhcbazdcdymgw.supabase.co';
  final _key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRkZWprbXBqaGNiYXpkY2R5bWd3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzNjU5MiwiZXhwIjoxOTk5ODEyNTkyfQ.da60pCXOfhYWfaHJ6hJgAD41-VUWukdvxzXRtrZgYHU';


  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}


