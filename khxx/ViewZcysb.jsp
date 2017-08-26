<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材预算表</title>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=request.getParameter("khbh");
String khxm="";
try {
	conn=cf.getConnection();

	ls_sql =" SELECT khxm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
	}
	rs.close();
	ps.close();
%>

<CENTER >
  <B><font size="3">主材预算表（<%=khxm%>）</font></B>
</CENTER>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center">
    <td  width="2%" rowspan="2">序号</td>
    <td  width="4%" rowspan="2">订单号</td>
    <td  width="5%" rowspan="2">铺装位置</td>
    <td  width="9%" rowspan="2">材料名称</td>
    <td  width="9%" rowspan="2">型号</td>
    <td  width="7%" rowspan="2">规格</td>
    <td  width="3%" rowspan="2">单位</td>
    <td  width="4%" rowspan="2">数量</td>
    <td colspan="2">单价</td>
    <td colspan="2">合计</td>
    <td colspan="2">远程</td>
    <td colspan="2">其他</td>
    <td  width="3%" rowspan="2">毛利</td>
    <td  width="170%" rowspan="2">供应商</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">售价</td>
    <td  width="4%">成本</td>
    <td  width="6%">售价合计</td>
    <td  width="6%">成本合计</td>
    <td  width="5%">远程费</td>
    <td  width="5%">成本</td>
    <td  width="5%">其它费</td>
    <td  width="5%">成本</td>
  </tr>
  <%

	String ppbm=null;

	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjcbje=0;
	double zjycf=0;
	double zjqtfyje=0;
	double zjcxhdje=0;

	double mll=0;
	ls_sql=" SELECT distinct ppbm";
	ls_sql+=" FROM bj_khzcmx";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" order by ppbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ppbm=rs1.getString("ppbm");


		String zcpzwzbm=null;
		String fjddbh=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
		double dj=0;
		double cbj=0;
		double je=0;
		double cbje=0;
		double ycf=0;
		double qtfyje=0;
		String cxhdbl=null;
		double cxhdje=0;
		String gys=null;

		double xjsl=0;
		double xjje=0;
		double xjcbje=0;
		double xjycf=0;
		double xjqtfyje=0;
		double xjcxhdje=0;


		
		ls_sql =" SELECT  fjddbh,zcpzwzbm,zcmc,xinghao,gg,jldwbm,sl,dj,cbj,je,round(sl*cbj,2) cbje,ycf,qtfyje,gys";
		ls_sql+=" FROM bj_khzcmx";
		ls_sql+=" where khbh='"+khbh+"' ";
		ls_sql+=" and ppbm='"+ppbm+"' ";
		ls_sql+=" order by fjddbh,zcpzwzbm,zcmc,xinghao ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			fjddbh=cf.fillHtml(rs.getString("fjddbh"));
			zcpzwzbm=cf.fillHtml(rs.getString("zcpzwzbm"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			dj=rs.getDouble("dj");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			cbje=rs.getDouble("cbje");
			ycf=rs.getDouble("ycf");
			qtfyje=rs.getDouble("qtfyje");
			zcpzwzbm=cf.fillHtml(rs.getString("zcpzwzbm"));
			gys=cf.fillHtml(rs.getString("gys"));

			if ((je+ycf+qtfyje)!=0)
			{
				mll=cf.round(((je+ycf+qtfyje)-(cbje+ycf+qtfyje))*100/(je+ycf+qtfyje),2);
			}
			else{
				mll=0;
			}


			xjsl+=sl;
			xjje+=je;
			xjcbje+=cbje;
			xjycf+=ycf;
			xjqtfyje+=qtfyje;
			xjcxhdje+=cxhdje;

			zjsl+=sl;
			zjje+=je;
			zjcbje+=cbje;
			zjycf+=ycf;
			zjqtfyje+=qtfyje;
			zjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=fjddbh%></td>
				<td ><%=zcpzwzbm%></td>
				<td ><%=zcmc%></td>
				<td ><%=xinghao%></td>
				<td ><%=gg%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=dj%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cbje%></td>
				<td ><%=ycf%></td>
				<td >&nbsp;</td>
				<td ><%=qtfyje%></td>
				<td >&nbsp;</td>
				<td ><%=mll%>%</td>
				<td align="left"><%=gys%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();

		if ((xjje+xjycf+xjqtfyje)!=0)
		{
			mll=cf.round(((xjje+xjycf+xjqtfyje)-(xjcbje+xjycf+xjqtfyje))*100/(xjje+xjycf+xjqtfyje),2);
		}
		else{
			mll=0;
		}

		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="3"  ><b>[<%=ppbm%>]小计</b></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
			<td><%=cf.formatDouble(xjcbje)%></td>
			<td><%=cf.formatDouble(xjycf)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjqtfyje)%></td>
			<td>&nbsp;</td>
			<td ><%=mll%>%</td>
			<td>&nbsp;</td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="4"><b>小计:<%=cf.round(zjje+zjycf+zjqtfyje,2)%></b></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
		<td><%=cf.formatDouble(zjcbje)%></td>
		<td><%=cf.formatDouble(zjycf)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjqtfyje)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <%
	
	String sfxmmc="";
	double sfbfb=0;
	double sfje=0;
	ls_sql="SELECT sfxmmc,sfbfb,sfje";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('8','4')";//8：公司购主材税金
	ls_sql+=" order by sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");

		zjje+=sfje;
		zjje=cf.round(zjje,2);

		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
			<td colspan="3"><b><%=sfxmmc%></b></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(sfje)%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


	if ((zjje+zjycf+zjqtfyje)!=0)
	{
		mll=cf.round(((zjje+zjycf+zjqtfyje)-(zjcbje+zjycf+zjqtfyje))*100/(zjje+zjycf+zjqtfyje),2);
	}
	else{
		mll=0;
	}
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="4"><b>总计:<%=cf.round(zjje+zjycf+zjqtfyje,2)%></b></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
		<td><%=cf.formatDouble(zjcbje)%></td>
		<td><%=cf.formatDouble(zjycf)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjqtfyje)%></td>
		<td>&nbsp;</td>
			<td ><%=mll%>%</td>
		<td>&nbsp;</td>
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