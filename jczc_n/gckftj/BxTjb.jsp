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

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>报修明细表
  <BR>(报修时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
      <table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="6%" class="STYLE1">序号</td>
          <td  width="6%" class="STYLE1">分公司</td>
          <td  width="7%" class="STYLE1">合同号</td>
          <td  width="6%" class="STYLE1">客户姓名</td>
          <td  width="8%" class="STYLE2">设计师</td>
          <td  width="8%" class="STYLE2">施工队</td>
          <td  width="8%" class="STYLE2">签约日期</td>
          <td  width="8%" class="STYLE2">受理时间</td>
          <td  width="15%" class="STYLE2">主要原因</td>
          <td  width="8%" class="STYLE2">处理时间</td>
          <td  width="8%" class="STYLE2">处理情况</td>
          <td  width="6%" class="STYLE2">处理人</td>
          <td  width="6%" class="STYLE2">处理结果</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();
	String tsjlh=null;
	String fgsmc=null;
	String hth=null;
	String khxm=null;
	String sjs=null;
	String sgdmc=null;
	String qyrq=null;
	String slsj=null;
	String tsxlmc=null;
	String tsyymc=null;
	String clsj=null;
	String clqk=null;
	String clr=null;
	String clzt=null;
	ls_sql="select crm_tsjl.tsjlh tsjlh,sq_dwxx.dwmc fgsmc,hth,khxm,sjs,sgdmc,qyrq,slsj";
	ls_sql+=" from crm_tsjl,sq_dwxx,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.lx='2'  ";
	ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" order by crm_tsjl.slsj desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		fgsmc=rs.getString("fgsmc");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		sjs=rs.getString("sjs");
		sgdmc=rs.getString("sgdmc");
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		slsj=cf.fillHtml(rs.getDate("slsj"));

		ls_sql="select tsxlmc,tsyymc,clsj,clqk,clr,DECODE(clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt ";
		ls_sql+=" from crm_tsbm,dm_tsxlbm,dm_tsyybm ";
		ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and  crm_tsbm.tsjlh='"+tsjlh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
		tsxlmc=rs1.getString("tsxlmc");
		tsyymc=rs1.getString("tsyymc");
		clsj=cf.fillHtml(rs1.getDate("clsj"));
		clqk=rs1.getString("clqk");
		clr=rs1.getString("clr");
		clzt=rs1.getString("clzt");
		}
		rs1.close();
		ps1.close();

		if(sgdmc==null){
		sgdmc="<font color=red>信息填写不全</font>";
		}
		if(sjs==null){
		sjs="<font color=red>信息填写不全</font>";
		}
		if(hth==null){
		hth="<font color=red>核查该客户</font>";
		}
		if(tsxlmc==null){
		tsxlmc="&nbsp;";
		}
		if(tsyymc==null){
		tsyymc="&nbsp;";
		}
		if(clqk==null){
		clqk="&nbsp;";
		}
		if(clr==null){
		clr="&nbsp;";
		}
%>
		<tr align="center">
          <td class="STYLE3"><%=tsjlh%></td>
          <td class="STYLE3"><%=fgsmc%></td>
          <td class="STYLE3"><%=hth%></td>
          <td class="STYLE3"><%=khxm%></td>
          <td class="STYLE4"><%=sjs%></td>
          <td class="STYLE4"><%=sgdmc%></td>
          <td class="STYLE4"><%=qyrq%></td>
          <td class="STYLE4"><%=slsj%></td>
          <td class="STYLE4"><%="<font color=red>"+tsxlmc+"</font>:"+tsyymc%></td>
          <td class="STYLE4"><%=clsj%></td>
          <td class="STYLE4"><%=clqk%></td>
          <td class="STYLE4"><%=clr%></td>
          <td class="STYLE4"><%=clzt%></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
</table>
</DIV>
</body>
</html>
