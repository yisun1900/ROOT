<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String xgytg=null;
String gytgts=null;
String sjcpxx=null;
String sjcpfl=null;
String bjlb=null;
String bjjbbm=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;
String jishu=null;
String changdu=null;
String jgchangdu=null;
String jishucd=null;
String gznr=null;
String bz=null;
String ysxm=null;
String whererwbm=null;
whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rwbm,rwmc,rwflmc,DECODE(zdjkrw,'1','�ص���','2','���ص�') zdjkrw,DECODE(xgytg,'Y','��','N','��') xgytg,gytgts,DECODE(sjcpxx,'Y','��','N','��') sjcpxx,sjcpfl,DECODE(bjlb,'1','��ǰ����','2','�º�����','3','��ǰ�º�����','9','һ���¼') bjlb,bjjbmc,sqtxnr,sqtxts,shtxnr,shtxts,DECODE(sfyxhxgq,'Y','Ӱ��','N','��') sfyxhxgq,DECODE(sfyxfc,'Y','Ӱ��','N','��') sfyxfc,DECODE(sfxys,'Y','����','N','��') sfxys,DECODE(sfwlcb,'Y','��̱�','N','��') sfwlcb,zyrwmc,rwxh,jishu,changdu,jgchangdu,jishucd,gznr,bz,ysxm ";
	ls_sql+=" from  dm_bzrwbm,dm_rwflbm,dm_zyrwbm,dm_bjjbbm";
	ls_sql+=" where dm_bzrwbm.rwflbm=dm_rwflbm.rwflbm(+) and dm_bzrwbm.zyrwbm=dm_zyrwbm.zyrwbm(+) and dm_bzrwbm.bjjbbm=dm_bjjbbm.bjjbbm(+) and rwbm='"+whererwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflmc"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		xgytg=cf.fillNull(rs.getString("xgytg"));
		gytgts=cf.fillNull(rs.getString("gytgts"));
		sjcpxx=cf.fillNull(rs.getString("sjcpxx"));
		sjcpfl=cf.fillNull(rs.getString("sjcpfl"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwmc"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		jishu=cf.fillNull(rs.getString("jishu"));
		changdu=cf.fillNull(rs.getString("changdu"));
		jgchangdu=cf.fillNull(rs.getString("jgchangdu"));
		jishucd=cf.fillNull(rs.getString("jishucd"));
		gznr=cf.fillNull(rs.getString("gznr"));
		bz=cf.fillNull(rs.getString("bz"));
		ysxm=cf.fillNull(rs.getString("ysxm"));
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
<title>��׼����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
.STYLE4 {
	color: #0000FF;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">��׼����������룺<%=rwbm%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3">�������    </span></td>
  <td width="32%" bgcolor="#FFFFFF"><span class="STYLE3"><%=rwxh%> </span></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3">ժҪ����</span></td>
  <td width="32%" bgcolor="#FFFFFF"><span class="STYLE3"><%=zyrwbm%></span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">��������</span></td>
  <td colspan="3" bgcolor="#FFFFFF"><span class="STYLE3"><%=rwmc%></span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �������  </td>
  <td width="32%"> 
    <%=rwflbm%>  </td>
  <td align="right" width="18%"> 
    �ص�������  </td>
  <td width="32%"> 
    <%=zdjkrw%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �蹤��ͣ��  </td>
  <td width="32%"> 
<%=xgytg%>  </td>
  <td align="right" width="18%"> 
    ����ͣ������  </td>
  <td width="32%"> 
    <%=gytgts%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    �Ƿ��漰��Ʒ��Ϣ  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
<%=sjcpxx%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    �漰��Ʒ����  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sjcpfl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �������  </td>
  <td width="32%"> 
<%=bjlb%>  </td>
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
<%=bjjbbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ǰ��������</td>
  <td width="32%"><%=sqtxts%></td>
  <td align="right" width="18%">�º���������</td>
  <td width="32%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ǰ��������</td>
  <td colspan="3"><%=sqtxnr%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �º���������  </td>
  <td colspan="3"> 
    <%=shtxnr%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ�Ӱ���������  </td>
  <td width="32%"> 
    <%=sfyxhxgq%>  </td>
  <td align="right" width="18%"> 
    �Ƿ�Ӱ�츴��  </td>
  <td width="32%"> 
    <%=sfyxfc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    �Ƿ�������  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sfxys%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    �Ƿ�Ϊ��̱�  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sfwlcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">������Ŀ</td>
  <td colspan="3" bgcolor="#FFFFCC"><%=ysxm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����  </td>
  <td width="32%"> 
    <%=jishu%>  </td>
  <td align="right" width="18%"> 
    ����  </td>
  <td width="32%"> 
    <%=changdu%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �������  </td>
  <td width="32%"> 
    <%=jgchangdu%>  </td>
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=jishucd%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">��ע���� </span></td>
  <td colspan="3"><%=gznr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע </td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>
</body>
</html>
