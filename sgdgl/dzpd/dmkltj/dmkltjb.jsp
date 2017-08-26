<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;
   	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");
	String px=request.getParameter("px");

%>
<%
int xxlyzs=0;//信息来源总数
String ls_sql=null;
String all=null;
ls_sql=null;
	//获取总数
	ls_sql="select count(*)from dm_xxlybm ";
	all=cf.executeQuery(ls_sql);
	xxlyzs=Integer.parseInt(all);

%>
<%
//**********************************
//根据用户属性，附加查询条件
//********************************
 String wheresql=null;
 if (yhjs.equals("A0")||yhjs.equals("A0"))
{

	wheresql="and (1=1)";
 }
else if (yhjs.equals("F0")||yhjs.equals("F1"))
{ 
	wheresql="and (sq_dwxx.ssdw='"+ssfgs+"') ";
 }
 else
 {
	wheresql="and (sq_dwxx.dwbh='"+dwbh+"') ";
 }

%> 
<%
//************************************
//将各种信息来源取出，赋值给数组，以便以后使用
//**********************************
String[] xxlymc;
String[] xxlybh;//定义数组
xxlymc=new String[xxlyzs];
xxlybh=new String[xxlyzs];//占用空间申请
String hjzs;
int jlzs=0;
int xh=0;
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
    rs =stmt.executeQuery(ls_sql);
	
	while (rs.next())
	{
		 
		
		xxlybh[xh]=cf.fillNull(rs.getString("xxlybm"));
		xxlymc[xh]=cf.fillNull(rs.getString("xxlymc"));
		//out.println(xxlymc[xh]);
		//out.println(',');
		xh++;
	
	}
	
}
catch (Exception e) {
	out.print("意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
//*******************************************
%>

<%
//计算各媒体客户来源数总数
ls_sql=null;
ls_sql="select count(*) from crm_khxxly,crm_zxkhxx,sq_dwxx " ;
ls_sql+=" where (crm_khxxly.khbh=crm_zxkhxx.khbh)  and (sq_dwxx.dwbh=crm_zxkhxx.zxdm) and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))  and ";
ls_sql+="(crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DDHH24:MI:SS'))";
ls_sql+=wheresql;
hjzs=cf.executeQuery(ls_sql);
jlzs=Integer.parseInt(hjzs);
//out.print(jlzs);
if(jlzs==0)
{
	out.print("这段时间无记录！");
	return;
}
%>

<%
//计算各媒体客户来源数
ls_sql=null;
ls_sql="select sq_dwxx.dwmc";
for (int i=0 ;i<xxlyzs;i++)
{
	ls_sql+=",count(decode(dm_xxlybm.xxlybm,'"+xxlybh[i]+"','"+xxlymc[i]+"')) AS "+xxlymc[i]+"";
}
ls_sql+=" from crm_zxkhxx,dm_xxlybm,sq_dwxx,crm_khxxly ";
ls_sql+=" where (crm_khxxly.xxlybm=dm_xxlybm.xxlybm)  and (sq_dwxx.dwbh=crm_zxkhxx.zxdm) and (crm_zxkhxx.khbh=crm_khxxly.khbh)";
ls_sql+=" and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))  and ";
ls_sql+="(crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DDHH24:MI:SS'))";
ls_sql+=wheresql;
ls_sql+=" group by sq_dwxx.dwmc";
//out.println(ls_sql);
%>


 <CENTER>
 <H3><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",dwbh,true);
%>咨询客流统计 </H3>
  <BR>(咨询时间：<%=sjfw%>→<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="10%">店面</td>
 <%
      for (int j=0 ;j<xxlyzs;j++)
       {
     out.println("<td  width=\"10%\">"+xxlymc[j]+"</td>");
	 
      }
%>
          </tr>
<%

	
   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(3000);//设置每页显示记录数
	for (int j=1 ;j<xxlyzs+1;j++)
	{
		pageObj.alignStr[j]="align='centre'";
	}
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
<!-- 求百分比-->
<%
ls_sql=null;
ls_sql="select '百分比'";
for (int i=0 ;i<xxlyzs;i++)
{
	ls_sql+=",ROUND(count(decode(dm_xxlybm.xxlybm,'"+xxlybh[i]+"','"+xxlymc[i]+"'))/"+jlzs+"*100,1)||'%'  ";
}
ls_sql+=" from crm_zxkhxx,dm_xxlybm,sq_dwxx,crm_khxxly ";
ls_sql+=" where (crm_khxxly.xxlybm=dm_xxlybm.xxlybm)  and (sq_dwxx.dwbh=crm_zxkhxx.zxdm) and (crm_zxkhxx.khbh=crm_khxxly.khbh)";
ls_sql+=" and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))  and ";
ls_sql+="(crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DDHH24:MI:SS'))";
ls_sql+=wheresql;
//out.println(ls_sql);
 pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(3000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
<!-- 求条形图-->
<%
//'<img src=\"/images/ColuGif.gif\" width=ROUND(count(decode(dm_xxlybm.xxlybm,'"+xxlybh[i]+"','"+xxlymc[i]+"'))/"+jlzs+"*100,1) //height=14>'
ls_sql=null;
ls_sql="select '条形图'";
for (int i=0 ;i<xxlyzs;i++)
{
	ls_sql+=",'<img src=\"/images/ColuGif.gif\" width='||count(decode(dm_xxlybm.xxlybm,'"+xxlybh[i]+"','"+xxlymc[i]+"'))*100/"+jlzs+"||' height=14>&nbsp;'";
}
ls_sql+=" from crm_zxkhxx,dm_xxlybm,sq_dwxx,crm_khxxly ";
ls_sql+=" where (crm_khxxly.xxlybm=dm_xxlybm.xxlybm)  and (sq_dwxx.dwbh=crm_zxkhxx.zxdm) and (crm_zxkhxx.khbh=crm_khxxly.khbh)";
ls_sql+=" and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))  and ";
ls_sql+="(crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DDHH24:MI:SS'))";
ls_sql+=wheresql;
pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(3000);//设置每页显示记录数

pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>

</body>
</html>