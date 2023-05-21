import 'package:supabase/supabase.dart';

class EnvSupabase {
  final _url = 'https://abztaxrlmeshodancbpd.supabase.co';
  final _key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFienRheHJsbWVzaG9kYW5jYnBkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDcyOSwiZXhwIjoxOTk5ODA2NzI5fQ.ELHbLxCmiwGEpT-ezz-Shi3oomSeIeneTiobLzFjNnY';


    SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
}

}