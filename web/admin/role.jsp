<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<div id="role">
		<div id="easy-window-role" class="easyui-window"
			style="width:400px;height:300px"
			data-options="closed:true,modal:true">
			<div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">
				<form id="role_form" action="addRole.do">
					<input type="text" name="roles" /><br /> 

				</form>
				<div>
					<a class="easyui-linkbutton" href="javascript:save()">保存</a>
				</div>

			</div>

		</div>

		<div id="easy-window2-role" class="easyui-window"
			style="width:400px;height:300px"
			data-options="closed:true,modal:true">
			<div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">
				<form id="role_form2" action="updateRole.do">
					<input type="hidden" name="rzid" />
					<input type="text" name="roles" /><br /> 

				</form>
				<div>
					<a class="easyui-linkbutton" href="javascript:update1()">修改</a>
				</div>

			</div>

		</div>
		
		
		
	</div>


<script type="text/javascript">
	function init(){
		$("#role").datagrid({
			pagination : true,
			columns : [ [
				{
					field : "rzid",
					title : "rzid",
					checkbox : true
				},
				{
					field : "roles",
					title : "职位",
					width : 100
				}
			] ],
			toolbar : [
				{
					text : "添加",
					iconCls : "icon-add",
					handler : function() {
						addRole();
					}
				},
				{
					text : "修改",
					iconCls : "icon-edit",
					handler : function() {
						editRole();
					}
				},
				{
					text : "删除",
					iconCls : "icon-remove",
					handler : function() {
						removeRole();
					}
				}
			]
			
		});
		loadRole(1);
	}


	/* 分页 */	
	function loadRole(p){
	//var count=0;
	$.getJSON("findallrole.do",{page:p},function(d){
	/* 	for(var a in d){
			if(d[a]){
				count++;
				}
			} */
		//alert(count);
		$("#role").datagrid("loadData",d);
		var pager=$("#role").datagrid("getPager");
			pager.pagination({
				total:5,
				pageSize:2,
				pageList:[1,2,3],
				pageNumber:p,
				onSelectPage:function(page,size){
				
						loadRole(page);
				}
			
			
			});
	
	});
	
	}



	/* 添加数据 ————打开添加信息框*/
	function addRole() {
	    $("#role_form").form("clear")
		$("#easy-window-role").window("open");
	}
	
	/* 添加数据————数据保存到数据库 */
	function save(){
		$("#role_form").form("submit",{		
			success:function(d){			
				$("#easy-window-role").window("close");
					loadRole(1);						
			}		
		});	
	}
	
	/* 修改数据————数据填充到输入框 */
	function editRole() {		 
		var data=$("#role").datagrid("getSelected");		
	  $("#role_form2").form("load",{
	     rzid:data.rzid,
	     roles:data.roles
	   
	  });
		$("#easy-window2-role").window("open");
	}


	/* 修改数据————数据在数据库进行修改 */
	function update1(){
		$("#role_form2").form("submit",{		
			success:function(d){			
				$("#easy-window2-role").window("close");
					loadRole(1);					
			}		
		});	
	}
	
	
	
	/*
	//删除单个数据
	function remove() {
		var data = $("#role").datagrid("getSelected");
		$.get("removeUser.do" ,{id:data.id},function(d){

			if(d){
			
				loadRole(1);
			
			}
		
		
		});
	}
		
	*/
	
	//删除多个数据
	function removeRole() {
		var data = $("#role").datagrid("getSelections");
		var did=[];
		for(var i=0 ;i<data.length;i++ ){
			did[i]=data[i].rzid;
		}
		var didjson = JSON.stringify(did);
		//alert(didjson)
		$.ajax({
			url:"removeRole.do",
			method:"post",
			data:didjson,
			 contentType:"application/json",
			 success:function(d){	
			 //alert(d);		 	
			 		loadRole(1);		 
		 }			
		})
	}
	
	
	

	init();
</script>




	
