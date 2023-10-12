// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MaBaseDeDonnees.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaBaseDeDonneesAdapter extends TypeAdapter<MaBaseDeDonnees> {
  @override
  final int typeId = 1;

  @override
  MaBaseDeDonnees read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaBaseDeDonnees(
      idcategorie: fields[0] as int,
      img: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MaBaseDeDonnees obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.idcategorie)
      ..writeByte(1)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaBaseDeDonneesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
