import 'package:supabase/supabase.dart';

class SupabaseEnv{
  final _url ='https://syemiceufbemdgjepaoo.supabase.co';
  final _key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5ZW1pY2V1ZmJlbWRnamVwYW9vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDcxOSwiZXhwIjoxOTk5ODA2NzE5fQ.YHWyVtFNznBk6xzzbRZNA_oi7Eo34K1t6PlmBDPJNsQ';

  SupabaseClient get supabase{
    final supabase = SupabaseClient(_url, _key);
    
    return supabase;
  }
}