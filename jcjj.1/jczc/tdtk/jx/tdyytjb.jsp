<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">减项原因分析 
  <BR>(<%=sjfw%>--<%=sjfw2%>)</font></B> 
  <BR>
</CENTER>
<table border="0" width="100%" style='FONT-SIZE: 14px'>
  <tr align="center">
    <td colspan="3">
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="28%">减项原因 </td>
          <td  width="12%">数量（起）</td>
          <td  width="20%">实退金额（元） </td>
          <td  width="25%">百分比(%)</td>
        </tr>
        <%
		//输出显示数据
		
		int[] mark={3,2,2,4};//设置显示风格参数
		//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

		ls_sql="SELECT sum(zjje)";
		ls_sql+=" FROM crm_zjxdj,crm_khxx ";
		ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zjxdj.fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}

		String tdje=cf.executeQuery(ls_sql);

		
		ls_sql="SELECT zjxyymc,count(*),sum(zjje),'<img src=\"/images/ColuGif.gif\" width='||ABS(sum(zjje))*130/"+tdje+"||' height=14>&nbsp;'";
		ls_sql+=" FROM crm_zjxdj,crm_khxx,dm_zjxyybm ";
		ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.zjxyybm=dm_zjxyybm.zjxyybm ";
		ls_sql+=" and crm_zjxdj.fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zjxdj.fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by zjxyymc";

		ls_sql+=" order by zjxyymc";
		
		
		so.addData(ls_sql);

		//输出数据
		so.outData(out,mark);
%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
