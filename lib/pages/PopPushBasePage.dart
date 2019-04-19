import 'package:flutter/material.dart';

/// 监听路由状态，需要配置到MaterialApp中navigatorObservers中才有效果
/// 例如：
///  void main() {
///  runApp(MaterialApp(
///    home: Container(),
///    navigatorObservers: [routeObserver],
///  ));
/// }
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

/// 监听当前界面Pop和Push的事件
abstract class PopPushBasePageState<T extends StatefulWidget> extends State<StatefulWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    // 子类重写该方法即可监听到该界面显示到前台中
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    // 子类重写该方法即可监听到前一个界面Pop出去，该界面再次显示到前台中
  }
}
