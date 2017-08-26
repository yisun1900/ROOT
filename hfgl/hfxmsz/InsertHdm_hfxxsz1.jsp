<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
 String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertHdm_hfxxsz.jsp" name="insertform" target="_blank">
<div align="center">回访设置</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访类型</td> 
  <td width="32%"> 
    <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"' order by hflxbm","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#E8E8FF" align="center">
  <td width="6%"><span class="STYLE1">选择</span></td>
  <td width="38%"><span class="STYLE1">评价指标</span></td>
  <td width="28%"><span class="STYLE1">回访对象</span></td>
  <td width="28%"><span class="STYLE1">回访对象分类</span></td>
</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String hfdxflbm=null;
	String hfdxflmc=null;
	ls_sql="select distinct hdm_hfdxbm.hfdxflbm,hfdxflmc ";
	ls_sql+=" from  hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm";
	ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm  ";
	ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm  ";
	ls_sql+=" order by hdm_hfdxbm.hfdxflbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		hfdxflbm=cf.fillNull(rs2.getString("hfdxflbm"));
		hfdxflmc=cf.fillNull(rs2.getString("hfdxflmc"));

		int col1=0;
		ls_sql="select count(*)";
		ls_sql+=" from  hdm_dxpjzb,hdm_hfdxbm";
		ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm  ";
		ls_sql+=" and hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"'";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery();
		if (rs3.next())
		{
			col1=rs3.getInt(1);
		}
		rs3.close();
		ps3.close();
	
		String hfdxbm=null;
		String hfdxmc=null;
		ls_sql="select distinct hdm_dxpjzb.hfdxbm,hfdxmc ";
		ls_sql+=" from  hdm_dxpjzb,hdm_hfdxbm";
		ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm  ";
		ls_sql+=" and hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"'";
		ls_sql+=" order by hdm_dxpjzb.hfdxbm";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery();
		while (rs3.next())
		{
			hfdxbm=cf.fillNull(rs3.getString("hfdxbm"));
			hfdxmc=cf.fillNull(rs3.getString("hfdxmc"));


			int col2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  hdm_dxpjzb";
			ls_sql+=" where hfdxbm='"+hfdxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				col2=rs.getInt(1);
			}
			rs.close();
			ps.close();

			String dxpjzbbm=null;
			String dxpjzb=null;
			ls_sql="select dxpjzbbm,dxpjzb ";
			ls_sql+=" from  hdm_dxpjzb";
			ls_sql+=" where hfdxbm='"+hfdxbm+"'";
			ls_sql+=" order by dxpjzbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				dxpjzbbm=cf.fillNull(rs.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs.getString("dxpjzb"));

				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from hdm_hfxxsz";
				ls_sql+=" where hflxbm='"+hflxbm+"' and dxpjzbbm='"+dxpjzbbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					count=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();
				String mark="";
				if (count>0)
				{
					mark="checked='true'";
				}

				if (col1>0)//显示第一列
				{
					if (col2>0)//显示第一列，显示第二列
					{
						%>
						<tr bgcolor="#FFFFFF"  >
						  <td>
							<input name="dxpjzbbm" type="checkbox" value="<%=dxpjzbbm%>" <%=mark%>>		  </td>
						  <td><%=dxpjzb%></td>
						  <td rowspan="<%=col2%>"><%=hfdxmc%></td>
						  <td rowspan="<%=col1%>"><%=hfdxflmc%></td>
						</tr>
						<%

						col2=0;
					}
					else{//显示第一列，不显示第二列
						%>
						<tr bgcolor="#FFFFFF"  >
						  <td>
							<input name="dxpjzbbm" type="checkbox" value="<%=dxpjzbbm%>" <%=mark%>>		  </td>
						  <td><%=dxpjzb%></td>
						  <td rowspan="<%=col1%>"><%=hfdxflmc%></td>
						</tr>
						<%
					}

					col1=0;
				}
				else{//不显示第一列
					if (col2>0)//不显示第一列，显示第二列
					{
						%>
						<tr bgcolor="#FFFFFF"  >
						  <td>
							<input name="dxpjzbbm" type="checkbox" value="<%=dxpjzbbm%>" <%=mark%>>		  </td>
						  <td><%=dxpjzb%></td>
						  <td rowspan="<%=col2%>"><%=hfdxmc%></td>
						</tr>
						<%

						col2=0;
					}
					else{//不显示第一列，不显示第二列
						%>
						<tr bgcolor="#FFFFFF"  >
						  <td>
							<input name="dxpjzbbm" type="checkbox" value="<%=dxpjzbbm%>" <%=mark%>>		  </td>
						  <td><%=dxpjzb%></td>
						</tr>
						<%
					}

				}

			}
			rs.close();
			ps.close();
		}
		rs3.close();
		ps3.close();
	
	}
	rs2.close();
	ps2.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>


</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[回访类型]！");
		FormName.hflxbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
