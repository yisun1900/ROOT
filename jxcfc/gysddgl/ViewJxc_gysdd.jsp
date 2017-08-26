<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dqbm=null;
String gysbm=null;
String gysmc=null;
String cglb=null;
String cllb=null;
String dhzsl=null;
String dhzje=null;
String xdr=null;
String xdrq=null;
String psfs=null;
String yqdhsj=null;
String gysjsr=null;
String gysjsrq=null;
String fhsfwc=null;
String gysfhr=null;
String gysfhrq=null;
String sfjs=null;
String jsr=null;
String jsrq=null;
String sgph=null;
String ddzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String nian=null;
String bz=null;
String sfrksgdw=null;
String gysddph=null;
gysddph=cf.GB2Uni(request.getParameter("gysddph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select a.dwmc as sq_dwxx_dwmc,dqmc,jxc_gysdd.gysbm as gysbm,jxc_gysdd.gysmc as gysmc,jxc_gysdd.cglb as cglb,jxc_gysdd.cllb as cllb,jxc_gysdd.dhzsl as dhzsl,jxc_gysdd.dhzje as dhzje,jxc_gysdd.xdr as xdr,jxc_gysdd.xdrq as xdrq,jxc_gysdd.psfs as psfs,jxc_gysdd.yqdhsj as yqdhsj,jxc_gysdd.gysjsr as gysjsr,jxc_gysdd.gysjsrq as gysjsrq,jxc_gysdd.fhsfwc as fhsfwc,jxc_gysdd.gysfhr as gysfhr,jxc_gysdd.gysfhrq as gysfhrq,jxc_gysdd.sfjs as sfjs,jxc_gysdd.jsr as jsr,jxc_gysdd.jsrq as jsrq,jxc_gysdd.sgph as sgph,DECODE(jxc_gysdd.ddzt,'7','δ�ύ','0','�ȴ��µ�','1','���µ�','2','�ѽ���','3','���ַ���','5','����ɷ���','4','�����','6','���ڰ������','9','�ѽ���') as ddzt,jxc_gysdd.lrr as lrr,jxc_gysdd.lrsj as lrsj,b.dwmc as lrbm,jxc_gysdd.nian as nian,jxc_gysdd.bz as bz,jxc_gysdd.sfrksgdw as sfrksgdw ";
	ls_sql+=" from  jxc_gysdd,sq_dwxx a,sq_dwxx b,dm_dqbm";
    ls_sql+=" where jxc_gysdd.ssfgs=a.dwbh and jxc_gysdd.lrbm=b.dwbh and jxc_gysdd.dqbm=dm_dqbm.dqbm";
	ls_sql+=" and jxc_gysdd.gysddph='"+gysddph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dqbm=cf.fillNull(rs.getString("dqmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		cglb=cf.fillNull(rs.getString("cglb"));
		cllb=cf.fillNull(rs.getString("cllb"));
		dhzsl=cf.fillNull(rs.getString("dhzsl"));
		dhzje=cf.fillNull(rs.getString("dhzje"));
		xdr=cf.fillNull(rs.getString("xdr"));
		xdrq=cf.fillNull(rs.getDate("xdrq"));
		psfs=cf.fillNull(rs.getString("psfs"));
		yqdhsj=cf.fillNull(rs.getDate("yqdhsj"));
		gysjsr=cf.fillNull(rs.getString("gysjsr"));
		gysjsrq=cf.fillNull(rs.getDate("gysjsrq"));
		fhsfwc=cf.fillNull(rs.getString("fhsfwc"));
		gysfhr=cf.fillNull(rs.getString("gysfhr"));
		gysfhrq=cf.fillNull(rs.getDate("gysfhrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		sgph=cf.fillNull(rs.getString("sgph"));
		ddzt=cf.fillNull(rs.getString("ddzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		nian=cf.fillNull(rs.getString("nian"));
		bz=cf.fillNull(rs.getString("bz"));
		sfrksgdw=cf.fillNull(rs.getString("sfrksgdw"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ӧ�̶���</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��Ӧ�̶�������  </td>
  <td width="32%"> 
    <%=gysddph%>  </td>
  <td align="right" width="18%">����״̬</td>
  <td width="32%"><%=ddzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><%=dqbm%></td>
  <td align="right">�µ���˾</td>
  <td><%=sq_dwxx_dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̱���</td>
  <td width="32%"><%=gysbm%></td>
  <td align="right" width="18%">��Ӧ������</td>
  <td width="32%"><%=gysmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ����</td>
  <td width="32%"><%
	cf.radioToken(out, "J+���Ųɹ�&D+�ط��ɹ�",cglb,true);
%></td>
  <td align="right" width="18%">�������</td>
  <td width="32%"><%
	cf.radioToken(out, "0+����&1+����",cllb,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������</td>
  <td width="32%"><%=dhzsl%></td>
  <td align="right" width="18%">�����ܽ��</td>
  <td width="32%"><%=dhzje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�µ��� </td>
  <td width="32%"><%=xdr%></td>
  <td align="right" width="18%">�µ�����</td>
  <td width="32%"><%=xdrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ͷ�ʽ</td>
  <td width="32%"><%
	cf.radioToken(out, "1+����&2+��ȡ&3+����",psfs,true);
%></td>
  <td align="right" width="18%">Ҫ�󵽻�ʱ��</td>
  <td width="32%"><%=yqdhsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̽�����</td>
  <td width="32%"><%=gysjsr%></td>
  <td align="right" width="18%">��Ӧ�̽�������</td>
  <td width="32%"><%=gysjsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ񷢻� </td>
  <td width="32%"><%
	cf.radioToken(out, "N+δ����&Y+�����&M+���ַ���",fhsfwc,true);
%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��Ӧ�̷�����  </td>
  <td width="32%"> 
    <%=gysfhr%>  </td>
  <td align="right" width="18%"> 
    ��Ӧ�̷�������  </td>
  <td width="32%"> 
    <%=gysfhrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ����  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+�ѽ���&N+δ����",sfjs,true);
%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ </td>
  <td><%=jsr%></td>
  <td align="right">�������� </td>
  <td><%=jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>�Ƿ�ֱ������깺��λ</strong></td>
  <td width="32%"><%
	cf.radioToken(out, "Y+ֱ������깺��λ&N+��",sfrksgdw,true);
%></td>
  <td align="right" width="18%"> 
    <strong>�깺����</strong> </td>
  <td width="32%"> 
    <%=sgph%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼���� </td>
  <td width="32%"><%=lrr%></td>
  <td align="right" width="18%">¼��ʱ�� </td>
  <td width="32%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼�벿��</td>
  <td width="32%"><%=lrbm%></td>
  <td align="right" width="18%">��</td>
  <td width="32%"><%=nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע </td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="7%">���ϱ���</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="11%">��������</td>
	<td  width="10%">�ͺ�</td>
	<td  width="10%">���</td>
	<td  width="4%">������λ</td>
	<td  width="5%">�ɹ�����</td>
	<td  width="5%">��������</td>
	<td  width="5%">�������</td>
	<td  width="5%">����������</td>
	<td  width="8%">Ʒ��</td>
	<td  width="14%">��Ӧ��</td>
	<td  width="7%">����С��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dhxh,clbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(cbj),dhsl,dhje,pssl,ppmc,gysmc,clxlbm ";
	ls_sql+=" FROM jxc_gysddmx ";
    ls_sql+=" where gysddph='"+gysddph+"'";
	ls_sql+=" order by dhxh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.printDateSum();
%> 
</table>

</body>
</html>