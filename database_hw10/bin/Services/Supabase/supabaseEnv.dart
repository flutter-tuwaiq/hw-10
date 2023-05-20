import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = 'https://vcbyprxyzisvfbuxxeib.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjYnlwcnh5emlzdmZidXh4ZWliIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMTEzMCwiZXhwIjoxOTk5ODA3MTMwfQ.0DBoHkZzsouVN52X3W5b5RVmduxltqTci8qpnvHekEA';

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
