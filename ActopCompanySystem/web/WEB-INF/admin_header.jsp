<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Management System</title>
<title>Actop System</title>
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('.dataTables-example').dataTable();
        $('.dataTables-example').dataTable();
        $('#access').change(function () {
            if ($('#access').is(":checked")) {
                $('.permissions').show(500);
            } else {
                $('.permissions').hide(500);
            }
        });
        $('#changepermission').click(function () {
            $('.text').hide();
            $(this).hide();
            $('.edit').show(500);
            $('#saveChanges').show(500);
        });

        $.post('LoadPermissionsByEmp', {empid: $('#emp').val()}, function (data, status) {
            $('#permbyempbody').html(data);
        });
        $('#permbyempbody').change(function () {
            $.post('LoadPermissionsByEmp', {empid: $('#emp').val()}, function (data, status) {
                $('#permbyempbody').html("0");
            });
        });
        setInterval(function () {
            $.post('ApprovalListner', {}, function (data, status) {
                $('#msg').html(data);
            });
        }, 6000);
        $.post('ApprovalListner', {}, function (data, status) {
            $('#msg').html(data);
        });
    });
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</compress:html>