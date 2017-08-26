<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String sq_dwxx_dwmc=null;
String xsdlx=null;
String xszsl=null;
String xszje=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
String xsrq=null;
String xsdzt=null;
String nian=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String cbzje=null;
String xsph=null;
xsph=cf.GB2Uni(request.getParameter("xsph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jxc_fcxsd.dqbm as dqbm,sq_dwxx.dwmc as sq_dwxx_dwmc,jxc_fcxsd.xsdlx as xsdlx,jxc_fcxsd.xszsl as xszsl,jxc_fcxsd.xszje as xszje,jxc_fcxsd.sklx as sklx,jxc_fcxsd.sfqk as sfqk,jxc_fcxsd.shfmc as shfmc,jxc_fcxsd.shrlxfs as shrlxfs,jxc_fcxsd.shfdz as shfdz,jxc_fcxsd.xsy as xsy,jxc_fcxsd.xsrq as xsrq,jxc_fcxsd.xsdzt as xsdzt,jxc_fcxsd.nian as nian,jxc_fcxsd.lrr as lrr,jxc_fcxsd.lrsj as lrsj,jxc_fcxsd.lrbm as lrbm,jxc_fcxsd.bz as bz,jxc_fcxsd.cbzje as cbzje ";
	ls_sql+=" from  jxc_fcxsd,sq_dwxx";
	ls_sql+=" where jxc_fcxsd.ssfgs=sq_dwxx.dwbh(+) and  (jxc_fcxsd.xsph='"+xsph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		xsdlx=cf.fillNull(rs.getString("xsdlx"));
		xszsl=cf.fillNull(rs.getString("xszsl"));
		xszje=cf.fillNull(rs.getString("xszje"));
		sklx=cf.fillNull(rs.getString("sklx"));
		sfqk=cf.fillNull(rs.getString("sfqk"));
		shfmc=cf.fillNull(rs.getString("shfmc"));
		shrlxfs=cf.fillNull(rs.getString("shrlxfs"));
		shfdz=cf.fillNull(rs.getString("shfdz"));
		xsy=cf.fillNull(rs.getString("xsy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		nian=cf.fillNull(rs.getString("nian"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		cbzje=cf.fillNull(rs.getString("cbzje"));
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
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=xsph%>  </td>
  <td align="right" width="18%">���۵����� </td>
  <td width="32%"><%
	cf.selectToken(out,"1+��װ����&2+�ͻ�����&3+�����⳥&4+������&9+����",xsdlx,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����ֹ�˾  </td>
  <td width="32%"> 
    <%=sq_dwxx_dwmc%>  </td>
  <td align="right" width="18%">����</td>
  <td width="32%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����������</td>
  <td><%=xszsl%></td>
  <td align="right">�����ܽ�� </td>
  <td><%=xszje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> �ɱ��ܽ�� </td>
  <td><%=cbzje%> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�տ����� </td>
  <td width="32%"><%
	cf.selectToken(out,"1+�ֽ�&2+ת��&3+֧Ʊ&9+����",sklx,true);
%></td>
  <td align="right" width="18%">�Ƿ�ȫ��</td>
  <td width="32%"><%
	cf.radioToken(out, "1+ȫ��&2+���ֿ�&3+δ����",sfqk,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ջ�������</td>
  <td colspan="3"><%=shfmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ջ�����ϵ��ʽ</td>
  <td colspan="3"><%=shrlxfs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ջ�����ַ</td>
  <td colspan="3"><%=shfdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����Ա  </td>
  <td width="32%"> 
    <%=xsy%>  </td>
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=xsrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���۵�״̬  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"0+�ȴ��ύ&2+�ȴ�����&3+�ѳ���&4+���ֳ���",xsdzt,true);
%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼����  </td>
  <td width="32%"> 
    <%=lrr%>  </td>
  <td align="right" width="18%"> 
    ¼��ʱ��  </td>
  <td width="32%"> 
    <%=lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿�� </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",lrbm,true);
%></td>
  <td align="right">��</td>
  <td><%=nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">���ϱ���</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="10%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="4%">������λ</td>
	<td  width="4%">���ۼ�</td>
	<td  width="4%">��������</td>
	<td  width="5%">���۽��</td>
	<td  width="4%">��������</td>
	<td  width="4%">���۷�ʽ</td>
	<td  width="4%">��С����</td>
	<td  width="7%">��Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="7%">���ϴ���</td>
	<td  width="7%">����С��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jxc_fcxsmx.xsxh,jxc_fcxsmx.clbm,jxc_fcxsmx.nbbm,jxc_fcxsmx.clmc,jxc_fcxsmx.xh,jxc_fcxsmx.gg,jxc_fcxsmx.jldwbm,TO_CHAR(jxc_fcxsmx.xsj),jxc_fcxsmx.xssl,jxc_fcxsmx.xsje,jxc_fcxsmx.cksl";
	ls_sql+=" ,DECODE(jxc_fcxsmx.xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�ɸ����') xsfsmc,TO_CHAR(zxqdl)";
	ls_sql+=" ,jxc_fcxsmx.ppmc,jxc_fcxsmx.gysmc,jxc_fcxsmx.cldlbm,jxc_fcxsmx.clxlbm";
	ls_sql+=" FROM jxc_fcxsmx,jxc_cljgb ";
	ls_sql+=" where jxc_fcxsmx.xsph='"+xsph+"' ";
	ls_sql+=" and jxc_fcxsmx.clbm=jxc_cljgb.clbm(+)";
	ls_sql+=" and  jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" order by jxc_fcxsmx.xsxh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>
