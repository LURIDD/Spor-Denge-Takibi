import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_badge_model.dart';
export 'add_new_badge_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// Yeni Rozet Ekle
class AddNewBadgeWidget extends StatefulWidget {
  const AddNewBadgeWidget({super.key});

  @override
  State<AddNewBadgeWidget> createState() => _AddNewBadgeWidgetState();
}

class _AddNewBadgeWidgetState extends State<AddNewBadgeWidget> {
  late AddNewBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewBadgeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: AddBadgeForm(),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
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
        child:
            // Yeni rozet ekleme alanı
            Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            Text(
              'Yeni Rozet Ekle',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddBadgeForm extends StatefulWidget {
  final BadgesRecord? badgeToEdit;
  const AddBadgeForm({this.badgeToEdit});

  @override
  AppBadgeFormState createState() => AppBadgeFormState();
}

class AppBadgeFormState extends State<AddBadgeForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _criteriaController;
  late TextEditingController _descController;
  late TextEditingController _imageController;
  bool _uploading = false;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() => _uploading = true);
      try {
        final Uint8List fileBytes = await pickedFile.readAsBytes();
        final String fileName =
            'badge_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final Reference storageRef =
            FirebaseStorage.instance.ref().child('badges/$fileName');
        final UploadTask uploadTask = storageRef.putData(
            fileBytes, SettableMetadata(contentType: 'image/jpeg'));

        final TaskSnapshot snapshot = await uploadTask;
        final String downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          _imageController.text = downloadUrl;
          _uploading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Resim yüklendi!')));
      } catch (e) {
        setState(() => _uploading = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Yükleme hatası: $e')));
      }
    }
  }

  final List<String> _presets = [
    'assets/images/water-drop.png',
    'assets/images/fire.png',
    'assets/images/star.png',
    'assets/images/target.png',
    'assets/images/meditation.png',
    'assets/images/running.png',
    'assets/images/training.png',
    'assets/images/stack-of-books.png',
  ];

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.badgeToEdit?.name ?? '');
    _criteriaController =
        TextEditingController(text: widget.badgeToEdit?.criteria ?? '');
    _descController =
        TextEditingController(text: widget.badgeToEdit?.description ?? '');
    _imageController = TextEditingController(
        text: widget.badgeToEdit?.image ?? 'assets/images/water-drop.png');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _criteriaController.dispose();
    _descController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.badgeToEdit != null;
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isEditing ? 'Rozet Düzenle' : 'Yeni Rozet Oluştur',
                  style: FlutterFlowTheme.of(context).headlineSmall),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Rozet Adı', hintText: 'Örn: Su Ustası'),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: (val) => val!.isEmpty ? 'Gerekli' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _criteriaController,
                decoration: InputDecoration(
                    labelText: 'Kriter (Kısa)', hintText: '30 Gün'),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: (val) => val!.isEmpty ? 'Gerekli' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                    labelText: 'Açıklama',
                    hintText: 'Kriter: 30 gün su içme...'),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                    labelText: 'Resim Yolu (Asset/URL)',
                    hintText: 'assets/images/...'),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              SizedBox(height: 10),
              Text('Hazır İkonlar:',
                  style: FlutterFlowTheme.of(context).labelSmall),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _presets.length + 1,
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    if (index == _presets.length) {
                      return InkWell(
                        onTap: () => _uploadImage(),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2),
                            borderRadius: BorderRadius.circular(8),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: _uploading
                              ? Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2)))
                              : Icon(Icons.add_photo_alternate,
                                  color: FlutterFlowTheme.of(context).primary),
                        ),
                      );
                    }
                    final path = _presets[index];
                    return InkWell(
                      onTap: () => setState(() => _imageController.text = path),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _imageController.text == path
                                  ? FlutterFlowTheme.of(context).primary
                                  : Colors.transparent,
                              width: 2),
                          borderRadius: BorderRadius.circular(8),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Image.asset(path, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('İptal'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (isEditing) {
                          await widget.badgeToEdit!.reference
                              .update(createBadgesRecordData(
                            name: _nameController.text,
                            criteria: _criteriaController.text,
                            description: _descController.text,
                            image: _imageController.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Rozet güncellendi!')),
                          );
                        } else {
                          await BadgesRecord.collection
                              .add(createBadgesRecordData(
                            name: _nameController.text,
                            criteria: _criteriaController.text,
                            description: _descController.text,
                            image: _imageController.text,
                            createdTime: DateTime.now(),
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Rozet eklendi!')),
                          );
                        }
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(isEditing ? 'Güncelle' : 'Kaydet'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
