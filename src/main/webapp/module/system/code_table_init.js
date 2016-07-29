$(function($) {
	
	$("#btnSearch").click(function(){
		var postData = $("#searchForm").form2json();
		$("#codeTableGrid").jqGrid('setGridParam',{datatype:'json', postData : {searchForm: postData}}).trigger('reloadGrid');
	});
	
	$("#btnSave").click(function(){
		var $form = $("#dataForm");
		var actionUrl = g_contextPath +"/system/codeTable/save.shtml";
        $form.ajaxPostForm(actionUrl,
             function (response) {
        		
//                 notifSuccess(response.message);
//                 var actionUrl = editEnquiryComplaintUrl.replace("-1", response.data);
//                 window.location = actionUrl;
             }
        );
	});
	
	$("#searchForm #codeTableType").chosen();
	

	var $grid_selector = $("#codeTableGrid");
    var pager_selector = "#gridPager";
    
    $grid_selector.jqGrid({
		//direction: "rtl",
    	url: g_contextPath +"/system/codeTable/search.shtml",
    	postData : {searchForm: $("#searchForm").form2json()},
		//data: grid_data,
    	datatype: "local",
        mtype: "POST",
		colNames:[' Id ', 'Type','Code','Description', 'Modified Date'],
		colModel:[
			{name:'codeTableId',index:'id', width:1,hidden:true},
			{name:'type', width:1},
			{name:'code',width:1},
			{name:'description',width:2},
			{name:'modifiedDate',width:1}
		], 
		pager : pager_selector,
		//toppager: true,
		multiselect: true,
		//multikey: "ctrlKey",
        multiboxonly: true,
		//loadComplete : defaultGridLoadComplete,
		editurl: "/dummy.html",//nothing is saved
		caption: "Code Table List",
	});

	$grid_selector.jqGrid('navGrid', pager_selector, {
        //navbar options
        search: true,
        refresh: true,
    }, {}, {}, {}, {
        //search form
        recreateForm: true,
        //afterShowSearch: defaultSearchFormAfterShowSearch,
        //afterRedraw: defaultSearchFormAfterRedraw
    }, {}).jqGrid('navButtonAdd', pager_selector, {
        caption: "",
        buttonicon: "icon-plus-sign purple",
        onClickButton: onNewRecord,
        position: "first",
        title: "New Record",
        cursor: "pointer"
    });
	
	function onNewRecord(){
		displayInput();
	}

	$('#code_table_modal_div').on('shown.bs.modal', function () {
		$("#dataForm #codeTableType").chosen(); 
	})
});

function displayInput() {
	 $('#code_table_modal_div').modal({ 
		 backdrop: 'static', 
		 show: true, 
		 keyboard:false,
	 });
};