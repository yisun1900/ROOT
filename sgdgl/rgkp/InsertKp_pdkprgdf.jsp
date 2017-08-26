<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<%
String kpjlh=request.getParameter("kpjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dwmc=null;
String bgcolor="";

int row=0;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx ";
	ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh and kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="" name="selectform" target="_back">
  <div align="center"><b>派单考评人工打分（<%=dwmc%>）</b></div>
        
  <table width="100%" border="0" style="FONT-SIZE:13" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="10"> 
        <input type="hidden" name="kpjlh" value="<%=kpjlh%>">
        <input type="button"  value=" 保 存 " onClick="f_do(selectform)">
      </td>
    </tr>
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="5%"> <b>序号</b></td>
      <td width="15%"><b>施工队</b></td>
      <td width="20%"><b>工程减项金额</b></td>
      <td width="15%"><b>工程减项得分<BR>
        （<font color="#0000CC">整数，满分12</font>）</b></td>
      <td width="15%"><b>配合集成得分<BR>
        （<font color="#0000CC">整数，满分10</font>）</b></td>
      <td width="15%"><b>特殊贡献得分<BR>
        （<font color="#0000CC">整数，满分10</font>）</b></td>

    </tr>
    <%
	String sgd=null;
	String sgdmc=null;
	double gcjxje=0;
	int gcjxdf=0;
	int phjcdf=0;
	int tsgxdf=0;

	String gcjxjestr="";
	String gcjxdfstr="";
	String phjcdfstr="";
	String tsgxdfstr="";


	ls_sql=" select kp_pdkprgdf.sgd,sgdmc,gcjxje,gcjxdf,phjcdf,tsgxdf,kpbz ";
	ls_sql+=" from kp_pdkprgdf,sq_sgd  ";
	ls_sql+=" where kp_pdkprgdf.sgd=sq_sgd.sgd and kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row+=1;

		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		gcjxje=rs.getDouble("gcjxje");
		gcjxdf=rs.getInt("gcjxdf");
		phjcdf=rs.getInt("phjcdf");
		tsgxdf=rs.getInt("tsgxdf");

		if (gcjxje==0)
		{
			gcjxjestr="";
		}
		else{
			gcjxjestr=gcjxje+"";
		}
		if (gcjxdf==0)
		{
			gcjxdfstr="";
		}
		else{
			gcjxdfstr=gcjxdf+"";
		}
		if (phjcdf==0)
		{
			phjcdfstr="";
		}
		else{
			phjcdfstr=phjcdf+"";
		}
		if (tsgxdf==0)
		{
			tsgxdfstr="";
		}
		else{
			tsgxdfstr=tsgxdf+"";
		}

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}


	%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=row%></td>
      <td ><%=sgdmc%> 
          <input type="hidden" name="sgd" value="<%=sgd%>">
          <input type="hidden" name="sgdmc" value="<%=sgdmc%>">
      </td>
      <td> 
        <input type="text" name="gcjxje" size="13" maxlength="13" value="<%=gcjxjestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gcjxdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="gcjxdf" size="13" maxlength="13" value="<%=gcjxdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(phjcdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="phjcdf" size="13" maxlength="13" value="<%=phjcdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(tsgxdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="tsgxdf" size="13" maxlength="13" value="<%=tsgxdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gcjxje[<%=row%>])">
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
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="10"> 
        <input type="button"  value=" 保 存 " onClick="f_do(selectform)">
      </td>
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

	FormName.action="SaveInsertKp_pdkprgdf.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>