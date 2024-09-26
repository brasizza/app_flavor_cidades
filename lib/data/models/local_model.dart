// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocalModel {
  final int id;
  final String local;
  final String descricao;
  final String? endereco;
  final String imagem;
  LocalModel({
    required this.id,
    required this.local,
    required this.descricao,
    required this.endereco,
    required this.imagem,
  });

  LocalModel copyWith({
    int? id,
    String? local,
    String? descricao,
    String? endereco,
    String? imagem,
  }) {
    return LocalModel(
      id: id ?? this.id,
      local: local ?? this.local,
      descricao: descricao ?? this.descricao,
      endereco: endereco ?? this.endereco,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'local': local,
      'descricao': descricao,
      'endereco': endereco,
      'imagem': imagem,
    };
  }

  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(
      id: map['id'] as int,
      local: map['local'] as String,
      descricao: map['descricao'] as String,
      endereco: map['endereco'],
      imagem: map['imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalModel.fromJson(String source) => LocalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalModel(id: $id, local: $local, descricao: $descricao, endereco: $endereco, imagem: $imagem)';
  }

  @override
  bool operator ==(covariant LocalModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.local == local && other.descricao == descricao && other.endereco == endereco && other.imagem == imagem;
  }

  @override
  int get hashCode {
    return id.hashCode ^ local.hashCode ^ descricao.hashCode ^ endereco.hashCode ^ imagem.hashCode;
  }
}
