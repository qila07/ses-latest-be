"use strict";

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use("Schema");

class SekolahSchema extends Schema {
  up() {
    this.create("sekolah", (table) => {
      table.increments(); // id
      table.string("nama");
      table.timestamps();
    });
  }

  down() {
    this.drop("sekolah");
  }
}

module.exports = SekolahSchema;
