<%@ page pageEncoding="UTF-8"%>
</div> <!-- content end -->
            
	<hr>
	<footer>
	    <p>Copyright ⓒ SEOULCOSA. All Rights Reserved.</p>
	</footer>
        
        <!--/.fluid-container-->
        <!-- <script src="/lib/vendors/jquery-1.9.1.min.js"></script>
        <script src="/lib/vendors/jquery-1.9.1.js"></script>
        <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="/lib/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="/lib/assets/scripts.js"></script>
        <script src="/lib/vendors/datatables/js/jquery.dataTables.min.js"></script>
        
        <link href="/lib/vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="/lib/vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="/lib/vendors/chosen.min.css" rel="stylesheet" media="screen">
        <link href="/lib/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
        <link href="/lib/vendors/fullcalendar/fullcalendar.css" rel="stylesheet" media="screen">
        <script src="/lib/vendors/jquery.uniform.min.js"></script>
        <script src="/lib/vendors/chosen.jquery.min.js"></script>
        <script src="/lib/vendors/bootstrap-datepicker.js"></script>
        <script src="/lib/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="/lib/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="/lib/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="/lib/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="/lib/assets/form-validation.js"></script>

		<script src="/lib/assets/scripts.js"></script>
        <script src="/lib/assets/DT_bootstrap.js"></script> -->
        <script>
    	jQuery(document).ready(function() {   
    	   FormValidation.init();
    	});
    	
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
            
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
//            $('.textarea').wysihtml5();
            
            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        </script>
		</main>
    </body>
</html>