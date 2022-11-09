import 'dart:math';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@entity
class MovieDetailModel {
  @PrimaryKey(autoGenerate: true)
  int? primaryId;
  bool? adult;
  String? backdropPath;
  int? budget;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  List<Genres>? genres;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<SpokenLanguages>? spokenLanguages;
  BelongsToCollection? belongsToCollection;

  MovieDetailModel(
      {this.primaryId,
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
      });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? new BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = double.parse(json['popularity'].toString());
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    if (this.belongsToCollection != null) {
      data['belongs_to_collection'] = this.belongsToCollection!.toJson();
    }
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }

  MovieDetailModel.fromMap(Map<String, dynamic> res)
  {
    primaryId = res['primaryId'];
    adult = res['adult'];
    backdropPath = res['backdrop_path'];
    id = res['id'];
    homepage = res['homepage'];
    imdbId = res['imdb_Id'];
    revenue = res['revenue'];
    runtime = res['runtime'];
    status = res['status'];
    tagline = res['tagline'];
    originalLanguage = res['original_language'];
    originalTitle = res['original_title'];
    overview = res['overview'];
    popularity = double.parse(res['popularity'].toString());
    posterPath = res['poster_path'];
    releaseDate = res['release_date'];
    title = res['title'];
    video = res['video'];
    voteAverage = double.parse(res['vote_average'].toString());
    voteCount = res['vote_count'];
    belongsToCollection = res['belongs_to_collection'] != null
        ? new BelongsToCollection.fromMap(res['belongs_to_collection'])
        : null;
    if (res['genres'] != null) {
      genres = <Genres>[];
      res['genres'].forEach((v) {
        genres!.add(new Genres.fromMap(v));
      });
    }
    if (res['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      res['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromMap(v));
      });
    }
    if (res['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      res['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromMap(v));
      });
    }
    if (res['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      res['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromMap(v));
      });
    }

  }

  Map<String, Object?> toMap() {
    return {
      'primaryId': primaryId,
      'adult': adult,
      'backdrop_path': backdropPath,
      'id':id,
      'original_language': originalLanguage,
      'original_title':originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title':title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'homepage':homepage,
      'imdb_Id':imdbId,
      'revenue':revenue,
      'runtime':runtime,
      'status':status,
      'tagline': tagline,
      'genres' : genres != null ? this.genres!.map((v) => v.toMap()).toList() : null,
      'belongs_to_collection' : belongsToCollection != null ? this.belongsToCollection!.toMap() : null,
      'production_companies' : productionCompanies != null ? this.productionCompanies!.map((v) => v.toMap()).toList() : null,
      'production_countries' : productionCountries != null ? this.productionCountries!.map((v) => v.toMap()).toList() : null,
      'spoken_languages' : spokenLanguages != null ? this.spokenLanguages!.map((v) => v.toMap()).toList() : null,

    };
  }

}

@entity
class BelongsToCollection {
  @PrimaryKey(autoGenerate: true)
  int? primaryId;
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath, this.primaryId});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryId = json['primaryId'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primaryId'] = this.primaryId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }

  BelongsToCollection.fromMap(Map<String, dynamic> res)
    : name = res['name'],
    id = res['id'],
    posterPath = res['poster_path'],
    backdropPath = res['backdrop_path'];


  Map<String, Object?> toMap() {
    return {
      'backdrop_path': backdropPath,
      'id':id,
      'poster_path': posterPath,
      'name': name,
    };
  }


}

class Genres {
  int? id;
  String? name;
  Color? color;

  Genres({this.id, this.name, this.color});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  Genres.fromMap(Map<String, dynamic> res)
      : name = res['name'],
        id = res['id'],
        color = Colors.primaries[Random().nextInt(Colors.primaries.length)];


  Map<String, Object?> toMap() {
    return {
      'id':id,
      'name': name,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    };
  }

}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }

  ProductionCompanies.fromMap(Map<String, dynamic> res)
      : name = res['name'],
        id = res['id'],
        logoPath = res['logo_path'],
        originCountry = res['origin_country'];


  Map<String, Object?> toMap() {
    return {
      'origin_country': originCountry,
      'id':id,
      'name': name,
      'logo_path': logoPath,
    };
  }

}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }

  ProductionCountries.fromMap(Map<String, dynamic> res)
      : name = res['name'],
        iso31661 = res['iso_3166_1'];


  Map<String, Object?> toMap() {
    return {
      'iso_3166_1':iso31661,
      'name': name,
    };
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }

  SpokenLanguages.fromMap(Map<String, dynamic> res)
      : name = res['name'],
        englishName = res['english_name'],
        iso6391 = res['iso_639_1'];


  Map<String, Object?> toMap() {
    return {
      'iso_639_1':iso6391,
      'english_name':englishName,
      'name': name,
    };
  }
}
