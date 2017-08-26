<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%//saw
ybl.common.PageObject pageObject=new ybl.common.PageObject();
String ls_sql=null;
String wheresql=" ";
String xsrq=null;
String xsrq2=null;
String dwbh=null;
String hybh=null;
String hykh=null;


	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+="  and (cp_cpxx1.szdw='"+dwbh+"')";
	}
	hybh=request.getParameter("hybh");
	if (hybh!=null)
	{
		if (!(hybh.equals("")))	wheresql+=" and  (cp_cpxx1.khbh='"+hybh+"')";
	}
	hykh=request.getParameter("hykh");
	if (hykh!=null)
	{
		if (!(hykh.equals("")))	wheresql+=" and  (hy_hyxxb.hykh='"+hykh+"')";
	}
	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and cp_cpxx1.xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and cp_cpxx1.xsrq<=TO_DATE('"+xsrq2+"','YYYY-MM-DD')";
	}


	ls_sql="SELECT khbh,hy_hyxxb.hykh,ywxh,cpbm,DECODE(cplb,'B','素金','A','镶嵌'),bkbh,plmc,dwmc,bqj,sxj  ";
	ls_sql+=" FROM cp_cpxx1,sq_dwxx,hy_hyxxb,xt_plbm ";
	ls_sql+=" where cp_cpxx1.szdw=sq_dwxx.dwbh and cp_cpxx1.khbh=hy_hyxxb.hybh and khlx='1' and wlzt='05'";
	ls_sql+=" and cp_cpxx1.plbm=xt_plbm.plbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by khbh,ywxh ";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("Dm_xsjlCxList.jsp","xstjb.jsp","","");
	pageObject.setPageRow(10000);

%>
<%
	String dwmc=null;

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	try {
		conn=cf.getConnection();    //得到连接
		
		ls_sql="select dwmc from sq_dwxx ";
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwmc=rs.getString(1);
		}

		rs.close();
		ps.close();
	}
	catch (Exception e) {
		try{
			out.println("getDate.Exception: " + e);
			out.println("sql=" + ls_sql);
		}
		catch (Exception e1){}
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn);    //释放连接
		}
		catch (Exception e){}
	}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2"><%=dwmc%>销售明细</font></B>
  <BR>（<%=xsrq%>--<%=xsrq2%>）
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%" >会员编号</td>
	<td  width="7%" >水质分析卡号</td>
	<td  width="9%" >业务序号</td>
	<td  width="11%" >产品编码</td>
	<td  width="5%" >类别</td>
	<td  width="7%" >版库编号</td>
	<td  width="17%" >品名</td>
	<td  width="14%" >销售单位</td>
	<td  width="9%" >标签价</td>
	<td  width="9%" >实销价</td>
</tr>
<%
	pageObject.printDateSum();
%> 

</table>
</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>