<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
String ckmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz=null;
int dyhs=22;//打印行数
double pxcm=37.5;//1cm等于多少px
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	//查询仓库名称，入库日期
	ls_sql="select ckmc,bz,to_char(cksj,'YYYY') nian,to_char(cksj,'MM') yue,to_char(cksj,'DD') ri ";
	ls_sql+=" from  jxc_ckd,jxc_ckmc ";
	ls_sql+=" where  jxc_ckd.ckbh=jxc_ckmc.ckbh and (ckph='"+ckph+"')  ";
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
	<table  width="<%=19.5*pxcm%>" border="0" style='FONT-SIZE: 12px'>
	<tr height="<%=0.8*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	<tr>
    <td colspan="8" align="center" style='FONT-SIZE: 12px' height="<%=0.9*pxcm%>"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ckmc%></b></td>
	 </tr>
	 <tr height="<%=1.5*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	 <tr height="<%=1*pxcm%>">
    <td colspan="8" align="center"><%=nian%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yue%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ri%></td>
	 </tr>
	 <tr height="<%=1.2*pxcm%>">
	 <td>
   &nbsp;
   </td>
	 </tr>
	<%
	String clbmlist="";
	String jldwbm=null;
	int dyxh=0;
	int sygs=0;
	double ckdj=0;
	double cksl=0;
	double ckdje=0;
	double sumcksl=0;
	double sumckdje=0;
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
	ls_sql="select clmc,gg,jldwbm,ckdj,cksl,(cksl*ckdj) ckdje ";
	ls_sql+=" from jxc_ckmx,jxc_clbm ";
	ls_sql+=" where ckph='"+ckph+"' and jxc_ckmx.clbm=jxc_clbm.clbm and jxc_ckmx.clbm in("+clbmlist+") ";
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
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");
		ckdje=rs.getDouble("ckdje");
		sumcksl+=cksl;
		sumckdje+=ckdje;
		%>
		<tr bgcolor="#FFFFFF"  height="<%=0.75*pxcm%>">
		<td align="center" width="<%=2.3*pxcm%>">&nbsp;</td>
		<td align="center" width="<%=3.4*pxcm%>"><%=clmc%></td>
		<td align="center" width="<%=3.6*pxcm%>"><%=gg%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=jldwbm%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=ckdj%></td>
		<td align="center" width="<%=1.7*pxcm%>"><%=cksl%></td>
		<td align="center" width="<%=2.3*pxcm%>"><%=ckdje%></td>
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
			<tr bgcolor="#FFFFFF"  height="<%=0.75*pxcm%>">
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
		<tr bgcolor="#FFFFFF"  height="<%=0.75*pxcm%>">
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center">&nbsp;</td>
		<td align="center"><%=cf.formatDouble(sumcksl) %></td>
		<td align="center"><%=cf.formatDouble(sumckdje) %></td>
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
