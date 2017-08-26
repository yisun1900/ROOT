<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;

String psdh=cf.GB2Uni(request.getParameter("psdh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
double pssl=0;
String psslstr=null;
double gdj=0;
String cldlmc=null;
String jldwmc=null;
String bz=null;

try {
	conn=cf.getConnection();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">批量录入配送单(配送单号:<%=psdh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">编码</td>
	<td  width="21%">材料名称</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">配送单价</td>
	<td  width="8%">配送数量</td>
	<td  width="2%"></td>
	<td  width="6%">编码</td>
	<td  width="21%">材料名称</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">配送单价</td>
	<td  width="8%">配送数量</td>
</tr>
<%
	String sfycx=null;
	String cxkssj=null;
	String cxjzsj=null;
	double cxgdj=0;

	ls_sql="SELECT cl_clbm.clbm,clmc,clgg,cldlmc,gdj,jldwmc,bz,sfycx,cxkssj,cxjzsj,cxgdj ";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
	ls_sql+=" and cl_jgmx.dwbh='"+dwbh+"' and cl_clbm.lx='1' ";
	ls_sql+=" order by  cl_clbm.paixu,cl_clbm.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		gdj=rs.getDouble("gdj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		bz=cf.fillNull(rs.getString("bz"));

		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxgdj=rs.getDouble("cxgdj");

		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			gdj=cxgdj;
		}

		pssl=0;
		ls_sql="SELECT pssl";
		ls_sql+=" FROM cl_psdmx";
		ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			pssl=rs1.getDouble("pssl");
		}
		rs1.close();
		ps1.close();

		if (pssl==0)
		{
			psslstr="";
		}
		else{
			psslstr=""+pssl;
		}


		%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center">
		<td><%=clbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
		</td>
		<td><%=clmc%>（<%=clgg%>）</td>
		<td><%=jldwmc%></td>
		<td><%=gdj%></td>
		<td>
			<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=(row+1)%>])" >
		</td>

		<td></td>

		<%
		if (rs.next())	
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			clgg=cf.fillNull(rs.getString("clgg"));
			cldlmc=cf.fillNull(rs.getString("cldlmc"));
			gdj=rs.getDouble("gdj");
			jldwmc=cf.fillNull(rs.getString("jldwmc"));
			bz=cf.fillNull(rs.getString("bz"));

			pssl=0;
			ls_sql="SELECT pssl";
			ls_sql+=" FROM cl_psdmx";
			ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				pssl=rs1.getDouble("pssl");
			}
			rs1.close();
			ps1.close();

			if (pssl==0)
			{
				psslstr="";
			}
			else{
				psslstr=""+pssl;
			}

			%>
			<td><%=clbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%>（<%=clgg%>）</td>
			<td><%=jldwmc%></td>
			<td><%=gdj%></td>
			<td>
				<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=(row+1)%>])" >
			</td>
			<%	
		}

		row++;
	}
	rs.close();
	ps.close();
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
<tr bgcolor="#FFFFFF"> 
      <td colspan="11" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="psdh" value="<%=psdh%>">
	<input type="hidden" name="psdh" value="<%=psdh%>">
	<input type="hidden" name="dwbh" value="<%=dwbh%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
      </td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	FormName.action="SavePllrCl_clbm.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

