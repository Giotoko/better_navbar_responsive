
import 'better_navbar_responsive_platform_interface.dart';

class BetterNavbarResponsive {
  Future<String?> getPlatformVersion() {
    return BetterNavbarResponsivePlatform.instance.getPlatformVersion();
  }

  Future<int> getNavBarHeight() async{
    return await BetterNavbarResponsivePlatform.instance.getNavBarHeight();
  }
}
