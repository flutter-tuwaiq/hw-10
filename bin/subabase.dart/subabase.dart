// ignore: depend_on_referenced_packages
import 'package:supabase/supabase.dart';

class subabase {
  final _url = "https://zkpmpmnpdaxrnhtljrrn.supabase.co";
  final _key =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InprcG1wbW5wZGF4cm5odGxqcnJuIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDU5NCwiZXhwIjoxOTk5ODA2NTk0fQ.upnNgeVmp872hQD52pqudVUKpIMfjgeWHoKL_02vTDU";

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
