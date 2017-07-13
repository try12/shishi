<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="css/icon.css" />
    <link rel="stylesheet" href="css/easyui.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <script type="text/javascript">
        function init(){
            $("#menu_tree").tree({
                onClick:function(node){

                    //alert(node.url);
                    var ex = $("#work").tabs("exists",node.text);

                    if(!ex){
                        $("#work").tabs("add",{
                            title:node.text,
                            closable:true,
                            href:node.url
                        });

                    }else{

                        $("#work").tabs("select",node.text)
                    }
                },

            })

        }

        $(init);


    </script>
</head>

<body>
<div class="easyui-layout" style="width:100%;height:600px">
    <div data-options ="region:'north'" style="width:100%;height:100px;background-color:green">
        <h1 style="text-align: center">随便玩！</h1>
    </div>
    <div data-options ="region:'west'" style="width:200px">
        <ul id="menu_tree" class="easyui-tree" data-options="url:'findResByUser.do'"></ul>

    </div>
    <div id="work" data-options ="region:'center'" class="easyui-tabs" ></div>


</div>





</body>
</html>
