$(document).ready( function () {
	 var table = $('#employeesTable').DataTable({
			"sAjaxSource": "/employees",
			"sAjaxDataProp": "",
			"order": [[ 0, "asc" ]],
			"aoColumns": [
			    { "mData": "id"},
			    { "mData": "employeeLastName" },
				{ "mData": "employeeFirstName" },
				{ "mData": "extension" },
				{ "mData": "email" },
				{ "mData": "reportsTo" },
				{ "mData": "jobTitle" }
			]
	 })
});