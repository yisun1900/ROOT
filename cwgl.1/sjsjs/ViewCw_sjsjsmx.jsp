<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<%
String jsjlh=request.getParameter("jsjlh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;


try {
	conn=cf.getConnection();

%>

<form method="post" action="" name="selectform" target="_back">
  <div align="center"><b>设计师结算－－增减其它费用（结算记录号：<%=jsjlh%>）</b></div>
        
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" >
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="7%" ><b>项目编码</b></td>
      <td width="21%" ><b>项目名称</b></td>
      <td width="12%" ><b>增减百分比</b></td>
      <td width="12%" ><b>增减金额</b></td>
      <td width="48%" ><b>备注</b></td>
	
	</tr>
    <%

	String sjsxmbm=null;
	String sjsxmmc=null;
	double zjbfb=0;
	double zjje=0;
	String bz=null;
	String bgcolor="";

	String zjbfbstr="";
	String zjjestr="";

	ls_sql=" SELECT sjsxmbm,cw_sjsjszjfy.sjsxmmc,cw_sjsqtfymx.zjbfb,cw_sjsqtfymx.zjje,cw_sjsqtfymx.bz";
	ls_sql+=" FROM cw_sjsjszjfy,cw_sjsqtfymx";
	ls_sql+=" where cw_sjsjszjfy.sjsxmmc=cw_sjsqtfymx.sjsxmmc(+) and cw_sjsqtfymx.jsjlh(+)='"+jsjlh+"' and cw_sjsqtfymx.khbh(+)='"+khbh+"'";
	ls_sql+=" order by sjsxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjsxmbm=cf.fillNull(rs.getString("sjsxmbm"));
		sjsxmmc=cf.fillNull(rs.getString("sjsxmmc"));
		zjbfb=rs.getDouble("zjbfb");
		zjje=rs.getDouble("zjje");
		bz=cf.fillNull(rs.getString("bz"));

		if (zjbfb==0)
		{
			zjbfbstr="";
		}
		else{
			zjbfbstr=""+zjbfb;
		}
		if (zjje==0)
		{
			zjjestr="";
		}
		else{
			zjjestr=""+zjje;
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

	%> 
    <tr bgcolor="<%=bgcolor%>" align="center" > 
      <td > 
          <%=sjsxmbm%>
      </td>
      <td > <%=sjsxmmc%>
      </td>
      <td > <%=zjbfbstr%>
		%
      </td>
      <td > <%=zjjestr%>
      </td>
      <td > <%=bz%>
      </td>
	</tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
  </table>
		</form>
		</body>
		</html>

