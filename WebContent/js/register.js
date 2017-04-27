$(document).ready(function() {
	getBloodGroups();
	getSkillDetails();
	$("#updatePic").hide();
	$(".updateBtn").hide();
});
function registerEmployee() {
	var empObject = new Object();
	var empName = $("#empName").val();
	var empGender = $('input[name=yesno]:checked', '#empGender').val();
	var empBgroup = $('#empBloodGroup option:selected').val();
	var empSkills = [];
	$('input:checkbox[name=skill]:checked').each(function() {
		empSkills.push($(this).val());
	});
	var filename = $('input[type=file]').val();
	var empAddress = $('#empAddress').val();
	empObject.Name = empName;
	empObject.Gender = empGender;
	empObject.Blood = empBgroup;
	empObject.Skills = empSkills;
	empObject.FileName = filename;
	empObject.Address = empAddress;
	var param = "Name=" + empName + "&Gender=" + empGender + "&Blood="
			+ empBgroup + "&empSkills=" + empSkills + "&Address=" + empAddress;
	$
			.ajax({
				data : empObject,
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/setEmpDetails?param="
						+ param,
				success : function(data) {
					getEmpDetails();
				}
			});
}

function getEmpDetails() {
	var html = '';
	$
			.ajax({
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/getEmpDetails",
				success : function(data) {
					$
							.each(
									data.EmpDetails,
									function(key, val) {
										var fileName = data.EmpDetails[key].empPhoto
												.replace(/^.*[\\\/]/, '');
										html = html
												+ '<tr id=empdetails'
												+ key
												+ '>'
												+ '<td id=empId'
												+ key
												+ '>'
												+ data.EmpDetails[key].empId
												+ '</td>'
												+ '<td id=empPhoto'
												+ key
												+ '><a href="../images/'
												+ fileName
												+ '" target="_blank"><img height=30 width=30 src="../images/'
												+ fileName
												+ '" class="img-rounded" alt="Cinque Terre" width="304" height="236"></a></td>'
												+ '<td id=empName'
												+ key
												+ '>'
												+ data.EmpDetails[key].empName
												+ '</td>'
												+ '<td id=empGroupId'
												+ key
												+ '>'
												+ data.EmpDetails[key].empGroupName
												+ '</td>'
												+ '<td id=empSkills'
												+ key
												+ '>'
												+ data.EmpDetails[key].empSkillsName
												+ '</td>'
												+ '<td id=empAddress'
												+ key
												+ '>'
												+ data.EmpDetails[key].empAddress
												+ '</td>'
												+ '<td><button id=edit'
												+ key
												+ ' style="text-transform:underline;" onclick="editEmpDetails('
												+ key
												+ ')">Edit</button></a></td>'
												+ '<td><button id=delete'
												+ key
												+ ' style="text-transform:underline;" onclick="deleteEmp('
												+ key
												+ ')">Delete</button></td>'
												+ '</tr>';
									});
					$('#empdet').empty().append(html);
				}
			});
}
function editEmpDetails(elem) {
	var param = $('#empId' + elem).text();
	$("#submitBtn").hide();
	$("#updatePic").hide();
	$(".updateBtn").show();
	$(".updateBtn").attr("onclick", "updateEmployee(" + elem + ")");
	$
			.ajax({
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/editEmpDetails?empId="
						+ param,
				success : function(data) {
					$.each(data.EmpDetails, function(key, val) {
						var fileName = data.EmpDetails[key].empPhoto.replace(
								/^.*[\\\/]/, '');
						$("#empName").val(data.EmpDetails[key].empName);
						if (data.EmpDetails[key].empGender == 'M') {
							$(".male").attr("checked", "checked");
						} else {
							$(".female").attr("checked", "checked");
						}
						var groupId = data.EmpDetails[key].empGroupId;
						$("#" + groupId).attr("selected", "selected");
						$("#empAddress").val(data.EmpDetails[key].empAddress);
					});
					$.each(data.EmpSkillDetails, function(key, val) {
						var skillId = data.EmpSkillDetails[key].skillId;
						$("#" + skillId).attr("checked", "checked");
					});
				}
			});
}
function deleteEmp(elem) {
	var param = $('#empId' + elem).text();
	$
			.ajax({
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/deleteEmpDetails?empId="
						+ param,
				success : function(data) {
					getEmpDetails();
				}
			});
}
function getBloodGroups() {
	$
			.ajax({
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/getBloodGroups",
				success : function(data) {
					var html = "";
					$.each(data.BloodGroup, function(key, val) {
						html = html + '<option id="'
								+ data.BloodGroup[key].groupId + '" value="'
								+ data.BloodGroup[key].groupId + '">'
								+ data.BloodGroup[key].groupName + '</option>';
					});
					$('#empBloodGroup').empty().append(html);
				}
			});
}
function getSkillDetails() {
	$
			.ajax({
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/getSkillsDetails",
				success : function(data) {
					var html = "";
					$
							.each(
									data.Skills,
									function(key, val) {
										html = html
												+ '<label><input type="checkbox" name="skill" id="'
												+ data.Skills[key].skillId
												+ '" value="'
												+ data.Skills[key].skillId
												+ '">'
												+ data.Skills[key].skillName
												+ '</label>';
									});
					$('#skillDetails').empty().append(html);
				}
			});
}
function resetData() {
	$("#empName").val('');
	$('#empAddress').val('');
}
function loadchosen() {
	var config = {
		'.chosen-select' : {},
		'.chosen-select-deselect' : {
			allow_single_deselect : true
		},
		'.chosen-select-no-single' : {
			disable_search_threshold : 10
		},
		'.chosen-select-no-results' : {
			no_results_text : 'Oops, nothing found!'
		},
		'.chosen-select-width' : {
			width : "95%"
		}
	};
	for ( var selector in config) {
		$(selector).chosen(config[selector]);
	}
}
function uploadPic() {
	var path = $('input[type=file][name=uploadFile]').val();
	alert(path);
	var fd = new FormData();
	$.each($('#pic')[0].files, function(i, file) {
		fd.append('file-' + i, file);
	});
	$.ajax({
		data : fd,
		processData : false,
		contentType : false,
		type : 'POST',
		url : "http://localhost:8080/EmpSkillPortal/emp/empService/upload",
		success : function(data) {
			alert("file uploaded successfully");
		},
	});
}
function updatePic(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#empImg").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function updateEmployee(elem) {
	var empObject = new Object();
	var empName = $("#empName").val();
	var empId = $("#empId" + elem).text();
	var empGender = $('input[name=yesno]:checked', '#empGender').val();
	var empBgroup = $('#empBloodGroup option:selected').val();
	var empSkills = [];
	$('input:checkbox[name=skill]:checked').each(function() {
		empSkills.push($(this).val());
	});
	var filename = $('input[type=file]').val();
	var empAddress = $('#empAddress').val();
	empObject.Name = empName;
	empObject.Gender = empGender;
	empObject.Blood = empBgroup;
	empObject.Skills = empSkills;
	empObject.FileName = filename;
	empObject.Address = empAddress;
	var param = "Name=" + empName + "&Gender=" + empGender + "&Blood="
			+ empBgroup + "&empSkills=" + empSkills + "&Address=" + empAddress
			+ "&empId=" + empId;
	$
			.ajax({
				data : empObject,
				url : "http://localhost:8080/EmpSkillPortal/emp/empService/updateEmpDetails?param="
						+ param,
				success : function(data) {
					if (data.Msg = "success") {
						getEmpDetails();
						$(".updateBtn").hide();
						$("#submitBtn").show();
					}
				}
			});
}