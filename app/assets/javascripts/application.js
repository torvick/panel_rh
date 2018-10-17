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
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require datatables
//= require jquery-ui
//= require dataconfig
//= require_tree .

$(document).ready(function(){
    // $('#datatable-buttons').dataTable();
    // $('#table-employee').dataTable();
    // $('#table-company').dataTable();
    // $('#table-records').dataTable();
    init_DataTables();
});

function init_DataTables() {

    console.log('run_datatables');

    if( typeof ($.fn.DataTable) === 'undefined'){ return; }
    console.log('init_DataTables');

    var handleDataTableButtons = function() {
        if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
                dom: "Bfrtip",
                buttons: [
                    {
                        extend: "copy",
                        className: "btn-sm"
                    },
                    {
                        extend: "csv",
                        className: "btn-sm"
                    },
                    {
                        extend: "excel",
                        className: "btn-sm"
                    },
                    {
                        extend: "pdfHtml5",
                        className: "btn-sm"
                    },
                    {
                        extend: "print",
                        className: "btn-sm"
                    },
                ],
                responsive: true
            });
        }
    };

    TableManageButtons = function() {
        "use strict";
        return {
            init: function() {
                handleDataTableButtons();
            }
        };
    }();

    $('#datatable').dataTable();

    $('#datatable-keytable').DataTable({
        keys: true
    });

    $('#datatable-responsive').DataTable();

    $('#datatable-scroller').DataTable({
        ajax: "js/datatables/json/scroller-demo.json",
        deferRender: true,
        scrollY: 380,
        scrollCollapse: true,
        scroller: true
    });

    $('#datatable-fixed-header').DataTable({
        fixedHeader: true
    });

    var $datatable = $('#datatable-checkbox');

    $datatable.dataTable({
        'order': [[ 1, 'asc' ]],
        'columnDefs': [
            { orderable: false, targets: [0] }
        ]
    });
    $datatable.on('draw.dt', function() {
        $('checkbox input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
        });
    });

    TableManageButtons.init();

    $('.tbl-general').DataTable({
        dom: 'Bfrtip',
        responsive: true,
        buttons: ['csv','print','copy'],

    });
};