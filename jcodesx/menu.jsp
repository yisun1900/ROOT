<%@ page contentType="text/html;charset=gb2312" %>


<html>
<head>
<title>OROP信息管理系统菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='./js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>
<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5>
<SCRIPT SRC="./js/menu.js"></SCRIPT>
<SCRIPT SRC="./js/menu_functions.js"></SCRIPT>

<script>
foldersTree = gFld('YBL-JCoding主菜单|iGeneric', '');

cdbh02       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>编辑数据窗口</B></FONT>|iJvm", ""));
insDoc(cdbh02, gLnk(2, "编辑数据窗口^iJvmAttribute.gif", "datawindow/SelectDwFrame.jsp"));
insDoc(cdbh02, gLnk(2, "编辑数据窗口^iJvmAttribute.gif", "datawindow1/SelectDwFrame.jsp"));
insDoc(cdbh02, gLnk(2, "查看数据窗口^iJvmAttribute.gif", "datawindow/SelectCxJdatawindow_note.jsp"));
insDoc(cdbh02, gLnk(2, "生成SQL语句^iJvmAttribute.gif", "makesql/SelectTableFrame.jsp"));

cdbh03       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>生成插入网页</B></FONT>|iJvm", ""));
insDoc(cdbh03, gLnk(2, "选择插入列^iJvmAttribute.gif", "insert/editInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "生成插入代码^iJvmAttribute.gif", "insert/viewInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "选择插入列^iJvmAttribute.gif", "insert1/editInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "生成插入代码^iJvmAttribute.gif", "insert1/viewInsertFrame.jsp"));

cdbh04       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>生成修改网页</B></FONT>|iJvm", ""));
insDoc(cdbh04, gLnk(2, "选择修改列^iJvmAttribute.gif", "edit/editFrame.jsp"));
insDoc(cdbh04, gLnk(2, "生成修改代码^iJvmAttribute.gif", "edit/viewEditFrame.jsp"));
insDoc(cdbh04, gLnk(2, "选择修改列^iJvmAttribute.gif", "edit1/editFrame.jsp"));
insDoc(cdbh04, gLnk(2, "生成修改代码^iJvmAttribute.gif", "edit1/viewEditFrame.jsp"));

cdbh05       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>生成查看网页</B></FONT>|iJvm", ""));
insDoc(cdbh05, gLnk(2, "选择查看列^iJvmAttribute.gif", "view/viewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "生成查看代码^iJvmAttribute.gif", "view/viewViewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "选择查看列^iJvmAttribute.gif", "view1/viewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "生成查看代码^iJvmAttribute.gif", "view1/viewViewFrame.jsp"));

cdbh06       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>生成查询网页</B></FONT>|iJvm", ""));
insDoc(cdbh06, gLnk(2, "选择查询列^iJvmAttribute.gif", "select/editSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "生成查询代码^iJvmAttribute.gif", "select/viewSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "选择查询列^iJvmAttribute.gif", "select1/editSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "生成查询代码^iJvmAttribute.gif", "select1/viewSelectFrame.jsp"));

cdbh07       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>生成统计网页</B></FONT>|iJvm", ""));
insDoc(cdbh07, gLnk(2, "选择统计条件^iJvmAttribute.gif", "tj/tjFrame.jsp"));
insDoc(cdbh07, gLnk(2, "生成统计代码^iJvmAttribute.gif", "tj/viewTjFrame.jsp"));

cdbh08       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>预览生成结果</B></FONT>|iJvm", ""));
insDoc(cdbh08, gLnk(2, "预览生成结果^iJvmAttribute.gif", "preview/previewframe.jsp"));

cdbh09       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>系统部署</B></FONT>|iJvm", ""));
insDoc(cdbh09, gLnk(2, "系统部署^iJvmAttribute.gif", "ff/editViewCol.jsp"));

cdbh10       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>参数配置</B></FONT>|iJvm", ""));
insDoc(cdbh10, gLnk(2, "参数配置^iJvmAttribute.gif", "setparam/setparam.jsp"));

cdbh011       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>帮助</B></FONT>|iJvm", ""));
insDoc(cdbh011, gLnk(2, "操作说明^iJvmAttribute.gif", "help/use.jsp"));
insDoc(cdbh011, gLnk(2, "关于JCoding^iJvmAttribute.gif", "help/about.jsp"));

</SCRIPT>

<script language="JavaScript">
	parent.main.location="content.jsp";
	initializeDocument()
</SCRIPT>

</body>
</html>
