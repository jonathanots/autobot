abstract class IActivity {
  late dynamic args;
  void start([dynamic arguments]) {
    args = arguments;
  }

  /// Do something before execute the bussiness logic
  void initState() {}

  /// Input your bussiness logic
  void build() {}

  ///Handle something action before destroy
  void dispose();
}
