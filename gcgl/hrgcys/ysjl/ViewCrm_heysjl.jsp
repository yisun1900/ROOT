<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ysjlh=null;
String yscsjlh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String gcysbbh=null;
String gcysxmbm=null;
String gcysxmmc=null;
String yszxsl=null;
String yssj=null;
String ysr=null;
String sjysjg=null;
String clbz=null;
String zgcljlh=null;
String jhjjsj=null;
String jsr=null;
String jssj=null;
String jssm=null;
String cljg=null;
String jjr=null;
String jjsj=null;
String jjsm=null;
String zgysjg=null;
String zgysr=null;
String zgyssj=null;
String zgyssm=null;
String sfszhf=null;
String hfszjlh=null;
String gcjdbm=null;
String sfsgjdb=null;
String jdbm=null;
String ygcjdbm=null;
String ysfxhf=null;
String yhfrq=null;
String yhflxbm=null;
String yysjlh=null;
String ygcysxmbm=null;
String yyssj=null;
String zpsl=null;
String khkkzpsl=null;
String lrbm=null;
String lrr=null;
String lrsj=null;
String fdxbz=null;
String xlrmx=null;
String bz=null;
String dwjg=null;
String dwwz=null;
String dwjd=null;
String dwwd=null;
String dwhb=null;
String padlrbz=null;
String whereysjlh=null;
whereysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_heysjl.ysjlh as ysjlh,crm_heysjl.yscsjlh as yscsjlh,crm_heysjl.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_heysjl.sjs as sjs,sgdmc,crm_heysjl.zjxm as zjxm,crm_heysjl.gcysbbh as gcysbbh,crm_heysjl.gcysxmbm as gcysxmbm,crm_heysjl.gcysxmmc as gcysxmmc,crm_heysjl.yszxsl as yszxsl,crm_heysjl.yssj as yssj,crm_heysjl.ysr as ysr,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','���ϸ�') sjysjg,DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz,crm_heysjl.zgcljlh as zgcljlh,crm_heysjl.jhjjsj as jhjjsj,crm_heysjl.jsr as jsr,crm_heysjl.jssj as jssj,crm_heysjl.jssm as jssm,crm_heysjl.cljg as cljg,crm_heysjl.jjr as jjr,crm_heysjl.jjsj as jjsj,crm_heysjl.jjsm as jjsm,crm_heysjl.zgysjg as zgysjg,crm_heysjl.zgysr as zgysr,crm_heysjl.zgyssj as zgyssj,crm_heysjl.zgyssm as zgyssm,crm_heysjl.sfszhf as sfszhf,crm_heysjl.hfszjlh as hfszjlh,crm_heysjl.gcjdbm as gcjdbm,crm_heysjl.sfsgjdb as sfsgjdb,crm_heysjl.jdbm as jdbm,crm_heysjl.ygcjdbm as ygcjdbm,crm_heysjl.ysfxhf as ysfxhf,crm_heysjl.yhfrq as yhfrq,crm_heysjl.yhflxbm as yhflxbm,crm_heysjl.yysjlh as yysjlh,crm_heysjl.ygcysxmbm as ygcysxmbm,crm_heysjl.yyssj as yyssj,crm_heysjl.zpsl as zpsl,crm_heysjl.khkkzpsl as khkkzpsl,crm_heysjl.lrbm as lrbm,crm_heysjl.lrr as lrr,crm_heysjl.lrsj as lrsj,crm_heysjl.fdxbz as fdxbz,crm_heysjl.xlrmx as xlrmx,crm_heysjl.bz as bz,crm_heysjl.dwjg as dwjg,crm_heysjl.dwwz as dwwz,crm_heysjl.dwjd as dwjd,crm_heysjl.dwwd as dwwd,crm_heysjl.dwhb as dwhb,crm_heysjl.padlrbz as padlrbz ";
	ls_sql+=" from  crm_heysjl,crm_khxx,sq_sgd";
	ls_sql+=" where crm_heysjl.khbh=crm_khxx.khbh(+) and  (crm_heysjl.ysjlh='"+whereysjlh+"')  ";
	ls_sql+=" and crm_heysjl.sgd=sq_sgd.sgd(+) and  (crm_heysjl.ysjlh='"+whereysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysjlh=cf.fillNull(rs.getString("ysjlh"));
		yscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		yszxsl=cf.fillNull(rs.getString("yszxsl"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
		zgcljlh=cf.fillNull(rs.getString("zgcljlh"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jssm=cf.fillNull(rs.getString("jssm"));
		cljg=cf.fillNull(rs.getString("cljg"));
		jjr=cf.fillNull(rs.getString("jjr"));
		jjsj=cf.fillNull(rs.getDate("jjsj"));
		jjsm=cf.fillNull(rs.getString("jjsm"));
		zgysjg=cf.fillNull(rs.getString("zgysjg"));
		zgysr=cf.fillNull(rs.getString("zgysr"));
		zgyssj=cf.fillNull(rs.getDate("zgyssj"));
		zgyssm=cf.fillNull(rs.getString("zgyssm"));
		sfszhf=cf.fillNull(rs.getString("sfszhf"));
		hfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sfsgjdb=cf.fillNull(rs.getString("sfsgjdb"));
		jdbm=cf.fillNull(rs.getString("jdbm"));
		ygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		ysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		yhfrq=cf.fillNull(rs.getDate("yhfrq"));
		yhflxbm=cf.fillNull(rs.getString("yhflxbm"));
		yysjlh=cf.fillNull(rs.getString("yysjlh"));
		ygcysxmbm=cf.fillNull(rs.getString("ygcysxmbm"));
		yyssj=cf.fillNull(rs.getDate("yyssj"));
		zpsl=cf.fillNull(rs.getString("zpsl"));
		khkkzpsl=cf.fillNull(rs.getString("khkkzpsl"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fdxbz=cf.fillNull(rs.getString("fdxbz"));
		xlrmx=cf.fillNull(rs.getString("xlrmx"));
		bz=cf.fillNull(rs.getString("bz"));
		dwjg=cf.fillNull(rs.getString("dwjg"));
		dwwz=cf.fillNull(rs.getString("dwwz"));
		dwjd=cf.fillNull(rs.getString("dwjd"));
		dwwd=cf.fillNull(rs.getString("dwwd"));
		dwhb=cf.fillNull(rs.getString("dwhb"));
		padlrbz=cf.fillNull(rs.getString("padlrbz"));
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
    <td  align="center" colspan="4"><input name="ckxm" type="button"  onClick="window.open('ViewCrm_heysmxb.jsp?ysjlh=<%=ysjlh%>')"  value="�鿴��Ŀ" >
    <input name="cktp" type="button" id="cktp" onClick="window.open('ViewZp1.jsp?ysjlh=<%=ysjlh%>')"  value="�鿴ͼƬ" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���ռ�¼��  </td>
  <td width="32%"> 
    <%=ysjlh%>  </td>
  <td align="right" width="18%"> 
    ���մ�����¼��  </td>
  <td width="32%"> 
    <%=yscsjlh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=khbh%>  </td>
  <td align="right" width="18%"> 
    �ͻ�����  </td>
  <td width="32%"> 
    <%=crm_khxx_khxm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���ݵ�ַ  </td>
  <td width="32%"> 
    <%=crm_khxx_fwdz%>  </td>
  <td align="right" width="18%"> 
    ���ʦ  </td>
  <td width="32%"> 
    <%=sjs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ʩ����  </td>
  <td width="32%"> 
    <%=sgd%>  </td>
  <td align="right" width="18%"> 
    �ʼ�  </td>
  <td width="32%"> 
    <%=zjxm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���հ汾��  </td>
  <td width="32%"> 
    <%=gcysbbh%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ������Ŀ����  </td>
  <td width="32%"> 
    <%=gcysxmmc%>  </td>
  <td align="right" width="18%"> 
    ������������  </td>
  <td width="32%"> 
    <%=yszxsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��Ŀ����ʱ��  </td>
  <td width="32%"> 
    <%=yssj%>  </td>
  <td align="right" width="18%"> 
    ��Ŀ������  </td>
  <td width="32%"> 
    <%=ysr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��Ŀ���ս��  </td>
  <td width="32%"> 
<%=sjysjg%>  </td>
  <td align="right" width="18%"> 
    ���Ĵ���״̬  </td>
  <td width="32%"> 
<%=clbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���Ĵ����¼��  </td>
  <td width="32%"> 
    <%=zgcljlh%>  </td>
  <td align="right" width="18%"> 
    �ƻ����ʱ��  </td>
  <td width="32%"> 
    <%=jhjjsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���Ľ�����  </td>
  <td width="32%"> 
    <%=jsr%>  </td>
  <td align="right" width="18%"> 
    ���Ľ���ʱ��  </td>
  <td width="32%"> 
    <%=jssj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���Ľ���˵��  </td>
  <td width="32%"> 
    <%=jssm%>  </td>
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "3+�ڴ���&4+�ѽ��",cljg,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���Ĵ�����  </td>
  <td width="32%"> 
    <%=jjr%>  </td>
  <td align="right" width="18%"> 
    ���Ĵ���ʱ��  </td>
  <td width="32%"> 
    <%=jjsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���Ĵ������  </td>
  <td width="32%"> 
    <%=jjsm%>  </td>
  <td align="right" width="18%"> 
    �������ս��  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "5+�ϸ�&6+���ϸ�",zgysjg,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����������  </td>
  <td width="32%"> 
    <%=zgysr%>  </td>
  <td align="right" width="18%"> 
    ��������ʱ��  </td>
  <td width="32%"> 
    <%=zgyssj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����������  </td>
  <td width="32%"> 
    <%=zgyssm%>  </td>
  <td align="right" width="18%"> 
    �Ƿ����ûط�  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+��&N+��",sfszhf,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ط����ü�¼��  </td>
  <td width="32%"> 
    <%=hfszjlh%>  </td>
  <td align="right" width="18%"> 
    ���ù��̽��ȱ���  </td>
  <td width="32%"> 
    <%=gcjdbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ����ʩ�����ȱ�  </td>
  <td width="32%"> 
    <%=sfsgjdb%>  </td>
  <td align="right" width="18%"> 
    ʩ�����Ƚ��Ƚڵ�  </td>
  <td width="32%"> 
    <%=jdbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ԭ���̽��ȱ���  </td>
  <td width="32%"> 
    <%=ygcjdbm%>  </td>
  <td align="right" width="18%"> 
    ԭ�Ƿ���ط�  </td>
  <td width="32%"> 
    <%=ysfxhf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ԭӦ�ط�����  </td>
  <td width="32%"> 
    <%=yhfrq%>  </td>
  <td align="right" width="18%"> 
    ԭ�ط����ͱ���  </td>
  <td width="32%"> 
    <%=yhflxbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ԭ���ռ�¼��  </td>
  <td width="32%"> 
    <%=yysjlh%>  </td>
  <td align="right" width="18%"> 
    ԭ������Ŀ����  </td>
  <td width="32%"> 
    <%=ygcysxmbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ԭ����ʱ��  </td>
  <td width="32%"> 
    <%=yyssj%>  </td>
  <td align="right" width="18%"> 
    ��Ƭ����  </td>
  <td width="32%"> 
    <%=zpsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ��ɿ���Ƭ����  </td>
  <td width="32%"> 
    <%=khkkzpsl%>  </td>
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
  <td align="right" width="18%"> 
    �����ű�־  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "1+δ����&2+����",fdxbz,true);
%>  </td>
  <td align="right" width="18%"> 
    ��¼����ϸ  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"1+����¼��&2+��¼��&3+��¼��",xlrmx,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��ע  </td>
  <td width="32%"> 
    <%=bz%>  </td>
  <td align="right" width="18%"> 
    ��λ���  </td>
  <td width="32%"> 
    <%=dwjg%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��λλ��  </td>
  <td width="32%"> 
    <%=dwwz%>  </td>
  <td align="right" width="18%"> 
    ��λ����  </td>
  <td width="32%"> 
    <%=dwjd%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��λγ��  </td>
  <td width="32%"> 
    <%=dwwd%>  </td>
  <td align="right" width="18%"> 
    ��λ����  </td>
  <td width="32%"> 
    <%=dwhb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ���¼���־  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "0+����&1+�ͻ���",padlrbz,true);
%>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
</table>
</body>
</html>
