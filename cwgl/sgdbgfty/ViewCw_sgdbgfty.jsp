<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_sgdbgfty_jsjlh=null;
String cw_sgdbgfty_khbh=null;
String sq_sgd_sgdmc=null;
String cw_sgdbgfty_sgbz=null;
String cw_sgdbgfty_jsrq=null;
String cw_sgdbgfty_jsbl=null;
String cw_sgdbgfty_jsje=null;
String cw_sgdbgfty_clf=null;
String cw_sgdbgfty_gdyp=null;
String cw_sgdbgfty_sjbk=null;
String cw_sgdbgfty_lx=null;
String cw_sgdbgfty_lrr=null;
String cw_sgdbgfty_lrsj=null;
String cw_sgdbgfty_lrbm=null;
String cw_sgdbgfty_bz=null;
String cw_sgdbgfty_jsjs=null;
String cw_sgdbgfty_htje=null;
String cw_sgdbgfty_zjxje=null;
String cw_sgdbgfty_jsjsze=null;
String cw_sgdbgfty_sfkclk=null;
String cw_sgdbgfty_sfkgdyp=null;
String cw_sgdbgfty_sfkyfgf=null;
String cw_sgdbgfty_jzssk=null;
String cw_sgdbgfty_yfgf=null;
String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sgdbgfty.jsjlh as cw_sgdbgfty_jsjlh,cw_sgdbgfty.khbh as cw_sgdbgfty_khbh,sq_sgd.sgdmc as sq_sgd_sgdmc,cw_sgdbgfty.sgbz as cw_sgdbgfty_sgbz,cw_sgdbgfty.jsrq as cw_sgdbgfty_jsrq,cw_sgdbgfty.jsbl as cw_sgdbgfty_jsbl,cw_sgdbgfty.jsje as cw_sgdbgfty_jsje,cw_sgdbgfty.clf as cw_sgdbgfty_clf,cw_sgdbgfty.gdyp as cw_sgdbgfty_gdyp,cw_sgdbgfty.sjbk as cw_sgdbgfty_sjbk,cw_sgdbgfty.gdjsjd as cw_sgdbgfty_lx,cw_sgdbgfty.lrr as cw_sgdbgfty_lrr,cw_sgdbgfty.lrsj as cw_sgdbgfty_lrsj,cw_sgdbgfty.lrbm as cw_sgdbgfty_lrbm,cw_sgdbgfty.bz as cw_sgdbgfty_bz,cw_sgdbgfty.jsjs as cw_sgdbgfty_jsjs,cw_sgdbgfty.htje as cw_sgdbgfty_htje,cw_sgdbgfty.zjxje as cw_sgdbgfty_zjxje,cw_sgdbgfty.jsjsze as cw_sgdbgfty_jsjsze,cw_sgdbgfty.sfkclk as cw_sgdbgfty_sfkclk,cw_sgdbgfty.sfkgdyp as cw_sgdbgfty_sfkgdyp,cw_sgdbgfty.sfkyfgf as cw_sgdbgfty_sfkyfgf,cw_sgdbgfty.jzssk as cw_sgdbgfty_jzssk,cw_sgdbgfty.yfgf as cw_sgdbgfty_yfgf ";
	ls_sql+=" from  cw_sgdbgfty,sq_sgd";
	ls_sql+=" where cw_sgdbgfty.sgd=sq_sgd.sgd(+) and  (cw_sgdbgfty.jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_sgdbgfty_jsjlh=cf.fillNull(rs.getString("cw_sgdbgfty_jsjlh"));
		cw_sgdbgfty_khbh=cf.fillNull(rs.getString("cw_sgdbgfty_khbh"));
		sq_sgd_sgdmc=cf.fillNull(rs.getString("sq_sgd_sgdmc"));
		cw_sgdbgfty_sgbz=cf.fillNull(rs.getString("cw_sgdbgfty_sgbz"));
		cw_sgdbgfty_jsrq=cf.fillNull(rs.getDate("cw_sgdbgfty_jsrq"));
		cw_sgdbgfty_jsbl=cf.fillNull(rs.getString("cw_sgdbgfty_jsbl"));
		cw_sgdbgfty_jsje=cf.fillNull(rs.getString("cw_sgdbgfty_jsje"));
		cw_sgdbgfty_clf=cf.fillNull(rs.getString("cw_sgdbgfty_clf"));
		cw_sgdbgfty_gdyp=cf.fillNull(rs.getString("cw_sgdbgfty_gdyp"));
		cw_sgdbgfty_sjbk=cf.fillNull(rs.getString("cw_sgdbgfty_sjbk"));
		cw_sgdbgfty_lx=cf.fillNull(rs.getString("cw_sgdbgfty_lx"));
		cw_sgdbgfty_lrr=cf.fillNull(rs.getString("cw_sgdbgfty_lrr"));
		cw_sgdbgfty_lrsj=cf.fillNull(rs.getDate("cw_sgdbgfty_lrsj"));
		cw_sgdbgfty_lrbm=cf.fillNull(rs.getString("cw_sgdbgfty_lrbm"));
		cw_sgdbgfty_bz=cf.fillNull(rs.getString("cw_sgdbgfty_bz"));
		cw_sgdbgfty_jsjs=cf.fillNull(rs.getString("cw_sgdbgfty_jsjs"));
		cw_sgdbgfty_htje=cf.fillNull(rs.getString("cw_sgdbgfty_htje"));
		cw_sgdbgfty_zjxje=cf.fillNull(rs.getString("cw_sgdbgfty_zjxje"));
		cw_sgdbgfty_jsjsze=cf.fillNull(rs.getString("cw_sgdbgfty_jsjsze"));
		cw_sgdbgfty_sfkclk=cf.fillNull(rs.getString("cw_sgdbgfty_sfkclk"));
		cw_sgdbgfty_sfkgdyp=cf.fillNull(rs.getString("cw_sgdbgfty_sfkgdyp"));
		cw_sgdbgfty_sfkyfgf=cf.fillNull(rs.getString("cw_sgdbgfty_sfkyfgf"));
		cw_sgdbgfty_jzssk=cf.fillNull(rs.getString("cw_sgdbgfty_jzssk"));
		cw_sgdbgfty_yfgf=cf.fillNull(rs.getString("cw_sgdbgfty_yfgf"));
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
<title>ʩ���Ӳ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ʩ���Ӳ�����
  <input name="button" type="button" onClick="window.open('dybkd.jsp?jsjlh=<%=jsjlh%>')"  value="��ӡ���">
