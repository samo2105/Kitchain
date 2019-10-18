$(document).on('ready turbolinks:load', function () {
    $('.dtBasicExample').DataTable({
    "columnDefs": [
        { "searchable": true, "targets": [0, 2] }
    ]}
    );
    $('.dataTables_length').addClass('bs-select');
});