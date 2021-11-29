abstract class IActivity {
  /// Do something before execute the bussiness logic
  void initState() {
    build();
  }

  /// Input your bussiness logic
  void build() {
    dispose();
  }

  ///Handle something action before destroy
  void dispose();
}
