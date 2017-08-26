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

	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>样板间统计
  <BR>(样板间登记时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="10%">年</td>
          <td  width="10%">月</td>
          <td  width="20%">风格</td>
          <td  width="12%">登记数</td>
          <td  width="25%">登记数</td>
        </tr>
<%
	int[] mark={3,3,1,2,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	String all=null;
	//获取总数
	ls_sql="select max(count(*))";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where  ybjdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2' and ybjbz='Y'";
	ls_sql+=" and ybjdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by TO_CHAR(ybjdjsj,'YYYY'),TO_CHAR(ybjdjsj,'MM'),crm_khxx.fgflbm";

	all=cf.executeQuery(ls_sql);

	//获取最大值
	ls_sql="select TO_CHAR(ybjdjsj,'YYYY') nian,TO_CHAR(ybjdjsj,'MM') yue,fgflmc,count(*),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+all+"||' height=14>'";
	ls_sql+=" from crm_khxx,dm_fgflbm";
	ls_sql+=" where crm_khxx.fgflbm=dm_fgflbm.fgflbm and ybjdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2' and ybjbz='Y'";
	ls_sql+=" and ybjdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by TO_CHAR(ybjdjsj,'YYYY'),TO_CHAR(ybjdjsj,'MM'),crm_khxx.fgflbm,fgflmc";
	ls_sql+=" order by TO_CHAR(ybjdjsj,'YYYY'),TO_CHAR(ybjdjsj,'MM'),crm_khxx.fgflbm";

	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%> 
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <BR><CENTER>样板间风格统计</CENTER>
	  <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="20%">风格</td>
          <td  width="12%">登记数</td>
          <td  width="25%">登记数</td>
        </tr>
<%
	so.clearData();

	int[] mark1={1,2,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	//获取总数
	ls_sql="select max(count(*))";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where  ybjdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2' and ybjbz='Y'";
	ls_sql+=" and ybjdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by crm_khxx.fgflbm";

	all=cf.executeQuery(ls_sql);

	//获取最大值
	ls_sql="select fgflmc,count(*),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+all+"||' height=14>'";
	ls_sql+=" from crm_khxx,dm_fgflbm";
	ls_sql+=" where crm_khxx.fgflbm=dm_fgflbm.fgflbm and ybjdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2' and ybjbz='Y'";
	ls_sql+=" and ybjdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by crm_khxx.fgflbm,fgflmc";
	ls_sql+=" order by crm_khxx.fgflbm";

	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark1);
%> 
      </table>
    </td>
  </tr>

</table>
</body>
</html>
