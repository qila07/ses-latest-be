'use strict'

const Schema = use('Schema')

class LaporanPengembalianSchema extends Schema {
  up () {
    this.create('lostfound_laporan_pengembalian', (table) => {
      table.increments('id')
      table
        .integer('lost_and_found_id')
        .unsigned()
        .notNullable()
        .references('id')
        .inTable('lost_found')
        .onDelete('CASCADE')

      table.enu('jenis_form', ['Klaim', 'Penemuan']).notNullable()

      table.string('nama_lengkap', 100).notNullable()
      table.string('kelas', 50).notNullable()
      table.string('kontak_whatsapp', 20).notNullable()

      // Kolom khusus untuk form klaim
      table.string('lokasi_terakhir', 255).nullable()
      table.text('alasan_klaim').nullable()
      table.string('bukti_kepemilikan', 500).nullable() // PERBAIKAN: Perbesar panjang string

      // Kolom khusus untuk form penemuan
      table.string('lokasi_penemuan', 255).nullable()
      table.datetime('waktu_penemuan').nullable()
      table.enu('metode_pengembalian', ['Resepsionis', 'Chat Pribadi']).nullable()
      table.string('bukti_penyerahan', 500).nullable() // PERBAIKAN: Perbesar panjang string

      // PERBAIKAN: Tambah kolom status dan updated_at
      table.enu('status', ['Pending', 'Disetujui', 'Ditolak']).defaultTo('Pending')
      table.timestamps() // PERBAIKAN: Gunakan timestamps() untuk created_at dan updated_at
    })
  }

  down () {
    this.drop('lostfound_laporan_pengembalian')
  }
}

module.exports = LaporanPengembalianSchema