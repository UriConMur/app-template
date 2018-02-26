<head>
	<title>Beliveo bBox - Powered by people</title>
	<link rel="stylesheet" type="text/css" href="src/client/pages/access-control/css/styles.css">
</head>
<div class='access-control-page'>
		<center><h1>This is the access Control</h1></center>
		<div id='list_pages'></div><hr>
		<div id='permissions'>
			<center><h2>Permissions for this page</h2></center>
			<div class="row">
				<div class="col col-md-6">
					<table class="table">
						<thead>
							<tr>
								<th colspan=3>Positions</th>
							</tr>
							<tr>
								<th>ID Position</th>
								<th>Rules for position</th>
								<th>&emsp;</th>
							</tr>
						</thead>
						<tr>
							<td><input id="position_to_add" type="number" placeholder="ID Position" /></td>
							<td><input id="pos_rules_to_add" type="text" placeholder="Rules" /></td>
							<td><i id="pos_add" class="fa fa-plus"></i></td>
						</tr>
						<tbody id='perm_positions'>
						</tbody>
					</table>
				</div>
				<div class="col col-md-6">
					<table class="table">
						<thead>
							<tr>
								<th colspan=3>Employees</th>
							</tr>
							<tr>
								<th>ID Employee</th>
								<th>Rules for employee</th>
								<th>&emsp;</th>
							</tr>
						</thead>
						<tr>
							<td><input id="employee_to_add" type="number" placeholder="ID Employee" /></td>
							<td><input id="emp_rules_to_add" type="text" placeholder="Rules" /></td>
							<td><i id="emp_add" class="fa fa-plus"></i></td>
						</tr>
						<tbody id='perm_employees'>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</div>
