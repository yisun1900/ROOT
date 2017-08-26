<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
%>
<table width="100%" height="80%" border="0">
  <tr> 
    <td width="19%" rowspan="2" bgcolor="#999999"> 
	<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
<%
String ssfgs="FBJ00";

String zcdlbm=null;
String zcdlmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcdlbm,zcdlmc ";
	ls_sql+=" from  jdm_zcdlbm";
	ls_sql+=" order by zcdlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcdlmc=cf.fillNull(rs.getString("zcdlmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="zcxlbmList.jsp?ssfgs=<%=ssfgs%>&zcdlbm=<%=java.net.URLEncoder.encode(zcdlmc,"UTF-8")%>" ><%=zcdlmc%></A></td>
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
	  </td>
    <td width="81%" height="34">当前位置：天天购物网 → 商品浏览 → 美体护理 </td>
  </tr>
  <tr> 
    <td height="667">
	<iframe width="100%" height="100%" src="http://localhost:8090/khhdpt/gmjccp/jccpList.html" name="KhhdptFrame" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0" > 
	</iframe> 
    </td>
  </tr>
</table>
