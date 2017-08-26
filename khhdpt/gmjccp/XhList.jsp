<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<style>
img {nobar:expression(this.galleryImg='no')}
.arial {font-family: 华文行楷, Helvetica, sans-serif;font-size: 20px;font-weight: bold;color:blue;
 border: 3px;  border-style: double;border-color:red; }
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px;color:red;font-weight: bold; }
</style>
<script for=window event=onLoad language=vbscript>
	images.filters.item(0).apply()
	images.filters.item(0).transition = 70
	images.Style.visibility = ""
	images.filters(0).play(2.0)
</script>
<html>
<head>
	<title>主材展厅</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
String cldlbm=request.getParameter("cldlbm");
String ppmc=request.getParameter("ppmc");
String ssfgs=request.getParameter("ssfgs");
%>
<body bgcolor="#FFFFFF">
<table width="100%" height="100%" border="1" align="center"  cellpadding="0" cellspacing="2" bordercolor="#999999" style="FONT-SIZE: 12px;border-collapse:collapse">
	<tr align="left" valign="top"  height="10%"> 
		<td  height="3%" colspan="2" bgcolor="#EEEEEE"> 
			<div align="left">
				<font size="-1"><B>您的位置 <img src=../images/ann.gif> <a href="GmjccpIndex.jsp"><%=cldlbm%></a> <img src=../images/ann.gif> <a href="zcxlbmList.jsp?ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>"></a> <img src=../images/ann.gif> <a href="ppmcList.jsp?ssfgs=<%=java.net.URLEncoder.encode(ssfgs,"UTF-8")%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%><%=ppmc%></a> <img src=../images/ann.gif> 类别系列</B><font>
			</div>
		</td>
	</tr>
	<tr>
		<td width="20%" height="90%" align="left" valign="top"  bgcolor="#CCCCCC"> 
			<table width="100%" border="0" align="center"  cellpadding="5" cellspacing="5" bordercolor="#999999" style="FONT-SIZE: 12px;border-collapse:collapse"  class="dgInit">
			<%
			String cllbbm=null;
			int count=0;
			Connection conn  = null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			String ls_sql=null;
			try 
			{
				conn=cf.getConnection();
				ls_sql="select cllbbm,count(*)";
				ls_sql+=" from  jxc_clbm";
				ls_sql+=" where ppmc='"+ppmc+"' and cldlbm='"+cldlbm+"'";
				ls_sql+=" group by cllbbm";
				ls_sql+=" order by cllbbm";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					cllbbm=cf.fillNull(rs.getString("cllbbm"));
					count=rs.getInt(2);
			%>
				<tr>
					<td align="center" height="30"  bgcolor="#EEEEEE">
						<A HREF="cpList.jsp?ssfgs=<%=ssfgs%>&cldlbm=<%=java.net.URLEncoder.encode(cldlbm,"UTF-8")%>&ppmc=<%=java.net.URLEncoder.encode(ppmc,"UTF-8")%>&cllbbm=<%=java.net.URLEncoder.encode(cllbbm,"UTF-8")%>">·<%=cllbbm%>（<%=count%>种）·</A>
					</td>
				</tr>
			<%
				}
				rs.close();
				ps.close();
			}
			catch (Exception e) 
			{
				out.print("Exception: " + e);
				return;
			}
			finally 
			{
				try
				{
					if (rs != null) rs.close(); 
					if (ps != null) ps.close(); 
					if (conn != null) cf.close(conn); 
				}
				catch (Exception e)
				{
					if (conn != null) cf.close(conn); 
				}
			}
			%>
			</table>
		</td>
		<td width="80%" height="90%" align="left" valign="top">
			<p> &nbsp;<br>
				<center>
				 <SPAN CLASS="arial">松下亿达与您共建美好家园</SPAN>
				</center>
			  </p>
				<img src="../images/xxq.JPG"  width="680" id="images" style="visibility:hidden; FILTER:revealTrans(Duration=4.0, Transition=23);"> 
		</td>
	</tr>
</table>
</body>
</html>
