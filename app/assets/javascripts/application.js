// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require moment
//= require fullcalendar
//= require_tree .

/*global $*/
//ページ読み込みが完了したら
$(document).on('turbolinks:load', function () {
  var calendarEl = $("#calendar");
  //フルカレンダーを初期化処理する
  var calendar = new FullCalendar.Calendar(calendarEl);
  //フルカレンダーを表示する
  calendar.render();
});

// メンターがテストの時に使っていたコード
// function test () {
//   consle.log("test");
// }