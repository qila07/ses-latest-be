'use strict'
const Model = use('Model')
class LostFoundNotif extends Model {
  static get table() {
    return 'lost_found_notifs'
  }
}
module.exports = LostFoundNotif