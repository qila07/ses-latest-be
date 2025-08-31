'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class LostFoundSchema extends Schema {
  up () {
    this.create('lost_found', (table) => {
      table.increments('id')
      table.string('judul', 255).notNullable()
      table.enu('status', ['Dicari', 'Ditemukan', 'Selesai']).notNullable()
      table.string('kategori', 100).notNullable()
      table.string('lokasi', 255).notNullable()
      table.dateTime('waktu').notNullable()
      table.string('kontak', 20).notNullable()
      table.text('deskripsi')
      table.string('gambar', 255)
      table.integer('created_by').unsigned().notNullable().references('id').inTable('users').onDelete('CASCADE')
      table.timestamps()
    })
  }

  down () {
    this.drop('lost_found')
  }
}

module.exports = LostFoundSchema



