// ignore_for_file: file_names

import 'package:supabase/supabase.dart';

class SupaBAseEnv {
  final _url = 'https://zokdwczqizizohacfltd.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpva2R3Y3pxaXppem9oYWNmbHRkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDY1OSwiZXhwIjoxOTk5ODA2NjU5fQ.0pisarulZPlmxR2aYkdLzJ8uRvaEJxwN9Qb9UXSmL7I';

  SupabaseClient get supaBase {
    final database = SupabaseClient(_url, _key);

    return database;
  }
}
