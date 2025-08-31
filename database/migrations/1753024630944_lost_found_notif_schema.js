'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class LostFoundNotifSchema extends Schema {
  up () {
    this.create('lost_found_notifs', (table) => {
      table.increments()
      table.text('subscription').notNullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('lost_found_notifs')
  }
}

module.exports = LostFoundNotifSchema
