<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,gzjs.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>


<html>
<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <p><b><font size="5">团购情况统计表</font></b></p>
</div>
 <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"> 
	<!-- <td  width="12%">&nbsp;</td> -->
	<td  width="10%" align="center">小区</td>
	<td  width="10%" align="center">户数</td>
	<td  width="10%" align="center">小区</td>
	<td  width="10%" align="center">户数</td>

	<td  width="10%" align="center">小区</td>
	<td  width="10%" align="center">户数</td>

	<td  width="10%" align="center">小区</td>
	<td  width="10%" align="center">户数</td>

	<td  width="10%" align="center">小区</td>
	<td  width="10%" align="center">户数</td>

</tr>

<%
Connection conn  = null;
PreparedStatement ps5=null;
ResultSet rs5=null;
String ls_sql5=null;
String bgcolor=null;
int count=0;
int row=0;
String xqmc=null;
String xqbm2=null;
String szxs=null;
String sqys=null;
String ss=null;
try {
	conn=cf.getConnection();
	
	int i=0;
	int j=0;
	ls_sql5="SELECT qh_tgglb.xqbm,dm_xqbm.xqmc,qh_tgglb.zxs,qh_tgglb.qys,qh_tgglb.kkjs  ";
	//ls_sql5+=",'12' as ss";
	ls_sql5+=",(qh_tgglb.zxs+qh_tgglb.qys+qh_tgglb.kkjs) as ss";
	ls_sql5+=" FROM qh_tgglb,dm_xqbm ";
    ls_sql5+=" where  qh_tgglb.xqbm=dm_xqbm.xqbm(+) and  dm_xqbm.dqbm='"+dqbm+"'  ";    
    ls_sql5+=" order by dm_xqbm.xqmc";
	ps5= conn.prepareStatement(ls_sql5);
	rs5 =ps5.executeQuery(ls_sql5);
	while (rs5.next())
	{
        xqmc=cf.fillHtml(rs5.getString("xqmc"));
		//xqbm2=cf.fillNull(rs5.getString("xqbm"));
		//szxs=cf.fillHtml(rs5.getString("zxs"));
		//sqys=cf.fillNull(rs5.getString("qys"));
		ss=cf.fillHtml(rs5.getString("ss"));
		
		if (i%5==0)
		{
			j=0;
		out.print("<tr>");
			
		}
		i++;
		j++;
		out.print("<td  width=\"10%\" align=\"center\">"+xqmc+"</td>");
		out.print("<td  width=\"10%\" align=\"center\">"+ss+"</td>");
		
       if (j==5)
		{
		out.print("</tr>");
			
		}
		
    }   
	
	ps5.close();
	rs5.close();

}
catch (Exception e) {
	out.print("可控数发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps5!= null) ps5.close(); 
		if (rs5!= null) rs5.close(); 
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






