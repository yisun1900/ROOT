<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ckph=null;
String dqbm=null;
String ckbh=null;
String ckzje=null;
String cklx=null;
String cklxmc=null;
String ckcllx=null;
String ckdzt=null;
String ddbh=null;
String thdbh=null;
String sgph=null;
String psph=null;
String dbph=null;
String czxh=null;
String xsph=null;
String rkph=null;
String fgsbh=null;
String jsr=null;
String sfth=null;
String sfjz=null;
String psfs=null;
String jhshsj=null;
String ckr=null;
String cksj=null;
String bz=null;
String khbh=null;
String lydh=null;
String sfyfkc=null;
String ckjxz=null;
String mddqbm=null;


String whereckph=null;
whereckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select b.dqmc mddqbm,ckph,a.dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ϵ�����','J','����ȯ����','X','���۳���','R','��������') cklxmc,DECODE(ckdzt,'0','δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�ύ') ckdzt,dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD')cksj,jxc_ckd.bz bz,ckzje,DECODE(psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,to_char(jhshsj,'YYYY-MM-DD') jhshsj";
	ls_sql+=",ddbh,thdbh,sgph,psph,dbph,czxh,xsph,rkph,cklx,jxc_ckd.khbh,jxc_ckd.lydh,DECODE(jxc_ckd.sfyfkc,'1','�޸����','2','�����δ���','3','��������') sfyfkc,DECODE(jxc_ckd.ckjxz,'1','ȡ�۸��','2','ȡ���ʱ���ۼ�','3','ȡ���ϵ��۸�') ckjxz";
	ls_sql+=" from  jxc_ckd,dm_dqbm a,dm_dqbm b,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+) and jxc_ckd.dqbm=a.dqbm(+) and jxc_ckd.mddqbm=b.dqbm(+) ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and  (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mddqbm=cf.fillNull(rs.getString("mddqbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		lydh=cf.fillNull(rs.getString("lydh"));
		sfyfkc=cf.fillNull(rs.getString("sfyfkc"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklxmc=cf.fillNull(rs.getString("cklxmc"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));

		ddbh=cf.fillNull(rs.getString("ddbh"));
		thdbh=cf.fillNull(rs.getString("thdbh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		psph=cf.fillNull(rs.getString("psph"));
		dbph=cf.fillNull(rs.getString("dbph"));
		czxh=cf.fillNull(rs.getString("czxh"));
		xsph=cf.fillNull(rs.getString("xsph"));
		rkph=cf.fillNull(rs.getString("rkph"));
		cklx=cf.fillNull(rs.getString("cklx"));
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
<title>���ⵥ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ⵥ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=ckph%>  </td>
  <td align="right" width="18%">���ⵥ״̬ </td>
  <td width="32%"><%=ckdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֹ�˾</td>
  <td><%=fgsbh%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><%=dqbm%></td>
  <td align="right">Ŀ�ĵ���</td>
  <td><%=mddqbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ֿ�</td>
  <td width="32%"><%=ckbh%></td>
  <td align="right" width="18%">��������</td>
  <td width="32%"><%=cklxmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ѡ��</td>
  <td><%=ckjxz%></td>
  <td align="right">�Ƿ��и����</td>
  <td><%=sfyfkc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������</td>
  <td width="32%"><%=ckzje%></td>
  <td align="right" width="18%">�����ܽ�� </td>
  <td width="32%"><%=ckzje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td>
  <td width="32%"><%=ckr%></td>
  <td align="right" width="18%">����ʱ��</td>
  <td width="32%"><%=cksj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td>
  <td width="32%"><%=jsr%></td>
  <td align="right" width="18%">��Դ����</td>
  <td width="32%"><%=lydh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ͷ�ʽ </td>
  <td><%=psfs%></td>
  <td align="right">�ƻ��ͻ�ʱ��</td>
  <td><%=jhshsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><%=jsr%></td>
  <td align="right">¼��ʱ��</td>
  <td><%=jsr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿��</td>
  <td><%=jsr%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ڲ�����</td>
	<td  width="10%">��������</td>
	<td  width="6%">���</td>
	<td  width="9%">Ʒ��</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">������λ</td>
	<td  width="5%">��������</td>
	<td  width="5%">���ⵥ��</td>
	<td  width="5%">������</td>
	<td  width="4%">�Ƿ��и����</td>
	<td  width="5%">�������</td>
	<td  width="7%">����ֿ�</td>
	<td  width="7%">�������</td>
	<td  width="7%">���ϱ���</td>
	<td  width="6%">�ͺ�</td>
</tr>
<%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT nbbm,clmc,gg,ppmc,gysmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jldwbm,jxc_ckmx.cksl,TO_CHAR(jxc_ckmx.ckdj),jxc_ckmx.ckje,DECODE(jxc_ckmx.sfyfkc,'1','��','2','�и����'),jxc_ckmx.fkcs,jxc_ckmc.ckmc,jxc_hjmc.hjmc,clbm,xh";
	ls_sql+=" FROM jxc_ckmx,jxc_ckmc,jxc_hjmc  ";
    ls_sql+=" where jxc_ckmx.ckbh=jxc_ckmc.ckbh(+) and jxc_ckmx.hjbh=jxc_hjmc.hjbh(+) and ckph='"+ckph+"'";
	ls_sql+=" order by ckxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>