<script>
	jQuery(document).ready(function($){
		var api_url = "src/server/public";
		var selectedPage = null;

		function get_pages() {
			var dataJson = JSON.stringify({});
			$.ajax(
					{
							type:   "GET",
							contentType: 'application/json',
							url: api_url + "/pages",
							cache:  false,
							beforeSend: function () {},
							success: function (data, textStatus, jqXHR) {
									var results = JSON.parse(data).body;
									$("#list_pages").html('');
									for(var i = 0; i<results.length; i++){
										var page = results[i];
										var object = ''+
										'<div class="page" page-id="'+page.id_page+'">'+
											'<span>'+page.title+'</span>'+
										'</div>';
										$("#list_pages").append(object);
									}
							},
							error: function (jqXHR, textStatus, errorThrown) {
							}
					}
			);
		}

		$(document).on("click", ".delete_permission", function(){
			var target = $(this).attr("target");
			var type_id = $(this).attr("type_perm");
			var dataJson = JSON.stringify({target: target});

			var api = '';
			if(type_id == 1){
				api = "/permission/employee/";
			} else if(type_id == 2) {
				api = "/permission/position/";
			}
			$.ajax({
				type:   "DELETE",
				contentType: 'application/json',
				url: api_url + api + selectedPage,
				dataType: "json",
				data:  dataJson,
				cache:  false,
				beforeSend: function () {},
				success: function (data, textStatus, jqXHR) {
					if(type_id == 1){
						$("#perm_emp_"+target).remove();
					} else if(type_id == 2) {
						$("#perm_pos_"+target).remove();
					}
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert("Error");
				}
			});
		})

		$(document).on("click", "#pos_add", function(){
			var target     = $("#position_to_add").val();
			var rules     = $("#pos_rules_to_add").val();
			var dataJson = JSON.stringify({target: target, rules: rules});

			if(target=='') {
				alert("Add ID Position");
			} else if(target > 0) {
				$.ajax({
					type:   "POST",
					contentType: 'application/json',
					url: api_url + "/permission/position/" + selectedPage,
					dataType: "json",
					data:  dataJson,
					cache:  false,
					beforeSend: function () {},
					success: function (data, textStatus, jqXHR) {
						var elementDOM = $("#perm_pos_rule_"+target);
						if(elementDOM.length > 0) {
							elementDOM.text(rules);
							elementDOM.animate({
						    fontSize: '20px',
						  },500);
							elementDOM.animate({
						    fontSize: '15px',
						  },500);
						} else {
							var object = '<tr id="perm_pos_'+target+'">'+
							'<td>'+target+'</td>'+
							'<td id="perm_pos_rule_'+target+'">'+rules+'</td>'+
							'<td><i class="delete_permission fa fa-close" type_perm="2" target="'+target+'"></i></td>'+
							'</tr>';
							$("#perm_positions").append(object);
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert("Error");
					}
				});
			}
		});


		$(document).on("click", "#emp_add", function(){
			var target     = $("#employee_to_add").val();
			var rules     = $("#emp_rules_to_add").val();
			var dataJson = JSON.stringify({target: target, rules: rules});

			if(target=='' && target > 0) {
				alert("Add ID Employee");
			} else if(target > 0) {
				$.ajax({
					type:   "POST",
					contentType: 'application/json',
					url: api_url + "/permission/employee/" + selectedPage,
					dataType: "json",
					data:  dataJson,
					cache:  false,
					beforeSend: function () {},
					success: function (data, textStatus, jqXHR) {
						var elementDOM = $("#perm_emp_rule_"+target);
						if(elementDOM.length > 0) {
							elementDOM.text(rules);
							elementDOM.animate({
						    fontSize: '20px',
						  },500);
							elementDOM.animate({
						    fontSize: '15px',
						  },500);
						} else {
							var object = '<tr id="perm_emp_'+target+'">'+
							'<td>'+target+'</td>'+
							'<td id="perm_emp_rule_'+target+'">'+rules+'</td>'+
							'<td><i class="delete_permission fa fa-close" type_perm="1" target="'+target+'"></i></td>'+
							'</tr>';
							$("#perm_employees").append(object);
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert("Error");
					}
				});
			}
		});

		$(document).on("click", ".page", function(){
			$(".page").removeClass("active");
			$(this).addClass("active");
			$("#permissions").fadeIn();
			selectedPage = $(this).attr("page-id");

			$.ajax({
				type:   "GET",
				contentType: 'application/json',
				url: api_url + "/permission/position/" + selectedPage,
				cache:  false,
				beforeSend: function () {},
				success: function (data, textStatus, jqXHR) {
						var results = JSON.parse(data).body;
						$("#perm_positions").html('');
						for(var i = 0; i<results.length; i++){
							var permission = results[i];
							var object = '<tr id="perm_pos_'+permission.id_position+'">'+
							'<td>'+permission.id_position+'</td>'+
							'<td id="perm_pos_rule_'+permission.id_position+'">'+permission.rules+'</td>'+
							'<td><i class="delete_permission fa fa-close" type_perm="2" target="'+permission.id_position+'"></i></td>'+
							'</tr>';
							$("#perm_positions").append(object);
						}
				},
				error: function (jqXHR, textStatus, errorThrown) {
				}
			});

			$.ajax({
				type:   "GET",
				contentType: 'application/json',
				url: api_url + "/permission/employee/" + selectedPage,
				cache:  false,
				beforeSend: function () {},
				success: function (data, textStatus, jqXHR) {
						var results = JSON.parse(data).body;
						$("#perm_employees").html('');
						for(var i = 0; i<results.length; i++){
							var permission = results[i];
							var object = '<tr id="perm_emp_'+permission.id_employee+'">'+
							'<td>'+permission.id_employee+'</td>'+
							'<td id="perm_emp_rule_'+permission.id_employee+'"">'+permission.rules+'</td>'+
							'<td><i class="delete_permission fa fa-close" type_perm="1" target="'+permission.id_employee+'"></i></td>'+
							'</tr>';
							$("#perm_employees").append(object);
						}
				},
				error: function (jqXHR, textStatus, errorThrown) {
				}
			});

		})

		function init(){
			get_pages();
		}
		init();
	})

</script>
