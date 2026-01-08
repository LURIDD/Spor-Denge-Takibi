import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_goal_page_new_model.dart';
export 'add_new_goal_page_new_model.dart';

/// Yeni Hedef Ekle (yeni)
class AddNewGoalPageNewWidget extends StatefulWidget {
  const AddNewGoalPageNewWidget({super.key});

  static String routeName = 'AddNewGoalPageNew';
  static String routePath = '/addNewGoalPageNew';

  @override
  State<AddNewGoalPageNewWidget> createState() =>
      _AddNewGoalPageNewWidgetState();
}

class _AddNewGoalPageNewWidgetState extends State<AddNewGoalPageNewWidget> {
  late AddNewGoalPageNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewGoalPageNewModel());

    _model.hedefMiktariTextTextController ??= TextEditingController();
    _model.hedefMiktariTextFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 24.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).customGrey,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(HomePageWidget.routeName);
                        },
                      ),
                      Text(
                        'Yeni Hedef Ekle',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return [
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Su İçme';
                                  _model.selectedGoalUnitMsr = 'Litre';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedGoalType == 'Su İçme'
                                        ? FlutterFlowTheme.of(context)
                                            .addNewGoalPageSelectedFillColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: _model.selectedGoalType ==
                                              'Su İçme'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/water.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Su İçme',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Egzersiz';
                                  _model.selectedGoalUnitMsr = 'Dakika';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedGoalType == 'Egzersiz'
                                        ? FlutterFlowTheme.of(context)
                                            .addNewGoalPageSelectedFillColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: _model.selectedGoalType ==
                                              'Egzersiz'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/training.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Egzersiz',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Meditasyon';
                                  _model.selectedGoalUnitMsr = 'Dakika';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        _model.selectedGoalType == 'Meditasyon'
                                            ? FlutterFlowTheme.of(context)
                                                .addNewGoalPageSelectedFillColor
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: _model.selectedGoalType ==
                                              'Meditasyon'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/meditation.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Meditasyon',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Kitap Okuma';
                                  _model.selectedGoalUnitMsr = 'Sayfa';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        _model.selectedGoalType == 'Kitap Okuma'
                                            ? FlutterFlowTheme.of(context)
                                                .addNewGoalPageSelectedFillColor
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: _model.selectedGoalType ==
                                              'Kitap Okuma'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/stack-of-books.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Kitap Okuma',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Uyku';
                                  _model.selectedGoalUnitMsr = 'Saat';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedGoalType == 'Uyku'
                                        ? FlutterFlowTheme.of(context)
                                            .addNewGoalPageSelectedFillColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: _model.selectedGoalType == 'Uyku'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/sleeping.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Uyku',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                          () => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedGoalType = 'Özel Hedef';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        _model.selectedGoalType == 'Özel Hedef'
                                            ? FlutterFlowTheme.of(context)
                                                .addNewGoalPageSelectedFillColor
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: _model.selectedGoalType ==
                                              'Özel Hedef'
                                          ? FlutterFlowTheme.of(context)
                                              .addNewGoalPageSelectedBorderColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/star.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          cacheWidth: 200,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Text(
                                        'Özel Hedef',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                        ][index]();
                      },
                    ),
                  ),
                  if (_model.selectedGoalType == 'Özel Hedef') ...[
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Özel Hedef Adı',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                ),
                          ),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.customGoalNameTextController,
                              focusNode: _model.customGoalNameFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Örn: Gitar Çalışması',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).textFieldColor,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .customGoalNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Text(
                            'Ölçü Birimi',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: DropdownButtonFormField<String>(
                                initialValue: _model.selectedGoalUnitMsr,
                                items: [
                                  'Adet',
                                  'Dakika',
                                  'Saat',
                                  'Litre',
                                  'Sayfa',
                                  'Km',
                                  'Defa'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.selectedGoalUnitMsr = val),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 12.0),
                                ),
                                dropdownColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                hint: Text(
                                  'Birim Seçiniz...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Hedef İkonu',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                alignment: WrapAlignment.start,
                                children: [
                                  'assets/images/star.png',
                                  'assets/images/water-drop.png',
                                  'assets/images/fire.png',
                                  'assets/images/training.png',
                                  'assets/images/meditation.png',
                                  'assets/images/stack-of-books.png',
                                  'assets/images/sleeping.png',
                                  'assets/images/running.png',
                                  'assets/images/target.png',
                                ].map((iconPath) {
                                  final isSelected =
                                      _model.selectedIconPath == iconPath;
                                  return InkWell(
                                    onTap: () {
                                      safeSetState(() {
                                        _model.selectedIconPath = iconPath;
                                      });
                                    },
                                    child: Container(
                                      width: 44.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                                .withOpacity(0.2)
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: isSelected
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          width: 2.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(6.0),
                                      child: Image.asset(
                                        iconPath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ],
                  if (_model.selectedGoalType !=
                      'Özel Hedef') // Sadece özel hedef değilse miktar etiketini göster (genellikle miktar her zaman gereklidir)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hedef Miktarı',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller:
                                        _model.hedefMiktariTextTextController,
                                    focusNode: _model.hedefMiktariTextFocusNode,
                                    autofocus: false,
                                    enabled: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Örn: 8',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldColor,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .hedefMiktariTextTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  () {
                                    if (_model.selectedGoalType == 'Su İçme') {
                                      return 'Litre';
                                    } else if ((_model.selectedGoalType ==
                                            'Egzersiz') ||
                                        (_model.selectedGoalType ==
                                            'Meditasyon')) {
                                      return 'Dakika';
                                    } else if (_model.selectedGoalType ==
                                        'Kitap Okuma') {
                                      return 'Sayfa';
                                    } else if (_model.selectedGoalType ==
                                        'Uyku') {
                                      return 'Saat';
                                    } else if (_model.selectedGoalType ==
                                        'Vitamin/İlaç') {
                                      return 'Adet';
                                    } else if (_model.selectedGoalType ==
                                        'Özel Hedef') {
                                      return _model.selectedGoalUnitMsr ??
                                          'Birim'; // Dynamic unit for custom goal
                                    } else {
                                      return 'Litre';
                                    }
                                  }(),
                                  'Litre',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    )
                  else
                    // When Custom Goal is selected, we still need the Amount field, just maybe labeled differently or positioned.
                    // Actually, let's keep the amount field ALWAYS visible, but the unit label logic (above) handles the text.
                    // The conditional `if (_model.selectedGoalType != 'Özel Hedef')` above was a mistake in my thought process while typing.
                    // I should keep the Amount field visible for ALL types.
                    // Let me correct the ReplacementContent to just INSERT the Custom Fields BEFORE the Amount field, and keep Amount field for everyone.
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hedef Miktarı',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller:
                                        _model.hedefMiktariTextTextController,
                                    focusNode: _model.hedefMiktariTextFocusNode,
                                    autofocus: false,
                                    enabled: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Örn: 8',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldColor,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .hedefMiktariTextTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  () {
                                    if (_model.selectedGoalType == 'Su İçme') {
                                      return 'Litre';
                                    } else if ((_model.selectedGoalType ==
                                            'Egzersiz') ||
                                        (_model.selectedGoalType ==
                                            'Meditasyon')) {
                                      return 'Dakika';
                                    } else if (_model.selectedGoalType ==
                                        'Kitap Okuma') {
                                      return 'Sayfa';
                                    } else if (_model.selectedGoalType ==
                                        'Uyku') {
                                      return 'Saat';
                                    } else if (_model.selectedGoalType ==
                                        'Vitamin/İlaç') {
                                      return 'Adet';
                                    } else if (_model.selectedGoalType ==
                                        'Özel Hedef') {
                                      return _model.selectedGoalUnitMsr ??
                                          'Birim';
                                    } else {
                                      return 'Litre';
                                    }
                                  }(),
                                  'Litre',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // Custom Goal Validation
                        bool isCustomGoal =
                            _model.selectedGoalType == 'Özel Hedef';
                        bool isCustomGoalValid = !isCustomGoal ||
                            (_model.customGoalNameTextController.text
                                    .isNotEmpty &&
                                _model.selectedGoalUnitMsr != null &&
                                _model.selectedIconPath != null);

                        if ((_model.selectedGoalType != null &&
                                _model.selectedGoalType != '') &&
                            (_model.hedefMiktariTextTextController.text !=
                                '') &&
                            isCustomGoalValid) {
                          String finalGoalName = isCustomGoal
                              ? _model.customGoalNameTextController.text
                              : _model.selectedGoalType!;
                          String? finalIconPath;

                          if (isCustomGoal) {
                            finalIconPath = _model.selectedIconPath;
                          } else {
                            // Map default icons for standard goals
                            if (_model.selectedGoalType == 'Su İçme')
                              finalIconPath = 'assets/images/water.png';
                            else if (_model.selectedGoalType == 'Egzersiz')
                              finalIconPath = 'assets/images/training.png';
                            else if (_model.selectedGoalType == 'Meditasyon')
                              finalIconPath = 'assets/images/meditation.png';
                            else if (_model.selectedGoalType == 'Kitap Okuma')
                              finalIconPath =
                                  'assets/images/stack-of-books.png';
                            else if (_model.selectedGoalType == 'Uyku')
                              finalIconPath = 'assets/images/sleeping.png';
                          }

                          // Check for duplicate goals
                          final existingGoals =
                              await UserGoalsRecord.collection(
                                      currentUserReference)
                                  .where('goalName', isEqualTo: finalGoalName)
                                  .get();

                          if (existingGoals.docs.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Bu hedef zaten listenizde mevcut!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFFD63636),
                              ),
                            );
                            return;
                          }

                          await UserGoalsRecord.createDoc(currentUserReference!)
                              .set({
                            ...createUserGoalsRecordData(
                              goalName: finalGoalName,
                              goalAmount: double.tryParse(
                                  _model.hedefMiktariTextTextController.text),
                              ownerRef: currentUserReference,
                              isCompleted: false,
                              goalUnitMeasurement: _model.selectedGoalUnitMsr,
                              iconPath: finalIconPath,
                            ),
                            ...mapToFirestore(
                              {
                                'createdAt': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isCustomGoal && _model.selectedIconPath == null
                                    ? 'Lütfen bir ikon seçin!'
                                    : 'Lütfen tüm alanları doldurun!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFFD63636),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 30.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(-1.0, 0.0),
                            end: AlignmentDirectional(1.0, 0),
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            Text(
                              'Hedefi Başlat',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .lightTextAndIconColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
