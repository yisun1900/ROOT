<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String ckph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String cklx=null;
String ckdzt=null;
String ddbh=null;
String fgsbh=null;
String jsr=null;
String ckr=null;
String cksj=null;
String ckzje=null;
String whereckph=null;
String psfs=null;
String sfjz=null;
String sfth=null;
String gysmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz="";
String czxh=null;
String jhshsj=null;
String hth=null;
String wherecklx=null;
String sgph=null;
String thdbh=null;
String psph=null;
String khxm=null;
String sgdmc=null;
String drfgs=null;
String wheredrfgs=null;
String dbdz=null;
String 	dbdwmc=null;
String 	dbfhshr=null;
String 	dbshrsj=null;
String 	dbdh=null;

int ckzsl=0;
whereckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	//����������
	ls_sql="select cklx ";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wherecklx=cf.fillNull(rs.getString("cklx"));
	}
	else
	{
		out.print("<font color=red>���󣡲����ڵĳ��ⵥ</font>");
		return;
	}
	rs.close();
	ps.close();
	if (wherecklx.equals("J"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{

	ls_sql="select ckph,dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,DECODE(ckdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�������') ckdzt,ddbh,dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD') cksj,jxc_ckd.bz bz,ckzje,DECODE(psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,to_char(jhshsj,'YYYY-MM-DD') jhshsj,DECODE(sfjz,'Y','<font color=blue>�Ѹ���</font>','N','<font color=red>δ����</font>') sfjz,DECODE(sfth,'Y','<font color=blue>�����</font>','N','<font color=red>δ���</font>') sfth,to_char(cksj,'YYYY') nian,to_char(cksj,'MM') yue,to_char(cksj,'DD') ri,jxc_ckd.czxh czxh,hth ";
	ls_sql+=" from  jxc_ckd,dm_dqbm,jxc_ckmc,sq_dwxx,jxc_djj,crm_khxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh and jxc_ckd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and jxc_djj.czxh=jxc_ckd.czxh and crm_khxx.khbh=jxc_djj.khbh ";
	ls_sql+=" and  (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		czxh=cf.fillNull(rs.getString("czxh"));
		hth=cf.fillNull(rs.getString("hth"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));
		sfth=cf.fillNull(rs.getString("sfth"));
		sfjz=cf.fillNull(rs.getString("sfjz"));
	}
	rs.close();
	ps.close();
	}
	else if (wherecklx.equals("S"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{

	ls_sql="select jxc_ckd.ckph ckph,dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,DECODE(ckdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�������') ckdzt,ddbh,dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD') cksj,jxc_ckd.bz bz,ckzje,DECODE(jxc_ckd.psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,to_char(jxc_ckd.jhshsj,'YYYY-MM-DD') jhshsj,DECODE(sfjz,'Y','<font color=blue>�Ѹ���</font>','N','<font color=red>δ����</font>') sfjz,DECODE(sfth,'Y','<font color=blue>�����</font>','N','<font color=red>δ���</font>') sfth,to_char(cksj,'YYYY') nian,to_char(cksj,'MM') yue,to_char(cksj,'DD') ri,jxc_ckd.czxh czxh,jxc_ckd.sgph sgph,jxc_clsgd.ssfgs ssfgs ";
	ls_sql+=" from  jxc_ckd,dm_dqbm,jxc_ckmc,sq_dwxx,jxc_clsgd ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh and jxc_ckd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh and jxc_ckd.sgph=jxc_clsgd.sgph";
	ls_sql+=" and  (jxc_ckd.ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		czxh=cf.fillNull(rs.getString("czxh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		wheredrfgs=cf.fillNull(rs.getString("ssfgs"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));
		sfth=cf.fillNull(rs.getString("sfth"));
		sfjz=cf.fillNull(rs.getString("sfjz"));
	}
	rs.close();
	ps.close();
	//��ѯ�ֹ�˾��ϵ�˼���ַ
	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2,sm1,sm2 ";
	ls_sql+=" from  jxc_fgslxr ";
	ls_sql+=" where (dwbh='"+wheredrfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dbdz=cf.fillNull(rs.getString("dz"));
		dbdwmc=cf.fillNull(rs.getString("dwmc"));
		dbfhshr=cf.fillNull(rs.getString("shr"));
		dbshrsj=cf.fillNull(rs.getString("shrsj"));
		dbdh=cf.fillNull(rs.getString("dh"));

	}
	rs.close();
	ps.close();
	}
	else if (wherecklx.equals("R"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{

	ls_sql="select jxc_ckd.ckph ckph,dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,DECODE(ckdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�������') ckdzt,ddbh,a.dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD') cksj,jxc_ckd.bz bz,ckzje,DECODE(psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,to_char(jhshsj,'YYYY-MM-DD') jhshsj,DECODE(sfjz,'Y','<font color=blue>�Ѹ���</font>','N','<font color=red>δ����</font>') sfjz,DECODE(sfth,'Y','<font color=blue>�����</font>','N','<font color=red>δ���</font>') sfth,to_char(cksj,'YYYY') nian,to_char(cksj,'MM') yue,to_char(cksj,'DD') ri,jxc_ckd.czxh czxh,sgph,b.dwmc drfgs,drgs wheredrfgs ";
	ls_sql+=" from  jxc_ckd,dm_dqbm,jxc_ckmc,sq_dwxx a,jxc_db,sq_dwxx b ";
	ls_sql+=" where jxc_ckd.dbph=jxc_db.dbph and jxc_ckd.ckbh=jxc_ckmc.ckbh and jxc_ckd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_ckd.fgsbh=a.dwbh and jxc_db.drgs=b.dwbh ";
	ls_sql+=" and  (jxc_ckd.ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		czxh=cf.fillNull(rs.getString("czxh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		drfgs=cf.fillNull(rs.getString("drfgs"));
		wheredrfgs=cf.fillNull(rs.getString("wheredrfgs"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));
		sfth=cf.fillNull(rs.getString("sfth"));
		sfjz=cf.fillNull(rs.getString("sfjz"));
	}
	rs.close();
	ps.close();
	//��ѯ�ֹ�˾��ϵ�˼���ַ
	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2,sm1,sm2 ";
	ls_sql+=" from  jxc_fgslxr ";
	ls_sql+=" where (dwbh='"+wheredrfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dbdz=cf.fillNull(rs.getString("dz"));
		dbdwmc=cf.fillNull(rs.getString("dwmc"));
		dbfhshr=cf.fillNull(rs.getString("shr"));
		dbshrsj=cf.fillNull(rs.getString("shrsj"));
		dbdh=cf.fillNull(rs.getString("dh"));

	}
	rs.close();
	ps.close();
//	out.print(ls_sql);
	}
	else //'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{

	ls_sql="select ckph,dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,DECODE(ckdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�������') ckdzt,ddbh,dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD') cksj,jxc_ckd.bz bz,ckzje,DECODE(psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,to_char(jhshsj,'YYYY-MM-DD') jhshsj,DECODE(sfjz,'Y','<font color=blue>�Ѹ���</font>','N','<font color=red>δ����</font>') sfjz,DECODE(sfth,'Y','<font color=blue>�����</font>','N','<font color=red>δ���</font>') sfth,to_char(cksj,'YYYY') nian,to_char(cksj,'MM') yue,to_char(cksj,'DD') ri,jxc_ckd.czxh czxh,sgph,thdbh,psph ";
	ls_sql+=" from  jxc_ckd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh and jxc_ckd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and  (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		czxh=cf.fillNull(rs.getString("czxh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		thdbh=cf.fillNull(rs.getString("thdbh"));
		psph=cf.fillNull(rs.getString("psph"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));
		sfth=cf.fillNull(rs.getString("sfth"));
		sfjz=cf.fillNull(rs.getString("sfjz"));
	}
	rs.close();
	ps.close();
	}

	ls_sql="select count(*)+1 ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"'";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckzsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//��ѯ�ͻ�����
	ls_sql="select khxm,sgdmc ";
	ls_sql+=" from crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and hth='"+hth+"'";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
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
<title>���ϳ��ⵥ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
if (wherecklx.equals("J"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{
%>
<body bgcolor="#FFFFFF">
<div align="center"> �����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    �������ţ�</td>
  <td width="20%"> 
    <%=ckph%>  </td>
  <td align="right" width="10%"> 
    �������ͣ�</td>
  <td width="20%"> 
    <%=cklx%>  </td>
	<td align="right" width="10%"> 
    ����ֿ⣺</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �ͻ�������</td>
  <td width="20%"> 
    <%=khxm%> </td>
	<td align="right" width="10%"> 
    ��ͬ�ţ�</td>
  <td width="20%"> 
    <%=hth%>  </td>
  <td align="right" width="10%"> 
    ʩ���ӣ�</td>
  <td width="20%"> 
    <%=sgdmc%>  </td>
  
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �������ڣ�</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>��  </td>
  
  <td align="right" width="10%"> 
    ����ȯ���룺</td>
  <td width="20%"> 
    <%=czxh%>  </td>
	<td align="right" width="10%"> 
   &nbsp;</td>
  <td width="20%"> 
    &nbsp; </td>
</tr>

</table>
<%}
else if (wherecklx.equals("S"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{
%>
<body bgcolor="#FFFFFF">
<div align="center"> �����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    �������ţ�</td>
  <td width="20%"> 
    <%=ckph%>  </td>
  <td align="right" width="10%"> 
    �������ͣ�</td>
  <td width="20%"> 
    <%=cklx%>  </td>
	<td align="right" width="10%"> 
    ����ֿ⣺</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �������ڣ�</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>��  </td>
  <td align="right" width="10%"> 
    ���ͷ�ʽ��</td>
  <td width="20%"> 
    <%=psfs%>  </td>
  <td align="right" width="10%"> 
    �깺���ţ�</td>
  <td width="20%"> 
    <%=sgph%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �ջ���ַ��</td>
  <td colspan="5"> 
   <%=dbdz%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
	<td align="right" width="10%"> 
    ��&nbsp;��&nbsp;�ˣ�</td>
  <td width="20%"> 
    <%=dbfhshr%>��<%=dbshrsj%>��  </td>
  <td align="right" width="10%">��ϵ��ʽ��</td>
  <td width="25%"> <%=dbdh%> </td>
  <td align="right" width="10%"> 
    &nbsp;</td>
  <td width="20%"> 
   &nbsp; </td>
</tr>
</table>
<%}
  else if (wherecklx.equals("R"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{
%>
<body bgcolor="#FFFFFF">
<div align="center"> �����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    �������ţ�</td>
  <td width="20%"> 
    <%=ckph%>  </td>
  <td align="right" width="10%"> 
    �������ͣ�</td>
  <td width="20%"> 
    <%=cklx%>  </td>
	<td align="right" width="10%"> 
    ����ֿ⣺</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �������ڣ�</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>��  </td>
  <td align="right" width="10%"> 
    ���ͷ�ʽ��</td>
  <td width="20%"> 
    <%=psfs%>  </td>
  <td align="right" width="10%"> 
    ����ֹ�˾��</td>
  <td width="20%"> 
    <%=drfgs%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �ջ���ַ��</td>
  <td colspan="5"> 
   <%=dbdz%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
	<td align="right" width="10%"> 
    ��&nbsp;��&nbsp;�ˣ�</td>
  <td width="20%"> 
    <%=dbfhshr%>��<%=dbshrsj%>��  </td>
  <td align="right" width="10%">��ϵ��ʽ��</td>
  <td width="25%"> <%=dbdh%> </td>
  <td align="right" width="10%"> 
    &nbsp;</td>
  <td width="20%"> 
   &nbsp; </td>
</tr>
</table>
<%}
else //'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
	{
%>
<body bgcolor="#FFFFFF">
<div align="center"> �����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    �������ţ�</td>
  <td width="20%"> 
    <%=ckph%>  </td>
  <td align="right" width="10%"> 
    �������ͣ�</td>
  <td width="20%"> 
    <%=cklx%>  </td>
	<td align="right" width="10%"> 
    ����ֿ⣺</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �������ڣ�</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>��  </td>
  <td align="right" width="10%"> 
    ���ͷ�ʽ��</td>
  <td width="20%"> 
    <%=psfs%>  </td>
  <td align="right" width="10%"> 
  <%
	  if (wherecklx.equals("D"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
		{out.print("�������⣺");}
		else if (wherecklx.equals("B"))
		{out.print("���ϳ��⣺");}
		else if (wherecklx.equals("T"))
		{out.print("�˻����⣺");}
		else if (wherecklx.equals("R"))
		{out.print("�������⣺");}
		else if (wherecklx.equals("P"))
		{out.print("���ͳ��⣺");}
	%>
	</td>
  <td width="20%"> 
    <%
		if (wherecklx.equals("D"))//'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���'
		{out.print(ddbh);}
		else if (wherecklx.equals("B"))
		{out.print("");}
		else if (wherecklx.equals("T"))
		{out.print(thdbh);}
		else if (wherecklx.equals("R"))
		{out.print("");}
		else if (wherecklx.equals("P"))
		{out.print(psph);}
	%>  </td>
</tr>
</table>
<%}%>
<DIV>&nbsp;</DIV>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td align="center" width="5%"><b>���</b></td>
	<td align="center" width="10%"><b>�ڲ�����</b></td>
	<td align="center" width="20%"><b>��������</b></td>
	<td align="center" width="15%"><b>���Ϲ��</b></td>
	<td align="center" width="8%"><b>������λ</b></td>
	<td align="center" width="5%"><b>����</b></td>
	<td align="center" width="5%"><b>����</b></td>
	<td align="center" width="8%"><b>���</b></td>
	<td align="center" width="10%"><b>��ע</b></td>
</tr>
<%
int ckxh=0;
int i=0;
String clbm=null;
String clmc=null;
String gg=null;
String jldwmc=null;
double ckdj=0;
double cksl=0;
double ckje=0;
double sumckdj=0;
double sumcksl=0;
double sumckje=0;
try {
	conn=cf.getConnection();
	ls_sql="select ckxh,jxc_clbm.nbbm clbm,clmc,gg,jldwbm jldwmc,ckdj,cksl,ckdj*cksl ckje ";
	ls_sql+=" from jxc_ckmx,jxc_clbm ";
	ls_sql+=" where ckph='"+ckph+"' and jxc_clbm.clbm=jxc_ckmx.clbm ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		ckxh=rs.getInt("ckxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");
		sumckdj+=ckdj;
		sumcksl+=cksl;
		sumckje+=ckje;
		%>
		<tr bgcolor="#FFFFFF">
		<td align="center"><%=ckxh%></td>
		<td align="center"><%=clbm%></td>
		<td align="center"><%=clmc%></td>
		<td align="center"><%=gg%></td>
		<td align="center"><%=jldwmc%></td>
		<td align="center"><%=ckdj%></td>
		<td align="center"><%=cksl%></td>
		<td align="center"><%=ckje%></td>
		<%
			if (i==1)
		{out.print("<td  rowspan=\""+ckzsl+"\">&nbsp;</td>");}
			%>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	%>
		<tr bgcolor="#FFFFFF">
		<td align="center" colspan="5">�ϼ�</td>
		<td align="center"><%=cf.formatDouble(sumckdj) %></td>
		<td align="center"><%=cf.formatDouble(sumcksl) %></td>
		<td align="center"><%=cf.formatDouble(sumckje) %></td>
		</tr>
		
		<%
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

</table>
</body>
</html>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table width="100%" border="0">
<tr>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>����Ա��</b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>�����ˣ�</b></font></td>
	<td width="33%"><font size="-1"><b>��Ŀ����</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;��<%=yhmc%></b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>��ע��</b></font></td>
	<td colspan="2" align="right"><font size="-1"><b>��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>
</table>