</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����Ѽ�¼��  </td>
  <td width="32%"> 
    <%=cw_sgdbgfty_jsjlh%>  </td>
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=cw_sgdbgfty_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ʩ����  </td>
  <td width="32%"> 
    <%=sq_sgd_sgdmc%>  </td>
  <td align="right" width="18%"> 
    �ֳ�������  </td>
  <td width="32%"> 
    <%=cw_sgdbgfty_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd",cw_sgdbgfty_lx,true);
%></td>
  <td align="right">��������</td>
  <td><%=cw_sgdbgfty_jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ��ͬ���� </td>
  <td><%=cw_sgdbgfty_htje%> </td>
  <td align="right"> ��������� </td>
  <td><%=cw_sgdbgfty_zjxje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��װʵ�տ� </td>
  <td><%=cw_sgdbgfty_jzssk%></td>
  <td align="right">�Ƿ�۲��Ͽ�</td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdbgfty_sfkclk,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"> �Ƿ�۹�����Ʒ </td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdbgfty_sfkgdyp,true);
%>  </td>
  <td align="right"> �Ƿ���Ѹ����� </td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdbgfty_sfkyfgf,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ������Ʒ </td>
  <td><%=cw_sgdbgfty_gdyp%> </td>
  <td align="right">���Ϸ�</td>
  <td><%=cw_sgdbgfty_clf%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",cw_sgdbgfty_jsjs,true);
%></td>
  <td align="right"> �Ѹ����� </td>
  <td><%=cw_sgdbgfty_yfgf%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ܶ�</td>
  <td width="32%"><%=cw_sgdbgfty_jsjsze%>����ͬ�����������������</td>
  <td align="right" width="18%"> 
    �������  </td>
  <td width="32%"> 
    <%=cw_sgdbgfty_jsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
    <%=cw_sgdbgfty_jsje%>  </td>
  <td align="right" width="18%">ʵ�ʲ���</td>
  <td width="32%"><%=cw_sgdbgfty_sjbk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td>
  <td width="32%"><%=cw_sgdbgfty_lrr%></td>
  <td align="right" width="18%">¼��ʱ��</td>
  <td width="32%"><%=cw_sgdbgfty_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼�벿��</td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sgdbgfty_lrbm+"'",cw_sgdbgfty_lrbm,true);
%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��ע  </td>
  <td colspan="3"> 
    <%=cw_sgdbgfty_bz%>  </td>
  </tr>
</table>
</body>
</html>
