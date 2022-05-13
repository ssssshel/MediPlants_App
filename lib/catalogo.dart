import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediPlants',
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MediPlants',
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Center(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Noticia(),
          Abuta(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Abuta',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Analgésico dental, tónico cerebral, anemia, colesterol, cólico menstrual, diabetes, dismenorrea, esterilidad femenina, fiebre, hemorragia post-menstrual y post operatoria, paludismo, reumatismo, tifoidea, ulceras estomacales.',
            style: TextStyle(fontSize: 18),
          ),
          Achogchilla(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Achogchilla',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Para combatir la diabetes y también como un Hipoglicemiante y un antimicrobiano. ',
            style: TextStyle(fontSize: 18),
          ),
          Ajosacha(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Ajo Sacha',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Analgésico, tónico reconstituyente, artrítis, dolor de cabeza, epilepsia, fiebre, reumatismo.',
            style: TextStyle(fontSize: 18),
          ),
          Amasisa(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Amasisa',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Tiene propiedades medicinales a través de su corteza y hojas, las cuales son usadas para tratar las úlceras, hemorroides e infecciones urinarias.',
            style: TextStyle(fontSize: 18),
          ),
          Ayahuasca(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Ayahuasca',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Una bebida lisérgica de la medicina tradicional amazónica que se prepara con la mezcla de plantas, se emplea cada vez más en el mundo occidental para tratar la depresión y las adicciones.',
            style: TextStyle(fontSize: 18),
          ),
          Boldo(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Boldo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'El boldo es un arbusto utilizado por los mapuche para tratar diferentes dolencias, como reuma, trastornos digestivos e incluso hepáticos.',
            style: TextStyle(fontSize: 18),
          ),
          BolsaMullaca(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Bolsa Mullaca',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Se utiliza para Acaricida, Diurético, Abscesos, Asma, Diabetes, Helmintiasis, Hepatitis, Inflamaciones, Malaria, Micosis, Otalgias.',
            style: TextStyle(fontSize: 18),
          ),
          Calaguala(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Calaguala',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Antiinflamatorio, con mecanismo de acción similar a los corticosteroides.Inmunomodulador, estimula la acción de los linfocitos T. ',
            style: TextStyle(fontSize: 18),
          ),
          Capirona(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Capirona',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Se utiliza para Cicatrizar, Hemostático, Arrugas,Diabetes, Heridas infectadas, Hongos de la piel,Infecciones oculares, Manchas de la piel, Sarna negra.',
            style: TextStyle(fontSize: 18),
          ),
          Casho(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Casho',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Se utiliza como Analéptico o tónico reconstituyente, Contraceptivo, Queratolítico, Candidiasis, Diabetes, Diarrea, Hemoptisis por tuberculosis, Hemorragia dental, Inflamación vaginal Aplicar duchas vaginales con el cocimiento de la corteza, Ulceras dérmicas.',
            style: TextStyle(fontSize: 18),
          ),
          Cedro(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Cedro',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'Se utiliza para molestias dentales.',
            style: TextStyle(fontSize: 18),
          ),
          ClavoHuasca(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Clavo Huasca',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Reconstituyente y energizante, impotencia, resfriado, reumatismo.',
            style: TextStyle(fontSize: 18),
          ),
          Condurango(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Condurango',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Cicatrizante, reepitelizante en uso externo, Alivio del dolor, Relajante, Antiinflamatorio, Tonico, Carminativo, Hemostático, Antiulceroso, Antiemético, Colagogo, Depurativo, Diaforetico.',
            style: TextStyle(fontSize: 18),
          ),
          Copaiba(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Copaiba',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' posee propiedades antiinflamatorias, cicatrizantes, analgésicas y expectorantes, siendo indicado para ayudar en la cicatrización de heridas, tos o para aliviar los síntomas de la artritis.',
            style: TextStyle(fontSize: 18),
          ),
          CortezaDeQuina(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Corteza de Quina',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'osee diversos alcaloides naturales, entre los que destaca la quinina, que tiene propiedades antipiréticas (disminuye la fiebre), antipalúdicas y analgésicas por lo que fue utilizada para tratar eficazmente enfermedades como la malaria o paludismo..',
            style: TextStyle(fontSize: 18),
          ),
          Curare(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Curare',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'posee propiedades de relajante muscular, es antagonista de re- ceptores nicotínicos. Es un poderoso antiespasmódico usado en convulsiones por estricnina o tétano.',
            style: TextStyle(fontSize: 18),
          ),
          Chancapiedra(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Chanca Piedra',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            'proporciona una serie de beneficios para salud como combatir las piedras en los riñones y proteger el hígado.',
            style: TextStyle(fontSize: 18),
          ),
          ChilcaMalva(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Chilca Malva',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Sirven para la diarrea verde, fracturas óseas, desinflamar y ayudar a la consolidación, calmar dolores reumáticos.',
            style: TextStyle(fontSize: 18),
          ),
          Chuchuhuasi(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Chuchuhuasi',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Es una antibacteriano, antiinflamatorio, Analgésico, diurético, mejora el metabolismo y efecto afrodisiaco.',
            style: TextStyle(fontSize: 18),
          ),
          Eneld(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Text(
                  'Eneldo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                RaisedButton(
                  child: Text("Ver Opciones"),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Text(
            ' Facilita la digestión, Diurético, Refuerza el sistema inmunológico, Alivia los dolores menstruales, Calma las hemorroides.',
            style: TextStyle(fontSize: 18),
          ),
          Eucalipto(),
          Title(
            color: Colors.green,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Eucalipto',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 24),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                RaisedButton(child: Text("Ver Opciones"), onPressed: () => {}),
              ],
            ),
          ),
          Text(
            'La infusión de las hojas adultas de esta planta se emplea en afecciones respiratorias de diversa índole: bronquitis, asma, faringitis, amigdalitis, gripes y resfriados; también para el control de la diabetes, cistitis y vaginitis.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}

Widget Noticia() {
  return Container(
    child: Text(
      'Uso Medicinal',
      style: TextStyle(
          fontSize: 40, color: Colors.lightGreen, fontWeight: FontWeight.bold),
    ),
  );
}

Widget ClavoHuasca() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://ecoonatura.com/wp-content/uploads/2019/02/Clavo-huasca.jpg")),
  );
}

