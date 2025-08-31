'use strict'


const Model = use('Model')

class LostFound extends Model {
  static get table() {
    return 'lost_found'
  }

  user() {
    return this.belongsTo('App/Models/User', 'created_by', 'id')
  }

  static get dates() {
    return super.dates.concat(['waktu'])
  }
}

module.exports = LostFound