<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_xcjdjl_jdjlh=null;
String crm_xcjdjl_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_xcjdjl_sqrq=null;
String crm_xcjdjl_sqr=null;
String crm_xcjdjl_sqrlxdh=null;
String crm_xcjdjl_sfxtp=null;
String crm_xcjdjl_jhjdrq=null;
String crm_xcjdjl_jhjdsj=null;
String crm_xcjdjl_sqsm=null;
String crm_xcjdjl_zcwcsj=null;
String crm_xcjdjl_jdqrwcsj=null;
String crm_xcjdjl_fbr=null;
String crm_xcjdjl_fbsj=null;
String crm_xcjdjl_zzqrjdrq=null;
String crm_xcjdjl_zzqrjdsj=null;
String crm_xcjdjl_sjjdsj=null;
String crm_xcjdjl_jdsfcg=null;
String crm_xcjdjl_sfkkg=null;
String crm_xcjdjl_tzsfqr=null;
String crm_xcjdjl_fasfkx=null;
String crm_xcjdjl_khsfqr=null;
String crm_xcjdjl_xcfzrqr=null;
String crm_xcjdjl_qtczdqr=null;
String crm_xcjdjl_clzt=null;
String crm_xcjdjl_lrr=null;
String crm_xcjdjl_lrsj=null;
String crm_xcjdjl_lrbm=null;
String crm_xcjdjl_sbsfcl=null;
String crm_xcjdjl_tpshr=null;
String crm_xcjdjl_tpshsj=null;
String crm_xcjdjl_tpsftg=null;
String crm_xcjdjl_tpsm=null;
String crm_xcjdjl_jdqrjg=null;
String jdqrcs=null;
String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_xcjdjl.jdqrcs,crm_xcjdjl.jdjlh as crm_xcjdjl_jdjlh,crm_xcjdjl.khbh as crm_xcjdjl_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_xcjdjl.sqrq as crm_xcjdjl_sqrq,crm_xcjdjl.sqr as crm_xcjdjl_sqr,crm_xcjdjl.sqrlxdh as crm_xcjdjl_sqrlxdh,crm_xcjdjl.sfxtp as crm_xcjdjl_sfxtp,crm_xcjdjl.jhjdrq as crm_xcjdjl_jhjdrq,crm_xcjdjl.jhjdsj as crm_xcjdjl_jhjdsj,crm_xcjdjl.sqsm as crm_xcjdjl_sqsm,crm_xcjdjl.zcwcsj as crm_xcjdjl_zcwcsj,crm_xcjdjl.jdqrwcsj as crm_xcjdjl_jdqrwcsj,crm_xcjdjl.fbr as crm_xcjdjl_fbr,crm_xcjdjl.fbsj as crm_xcjdjl_fbsj,crm_xcjdjl.zzqrjdrq as crm_xcjdjl_zzqrjdrq,crm_xcjdjl.zzqrjdsj as crm_xcjdjl_zzqrjdsj,crm_xcjdjl.sjjdsj as crm_xcjdjl_sjjdsj,crm_xcjdjl.jdsfcg as crm_xcjdjl_jdsfcg,crm_xcjdjl.sfkkg as crm_xcjdjl_sfkkg,crm_xcjdjl.tzsfqr as crm_xcjdjl_tzsfqr,crm_xcjdjl.fasfkx as crm_xcjdjl_fasfkx,crm_xcjdjl.khsfqr as crm_xcjdjl_khsfqr,crm_xcjdjl.xcfzrqr as crm_xcjdjl_xcfzrqr,crm_xcjdjl.qtczdqr as crm_xcjdjl_qtczdqr,crm_xcjdjl.clzt as crm_xcjdjl_clzt,crm_xcjdjl.lrr as crm_xcjdjl_lrr,crm_xcjdjl.lrsj as crm_xcjdjl_lrsj,crm_xcjdjl.lrbm as crm_xcjdjl_lrbm,crm_xcjdjl.sbsfcl as crm_xcjdjl_sbsfcl,crm_xcjdjl.tpshr as crm_xcjdjl_tpshr,crm_xcjdjl.tpshsj as crm_xcjdjl_tpshsj,crm_xcjdjl.tpsftg as crm_xcjdjl_tpsftg,crm_xcjdjl.tpsm as crm_xcjdjl_tpsm,DECODE(crm_xcjdjl.jdqrjg,'Y','ͨ��','N','δͨ��') as crm_xcjdjl_jdqrjg ";
	ls_sql+=" from  crm_khxx,crm_xcjdjl";
	ls_sql+=" where crm_xcjdjl.khbh=crm_khxx.khbh and  (crm_xcjdjl.jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jdqrcs=cf.fillNull(rs.getString("jdqrcs"));
		crm_xcjdjl_jdjlh=cf.fillNull(rs.getString("crm_xcjdjl_jdjlh"));
		crm_xcjdjl_khbh=cf.fillNull(rs.getString("crm_xcjdjl_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_xcjdjl_sqrq=cf.fillNull(rs.getDate("crm_xcjdjl_sqrq"));
		crm_xcjdjl_sqr=cf.fillNull(rs.getString("crm_xcjdjl_sqr"));
		crm_xcjdjl_sqrlxdh=cf.fillNull(rs.getString("crm_xcjdjl_sqrlxdh"));
		crm_xcjdjl_sfxtp=cf.fillNull(rs.getString("crm_xcjdjl_sfxtp"));
		crm_xcjdjl_jhjdrq=cf.fillNull(rs.getDate("crm_xcjdjl_jhjdrq"));
		crm_xcjdjl_jhjdsj=cf.fillNull(rs.getString("crm_xcjdjl_jhjdsj"));
		crm_xcjdjl_sqsm=cf.fillNull(rs.getString("crm_xcjdjl_sqsm"));
		crm_xcjdjl_zcwcsj=cf.fillNull(rs.getDate("crm_xcjdjl_zcwcsj"));
		crm_xcjdjl_jdqrwcsj=cf.fillNull(rs.getString("crm_xcjdjl_jdqrwcsj"));
		crm_xcjdjl_fbr=cf.fillNull(rs.getString("crm_xcjdjl_fbr"));
		crm_xcjdjl_fbsj=cf.fillNull(rs.getDate("crm_xcjdjl_fbsj"));
		crm_xcjdjl_zzqrjdrq=cf.fillNull(rs.getDate("crm_xcjdjl_zzqrjdrq"));
		crm_xcjdjl_zzqrjdsj=cf.fillNull(rs.getString("crm_xcjdjl_zzqrjdsj"));
		crm_xcjdjl_sjjdsj=cf.fillNull(rs.getDate("crm_xcjdjl_sjjdsj"));
		crm_xcjdjl_jdsfcg=cf.fillNull(rs.getString("crm_xcjdjl_jdsfcg"));
		crm_xcjdjl_sfkkg=cf.fillNull(rs.getString("crm_xcjdjl_sfkkg"));
		crm_xcjdjl_tzsfqr=cf.fillNull(rs.getString("crm_xcjdjl_tzsfqr"));
		crm_xcjdjl_fasfkx=cf.fillNull(rs.getString("crm_xcjdjl_fasfkx"));
		crm_xcjdjl_khsfqr=cf.fillNull(rs.getString("crm_xcjdjl_khsfqr"));
		crm_xcjdjl_xcfzrqr=cf.fillNull(rs.getString("crm_xcjdjl_xcfzrqr"));
		crm_xcjdjl_qtczdqr=cf.fillNull(rs.getString("crm_xcjdjl_qtczdqr"));
		crm_xcjdjl_clzt=cf.fillNull(rs.getString("crm_xcjdjl_clzt"));
		crm_xcjdjl_lrr=cf.fillNull(rs.getString("crm_xcjdjl_lrr"));
		crm_xcjdjl_lrsj=cf.fillNull(rs.getDate("crm_xcjdjl_lrsj"));
		crm_xcjdjl_lrbm=cf.fillNull(rs.getString("crm_xcjdjl_lrbm"));
		crm_xcjdjl_sbsfcl=cf.fillNull(rs.getString("crm_xcjdjl_sbsfcl"));
		crm_xcjdjl_tpshr=cf.fillNull(rs.getString("crm_xcjdjl_tpshr"));
		crm_xcjdjl_tpshsj=cf.fillNull(rs.getDate("crm_xcjdjl_tpshsj"));
		crm_xcjdjl_tpsftg=cf.fillNull(rs.getString("crm_xcjdjl_tpsftg"));
		crm_xcjdjl_tpsm=cf.fillNull(rs.getString("crm_xcjdjl_tpsm"));
		crm_xcjdjl_jdqrjg=cf.fillNull(rs.getString("crm_xcjdjl_jdqrjg"));
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
<div align="center">�ֳ����׼�¼</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���׼�¼��  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_jdjlh%>  </td>
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ�����  </td>
  <td width="32%"> 
    <%=crm_khxx_khxm%>  </td>
  <td align="right" width="18%"> 
    ���ݵ�ַ  </td>
  <td width="32%"> 
    <%=crm_khxx_fwdz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��ͬ��  </td>
  <td width="32%"> 
    <%=crm_khxx_hth%>  </td>
  <td align="right" width="18%"> 
    ���ʦ  </td>
  <td width="32%"> 
    <%=crm_khxx_sjs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����״̬</td>
  <td><%
	cf.radioToken(out, "1+����&2+ȷ��&3+����ȷ��&4+�������&5+����&6+�ѽ���",crm_xcjdjl_clzt,true);
%></td>
  <td align="right">ʧ���Ƿ���</td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_sbsfcl,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_sqrq%>  </td>
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_sqr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������ϵ�绰  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_sqrlxdh%>  </td>
  <td align="right" width="18%"> 
    �Ƿ�������  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_sfxtp,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ƻ���������  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_jhjdrq%>  </td>
  <td align="right" width="18%"> 
    �ƻ�����ʱ��  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_jhjdsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����˵��  </td>
  <td colspan="3"> 
    <%=crm_xcjdjl_sqsm%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿�� </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_xcjdjl_lrbm,true);
%></td>
  <td align="right">������ʱ��</td>
  <td><%=crm_xcjdjl_zcwcsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ¼���� </td>
  <td><%=crm_xcjdjl_lrr%> </td>
  <td align="right"> ¼��ʱ�� </td>
  <td><%=crm_xcjdjl_lrsj%> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����Ƿ�ͨ��</td>
  <td><%
	cf.radioToken(out, "Y+ͨ��&N+δͨ��",crm_xcjdjl_tpsftg,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ��������� </td>
  <td><%=crm_xcjdjl_tpshr%> </td>
  <td align="right"> �������ʱ�� </td>
  <td><%=crm_xcjdjl_tpshsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����˵��</td>
  <td colspan="3"><%=crm_xcjdjl_tpsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����ȷ�ϴ���</td>
  <td><%=jdqrcs%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ȷ�Ͻ��</td>
  <td width="32%"><%=crm_xcjdjl_jdqrjg%></td>
  <td align="right" width="18%">����ȷ�����ʱ��</td>
  <td width="32%"><%=crm_xcjdjl_jdqrwcsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���׷����� </td>
  <td><%=crm_xcjdjl_fbr%></td>
  <td align="right">���׷���ʱ��</td>
  <td><%=crm_xcjdjl_fbsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ȷ�Ͻ�������</td>
  <td><%=crm_xcjdjl_zzqrjdrq%></td>
  <td align="right">����ȷ�Ͻ���ʱ��</td>
  <td><%=crm_xcjdjl_zzqrjdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����Ƿ�ɹ� </td>
  <td width="32%"><%
	cf.radioToken(out, "Y+�ɹ�&N+��",crm_xcjdjl_jdsfcg,true);
%></td>
  <td align="right" width="18%"> 
    ʵ�ʽ���ʱ��  </td>
  <td width="32%"> 
    <%=crm_xcjdjl_sjjdsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�ɿ���</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_sfkkg,true);
%></td>
  <td align="right" width="18%">ͼֽ�Ƿ�����</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_tzsfqr,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����Ƿ����</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_fasfkx,true);
