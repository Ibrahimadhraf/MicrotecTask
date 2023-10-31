import 'dart:typed_data';

class Attachment {
  int? id;
  int? duration;
  String? name;
  String? filePath;
  String? description;
  String? base64Encryption;
  int? size;
  AttachmentType? type;
  Uint8List? bytes;

  bool? isRecording;
  String? extension;
  int? ticketId;

  Attachment(
      {this.id,
      this.type,
      this.name,
      this.filePath,
      this.base64Encryption,
      this.duration,
      this.size,
      this.bytes,
      this.isRecording,
      this.extension,
      this.description,
      this.ticketId});

  Attachment.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'].toString();
    if (json['description'] == "file") {
      type = AttachmentType.file;
    } else if (json['description'] == "image") {
      type = AttachmentType.image;
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'res_id': ticketId,
      'res_model': 'helpdesk.ticket',
      "description": description,
      'datas': base64Encryption,
    };
  }
}

enum AttachmentType {
  file,
  image,
}
