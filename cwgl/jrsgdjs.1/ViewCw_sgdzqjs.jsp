<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_sgdzqjs_jsjlh=null;
String cw_sgdzqjs_khbh=null;
String sq_sgd_sgdmc=null;
String cw_sgdzqjs_sgbz=null;
String cw_sgdzqjs_jsrq=null;
String cw_sgdzqjs_jsbl=null;
String cw_sgdzqjs_jsje=null;
String cw_sgdzqjs_clf=null;
String cw_sgdzqjs_gdyp=null;
String cw_sgdzqjs_sjbk=null;
String cw_sgdzqjs_lx=null;
String cw_sgdzqjs_lrr=null;
String cw_sgdzqjs_lrsj=null;
String cw_sgdzqjs_lrbm=null;
String cw_sgdzqjs_bz=null;
String cw_sgdzqjs_jsjs=null;
String cw_sgdzqjs_htje=null;
String cw_sgdzqjs_zjxje=null;
String cw_sgdzqjs_jsjsze=null;
String cw_sgdzqjs_sfkclk=null;
String cw_sgdzqjs_sfkgdyp=null;
String cw_sgdzqjs_sfkyfgf=null;
String cw_sgdzqjs_jzssk=null;
String cw_sgdzqjs_yfgf=null;
String wherecw_sgdzqjs_jsjlh=null;
wherecw_sgdzqjs_jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sgdzqjs.jsjlh as cw_sgdzqjs_jsjlh,cw_sgdzqjs.khbh as cw_sgdzqjs_khbh,sq_sgd.sgdmc as sq_sgd_sgdmc,cw_sgdzqjs.sgbz as cw_sgdzqjs_sgbz,cw_sgdzqjs.jsrq as cw_sgdzqjs_jsrq,cw_sgdzqjs.jsbl as cw_sgdzqjs_jsbl,cw_sgdzqjs.jsje as cw_sgdzqjs_jsje,cw_sgdzqjs.clf as cw_sgdzqjs_clf,cw_sgdzqjs.gdyp as cw_sgdzqjs_gdyp,cw_sgdzqjs.sjbk as cw_sgdzqjs_sjbk,cw_sgdzqjs.lx as cw_sgdzqjs_lx,cw_sgdzqjs.lrr as cw_sgdzqjs_lrr,cw_sgdzqjs.lrsj as cw_sgdzqjs_lrsj,cw_sgdzqjs.lrbm as cw_sgdzqjs_lrbm,cw_sgdzqjs.bz as cw_sgdzqjs_bz,cw_sgdzqjs.jsjs as cw_sgdzqjs_jsjs,cw_sgdzqjs.htje as cw_sgdzqjs_htje,cw_sgdzqjs.zjxje as cw_sgdzqjs_zjxje,cw_sgdzqjs.jsjsze as cw_sgdzqjs_jsjsze,cw_sgdzqjs.sfkclk as cw_sgdzqjs_sfkclk,cw_sgdzqjs.sfkgdyp as cw_sgdzqjs_sfkgdyp,cw_sgdzqjs.sfkyfgf as cw_sgdzqjs_sfkyfgf,cw_sgdzqjs.jzssk as cw_sgdzqjs_jzssk,cw_sgdzqjs.yfgf as cw_sgdzqjs_yfgf ";
	ls_sql+=" from  cw_sgdzqjs,sq_sgd";
	ls_sql+=" where cw_sgdzqjs.sgd=sq_sgd.sgd(+) and  (cw_sgdzqjs.jsjlh='"+wherecw_sgdzqjs_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_sgdzqjs_jsjlh=cf.fillNull(rs.getString("cw_sgdzqjs_jsjlh"));
		cw_sgdzqjs_khbh=cf.fillNull(rs.getString("cw_sgdzqjs_khbh"));
		sq_sgd_sgdmc=cf.fillNull(rs.getString("sq_sgd_sgdmc"));
		cw_sgdzqjs_sgbz=cf.fillNull(rs.getString("cw_sgdzqjs_sgbz"));
		cw_sgdzqjs_jsrq=cf.fillNull(rs.getDate("cw_sgdzqjs_jsrq"));
		cw_sgdzqjs_jsbl=cf.fillNull(rs.getString("cw_sgdzqjs_jsbl"));
		cw_sgdzqjs_jsje=cf.fillNull(rs.getString("cw_sgdzqjs_jsje"));
		cw_sgdzqjs_clf=cf.fillNull(rs.getString("cw_sgdzqjs_clf"));
		cw_sgdzqjs_gdyp=cf.fillNull(rs.getString("cw_sgdzqjs_gdyp"));
		cw_sgdzqjs_sjbk=cf.fillNull(rs.getString("cw_sgdzqjs_sjbk"));
		cw_sgdzqjs_lx=cf.fillNull(rs.getString("cw_sgdzqjs_lx"));
		cw_sgdzqjs_lrr=cf.fillNull(rs.getString("cw_sgdzqjs_lrr"));
		cw_sgdzqjs_lrsj=cf.fillNull(rs.getDate("cw_sgdzqjs_lrsj"));
		cw_sgdzqjs_lrbm=cf.fillNull(rs.getString("cw_sgdzqjs_lrbm"));
		cw_sgdzqjs_bz=cf.fillNull(rs.getString("cw_sgdzqjs_bz"));
		cw_sgdzqjs_jsjs=cf.fillNull(rs.getString("cw_sgdzqjs_jsjs"));
		cw_sgdzqjs_htje=cf.fillNull(rs.getString("cw_sgdzqjs_htje"));
		cw_sgdzqjs_zjxje=cf.fillNull(rs.getString("cw_sgdzqjs_zjxje"));
		cw_sgdzqjs_jsjsze=cf.fillNull(rs.getString("cw_sgdzqjs_jsjsze"));
		cw_sgdzqjs_sfkclk=cf.fillNull(rs.getString("cw_sgdzqjs_sfkclk"));
		cw_sgdzqjs_sfkgdyp=cf.fillNull(rs.getString("cw_sgdzqjs_sfkgdyp"));
		cw_sgdzqjs_sfkyfgf=cf.fillNull(rs.getString("cw_sgdzqjs_sfkyfgf"));
		cw_sgdzqjs_jzssk=cf.fillNull(rs.getString("cw_sgdzqjs_jzssk"));
		cw_sgdzqjs_yfgf=cf.fillNull(rs.getString("cw_sgdzqjs_yfgf"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ʩ�������ڲ�����</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����¼��  </td>
  <td width="32%"> 
    <%=cw_sgdzqjs_jsjlh%>  </td>
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=cw_sgdzqjs_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ʩ����  </td>
  <td width="32%"> 
    <%=sq_sgd_sgdmc%>  </td>
  <td align="right" width="18%"> 
    �ֳ�������  </td>
  <td width="32%"> 
    <%=cw_sgdzqjs_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd",cw_sgdzqjs_lx,true);
%></td>
  <td align="right">��������</td>
  <td><%=cw_sgdzqjs_jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ��ͬ���� </td>
  <td><%=cw_sgdzqjs_htje%> </td>
  <td align="right"> ��������� </td>
  <td><%=cw_sgdzqjs_zjxje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��װʵ�տ� </td>
  <td><%=cw_sgdzqjs_jzssk%></td>
  <td align="right">�Ƿ�۲��Ͽ�</td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdzqjs_sfkclk,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"> �Ƿ�۹�����Ʒ </td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdzqjs_sfkgdyp,true);
%>  </td>
  <td align="right"> �Ƿ���Ѹ����� </td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",cw_sgdzqjs_sfkyfgf,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ������Ʒ </td>
  <td><%=cw_sgdzqjs_gdyp%> </td>
  <td align="right">���Ϸ�</td>
  <td><%=cw_sgdzqjs_clf%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",cw_sgdzqjs_jsjs,true);
%></td>
  <td align="right"> �Ѹ����� </td>
  <td><%=cw_sgdzqjs_yfgf%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ܶ�</td>
  <td width="32%"><%=cw_sgdzqjs_jsjsze%>����ͬ�����������������</td>
  <td align="right" width="18%"> 
    �������  </td>
  <td width="32%"> 
    <%=cw_sgdzqjs_jsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
    <%=cw_sgdzqjs_jsje%>  </td>
  <td align="right" width="18%">ʵ�ʲ���</td>
  <td width="32%"><%=cw_sgdzqjs_sjbk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td>
  <td width="32%"><%=cw_sgdzqjs_lrr%></td>
  <td align="right" width="18%">¼��ʱ��</td>
  <td width="32%"><%=cw_sgdzqjs_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼�벿��</td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sgdzqjs_lrbm+"'",cw_sgdzqjs_lrbm,true);
%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��ע  </td>
  <td colspan="3"> 
    <%=cw_sgdzqjs_bz%>  </td>
  </tr>
</table>
</body>
</html>
