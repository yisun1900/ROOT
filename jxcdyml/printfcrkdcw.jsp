<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
String ckmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz=null;
int dyhs=5;//打印行数
double pxcm=37.74;//1cm等于多少px
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	//查询仓库名称，入库日期
	ls_sql="select ckmc,bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri ";
	ls_sql+=" from  jxc_rkd,jxc_ckmc ";
	ls_sql+=" where  jxc_rkd.ckbh=jxc_ckmc.ckbh and (rkph='"+rkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
	<table  width="<%=19*pxcm%>" border="0" style='FONT-SIZE: 12px'>
	<tr height="<%=0.5*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	<tr>
    <td colspan="8" align="center" style='FONT-SIZE: 12px' height="<%=0.5*pxcm%>"><b><%=ckmc%></b></td>
	 </tr>
	 <tr height="<%=0.3*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	 <tr height="<%=0.5*pxcm%>">
    <td colspan="8" align="center"><%=nian%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yue%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ri%>&nbsp;</td>
	 </tr>
	 <tr height="<%=0.6*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	<%
	String clbmlist="";
	String jldwbm=null;
	int dyxh=0;
	int sygs=0;
	double rkj=0;
	double rksl=0;
	double rkje=0;
	double sumrksl=0;
	double sumrkje=0;
	String clmc=null;
	String gg=null;
//查询单件条码
	ls_sql="select distinct clbm ";
	ls_sql+=" from jxc_clbm ";
	ls_sql+=" where "+chooseitem+" ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clbmlist+="'"+cf.fillNull(rs.getString("clbm"))+"',";
	}
	clbmlist=clbmlist.substring(0,clbmlist.length()-1);
	rs.close();
	ps.close();
	ls_sql="select clmc,gg,jldwbm,rkj,rksl,(rksl*rkj) rkje ";
	ls_sql+=" from jxc_rkmx,jxc_clbm ";
	ls_sql+=" where rkph='"+rkph+"' and jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.clbm in("+clbmlist+") ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dyxh++;
		if (dyxh>dyhs)
		{break;}
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");
		sumrksl+=rksl;
		sumrkje+=rkje;
		%>
		<tr bgcolor="#FFFFFF"  height="<%=0.6*pxcm%>">
		<td align="center" width="<%=2.2*pxcm%>">&nbsp;</td>
		<td align="center" width="<%=3.5*pxcm%>"><%=clmc%></td>
		<td align="center" width="<%=3.6*pxcm%>"><%=gg%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=jldwbm%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=rkj%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=rksl%></td>
		<td align="center" width="<%=2.3*pxcm%>"><%=rkje%></td>
		<%
		if (dyxh==1)
		{out.print("<td rowspan=\""+dyhs+"\"  width=\""+2.3*pxcm+"\">"+bz+"</td>");}
		%>

		</tr>
		<%
	}
	rs.close();
	ps.close();
	sygs=dyhs-dyxh;
	if (sygs>0)
	{
		for (int i=0;i<sygs;i++)
		{
			%>
			<tr bgcolor="#FFFFFF"  height="<%=0.6*pxcm%>">
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td align="center">&nbsp;</td>
			</tr>
			<%
		}
	}
	%>
		<tr bgcolor="#FFFFFF"  height="<%=0.6*pxcm%>">
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center"><%=cf.formatDouble(sumrksl) %></td>
		<td align="center"><%=cf.formatDouble(sumrkje) %></td>
		</tr>		
		<%
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

</table>
</body>
</html>