Widget Abuta() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: (Image.network(
        "https://static.inaturalist.org/photos/37321715/large.jpg")),
  );
}

Widget Achogchilla() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://eva.iniap.gob.ec/agro/wp-content/uploads/2018/08/584.jpg")),
  );
}

Widget Ajosacha() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://delamazonas.com/wp-content/uploads/2021/05/Garlic-Vine-Mansoa-alliacea-aka-Ajos-Sacha-in-Kerala-low.jpg")),
  );
}

Widget Amasisa() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/c/cf/Erythrina_fusca.jpg")),
  );
}

Widget Ayahuasca() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://lamenteesmaravillosa.com/wp-content/uploads/2018/07/ayahuasca-liana.jpg")),
  );
}

Widget Boldo() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://www.dosfarma.com/blog/wp-content/uploads/2020/06/Beneficios-del-boldo-_619.jpg")),
  );
}

Widget BolsaMullaca() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://www.curaybienestar.com/wp-content/uploads/2018/09/Propiedades-de-la-bolsa-mullaca.jpg")),
  );
}

Widget Calaguala() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://www.ultimasnoticias.ec/files/article_main/uploads/2016/01/01/2015_06_26_Calaguala.jpg")),
  );
}

Widget Capirona() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://fm-digital-assets.fieldmuseum.org/1514/457/RUBI_capi_deco_bol_807.jpg")),
  );
}

Widget Casho() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://live.staticflickr.com/5046/5236322495_a67fda99b3_b.jpg")),
  );
}

Widget Cedro() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/0/06/Cedrus_atlantica2.jpg")),
  );
}

Widget Condurango() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://plantasyremedios.com/wp-content/uploads/2017/01/propiedades-medicinales-del-Condurango-1-e1485484430241.jpg")),
  );
}

Widget Copaiba() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://www.pebani.com.pe/wp-content/uploads/2018/05/Copaiba_frutos1.png")),
  );
}

Widget CortezaDeQuina() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://storage.googleapis.com/statics-pro-uriach-web/images/corteza-de-quina1.original.jpg")),
  );
}

Widget Curare() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/1/1b/Planta_de_Curare_en_el_Jard%C3%ADn_Bot%C3%A1nico_de_Lima.jpg")),
  );
}

Widget Chancapiedra() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://static.tuasaude.com/media/article/cx/u5/quebra-pedra_713_l.jpg")),
  );
}

Widget ChilcaMalva() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/0/05/Chilca.JPG")),
  );
}

Widget Chuchuhuasi() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://solperunutrition.com/wp-content/uploads/2018/10/CHUCHUHUASI3.jpg")),
  );
}

Widget Eneld() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://www.hola.com/imagenes/estar-bien/20200731172989/eneldo-propiedades-planta-medicinal-gt/0-852-367/eneldo-t.jpg")),
  );
}

Widget Eucalipto() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: (Image.network(
        "https://perudesconocido.pe/wp-content/uploads/2019/07/eucalipto-3-eucalipto.jpg")),
  );
}
