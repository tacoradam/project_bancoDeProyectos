import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/project_service.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);
    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: Stack(children: [
        Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 7.5),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            projectService.selectedProject.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Monserrat',
                              fontSize: 24,
                              color: Colors.purple[800],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Text(
                          projectService.selectedProject.decription,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Monserrat',
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                          maxLines: 12,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: FadeInImage(
                            height: 75,
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: AssetImage(
                                'assets/${projectService.selectedProject.category}'),
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _viewContact(
              context,
              projectService.selectedProject.contact,
              projectService.selectedProject.email,
              projectService.selectedProject.web),
          child: Icon(Icons.contact_mail)),
    );
  }

  _viewContact(BuildContext context, String? tel, String? email, String? web) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "Conectate con este proyecto!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 22,
                color: Colors.purple[800],
              ),
            ),
            content: Column(
              //Para que se adapte el largo al contenido que tiene:
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(height: 25),
                    Text(
                      "Teléfono: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(tel!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Email: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(email!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Web: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(web!),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              // TextButton(
              //     onPressed: () => Navigator.of(context).pop(),
              //     child:
              //         Text('Cancelar', style: TextStyle(color: Colors.black))),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monserrat',
                      fontSize: 18,
                      color: Colors.purple[800],
                    ),
                  )),
            ],
          );
        });
  }
}