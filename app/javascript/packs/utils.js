import moment from 'moment'

export const formatDate = function(d) {
  return moment(d).format("YYYY-MM-DD h:mm:ss a");
}
