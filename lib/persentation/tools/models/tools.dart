import 'package:json_annotation/json_annotation.dart';

part 'tools.g.dart';

@JsonSerializable()
class Tools {
  final String assets;
  final String title;
  final int count;

  Tools({
    required this.assets,
    required this.title,
    required this.count,
  });

  factory Tools.fromJson(Map<String, dynamic> json) => _$ToolsFromJson(json);

  Map<String, dynamic> toJson() => _$ToolsToJson(this);

  String get idUnique => title.toLowerCase().replaceAll(' ', '_');

  static List<Tools> jokoTools = [
    Tools(
        assets: 'assets/tools/air_compressor.jpg',
        title: 'Kompresor Udara',
        count: 2),
    Tools(
        assets: 'assets/tools/alan_key_set.jpg', title: 'Kunci Alan', count: 4),
    Tools(assets: 'assets/tools/cutter.jpg', title: 'Pemotong', count: 12),
    Tools(assets: 'assets/tools/hammer.jpg', title: 'Palu', count: 3),
    Tools(
        assets: 'assets/tools/measuring_tape.jpg',
        title: 'Pita Ukur',
        count: 8),
    Tools(assets: 'assets/tools/plier.jpg', title: 'Kunci Tang', count: 15),
    Tools(assets: 'assets/tools/screwdriver.jpg', title: 'Obeng', count: 11),
    Tools(
        assets: 'assets/tools/welding_glasses.jpg',
        title: 'Kacamata Las',
        count: 7),
    Tools(
        assets: 'assets/tools/welding_machine.jpg',
        title: 'Mesin Las',
        count: 3),
    Tools(assets: 'assets/tools/wrench.jpg', title: 'Kunci', count: 6),
  ];
}
