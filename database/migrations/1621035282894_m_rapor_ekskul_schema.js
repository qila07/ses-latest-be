// "use strict";

// /** @type {import('@adonisjs/lucid/src/Schema')} */
// const Schema = use("Schema");

// class MRaporEkskulSchema extends Schema {
//   up() {
//     this.hasTable("m_rapor_ekskul").then((exist) => {
//       if (!exist)
//         this.create("m_rapor_ekskul", (table) => {
//           table.increments();
//           table.integer("m_user_id").unsigned().index("m_user_id");
//           table
//             .foreign("m_user_id")
//             .references("m_user.id")
//             .onDelete("cascade")
//             .onUpdate("cascade");
//           table.integer("m_ekstrakurikuler_id").unsigned().index("m_ekstrakurikuler_id");
//           table
//             .foreign("m_ekstrakurikuler_id")
//             .references("m_ekstrakurikuler.id")
//             .onDelete("cascade")
//             .onUpdate("cascade");
//           table.string("keterangan");
//           table.boolean("status");
//           table.boolean("dihapus").defaultTo(0);
//           table.timestamps();
//         });
//     });
//   }

//   down() {
//     this.drop("m_rapor_ekskul");
//   }
// }

// module.exports = MRaporEkskulSchema;

"use strict";

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use("Schema");

class MRaporEkskulSchema extends Schema {
  up() {
    this.create("m_rapor_ekskul", (table) => {
      table.increments();
      table.integer("m_user_id").unsigned().index();
      table
        .foreign("m_user_id")
        .references("id")
        .inTable("m_user")
        .onDelete("CASCADE")
        .onUpdate("CASCADE");

      // table.integer("m_ekstrakurikuler_id").unsigned().index();
      // table
      //   .foreign("m_ekstrakurikuler_id")
      //   .references("id")
      //   .inTable("m_ekstrakurikuler")
      //   .onDelete("CASCADE")
      //   .onUpdate("CASCADE");

      table.integer('m_ekstrakurikuler_id').unsigned().index();
      table
        .foreign('m_ekstrakurikuler_id')
        .references('id')
        .inTable('m_ekstrakurikuler')
        .onDelete('CASCADE')
        .onUpdate('CASCADE');


      table.string("keterangan");
      table.boolean("status");
      table.boolean("dihapus").defaultTo(0);
      table.timestamps();
    });
  }

  down() {
    this.drop("m_rapor_ekskul");
  }
}

module.exports = MRaporEkskulSchema;
