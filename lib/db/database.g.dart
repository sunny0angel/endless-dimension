// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String name;
  final String type;
  final String description;
  final String imagePath;
  final int life;
  final int magic;
  final int earth;
  final int fire;
  final int water;
  final int wind;
  Item(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.imagePath,
      this.life,
      this.magic,
      this.earth,
      this.fire,
      this.water,
      this.wind});
  factory Item.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Item(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      imagePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}imagePath']),
      life: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}life']),
      magic: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}magic']),
      earth: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}earth']),
      fire: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fire']),
      water: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}water']),
      wind: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wind']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imagePath != null) {
      map['imagePath'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || life != null) {
      map['life'] = Variable<int>(life);
    }
    if (!nullToAbsent || magic != null) {
      map['magic'] = Variable<int>(magic);
    }
    if (!nullToAbsent || earth != null) {
      map['earth'] = Variable<int>(earth);
    }
    if (!nullToAbsent || fire != null) {
      map['fire'] = Variable<int>(fire);
    }
    if (!nullToAbsent || water != null) {
      map['water'] = Variable<int>(water);
    }
    if (!nullToAbsent || wind != null) {
      map['wind'] = Variable<int>(wind);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      life: life == null && nullToAbsent ? const Value.absent() : Value(life),
      magic:
          magic == null && nullToAbsent ? const Value.absent() : Value(magic),
      earth:
          earth == null && nullToAbsent ? const Value.absent() : Value(earth),
      fire: fire == null && nullToAbsent ? const Value.absent() : Value(fire),
      water:
          water == null && nullToAbsent ? const Value.absent() : Value(water),
      wind: wind == null && nullToAbsent ? const Value.absent() : Value(wind),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      life: serializer.fromJson<int>(json['life']),
      magic: serializer.fromJson<int>(json['magic']),
      earth: serializer.fromJson<int>(json['earth']),
      fire: serializer.fromJson<int>(json['fire']),
      water: serializer.fromJson<int>(json['water']),
      wind: serializer.fromJson<int>(json['wind']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
      'life': serializer.toJson<int>(life),
      'magic': serializer.toJson<int>(magic),
      'earth': serializer.toJson<int>(earth),
      'fire': serializer.toJson<int>(fire),
      'water': serializer.toJson<int>(water),
      'wind': serializer.toJson<int>(wind),
    };
  }

  Item copyWith(
          {int id,
          String name,
          String type,
          String description,
          String imagePath,
          int life,
          int magic,
          int earth,
          int fire,
          int water,
          int wind}) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath,
        life: life ?? this.life,
        magic: magic ?? this.magic,
        earth: earth ?? this.earth,
        fire: fire ?? this.fire,
        water: water ?? this.water,
        wind: wind ?? this.wind,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('life: $life, ')
          ..write('magic: $magic, ')
          ..write('earth: $earth, ')
          ..write('fire: $fire, ')
          ..write('water: $water, ')
          ..write('wind: $wind')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              type.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      imagePath.hashCode,
                      $mrjc(
                          life.hashCode,
                          $mrjc(
                              magic.hashCode,
                              $mrjc(
                                  earth.hashCode,
                                  $mrjc(
                                      fire.hashCode,
                                      $mrjc(water.hashCode,
                                          wind.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.life == this.life &&
          other.magic == this.magic &&
          other.earth == this.earth &&
          other.fire == this.fire &&
          other.water == this.water &&
          other.wind == this.wind);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> description;
  final Value<String> imagePath;
  final Value<int> life;
  final Value<int> magic;
  final Value<int> earth;
  final Value<int> fire;
  final Value<int> water;
  final Value<int> wind;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.life = const Value.absent(),
    this.magic = const Value.absent(),
    this.earth = const Value.absent(),
    this.fire = const Value.absent(),
    this.water = const Value.absent(),
    this.wind = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.life = const Value.absent(),
    this.magic = const Value.absent(),
    this.earth = const Value.absent(),
    this.fire = const Value.absent(),
    this.water = const Value.absent(),
    this.wind = const Value.absent(),
  });
  static Insertable<Item> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> type,
    Expression<String> description,
    Expression<String> imagePath,
    Expression<int> life,
    Expression<int> magic,
    Expression<int> earth,
    Expression<int> fire,
    Expression<int> water,
    Expression<int> wind,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (imagePath != null) 'imagePath': imagePath,
      if (life != null) 'life': life,
      if (magic != null) 'magic': magic,
      if (earth != null) 'earth': earth,
      if (fire != null) 'fire': fire,
      if (water != null) 'water': water,
      if (wind != null) 'wind': wind,
    });
  }

  ItemsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String> description,
      Value<String> imagePath,
      Value<int> life,
      Value<int> magic,
      Value<int> earth,
      Value<int> fire,
      Value<int> water,
      Value<int> wind}) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      life: life ?? this.life,
      magic: magic ?? this.magic,
      earth: earth ?? this.earth,
      fire: fire ?? this.fire,
      water: water ?? this.water,
      wind: wind ?? this.wind,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['imagePath'] = Variable<String>(imagePath.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (magic.present) {
      map['magic'] = Variable<int>(magic.value);
    }
    if (earth.present) {
      map['earth'] = Variable<int>(earth.value);
    }
    if (fire.present) {
      map['fire'] = Variable<int>(fire.value);
    }
    if (water.present) {
      map['water'] = Variable<int>(water.value);
    }
    if (wind.present) {
      map['wind'] = Variable<int>(wind.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('life: $life, ')
          ..write('magic: $magic, ')
          ..write('earth: $earth, ')
          ..write('fire: $fire, ')
          ..write('water: $water, ')
          ..write('wind: $wind')
          ..write(')'))
        .toString();
  }
}

