<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='txin.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="txin.common.PageObject"/>

<%
	String ls_sql=null;
	String wheresql=" WHERE (1=1) ";
	int curPage=0;
	String pageStr=request.getParameter("curPage");

	if (pageStr!=null)//第x次运行
	{
		//要求显示第几页
		curPage=Integer.parseInt(pageStr);
		String chooseitem = request.getParameter("chooseitem");
		ls_sql="delete from jdatawindow_note where "+chooseitem;
		if ((chooseitem!=null)&&(!(chooseitem.equals(""))))//执行删除操作
		{
//			out.println("<BR>ls_sql="+ls_sql);
			Connection conn=cf.getConnection();    //得到连接
			try{
				pageObject.executeSql(conn,ls_sql);
			}
			catch(Exception e){
				out.println("<BR>执行pageObject.executeSql(conn,ls_sql)出错："+e);
				out.println("<BR>ls_sql="+ls_sql);
			}
			finally{
				cf.close(conn); //释放连接
			}
			pageObject.afterDelete();
		}
	}
	else//第一次运行,需要查询
	{
		curPage=1;
		String dw_name=null;
		String dw_note=null;
		String dw_sql=null;
		String dw_wheresql=null;
dw_name=request.getParameter("dw_name");
if (dw_name!=null)
{
	dw_name=cf.GB2Uni(dw_name);
	if (!(dw_name.equals("")))	wheresql+="  and (dw_name='"+dw_name+"')";
}
dw_note=request.getParameter("dw_note");
if (dw_note!=null)
{
	dw_note=cf.GB2Uni(dw_note);
	if (!(dw_note.equals("")))	wheresql+=" and  (dw_note='"+dw_note+"')";
}
dw_sql=request.getParameter("dw_sql");
if (dw_sql!=null)
{
	dw_sql=cf.GB2Uni(dw_sql);
	if (!(dw_sql.equals("")))	wheresql+=" and  (dw_sql='"+dw_sql+"')";
}
dw_wheresql=request.getParameter("dw_wheresql");
if (dw_wheresql!=null)
{
	dw_wheresql=cf.GB2Uni(dw_wheresql);
	if (!(dw_wheresql.equals("")))	wheresql+=" and  (dw_wheresql='"+dw_wheresql+"')";
}
	ls_sql="SELECT dw_name,dw_note,dw_sql,dw_wheresql  ";
	ls_sql+=" FROM jdatawindow_note  ";
    ls_sql+=wheresql;
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("Jdatawindow_noteList.jsp","SelectJdatawindow_note.jsp","ViewJdatawindow_note.jsp","EditJdatawindow_note.jsp");
/*
//设置显示列
	String[] disColName={"dw_name","dw_note","dw_sql","dw_wheresql"};
	pageObject.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dw_name"};
	pageObject.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdatawindow_noteList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObject.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObject.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObject.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="18%" height="2">&nbsp;</td>
		<td  width="16%" height="2">DataWindow名称</td>
		<td  width="22%" height="2">DataWindow说明</td>
		<td  width="22%" height="2">DataWindow SQL</td>
		<td  width="22%" height="2">WhereSQL</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>