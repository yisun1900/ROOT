<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ssfgs=request.getParameter("ssfgs");
	String ssfgsmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+ssfgs+"'");
	String dwbh=request.getParameter("dwbh");
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");

	String ls_sql=null;

	if (dwbh!=null && !dwbh.equals(""))
	{
		ls_sql="SELECT rs_cqtjb.xh,rs_cqtjb.nian,rs_cqtjb.yue,sq_dwxx.dwmc,rs_cqtjb.ygbh,rs_cqtjb.bianhao,rs_cqtjb.yhmc,rs_cqtjb.qqts,rs_cqtjb.cqts,rs_cqtjb.bz  ";
		ls_sql+=" FROM sq_dwxx,rs_cqtjb  ";
		ls_sql+=" where rs_cqtjb.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and rs_cqtjb.dwbh='"+dwbh+"' and rs_cqtjb.nian='"+nian+"' and rs_cqtjb.yue='"+yue+"'";
		ls_sql+=" order by rs_cqtjb.nian,rs_cqtjb.yue,rs_cqtjb.dwbh,yhmc";
	}
	else{
		ls_sql="SELECT rs_cqtjb.xh,rs_cqtjb.nian,rs_cqtjb.yue,sq_dwxx.dwmc,rs_cqtjb.ygbh,rs_cqtjb.bianhao,rs_cqtjb.yhmc,rs_cqtjb.qqts,rs_cqtjb.cqts,rs_cqtjb.bz  ";
		ls_sql+=" FROM sq_dwxx,rs_cqtjb  ";
		ls_sql+=" where rs_cqtjb.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and sq_dwxx.ssfgs='"+ssfgs+"' and rs_cqtjb.nian='"+nian+"' and rs_cqtjb.yue='"+yue+"'";
		ls_sql+=" order by rs_cqtjb.nian,rs_cqtjb.yue,rs_cqtjb.dwbh,yhmc";
	}

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditRs_cqtjb.jsp");
	pageObj.setPageRow(2000);//设置每页显示记录数


//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCqtjb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">（<%=ssfgsmc%>）出勤统计表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">序号</td>
	<td  width="8%">年</td>
	<td  width="6%">月</td>
	<td  width="12%">所属部门</td>
	<td  width="6%">员工序号</td>
	<td  width="8%">工号</td>
	<td  width="8%">员工姓名</td>
	<td  width="6%">全勤天数</td>
	<td  width="6%">出勤天数</td>
	<td  width="18%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>