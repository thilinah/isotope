/**
 * Author: Thilina Hasantha
 */


/**
 * SettingAdapter
 */

function SettingAdapter(endPoint,tab,filter,orderBy) {
	this.initAdapter(endPoint,tab,filter,orderBy);
}

SettingAdapter.inherits(AdapterBase);



SettingAdapter.method('getDataMapping', function() {
	return [
	        "id",
	        "name",
	        "value",
	        "description"
	];
});

SettingAdapter.method('getHeaders', function() {
	return [
			{ "sTitle": "ID" ,"bVisible":false},
			{ "sTitle": "Name" },
			{ "sTitle": "Value"},
			{ "sTitle": "Details"}
	];
});

SettingAdapter.method('getFormFields', function() {
	return [
	        [ "id", {"label":"ID","type":"hidden"}],
	        [ "value", {"label":"Value","type":"text","validation":"none"}]
	];
});

SettingAdapter.method('getActionButtonsHtml', function(id,data) {
	var html = '<div style="width:80px;"><img class="tableActionButton" src="_BASE_images/edit.png" style="cursor:pointer;" rel="tooltip" title="Edit" onclick="modJs.edit(_id_);return false;"></img></div>';
	html = html.replace(/_id_/g,id);
	html = html.replace(/_BASE_/g,this.baseUrl);
	return html;
});


SettingAdapter.method('getMetaFieldForRendering', function(fieldName) {
	if(fieldName == "value"){
		return "meta";
	}
	return "";
});


SettingAdapter.method('fillForm', function(object) {
	this.uber('fillForm',object);
	$("#helptext").html(object.description);
});



/**
 * LogAdapter
 */

function LogAdapter(endPoint,tab,filter,orderBy) {
    this.initAdapter(endPoint,tab,filter,orderBy);
}

LogAdapter.inherits(AdapterBase);



LogAdapter.method('getDataMapping', function() {
    return [

    ];
});

LogAdapter.method('getHeaders', function() {
    return [

    ];
});

LogAdapter.method('getFormFields', function() {
    return [

    ];
});

LogAdapter.method('get', function(id) {
    var that = this;
    var object = {};
    var reqJson = JSON.stringify(object);

    var callBackData = [];
    callBackData['callBackData'] = [];
    callBackData['callBackSuccess'] = 'getLogsSuccessCallback';
    callBackData['callBackFail'] = 'getLogsFailCallback';

    this.customAction('getAppLog','admin=settings',reqJson,callBackData);

});

LogAdapter.method('getLogsSuccessCallback', function(data) {
    $("#Log").html(data);
});

LogAdapter.method('getLogsFailCallback', function() {
    this.showMessage("Error", "Log request failed");
});