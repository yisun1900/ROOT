<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String wheregysbm=null;
wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select gysbm,dqmc dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,cwdm,DECODE(kdlxtbz,'Y','可登陆','N','不可登陆') kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,DECODE(sfsd,'Y','已锁定','N','未锁定') sfsd,bz,DECODE(gyslx,'0','代销品供货商','1','库存供货商') gyslx,DECODE(sfhz,'Y','合作','N','不合作') sfhz ";
	ls_sql+=" from  jxc_gysxx,dm_dqbm ";
	ls_sql+=" where jxc_gysxx.dqbm=dm_dqbm.dqbm and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">供应商编码<%=gysbm%></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">供应商名称</td>
  <td colspan="3"><%=gysmc%>&nbsp;&nbsp;[<%=sfhz%>]</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属地区 </td>
  <td width="35%"><%=dqbm%></td>
  <td align="right" width="15%">供应商类型</td>
  <td width="35%"><%=gyslx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">供应商地址</td>
  <td colspan="3"><%=gysdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    供应商负责人  </td>
  <td width="35%"> 
    <%=gysfzr%>  </td>
  <td align="right" width="15%"> 
    供应商电话  </td>
  <td width="35%"> 
    <%=gysdh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    供应商传真  </td>
  <td width="35%"> 
    <%=gyscz%>  </td>
  <td align="right" width="15%"> 
    EMail  </td>
  <td width="35%"> 
    <%=email%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    用户登录名  </td>
  <td width="35%"> 
    <%=yhdlm%>  </td>
  <td align="right" width="15%"> 
    用户口令  </td>
  <td width="35%"> 
   ********  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    用户名称  </td>
  <td width="35%"> 
    <%=yhmc%>  </td>
  <td align="right" width="15%"> 
    财务代码  </td>
  <td width="35%"> 
    <%=cwdm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    可登陆系统标志  </td>
  <td width="35%"> 
    <%=kdlxtbz%>  </td>
  <td align="right" width="15%"> 
    已经登陆失败次数  </td>
  <td width="35%"> 
    <%=lxdlsbcs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    密码修改时间  </td>
  <td width="35%"> 
    <%=mmxgsj%>  </td>
  <td align="right" width="15%"> 
    密码使用周期  </td>
  <td width="35%"> 
    <%=mmsyzq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    允许登陆失败次数  </td>
  <td width="35%"> 
    <%=yxdlsbcs%>  </td>
  <td align="right" width="15%"> 
    是否锁定  </td>
  <td width="35%"> 
    <%=sfsd%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    备注  </td>
  <td  colspan="3" > 
    <%=bz%>  </td>
</tr>
</table>
</body>
</html>
