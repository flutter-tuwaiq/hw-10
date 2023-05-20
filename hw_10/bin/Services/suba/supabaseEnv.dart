import 'package:supabase/supabase.dart';

class SupaBaseEnv {
  final _url = 'https://bppfzmzyrmxqnwflmqzl.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJwcGZ6bXp5cm14cW53ZmxtcXpsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDY2MCwiZXhwIjoxOTk5ODA2NjYwfQ._NRDt2bQfxjpCyTSMXYrzXWpt6NGGyFjj7gpt0psZ3o';

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
