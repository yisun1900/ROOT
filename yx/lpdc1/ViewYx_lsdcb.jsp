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
	out.print("<BR>����:" + e);
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
<title>¥����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">¥����Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">����</td>
    <td width="33%"> <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm,true);
%> </td>
      
    <td align="right" width="17%">��˾</td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ",fgsbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">����</td>
    <td width="33%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm,true);
%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">С������</td>
      
    <td colspan="3"><%=xqmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��ַ</td>
      
    <td colspan="3"><%=dz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">������</td>
      
    <td colspan="3"><%=kfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��������ϵ��</td>
      
    <td width="33%"><%=kfslxr%> </td>
      
    <td align="right" width="17%">��������ϵ��ְ��</td>
      
    <td width="33%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��������ϵ�˵绰</td>
      
    <td width="33%"><%=kfslxrdh%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��ҵ��˾����</td>
      
    <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��ҵ��ϵ��</td>
      
    <td width="33%"><%=wylxr%> </td>
      
    <td align="right" width="17%">��ҵ��ϵ��ְ��</td>
      
    <td width="33%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��ҵ�绰</td>
      
    <td width="33%"><%=wydh%> </td>
      
    <td align="right" width="17%">����ʱ��</td>
      
    <td width="33%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��Կ��ʱ��</td>
      
    <td width="33%"><%=fyssj%> </td>
      
    <td align="right" width="17%">��������</td>
      
    <td width="33%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��������</td>
      
    <td width="33%"><%=zlhx%> </td>
      
    <td align="right" width="17%">�����������</td>
      
    <td width="33%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">��ҵ��ʽ</td>
      
    <td width="33%"><%=wyxs%> </td>
      
    <td align="right" width="17%">��λ</td>
      
    <td width="33%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">С��������</td>
      
    <td width="33%"><%=xqfzr%> </td>
      
    <td align="right" width="17%">С�������˵绰</td>
      
    <td width="33%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">¥������</td>
      
    <td width="33%"><%=xz%> </td>
      
    <td align="right" width="17%">&nbsp;</td>
      
    <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td align="right" width="17%">¼����</td>
      
    <td width="33%"><%=lrr%> </td>
      
    <td align="right" width="17%">¼��ʱ��</td>
      
    <td width="33%"><%=lrsj%> </td>
    </tr>
  </table>
</body>
</html>
