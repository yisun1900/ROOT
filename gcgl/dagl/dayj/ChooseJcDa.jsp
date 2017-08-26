<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));	
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><b>工程档案－借出(客户编号：<%=khbh%>)</b></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF">
	  <td width="5%"><strong>借出</strong></td>
	  <td width="5%"><strong>归档标志</strong></td>
	  <td width="16%"><strong>档案名称</strong></td>
	  <td width="6%"><strong>数量</strong></td>
	  <td width="17%"><strong>保管部门</strong></td>
	  <td width="7%"><strong>保管人</strong></td>
	  <td width="9%"><strong>保管时间</strong></td>
	  <td width="7%"><strong>录入人</strong></td>
	  <td width="9%"><strong>录入时间</strong></td>
	  <td width="42%"><strong>备注</strong></td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
String ssfgs=null;
int i=0;
try {

	conn=cf.getConnection();

	ls_sql="select fgsbh from crm_khxx where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs= ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	String damxbm=null;
	String damxmc=null;
	String sl="";
	String bgr=null;
	String bgrdw="";
	String bgrfgs=null;
	String bgrdwmc=null;
	String bgrfgsmc=null;
	String bgsj=null;
	String lrsj=null;
	String lrr=null;
	String bz=null;
	String gdbz=null;

	ls_sql="select crm_gcdagl.damxbm,damxmc,sl,bgr,dwmc,bgrfgs,bgsj,crm_gcdagl.bz,crm_gcdagl.lrsj,crm_gcdagl.lrr,DECODE(crm_gcdagl.gdbz,'Y','归档','N','借出') gdbz";
	ls_sql+=" from crm_gcdagl,dm_damxbm,sq_dwxx";
	ls_sql+=" where crm_gcdagl.damxbm=dm_damxbm.damxbm and crm_gcdagl.bgrdw=sq_dwxx.dwbh(+) and crm_gcdagl.khbh='"+khbh+"'";
	ls_sql+=" order by damxbm ";
	ps= conn.prepareStatement(ls_sql);
	rs= ps.executeQuery();
	while (rs.next())
	{

		damxbm=rs.getString("damxbm");
		damxmc=rs.getString("damxmc");
		sl=rs.getString("sl");
		bgr=rs.getString("bgr");
		bgrdw=cf.fillNull(rs.getString("dwmc"));
		bgrfgs=rs.getString("bgrfgs");
		bgsj=cf.fillNull(rs.getDate("bgsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=rs.getString("lrr");
		bz=cf.fillNull(rs.getString("bz"));
		gdbz=cf.fillNull(rs.getString("gdbz"));

		if (gdbz.equals("归档"))
		{
			i++;
			%>
			<tr align="center" bgcolor="#FFFFFF"> 
			  <td>
				<input name="damxbm" type="checkbox" value="<%=damxbm%>">
			  </td>

			  <td><%=gdbz%></td>
			  <td >
				<%=damxmc%>
			  </td>
				
			  <td><%=sl%></td>
			
			  <td><%=bgrdw%></td>

			  <td><%=bgr%></td>
			  <td><%=bgsj%></td>
			  <td><%=lrr%></td>
			  <td><%=lrsj%></td>
			  <td><%=bz%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr align="center" bgcolor="#FFFFFF"> 
			  <td>
				已借出
			  </td>

			  <td><%=gdbz%></td>
			  <td >
				<%=damxmc%>
			  </td>
				
			  <td><%=sl%></td>
			
			  <td><%=bgrdw%></td>

			  <td><%=bgr%></td>
			  <td><%=bgsj%></td>
			  <td><%=lrr%></td>
			  <td><%=lrsj%></td>
			  <td><%=bz%></td>
			</tr>
			<%
		}


	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
	%>
           <tr > 
				<td colspan="6"> 
				  <input type="hidden" name="bgrfgs" value="<%=ssfgs%>" >
				  <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="button"  value="打勾档案借出" onClick="f_do(insertform)" name="save">
          </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	var choo=0;

	var i = 0;
	if (<%=i%>==1){
		if( FormName.damxbm.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i <<%=i%>;i++ ){
			if( FormName.damxbm[i].checked ){
				choo=1;
			}
		} 
	} 
	if (choo == 0){
		alert("打勾选择要借出档案");
		return false;
	}
	else{
		FormName.action="InsertJc.jsp?khbh=<%=khbh%>";
		FormName.submit();
		return true;
	}

}


//-->
</SCRIPT>