%></td>
  <td align="right" width="18%">�ͻ��Ƿ��Ͽ�</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_khsfqr,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֳ������˳�����ȷ��</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_xcfzrqr,true);
%></td>
  <td align="right" width="18%">ǽ�崹ֱ���Ƿ�ȷ��</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��&N+��",crm_xcjdjl_qtczdqr,true);
%></td>
</tr>
</table>
<BR>
<div align="center">�ֳ�ʱ���޸ļ�¼
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�޸�ʱ��</td>
	<td  width="41%">�޸�ԭ��</td>
	<td  width="8%">ԭ��������</td>
	<td  width="5%">ԭ����ʱ��</td>
	<td  width="8%">�½�������</td>
	<td  width="5%">�½���ʱ��</td>
	<td  width="5%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT xgsj,xgyy,yjdrq,yjdsj,xjdrq,xjdsj,lrr,lrsj,dwmc ";
	ls_sql+=" FROM crm_jdsjxgjl,sq_dwxx  ";
    ls_sql+=" where crm_jdsjxgjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_jdsjxgjl.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by crm_jdsjxgjl.xgsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setDateType ("long");

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
<BR>
<div align="center">������Ŀ��ϸ
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">������Ŀ</td>
	<td  width="6%">����״̬</td>
	<td  width="11%">������Ա</td>
	<td  width="20%">������Ա�绰</td>
	<td  width="48%">��������</td>
