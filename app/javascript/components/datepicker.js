import $ from 'jquery'
import { datetimepicker } from 'eonasdan-bootstrap-datetimepicker'


$('#datetimepicker6').datetimepicker({
  format: 'DD/MM/YYYY'
});
$('#datetimepicker7').datetimepicker({
                    useCurrent: false, //Important! See issue #1075
                    format: 'DD/MM/YYYY'
                  });
$("#datetimepicker6").on("dp.change", function (e) {
  $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
});
$("#datetimepicker7").on("dp.change", function (e) {
  $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
});

