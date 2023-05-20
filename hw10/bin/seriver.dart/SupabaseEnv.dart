import 'package:supabase/supabase.dart';
class SupabaseEnv{
  final _url ="https://ggxdfwrducfhbvrskdzt.supabase.co";
  final _key="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdneGRmd3JkdWNmaGJ2cnNrZHp0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQyMzA2NTIsImV4cCI6MTk5OTgwNjY1Mn0.0Uj0fJyZgq9ESeYAC6w5eRN4OWk3Lf-hfXgKB-5gQsI";
  SupabaseClient get supabase {
    final supabase=SupabaseClient(_url,_key);
    return supabase;
  }
}