</tr>
<%
	ls_sql="SELECT jdxmmc,DECODE(clzt,'1','δȷ��','2','ͬ��','3','��ͬ��'),jdry,jdrydh,jdnr ";
	ls_sql+=" FROM crm_jdxmmx,dm_jdxmbm  ";
    ls_sql+=" where crm_jdxmmx.jdxmbm=dm_jdxmbm.jdxmbm";
    ls_sql+=" and crm_jdxmmx.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by crm_jdxmmx.jdxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
<BR>
<div align="center">����ȷ�ϼ�¼
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����ȷ�ϴ���</td>
	<td  width="15%">������Ŀ</td>
	<td  width="6%">�Ƿ�ͬ��</td>
	<td  width="13%">ȷ��ʱ��</td>
	<td  width="7%">ȷ����</td>
	<td  width="53%">ȷ��˵��</td>
</tr>
<%
	ls_sql="SELECT jdqrcs,jdxmmc,DECODE(sfty,'Y','ͬ��','N','��ͬ��','M','����ȷ��'),qrsj,qrr,qrsm ";
	ls_sql+=" FROM crm_jdqrjl,dm_jdxmbm  ";
    ls_sql+=" where crm_jdqrjl.jdxmbm=dm_jdxmbm.jdxmbm";
    ls_sql+=" and crm_jdqrjl.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by jdqrcs,crm_jdqrjl.jdxmbm,crm_jdqrjl.qrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setDateType ("long");

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdqrcs","1");//�в����������Hash��
	spanColHash.put("jdxmmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


</body>
</html>
