import '/flutter_flow/flutter_flow_util.dart';
import 'live_video_widget.dart' show LiveVideoWidget;
import 'package:flutter/material.dart';

class LiveVideoModel extends FlutterFlowModel<LiveVideoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
