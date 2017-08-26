<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
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
	String wheresql1="";
	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");

	if (!(fgs.equals("")))
	{
		wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	}
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
  <B>主材销售统计
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV">
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="5%" class="STYLE2">序号</td>
          <td  width="6%" class="STYLE2">分公司</td>
          <td  width="8%" class="STYLE2">主材大类</td>
          <td  width="6%" class="STYLE2">合同总额</td>
          <td  width="5%" class="STYLE2">所占比例</td>
          <td  width="8%" class="STYLE2">主材实际收款</td>
          <td  width="8%" class="STYLE2">计入促销活动金额</td>
          <td  width="5%" class="STYLE2">主材实际收款比例</td>
          <td  width="20%" class="STYLE2">签约额百分比图</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String fgsbh=null;
String fgsmc=null;
String zcdlbm=null;
String zcdlmc=null;
String dlmc=null;
int row=0;
int numdl=0;
double wdzje=0;
double hkze=0;
double htcxhdje=0;

double xjwdzje=0;
double xjhkze=0;

double allwdzje=0;
double allhkze=0;
double allhtcxhdje=0;

double qyebfb=0;//未打折百分比
double sxebfb=0;//打折后百分比


try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM jdm_zcdlbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		numdl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dwmc fgs,dwbh fgsbh,zcdlmc,zcdlbm ";
	ls_sql+=" FROM sq_dwxx a,jdm_zcdlbm";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" order by fgs,zcdlmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");
		zcdlbm=rs.getString("zcdlbm");
		zcdlmc=rs.getString("zcdlmc");

		xjwdzje=0;
		xjhkze=0;
		dlmc=null;

		ls_sql="select sum(jc_zcdd.wdzje) wdzje,sum(jc_zcdd.hkze) hkze,sum(jc_zcdd.htcxhdje) htcxhdje";
		ls_sql+=" from jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
		xjwdzje=rs1.getDouble(1);
		xjhkze=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		ls_sql="select sum(jc_zcdd.wdzje) wdzje,sum(jc_zcdd.hkze) hkze,sum(jc_zcdd.htcxhdje) htcxhdje";
		ls_sql+=" from jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"' and jc_zcdd.zcdlbm='"+zcdlmc+"' ";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
		wdzje=rs1.getDouble(1);
		hkze=rs1.getDouble(2);
		htcxhdje=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		if (xjwdzje==0)
		{
			qyebfb=0;
		}
		else{
			qyebfb=wdzje*100/xjwdzje;
		}

		if (xjhkze==0)
		{
			sxebfb=0;
		}
		else{
			sxebfb=hkze*100/xjhkze;
		}
		
		allwdzje+=wdzje;
		allhkze+=hkze;
		allhtcxhdje+=htcxhdje;

		row++;

		dlmc=URLEncoder.encode(zcdlmc,"UTF-8");//把zcdlmc编码传给zcxltjb.jsp
%>
		<tr align="center">
          <td><%=row%></td>
		  <%if(row%numdl==1)
		  {%>
          <td rowSpan="<%=numdl%>"><%=fgsmc%></td>
		  <%}%>
          <td><%=zcdlmc%></td>
          <td align="right"><%=cf.formatDouble((int)wdzje)%></td>
          <td align="right"><%=cf.round(qyebfb,1)%>%</td>
          <td align="right"><%=cf.formatDouble((int)hkze)%></td>
          <td align="right"><%=cf.formatDouble((int)htcxhdje)%></td>
          <td align="right"><%=cf.round(sxebfb,1)%>%</td>
          <td align="right"><%=cf.round(qyebfb,1)%>%<A HREF="zcxltjb.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>&dlmc=<%=dlmc%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qyebfb*1.8%>" height="14"></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

%>
		<tr align="center">
          <td colSpan=2><B>总计</B></td>
          <td>&nbsp;</td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allwdzje)%></font></B></td>
          <td align="right">&nbsp;</td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allhkze)%></font></B></td>
          <td align="right"><B><font color=red><%=cf.formatDouble((int)allhtcxhdje)%></font></B></td>
          <td align="right">&nbsp;</td>
          <td align="right">&nbsp;</td>
        </tr>

<%
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
</body>
</html>
