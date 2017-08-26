<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherexqmc=cf.getParameter(request,"xqmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw,lrr,lrsj,fgsbh ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (xqmc='"+wherexqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<title>楼盘信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">楼盘信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">地区</td>
    <td width="33%"> <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm,true);
%> </td>
      
    <td align="right" width="17%">公司</td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ",fgsbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">城区</td>
    <td width="33%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm,true);
%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">小区名称</td>
      
    <td colspan="3"><%=xqmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">地址</td>
      
    <td colspan="3"><%=dz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">开发商</td>
      
    <td colspan="3"><%=kfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">开发商联系人</td>
      
    <td width="33%"><%=kfslxr%> </td>
      
    <td align="right" width="17%">开发商联系人职务</td>
      
    <td width="33%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">开发商联系人电话</td>
      
    <td width="33%"><%=kfslxrdh%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">物业公司名称</td>
      
    <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">物业联系人</td>
      
    <td width="33%"><%=wylxr%> </td>
      
    <td align="right" width="17%">物业联系人职务</td>
      
    <td width="33%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">物业电话</td>
      
    <td width="33%"><%=wydh%> </td>
      
    <td align="right" width="17%">立项时间</td>
      
    <td width="33%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">交钥匙时间</td>
      
    <td width="33%"><%=fyssj%> </td>
      
    <td align="right" width="17%">交房户数</td>
      
    <td width="33%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">主力户型</td>
      
    <td width="33%"><%=zlhx%> </td>
      
    <td align="right" width="17%">主力户型面积</td>
      
    <td width="33%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">物业形式</td>
      
    <td width="33%"><%=wyxs%> </td>
      
    <td align="right" width="17%">价位</td>
      
    <td width="33%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">小区负责人</td>
      
    <td width="33%"><%=xqfzr%> </td>
      
    <td align="right" width="17%">小区负责人电话</td>
      
    <td width="33%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">楼盘性质</td>
      
    <td width="33%"><%=xz%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">录入人</td>
      
    <td width="33%"><%=lrr%> </td>
      
    <td align="right" width="17%">录入时间</td>
      
    <td width="33%"><%=lrsj%> </td>
    </tr>
  </table>
</body>
</html>
