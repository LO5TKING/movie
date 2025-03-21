// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      id: fields[0] as String,
      url: fields[1] as String,
      primaryTitle: fields[2] as String,
      originalTitle: fields[3] as String,
      type: fields[4] as String,
      description: fields[5] as String,
      primaryImage: fields[6] as String,
      contentRating: fields[7] as String,
      startYear: fields[8] as int,
      releaseDate: fields[9] as String,
      interests: (fields[10] as List).cast<String>(),
      countriesOfOrigin: (fields[11] as List).cast<String>(),
      externalLinks: (fields[12] as List).cast<String>(),
      spokenLanguages: (fields[13] as List).cast<String>(),
      filmingLocations: (fields[14] as List).cast<String>(),
      budget: fields[15] as double,
      grossWorldwide: fields[16] as double,
      genres: (fields[17] as List).cast<String>(),
      isAdult: fields[18] as bool,
      runtimeMinutes: fields[19] as int,
      averageRating: fields[20] as double,
      numVotes: fields[21] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.primaryTitle)
      ..writeByte(3)
      ..write(obj.originalTitle)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.primaryImage)
      ..writeByte(7)
      ..write(obj.contentRating)
      ..writeByte(8)
      ..write(obj.startYear)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.interests)
      ..writeByte(11)
      ..write(obj.countriesOfOrigin)
      ..writeByte(12)
      ..write(obj.externalLinks)
      ..writeByte(13)
      ..write(obj.spokenLanguages)
      ..writeByte(14)
      ..write(obj.filmingLocations)
      ..writeByte(15)
      ..write(obj.budget)
      ..writeByte(16)
      ..write(obj.grossWorldwide)
      ..writeByte(17)
      ..write(obj.genres)
      ..writeByte(18)
      ..write(obj.isAdult)
      ..writeByte(19)
      ..write(obj.runtimeMinutes)
      ..writeByte(20)
      ..write(obj.averageRating)
      ..writeByte(21)
      ..write(obj.numVotes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
