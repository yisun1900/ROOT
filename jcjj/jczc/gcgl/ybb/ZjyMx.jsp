<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
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

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}
	wheresql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	wheresql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>质检员回访明细（回访类型：<%=hflxmc%>）<BR>
  (回访时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td width="8%">质检员</td>
    <td width="9%">回访时间</td>
    <td width="10%">合同号</td>
    <td width="8%">客户姓名</td>
    <td width="30%">房屋地址</td>
    <td width="7%">质检员服务</td>
    <td width="7%">质检员到位</td>
    <td width="7%">质检员尽责</td>
  </tr>
  <%
	String ls_sql="";

	ls_sql="SELECT zjxm,hfsj,hth,khxm,fwdz,a.hfjgmc zjyfw,b.hfjgmc zjydw,c.hfjgmc zjyjz";
	ls_sql+=" FROM crm_hfjl,crm_khxx,sq_dwxx,dm_hfjgbm a,dm_hfjgbm b,dm_hfjgbm c ";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_hfjl.zjyfw=a.hfjgbm(+) and crm_hfjl.zjydw=b.hfjgbm(+) and crm_hfjl.zjyjz=c.hfjgbm(+)";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.fgsbh,crm_khxx.zjxm,hfsj,crm_khxx.khbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>

</table>


</body>
</html>