<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="easyui-panel" title="搜索" style="width:100%;height:60px">

	<input class="easyui-searchbox" data-options="menu:'#choice',prompt:'输入搜索关键字',searcher:doSearch">
	<div id ="choice">
		<div data-options="name:'users'">账号</div>
		<div data-options="name:'pwd'">密码</div>
	</div>

</div>


<div id="first">

	<div id="easy-window" class="easyui-window"
		 style="width:400px;height:300px"
		 data-options="closed:true,modal:true">
		<div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">
			<form id="user_form" action="addUser.do">
				<input type="text" name="users" /><br /> <input type="password"
																name="pwd" /><br />

			</form>
			<div>
				<a class="easyui-linkbutton" href="javascript:save()">保存</a>
			</div>

		</div>

	</div>

	<div id="easy-window2" class="easyui-window"
		 style="width:400px;height:300px"
		 data-options="closed:true,modal:true">
		<div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">
			<form id="user_form2" action="updateUser.do">
				<input type="hidden" name="uzid" />
				<input type="text" name="users" /><br /> <input type="password"
																name="pwd" /><br />

			</form>
			<div>
				<a class="easyui-linkbutton" href="javascript:update1()">修改</a>
			</div>

		</div>

	</div>

	<div id="easy-window3" class="easyui-window" style="width:300px;height:300px" 	data-options="closed:true,modal:true">
		<div style="width:100%;height:100%">

			<ul id="power-tree" class="easyui-tree" data-options="url:'allResource.do',checkbox:true"></ul>

			<div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">

				<a class="easyui-linkbutton" href="javascript:topower()">分配</a>
			</div>

		</div>

	</div>



</div>


<script type="text/javascript">
    function init(){
        $("#first").datagrid({
            pagination : true,
            columns : [ [
                {
                    field : "uzid",
                    title : "id",
                    checkbox : true
                },
                {
                    field : "users",
                    title : "账号",
                    width : 100
                },
                {
                    field : "pwd",
                    title : "密码",
                    width : 100
                }
            ] ],
            toolbar : [
                {
                    text : "添加",
                    iconCls : "icon-add",
                    handler : function() {
                        add();
                    }
                },
                {
                    text : "修改",
                    iconCls : "icon-edit",
                    handler : function() {
                        edit();
                    }
                },
                {
                    text : "删除",
                    iconCls : "icon-remove",
                    handler : function() {
                        remove();
                    }
                },
                {
                    text : "权限",
                    iconCls : "icon-search",
                    handler : function() {
                        power();
                    }
                }
            ]

        });
        load1(1);
    }


	/* 分页 */
    function load1(p){

        $.getJSON("findalluser.do",{page:p},function(d){

            $("#first").datagrid("loadData",d);
            var pager=$("#first").datagrid("getPager");
            pager.pagination({
                total:7,
                pageSize:2,
                pageList:[1,2,3],
                pageNumber:p,
                onSelectPage:function(page,size){

                    load1(page);
                }


            });

        });

    }



	/* 添加数据 ————打开添加信息框*/
    function add() {
        $("#user_form").form("clear")
        $("#easy-window").window("open");
    }


	/*
	 //删除单个数据
	 function remove() {
	 var data = $("#first").datagrid("getSelected");
	 $.get("removeUser.do" ,{id:data.id},function(d){

	 if(d){

	 $("#first").datagrid("reload");

	 }


	 });
	 }

	 */

    //删除多个数据
    function remove() {
        var data = $("#first").datagrid("getSelections");
        var did=[];
        for(var i=0 ;i<data.length;i++ ){
            did[i]=data[i].uzid;
        }
        var didjson = JSON.stringify(did);
        //alert(didjson)
        $.ajax({
            url:"../removeUser.do",
            method:"post",
            data:didjson,
            contentType:"application/json",
            success:function(d){
                load1(1);
            }
        })
    }


	/* 修改数据————数据填充到输入框 */
    function edit() {
        var data=$("#first").datagrid("getSelected");
        $("#user_form2").form("load",{
            uzid:data.uzid,
            users:data.users,
            pwd:data.pwd
        });
        $("#easy-window2").window("open");
    }


	/* 修改数据————数据在数据库进行修改 */
    function update1(){
        $("#user_form2").form("submit",{
            success:function(d){
                $("#easy-window2").window("close");
                load1(1);
            }
        });
    }


	/* 添加数据————数据保存到数据库 */
    function save(){
        $("#user_form").form("submit",{
            success:function(d){
                $("#easy-window").window("close");
                load1(1);
            }
        });
    }


	/* 权限分配  */
    function power(){
        var isu = $("#first").datagrid("getSelected");

        if(isu){

            $("#easy-window3").window("open");
            findqx();

        }else{

            $.messager.alert("系统提示","请选择要分配权限的账号!");

        }
    }

    function topower(){
        var user=$("#first").datagrid("getSelected");
        var data= $("#power-tree").tree("getChecked");
        var as=[user.uzid];
        for(i=0;i<data.length;i++){
            as[i+1]=data[i].id;
        }
        //转化为json
        var json=JSON.stringify(as);
        $.ajax({
            url:"../powerGive.do",
            method:"post",
            data:json,
            contentType:"application/json",
            success:function(d){
                $("#easy-window3").window("close");
                load1(1);

            }
        });


    }

	/* function doSearch(key,type){
	 $.getJSON("search.do",{type:type,key:key},function(d){
	 $("#first").datagrid("loadData",d);
	 });
	 } */
    function doSearch(key,type){
        //alert(type+"---"+key);
        $.getJSON("../search.do",{type:type,key:key},function(d){

            $("#first").datagrid("loadData",d);
        });

    }



    //获取该用户的权限
    function findqx(){
        var user= $("#first").datagrid('getSelected');
        // var user= $("#first").datagrid('getSelected');
        alert("findqx--"+ user.uzid)
        $.ajax({
            url:"../findResByUser2.do",
            method: "post",
            data:{uzid:user.uzid},
            success:function(x){

                alert("后台传过来的"+x)
                if(x){
                    var data= JSON.parse(x);
                    for(var i=0;i<data.length;i++){
                        var node=$("#power-tree").tree('find',data[i].id);
                        $('#power-tree').tree('check', node.target);
                        var childrendata= data[i].children;
                        for(var j=0;j<childrendata.length;j++){
                            //  alert(childrendata[j].id)
                            var node=$("#power-tree").tree('find',childrendata[j].id);
                            // alert(node.target)
                            $('#power-tree').tree('check', node.target);
                        }
                    }

                }
            }

        });
    }




    init();
</script>




	
