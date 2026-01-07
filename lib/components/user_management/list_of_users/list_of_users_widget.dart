import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_of_users_model.dart';
export 'list_of_users_model.dart';

/// Kullanıcı Listesi
class ListOfUsersWidget extends StatefulWidget {
  const ListOfUsersWidget({super.key});

  @override
  State<ListOfUsersWidget> createState() => _ListOfUsersWidgetState();
}

class _ListOfUsersWidgetState extends State<ListOfUsersWidget> {
  late ListOfUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfUsersModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Kullanıcı Listesi', style: FlutterFlowTheme.of(context).headlineSmall),
                  ),
                  Expanded(
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.orderBy('created_time', descending: true),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final users = snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemCount: users.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                backgroundImage: user.photoUrl.isNotEmpty 
                                  ? NetworkImage(user.photoUrl) 
                                  : null,
                                onBackgroundImageError: user.photoUrl.isNotEmpty 
                                  ? (_, __) => Icon(Icons.person, color: FlutterFlowTheme.of(context).primary) 
                                  : null,
                                child: user.photoUrl.isEmpty 
                                  ? Icon(Icons.person, color: FlutterFlowTheme.of(context).primary) 
                                  : null,
                              ),
                              title: Text(user.displayName.isNotEmpty ? user.displayName : (user.userName.isNotEmpty ? user.userName : user.email)),
                              subtitle: Text(user.email),
                              trailing: user.isAdmin 
                                  ? Chip(label: Text('Admin', style: TextStyle(color: Colors.white)), backgroundColor: FlutterFlowTheme.of(context).primary)
                                  : null,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: Color(0xFFCED9F5),
          ),
        ),
        child:
            // Kullanıcı listesinin gösterildiği alan
            Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.people_alt,
              color: Color(0xFF2E5BDB),
              size: 24.0,
            ),
            Text(
              'Kullanıcı Listesi',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Color(0xFF2E5BDB),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
