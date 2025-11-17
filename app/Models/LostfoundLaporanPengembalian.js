// SES-BE-KEL1-main/app/Models/LostfoundLaporanPengembalian.js
'use strict'

const Model = use('Model')

class LostfoundLaporanPengembalian extends Model {
  static get table() {
    return 'lostfound_laporan_pengembalian'
  }

static get fillable() {
  return [
    'lost_and_found_id',
    'jenis_form',
    'nama_lengkap',
    'kelas',
    'kontak_whatsapp',
    'lokasi_terakhir',
    'alasan_klaim',
    'bukti_kepemilikan',
    'lokasi_penemuan',
    'waktu_penemuan',
    'metode_pengembalian',
    'bukti_penyerahan',
    'status'
  ];
}


  static get primaryKey() {
    return 'id'
  }

  static get createdAtColumn() {
    return 'created_at'
  }

  static get updatedAtColumn() {
    return 'updated_at'
  }

  // Relasi ke tabel lostfound
lostFound() {
    return this.belongsTo('App/Models/LostFound', 'id','lost_and_found_id')
  }
}


module.exports = LostfoundLaporanPengembalian
