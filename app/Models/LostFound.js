'use strict'


const Model = use('Model')

class LostFound extends Model {
  static get table() {
    return 'lost_found'
  }

  user() {
    return this.belongsTo('App/Models/User', 'created_by', 'id')
  }

  laporanPengembalian() {
    return this.hasMany('App/Models/LostfoundLaporanPengembalian', 'id', 'lost_and_found_id')
  }

  static get dates() {
    return super.dates.concat(['waktu'])
  }

  static get visible() {
  return [
      'id', 'judul', 'status', 'kategori', 'lokasi', 'waktu', 'kontak',
      'deskripsi', 'ciri_ciri_unik', 'informasi_tambahan',
      'gambar', 'metode_pengembalian', 'bukti_penyerahan',
      'created_by', 'created_at', 'updated_at'
  ]
}

}

module.exports = LostFound