class Items extends Table with TableInfo<Items, Item> {
  final GeneratedDatabase _db;
  final String _alias;
  Items(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true, $customConstraints: 'primary key');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  GeneratedTextColumn _imagePath;
  GeneratedTextColumn get imagePath => _imagePath ??= _constructImagePath();
  GeneratedTextColumn _constructImagePath() {
    return GeneratedTextColumn('imagePath', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _lifeMeta = const VerificationMeta('life');
  GeneratedIntColumn _life;
  GeneratedIntColumn get life => _life ??= _constructLife();
  GeneratedIntColumn _constructLife() {
    return GeneratedIntColumn('life', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _magicMeta = const VerificationMeta('magic');
  GeneratedIntColumn _magic;
  GeneratedIntColumn get magic => _magic ??= _constructMagic();
  GeneratedIntColumn _constructMagic() {
    return GeneratedIntColumn('magic', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _earthMeta = const VerificationMeta('earth');
  GeneratedIntColumn _earth;
  GeneratedIntColumn get earth => _earth ??= _constructEarth();
  GeneratedIntColumn _constructEarth() {
    return GeneratedIntColumn('earth', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _fireMeta = const VerificationMeta('fire');
  GeneratedIntColumn _fire;
  GeneratedIntColumn get fire => _fire ??= _constructFire();
  GeneratedIntColumn _constructFire() {
    return GeneratedIntColumn('fire', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _waterMeta = const VerificationMeta('water');
  GeneratedIntColumn _water;
  GeneratedIntColumn get water => _water ??= _constructWater();
  GeneratedIntColumn _constructWater() {
    return GeneratedIntColumn('water', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _windMeta = const VerificationMeta('wind');
  GeneratedIntColumn _wind;
  GeneratedIntColumn get wind => _wind ??= _constructWind();
  GeneratedIntColumn _constructWind() {
    return GeneratedIntColumn('wind', $tableName, true, $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        description,
        imagePath,
        life,
        magic,
        earth,
        fire,
        water,
        wind
      ];
  @override
  Items get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'items';
  @override
  final String actualTableName = 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('imagePath')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['imagePath'], _imagePathMeta));
    }
    if (data.containsKey('life')) {
      context.handle(
          _lifeMeta, life.isAcceptableOrUnknown(data['life'], _lifeMeta));
    }
    if (data.containsKey('magic')) {
      context.handle(
          _magicMeta, magic.isAcceptableOrUnknown(data['magic'], _magicMeta));
    }
    if (data.containsKey('earth')) {
      context.handle(
          _earthMeta, earth.isAcceptableOrUnknown(data['earth'], _earthMeta));
    }
    if (data.containsKey('fire')) {
      context.handle(
          _fireMeta, fire.isAcceptableOrUnknown(data['fire'], _fireMeta));
    }
    if (data.containsKey('water')) {
      context.handle(
          _waterMeta, water.isAcceptableOrUnknown(data['water'], _waterMeta));
    }
    if (data.containsKey('wind')) {
      context.handle(
          _windMeta, wind.isAcceptableOrUnknown(data['wind'], _windMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String tablePrefix}) {
    return Item.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Items createAlias(String alias) {
    return Items(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PlayerStateData extends DataClass implements Insertable<PlayerStateData> {
  final int id;
  final String name;
  final int life;
  final int magic;
  final int earth;
  final int fire;
  final int water;
  final int wind;
  final int bagsize;
  PlayerStateData(
      {this.id,
      this.name,
      this.life,
      this.magic,
      this.earth,
      this.fire,
      this.water,
      this.wind,
      this.bagsize});
  factory PlayerStateData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlayerStateData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      life: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}life']),
      magic: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}magic']),
      earth: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}earth']),
      fire: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fire']),
      water: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}water']),
      wind: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wind']),
      bagsize: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bagsize']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || life != null) {
      map['life'] = Variable<int>(life);
    }
    if (!nullToAbsent || magic != null) {
      map['magic'] = Variable<int>(magic);
    }
    if (!nullToAbsent || earth != null) {
      map['earth'] = Variable<int>(earth);
    }
    if (!nullToAbsent || fire != null) {
      map['fire'] = Variable<int>(fire);
    }
    if (!nullToAbsent || water != null) {
      map['water'] = Variable<int>(water);
    }
    if (!nullToAbsent || wind != null) {
      map['wind'] = Variable<int>(wind);
    }
    if (!nullToAbsent || bagsize != null) {
      map['bagsize'] = Variable<int>(bagsize);
    }
    return map;
  }

  PlayerStateCompanion toCompanion(bool nullToAbsent) {
    return PlayerStateCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      life: life == null && nullToAbsent ? const Value.absent() : Value(life),
      magic:
          magic == null && nullToAbsent ? const Value.absent() : Value(magic),
      earth:
          earth == null && nullToAbsent ? const Value.absent() : Value(earth),
      fire: fire == null && nullToAbsent ? const Value.absent() : Value(fire),
      water:
          water == null && nullToAbsent ? const Value.absent() : Value(water),
      wind: wind == null && nullToAbsent ? const Value.absent() : Value(wind),
      bagsize: bagsize == null && nullToAbsent
          ? const Value.absent()
          : Value(bagsize),
    );
  }

  factory PlayerStateData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlayerStateData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      life: serializer.fromJson<int>(json['life']),
      magic: serializer.fromJson<int>(json['magic']),
      earth: serializer.fromJson<int>(json['earth']),
      fire: serializer.fromJson<int>(json['fire']),
      water: serializer.fromJson<int>(json['water']),
      wind: serializer.fromJson<int>(json['wind']),
      bagsize: serializer.fromJson<int>(json['bagsize']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'life': serializer.toJson<int>(life),
      'magic': serializer.toJson<int>(magic),
      'earth': serializer.toJson<int>(earth),
      'fire': serializer.toJson<int>(fire),
      'water': serializer.toJson<int>(water),
      'wind': serializer.toJson<int>(wind),
      'bagsize': serializer.toJson<int>(bagsize),
    };
  }

  PlayerStateData copyWith(
          {int id,
          String name,
          int life,
          int magic,
          int earth,
          int fire,
          int water,
          int wind,
          int bagsize}) =>
      PlayerStateData(
        id: id ?? this.id,
        name: name ?? this.name,
        life: life ?? this.life,
        magic: magic ?? this.magic,
        earth: earth ?? this.earth,
        fire: fire ?? this.fire,
        water: water ?? this.water,
        wind: wind ?? this.wind,
        bagsize: bagsize ?? this.bagsize,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerStateData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('life: $life, ')
          ..write('magic: $magic, ')
          ..write('earth: $earth, ')
          ..write('fire: $fire, ')
          ..write('water: $water, ')
          ..write('wind: $wind, ')
          ..write('bagsize: $bagsize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              life.hashCode,
              $mrjc(
                  magic.hashCode,
                  $mrjc(
                      earth.hashCode,
                      $mrjc(
                          fire.hashCode,
                          $mrjc(water.hashCode,
                              $mrjc(wind.hashCode, bagsize.hashCode)))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerStateData &&
          other.id == this.id &&
          other.name == this.name &&
          other.life == this.life &&
          other.magic == this.magic &&
          other.earth == this.earth &&
          other.fire == this.fire &&
          other.water == this.water &&
          other.wind == this.wind &&
          other.bagsize == this.bagsize);
}

class PlayerStateCompanion extends UpdateCompanion<PlayerStateData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> life;
  final Value<int> magic;
  final Value<int> earth;
  final Value<int> fire;
  final Value<int> water;
  final Value<int> wind;
  final Value<int> bagsize;
  const PlayerStateCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.life = const Value.absent(),
    this.magic = const Value.absent(),
    this.earth = const Value.absent(),
    this.fire = const Value.absent(),
    this.water = const Value.absent(),
    this.wind = const Value.absent(),
    this.bagsize = const Value.absent(),
  });
  PlayerStateCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.life = const Value.absent(),
    this.magic = const Value.absent(),
    this.earth = const Value.absent(),
    this.fire = const Value.absent(),
    this.water = const Value.absent(),
    this.wind = const Value.absent(),
    this.bagsize = const Value.absent(),
  });
  static Insertable<PlayerStateData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> life,
    Expression<int> magic,
    Expression<int> earth,
    Expression<int> fire,
    Expression<int> water,
    Expression<int> wind,
    Expression<int> bagsize,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (life != null) 'life': life,
      if (magic != null) 'magic': magic,
      if (earth != null) 'earth': earth,
      if (fire != null) 'fire': fire,
      if (water != null) 'water': water,
      if (wind != null) 'wind': wind,
      if (bagsize != null) 'bagsize': bagsize,
    });
  }

  PlayerStateCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> life,
      Value<int> magic,
      Value<int> earth,
      Value<int> fire,
      Value<int> water,
      Value<int> wind,
      Value<int> bagsize}) {
    return PlayerStateCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      life: life ?? this.life,
      magic: magic ?? this.magic,
      earth: earth ?? this.earth,
      fire: fire ?? this.fire,
      water: water ?? this.water,
      wind: wind ?? this.wind,
      bagsize: bagsize ?? this.bagsize,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (magic.present) {
      map['magic'] = Variable<int>(magic.value);
    }
    if (earth.present) {
      map['earth'] = Variable<int>(earth.value);
    }
    if (fire.present) {
      map['fire'] = Variable<int>(fire.value);
    }
    if (water.present) {
      map['water'] = Variable<int>(water.value);
    }
    if (wind.present) {
      map['wind'] = Variable<int>(wind.value);
    }
    if (bagsize.present) {
      map['bagsize'] = Variable<int>(bagsize.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerStateCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('life: $life, ')
          ..write('magic: $magic, ')
          ..write('earth: $earth, ')
          ..write('fire: $fire, ')
          ..write('water: $water, ')
          ..write('wind: $wind, ')
          ..write('bagsize: $bagsize')
          ..write(')'))
        .toString();
  }
}

class PlayerState extends Table with TableInfo<PlayerState, PlayerStateData> {
  final GeneratedDatabase _db;
  final String _alias;
  PlayerState(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true, $customConstraints: 'primary key');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _lifeMeta = const VerificationMeta('life');
  GeneratedIntColumn _life;
  GeneratedIntColumn get life => _life ??= _constructLife();
  GeneratedIntColumn _constructLife() {
    return GeneratedIntColumn('life', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _magicMeta = const VerificationMeta('magic');
  GeneratedIntColumn _magic;
  GeneratedIntColumn get magic => _magic ??= _constructMagic();
  GeneratedIntColumn _constructMagic() {
    return GeneratedIntColumn('magic', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _earthMeta = const VerificationMeta('earth');
  GeneratedIntColumn _earth;
  GeneratedIntColumn get earth => _earth ??= _constructEarth();
  GeneratedIntColumn _constructEarth() {
    return GeneratedIntColumn('earth', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _fireMeta = const VerificationMeta('fire');
  GeneratedIntColumn _fire;
  GeneratedIntColumn get fire => _fire ??= _constructFire();
  GeneratedIntColumn _constructFire() {
    return GeneratedIntColumn('fire', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _waterMeta = const VerificationMeta('water');
  GeneratedIntColumn _water;
  GeneratedIntColumn get water => _water ??= _constructWater();
  GeneratedIntColumn _constructWater() {
    return GeneratedIntColumn('water', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _windMeta = const VerificationMeta('wind');
  GeneratedIntColumn _wind;
  GeneratedIntColumn get wind => _wind ??= _constructWind();
  GeneratedIntColumn _constructWind() {
    return GeneratedIntColumn('wind', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _bagsizeMeta = const VerificationMeta('bagsize');
  GeneratedIntColumn _bagsize;
  GeneratedIntColumn get bagsize => _bagsize ??= _constructBagsize();
  GeneratedIntColumn _constructBagsize() {
    return GeneratedIntColumn('bagsize', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, life, magic, earth, fire, water, wind, bagsize];
  @override
  PlayerState get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'player_state';
  @override
  final String actualTableName = 'player_state';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerStateData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('life')) {
      context.handle(
          _lifeMeta, life.isAcceptableOrUnknown(data['life'], _lifeMeta));
    }
    if (data.containsKey('magic')) {
      context.handle(
          _magicMeta, magic.isAcceptableOrUnknown(data['magic'], _magicMeta));
    }
    if (data.containsKey('earth')) {
      context.handle(
          _earthMeta, earth.isAcceptableOrUnknown(data['earth'], _earthMeta));
    }
    if (data.containsKey('fire')) {
      context.handle(
          _fireMeta, fire.isAcceptableOrUnknown(data['fire'], _fireMeta));
    }
    if (data.containsKey('water')) {
      context.handle(
          _waterMeta, water.isAcceptableOrUnknown(data['water'], _waterMeta));
    }
    if (data.containsKey('wind')) {
      context.handle(
          _windMeta, wind.isAcceptableOrUnknown(data['wind'], _windMeta));
    }
    if (data.containsKey('bagsize')) {
      context.handle(_bagsizeMeta,
          bagsize.isAcceptableOrUnknown(data['bagsize'], _bagsizeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerStateData map(Map<String, dynamic> data, {String tablePrefix}) {
    return PlayerStateData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  PlayerState createAlias(String alias) {
    return PlayerState(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PlayerItem extends DataClass implements Insertable<PlayerItem> {
  final int id;
  final int itemid;
  final int bagindex;
  final int cnt;
  PlayerItem({this.id, this.itemid, this.bagindex, this.cnt});
  factory PlayerItem.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlayerItem(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      itemid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}itemid']),
      bagindex: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bagindex']),
      cnt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cnt']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || itemid != null) {
      map['itemid'] = Variable<int>(itemid);
    }
    if (!nullToAbsent || bagindex != null) {
      map['bagindex'] = Variable<int>(bagindex);
    }
    if (!nullToAbsent || cnt != null) {
      map['cnt'] = Variable<int>(cnt);
    }
    return map;
  }

  PlayerItemsCompanion toCompanion(bool nullToAbsent) {
    return PlayerItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      itemid:
          itemid == null && nullToAbsent ? const Value.absent() : Value(itemid),
      bagindex: bagindex == null && nullToAbsent
          ? const Value.absent()
          : Value(bagindex),
      cnt: cnt == null && nullToAbsent ? const Value.absent() : Value(cnt),
    );
  }

  factory PlayerItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlayerItem(
      id: serializer.fromJson<int>(json['id']),
      itemid: serializer.fromJson<int>(json['itemid']),
      bagindex: serializer.fromJson<int>(json['bagindex']),
      cnt: serializer.fromJson<int>(json['cnt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemid': serializer.toJson<int>(itemid),
      'bagindex': serializer.toJson<int>(bagindex),
      'cnt': serializer.toJson<int>(cnt),
    };
  }

  PlayerItem copyWith({int id, int itemid, int bagindex, int cnt}) =>
      PlayerItem(
        id: id ?? this.id,
        itemid: itemid ?? this.itemid,
        bagindex: bagindex ?? this.bagindex,
        cnt: cnt ?? this.cnt,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerItem(')
          ..write('id: $id, ')
          ..write('itemid: $itemid, ')
          ..write('bagindex: $bagindex, ')
          ..write('cnt: $cnt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(itemid.hashCode, $mrjc(bagindex.hashCode, cnt.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerItem &&
          other.id == this.id &&
          other.itemid == this.itemid &&
          other.bagindex == this.bagindex &&
          other.cnt == this.cnt);
}

class PlayerItemsCompanion extends UpdateCompanion<PlayerItem> {
  final Value<int> id;
  final Value<int> itemid;
  final Value<int> bagindex;
  final Value<int> cnt;
  const PlayerItemsCompanion({
    this.id = const Value.absent(),
    this.itemid = const Value.absent(),
    this.bagindex = const Value.absent(),
    this.cnt = const Value.absent(),
  });
  PlayerItemsCompanion.insert({
    this.id = const Value.absent(),
    this.itemid = const Value.absent(),
    this.bagindex = const Value.absent(),
    this.cnt = const Value.absent(),
  });
  static Insertable<PlayerItem> custom({
    Expression<int> id,
    Expression<int> itemid,
    Expression<int> bagindex,
    Expression<int> cnt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemid != null) 'itemid': itemid,
      if (bagindex != null) 'bagindex': bagindex,
      if (cnt != null) 'cnt': cnt,
    });
  }

  PlayerItemsCompanion copyWith(
      {Value<int> id, Value<int> itemid, Value<int> bagindex, Value<int> cnt}) {
    return PlayerItemsCompanion(
      id: id ?? this.id,
      itemid: itemid ?? this.itemid,
      bagindex: bagindex ?? this.bagindex,
      cnt: cnt ?? this.cnt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemid.present) {
      map['itemid'] = Variable<int>(itemid.value);
    }
    if (bagindex.present) {
      map['bagindex'] = Variable<int>(bagindex.value);
    }
    if (cnt.present) {
      map['cnt'] = Variable<int>(cnt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemid: $itemid, ')
          ..write('bagindex: $bagindex, ')
          ..write('cnt: $cnt')
          ..write(')'))
        .toString();
  }
}

class PlayerItems extends Table with TableInfo<PlayerItems, PlayerItem> {
  final GeneratedDatabase _db;
  final String _alias;
  PlayerItems(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true, $customConstraints: 'primary key');
  }

  final VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  GeneratedIntColumn _itemid;
  GeneratedIntColumn get itemid => _itemid ??= _constructItemid();
  GeneratedIntColumn _constructItemid() {
    return GeneratedIntColumn('itemid', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _bagindexMeta = const VerificationMeta('bagindex');
  GeneratedIntColumn _bagindex;
  GeneratedIntColumn get bagindex => _bagindex ??= _constructBagindex();
  GeneratedIntColumn _constructBagindex() {
    return GeneratedIntColumn('bagindex', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _cntMeta = const VerificationMeta('cnt');
  GeneratedIntColumn _cnt;
  GeneratedIntColumn get cnt => _cnt ??= _constructCnt();
  GeneratedIntColumn _constructCnt() {
    return GeneratedIntColumn('cnt', $tableName, true, $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, itemid, bagindex, cnt];
  @override
  PlayerItems get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'player_items';
  @override
  final String actualTableName = 'player_items';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid'], _itemidMeta));
    }
    if (data.containsKey('bagindex')) {
      context.handle(_bagindexMeta,
          bagindex.isAcceptableOrUnknown(data['bagindex'], _bagindexMeta));
    }
    if (data.containsKey('cnt')) {
      context.handle(
          _cntMeta, cnt.isAcceptableOrUnknown(data['cnt'], _cntMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerItem map(Map<String, dynamic> data, {String tablePrefix}) {
    return PlayerItem.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  PlayerItems createAlias(String alias) {
    return PlayerItems(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  Items _items;
  Items get items => _items ??= Items(this);
  PlayerState _playerState;
  PlayerState get playerState => _playerState ??= PlayerState(this);
  PlayerItems _playerItems;
  PlayerItems get playerItems => _playerItems ??= PlayerItems(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [items, playerState, playerItems];
}
