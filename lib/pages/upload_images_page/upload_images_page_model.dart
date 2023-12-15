import '/flutter_flow/flutter_flow_util.dart';
import 'upload_images_page_widget.dart' show UploadImagesPageWidget;
import 'package:flutter/material.dart';

class UploadImagesPageModel extends FlutterFlowModel<UploadImagesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

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
