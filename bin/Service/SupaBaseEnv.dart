
import 'package:supabase/supabase.dart';

class SupaBaseEnv{

  final _url = "https://sxheybuxsfkclphlkbel.supabase.co";
  final _key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN4aGV5YnV4c2ZrY2xwaGxrYmVsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDYyNywiZXhwIjoxOTk5ODA2NjI3fQ.Kom00vgUL2wQ-BFrwk5NRw2Bop8OcbrOd-SUQRWtI3k";

  SupabaseClient get supaBase {

      final supBase = SupabaseClient( _url, _key);

    return supBase;
  }
}
