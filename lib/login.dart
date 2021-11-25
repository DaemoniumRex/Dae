//import '../flutter_flow/flutter_flow_theme.dart';
//import '../flutter_flow/flutter_flow_util.dart';
//import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({required Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  late bool passwordVisibility1;
  bool _loadingButton1 = false;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  bool? passwordVisibility2;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility1 = false;
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF330054),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/make-up-brush-with-p-powder-explosion-cavan-images.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 250, 0, 0),
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Color(0xFFFC89F2),
                    unselectedLabelColor: Color(0xFF74026A),
                    
                    
                    tabs: [
                      Tab(
                        text: 'Login',
                      ),
                      Tab(
                        text: 'Registro',
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: TextFormField(
                                  controller: textController1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Correo',
                                    
                                    hintText: 'Tu e-mail aqui...',
                                    
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    
                                  ),
                                  
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: TextFormField(
                                  controller: textController2,
                                  
                                  decoration: InputDecoration(
                                    labelText: 'Clave',
                                    
                                    hintText: 'Tu clave aqui...',
                                    
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility1 =
                                            !passwordVisibility1,
                                      ),
                                      child: Icon(
                                        passwordVisibility1
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Olvidaste tu clave?',
                                  
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 20, 10, 10),
                                child: TextFormField(
                                  controller: textController3,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre',
                                    
                                       
                                     
                                      
                                    
                                    hintText: 'Tu nombre y apellido aqui...',
                                    
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    
                                  ),
                                  
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: TextFormField(
                                  controller: textController4,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    
                                       
                                    hintText: 'Un correo valido aqui',
                                    
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    
                                  ),
                                  
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: TextFormField(
                                  controller: textController5,
                                  obscureText: !passwordVisibility2!,
                                  decoration: InputDecoration(
                                    labelText: 'Clave',
                                    
                                    hintText: '[Some hint text...]',
                                    
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility2 =
                                            !passwordVisibility2!,
                                      ),
                                      child: Icon(
                                        //passwordVisibility2
                                         //   ? Icons.visibility_outlined
                                             Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                               
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.8),
            child: Image.asset(
              'assets/images/glamlogp.png',
              width: 110,
              height: 210,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
