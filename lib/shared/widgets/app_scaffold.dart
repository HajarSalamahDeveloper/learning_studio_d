import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showAppBar;
  final bool centerTitle;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Widget? bottomSheet;

  const AppScaffold(
      {super.key,
      this.title,
      required this.body,
      this.actions,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.showAppBar = false,
      this.extendBody = false,
      this.centerTitle = true,
      this.resizeToAvoidBottomInset = false,
      this.backgroundColor,
      this.statusBarColor,
      this.bottomSheet});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldWidget(
        showAppBar: showAppBar,
        title: title,
        centerTitle: centerTitle,
        actions: actions,
        body: body,
        extendBody: extendBody,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor);
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget({
    required this.showAppBar,
    required this.title,
    required this.centerTitle,
    required this.actions,
    required this.body,
    required this.extendBody,
    required this.floatingActionButton,
    required this.bottomNavigationBar,
    required this.resizeToAvoidBottomInset,
    required this.backgroundColor,
    this.bottomSheet,
  });

  final bool showAppBar;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget body;
  final Widget? bottomSheet;
  final bool extendBody;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        appBar: showAppBar
            ? AppBar(
                title: Text(title ?? ''),
                centerTitle: centerTitle,
                actions: actions,
              )
            : null,
        body: body,
        extendBody: extendBody,
      
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor,
        bottomSheet: bottomSheet,
      ),
    );
  }
}
