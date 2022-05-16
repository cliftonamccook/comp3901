// Generic Datatable
document.addEventListener("turbolinks:load", () => {
  if($('[id^=dataTable]').length == 1) {
    $('#dataTable').DataTable( {
      "dom": "<''<'card-body border-bottom py-3 d-flex'<'text-muted'l><'ms-auto text-muted'f>>" +
             "<'table-responsive'<'col-sm-12'tr>>" +
             "<'card-footer d-flex align-items-center'<'m-0 text-muted'i><'pagination m-0 ms-auto'p>>",
      "order": [[0, "desc"]],
      language: {
        paginate: {
          next: 'next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>',
          previous: '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg> prev'
        }
      }
    });

    $('div.dataTables_length select').removeClass( "custom-select custom-select-sm form-control form-control-sm");
    $('div.dataTables_length select').addClass( "mx-2 d-inline-block datatables-form-select");
  }
});

// Generic Datatable
document.addEventListener("turbolinks:load", () => {
  if($('[id^=requirementcoursesdataTable]').length == 1) {
    // Setup - add a text input to each footer cell
    $('#requirementcoursesdataTable thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#requirementcoursesdataTable thead');

    $('#requirementcoursesdataTable').DataTable( {
      "dom": "<''<'card-body border-bottom py-3 d-flex'<'text-muted'l><'ms-auto text-muted'f>>" +
             "<'table-responsive'<'col-sm-12'tr>>" +
             "<'card-footer d-flex align-items-center'<'m-0 text-muted'i><'pagination m-0 ms-auto'p>>",
      "order": [[0, "desc"]],
      language: {
        paginate: {
          next: 'next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>',
          previous: '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg> prev'
        }
      },

      orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            var api = this.api();
 
            // For each column
            api
                .columns()
                .eq(0)
                .each(function (colIdx) {
                  if ($(api.column(colIdx).header()).index() != 0) {
                                        // Set the header cell to contain the input element
                    var cell = $('.filters th').eq(
                        $(api.column(colIdx).header()).index()
                    );
                    var title = $(cell).text();
                    $(cell).html('<input type="text" placeholder="' + title + '" />');
 
                    // On every keypress in this input
                    $(
                        'input',
                        $('.filters th').eq($(api.column(colIdx).header()).index())
                    )
                        .off('keyup change')
                        .on('keyup change', function (e) {
                            e.stopPropagation();
 
                            // Get the search value
                            $(this).attr('title', $(this).val());
                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
 
                            var cursorPosition = this.selectionStart;
                            // Search the column for that value
                            api
                                .column(colIdx)
                                .search(
                                    this.value != ''
                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
                                        : '',
                                    this.value != '',
                                    this.value == ''
                                )
                                .draw();
 
                            $(this)
                                .focus()[0]
                                .setSelectionRange(cursorPosition, cursorPosition);
                        });
                  }
                });
        },
    });

    $('div.dataTables_length select').removeClass( "custom-select custom-select-sm form-control form-control-sm");
    $('div.dataTables_length select').addClass( "mx-2 d-inline-block datatables-form-select");
  }
});