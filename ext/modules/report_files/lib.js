/*
 ReportFileAdapter
 */


function ReportFileAdapter(endPoint,tab,filter,orderBy) {
    this.initAdapter(endPoint,tab,filter,orderBy);
}

ReportFileAdapter.inherits(AdapterBase);



ReportFileAdapter.method('getDataMapping', function() {
    return [
        "id",
        "icon",
        "attachment",
        "name"
    ];
});

ReportFileAdapter.method('getHeaders', function() {
    return [
        { "sTitle": "ID","bVisible":false },
        { "sTitle": "","bSortable":false,"sWidth":"22px"},
        { "sTitle": "Attachment","bVisible":false },
        { "sTitle": "File"}
    ];
});

ReportFileAdapter.method('getFormFields', function() {
    return [
        [ "id", {"label":"ID","type":"hidden"}],
        [ "name", {"label":"File","type":"text"}]
    ];

});

ReportFileAdapter.method('getActionButtonsHtml', function(id,data) {
    var html = '<div style="width:80px;"><img class="tableActionButton" src="_BASE_images/download.png" style="cursor:pointer;" rel="tooltip" title="Download" onclick="download(\'_attachment_\');return false;"></img>_delete_</div>';

    var deleteButton = '<img class="tableActionButton" src="_BASE_images/delete.png" style="margin-left:15px;cursor:pointer;" rel="tooltip" title="Delete" onclick="modJs.deleteRow(_id_);return false;"></img>';

    if(this.showDelete){
        html = html.replace('_delete_',deleteButton);
    }else{
        html = html.replace('_delete_','');
    }

    html = html.replace(/_id_/g,id);
    html = html.replace(/_attachment_/g,data[2]);
    html = html.replace(/_BASE_/g,this.baseUrl);
    return html;
});

