<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsbm.dwbh='"+dwbh+"'";
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">信息来源分析表
  <BR>(<%=sjfw%>--<%=sjfw2%>)</font></B> 
</CENTER>
<table width="100%" border="0">
  <tr> 
    <td> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="30%">来源</td>
          <td  width="20%">数量</td>
          <td  width="50%">百分比 </td>
        </tr>
        <%
		//输出显示数据
		
		//获取总数
		ls_sql="SELECT count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_slfsbm ";
		ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;

		String all=cf.executeQuery(ls_sql);
		
		ls_sql="SELECT slfsmc,count(distinct crm_tsjl.tsjlh),'<img src=\"/images/ColuGif.gif\" width='||count(distinct crm_tsjl.tsjlh)*200/"+all+"||' height=14>&nbsp;'||ROUND(count(distinct crm_tsjl.tsjlh)/"+all+"*100,2)||'%'";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_slfsbm ";
		ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by slfsmc";


		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(10000);
		pageObj.alignStr[2]="align='left'";

		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();
		%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
