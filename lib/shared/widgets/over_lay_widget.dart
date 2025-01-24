import 'package:flutter/material.dart';

class OverlayService {
  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void showOverlay(BuildContext context, Widget overlayWidget, {Alignment alignment = Alignment.center, Offset? position}) {
    if (_isVisible) return; // Prevent multiple overlays

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            left: position?.dx,
            top: position?.dy,
            child: Material(
              color: Colors.transparent,
              child: Align(
                alignment: alignment,
                child: overlayWidget,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry);
    _isVisible = true;
  }

  static void hideOverlay() {
    if (_isVisible) {
      _overlayEntry.remove();
      _isVisible = false;
    }
  }
}
