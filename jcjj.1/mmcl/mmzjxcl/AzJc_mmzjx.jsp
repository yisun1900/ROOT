<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=null;
String jc_mmzjx_zjxxh=null;
String jc_mmzjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_zjxm=null;
String crm_khxx_sgd=null;
String jc_mmzjx_mmzjxyybm=null;
String jc_mmzjx_mmzjxje=null;
String jc_mmzjx_wjzjxje=null;
String jc_mmzjx_blzjxje=null;
String jc_mmzjx_zjxze=null;
String jc_mmzjx_srksj=null;
String jc_mmzjx_rkr=null;
String jc_mmzjx_rksm=null;
String jc_mmzjx_jhazsj=null;
String jc_mmzjx_azwcsj=null;
String jc_mmzjx_clzt=null;
String jc_mmzjx_lrr=null;
String jc_mmzjx_lrsj=null;
String jc_mmzjx_dwbh=null;
String jc_mmzjx_bz=null;
String zjxfssj=null;

String zjxxh=request.getParameter("zjxxh");
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_mmzjx.yddbh,jc_mmzjx.zjxxh as jc_mmzjx_zjxxh,jc_mmzjx.khbh as jc_mmzjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sgd as crm_khxx_sgd,jc_mmzjx.mmzjxyybm as jc_mmzjx_mmzjxyybm,jc_mmzjx.mmzjxje as jc_mmzjx_mmzjxje,jc_mmzjx.wjzjxje as jc_mmzjx_wjzjxje,jc_mmzjx.blzjxje as jc_mmzjx_blzjxje,jc_mmzjx.zjxze as jc_mmzjx_zjxze,jc_mmzjx.srksj as jc_mmzjx_srksj,jc_mmzjx.rkr as jc_mmzjx_rkr,jc_mmzjx.rksm as jc_mmzjx_rksm,jc_mmzjx.jhazsj as jc_mmzjx_jhazsj,jc_mmzjx.azwcsj as jc_mmzjx_azwcsj,jc_mmzjx.clzt as jc_mmzjx_clzt,jc_mmzjx.lrr as jc_mmzjx_lrr,jc_mmzjx.lrsj as jc_mmzjx_lrsj,jc_mmzjx.dwbh as jc_mmzjx_dwbh,jc_mmzjx.bz as jc_mmzjx_bz ";
	ls_sql+=" ,jc_mmzjx.zjxfssj ";
	ls_sql+=" from  crm_khxx,jc_mmzjx";
	ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and  jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		yddbh=cf.fillNull(rs.getString("yddbh"));
		jc_mmzjx_zjxxh=cf.fillNull(rs.getString("jc_mmzjx_zjxxh"));
		jc_mmzjx_khbh=cf.fillNull(rs.getString("jc_mmzjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		jc_mmzjx_mmzjxyybm=cf.fillNull(rs.getString("jc_mmzjx_mmzjxyybm"));
		jc_mmzjx_mmzjxje=cf.fillNull(rs.getString("jc_mmzjx_mmzjxje"));
		jc_mmzjx_wjzjxje=cf.fillNull(rs.getString("jc_mmzjx_wjzjxje"));
		jc_mmzjx_blzjxje=cf.fillNull(rs.getString("jc_mmzjx_blzjxje"));
		jc_mmzjx_zjxze=cf.fillNull(rs.getString("jc_mmzjx_zjxze"));
		jc_mmzjx_srksj=cf.fillNull(rs.getDate("jc_mmzjx_srksj"));
		jc_mmzjx_rkr=cf.fillNull(rs.getString("jc_mmzjx_rkr"));
		jc_mmzjx_rksm=cf.fillNull(rs.getString("jc_mmzjx_rksm"));
		jc_mmzjx_jhazsj=cf.fillNull(rs.getDate("jc_mmzjx_jhazsj"));
		jc_mmzjx_azwcsj=cf.fillNull(rs.getDate("jc_mmzjx_azwcsj"));
		jc_mmzjx_clzt=cf.fillNull(rs.getString("jc_mmzjx_clzt"));
		jc_mmzjx_lrr=cf.fillNull(rs.getString("jc_mmzjx_lrr"));
		jc_mmzjx_lrsj=cf.fillNull(rs.getDate("jc_mmzjx_lrsj"));
		jc_mmzjx_dwbh=cf.fillNull(rs.getString("jc_mmzjx_dwbh"));
		jc_mmzjx_bz=cf.fillNull(rs.getString("jc_mmzjx_bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from jc_mmzjx,sq_dwxx";
	ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>ľ���������-���װ </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" >
<div align="center">ľ���������-���װ </div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">�ƻ���װʱ��</td>
      <td width="28%"> 
        <input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jc_mmzjx_jhazsj%>" readonly>
      </td>
      <td width="23%" bgcolor="#E8E8FF" align="right">��װ���ʱ��</td>
      <td width="27%"> 
        <input type="text" name="azwcsj" size="20" maxlength="20"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" align="center"> 
	  <input type="button"  value="�� ��" onClick="f_do(selectform)" >
      <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >      </td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      Ԥ�������    </td>
    <td width="32%"> <%=yddbh%> </td>
    <td width="18%" align="right"> 
      ���������    </td>
    <td width="32%"> <%=jc_mmzjx_zjxxh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ͻ����    </td>
    <td width="32%"> <%=jc_mmzjx_khbh%> </td>
    <td width="18%" align="right"> 
      ��ͬ��    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ͻ�����    </td>
    <td width="32%"><%=crm_khxx_khxm%> </td>
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"><%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%> </td>
    <td width="18%" align="right"> 
      ���ʦ    </td>
    <td width="32%"><%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ʩ����    </td>
    <td width="32%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
    <td width="18%" align="right"> 
      �ʼ�    </td>
    <td width="32%"> <%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������ԭ�� </td>
    <td><%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm where mmzjxyybm='"+jc_mmzjx_mmzjxyybm+"'",jc_mmzjx_mmzjxyybm,true);
%></td>
    <td align="right">�������ʱ��</td>
    <td><%=zjxfssj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" height="19" align="right"> 
      ľ����������    </td>
    <td width="32%" height="19"><%=jc_mmzjx_mmzjxje%> </td>
    <td width="18%" height="19" align="right"> 
      �����������    </td>
    <td width="32%" height="19"><%=jc_mmzjx_wjzjxje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ������������    </td>
    <td width="32%"><%=jc_mmzjx_blzjxje%> </td>
    <td width="18%" align="right"> 
      �������ܶ�    </td>
    <td width="32%"><%=jc_mmzjx_zjxze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ʵ���ʱ��    </td>
    <td width="32%"><%=jc_mmzjx_srksj%> </td>
    <td width="18%" align="right"> 
      �����    </td>
    <td width="32%"><%=jc_mmzjx_rkr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">���˵��</td>
    <td colspan="3"><%=jc_mmzjx_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ƻ���װʱ��    </td>
    <td width="32%"> <%=jc_mmzjx_jhazsj%> </td>
    <td width="18%" align="right"> 
      ��װ���ʱ��    </td>
    <td width="32%"> <%=jc_mmzjx_azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ����״̬    </td>
    <td width="32%"> <%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+�����ѽ���&03+�����&04+��װ���",jc_mmzjx_clzt,true);
%> </td>
    <td width="18%" align="right"> 
      ¼����    </td>
    <td width="32%"> <%=jc_mmzjx_lrr%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��ע</td>
    <td colspan="3"><%=jc_mmzjx_bz%></td>
  </tr>
</table>
<CENTER >
  <font size="2">ľ����������ϸ</font>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����</td>
	<td  width="4%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">ľ���ͺ�</td>
	<td  width="9%">����</td>
	<td  width="5%">��ɫ</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">��о��</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�ذ��</td>
	<td  width="6%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="4%">�߽���</td>
	<td  width="5%">�����ͺ�</td>
	<td  width="4%">���ױ���</td>
	<td  width="5%">����/�ƿڲ���</td>
	<td  width="4%">�Ƿ��ж���</td>
	<td  width="3%">����</td>
	<td  width="3%" bgcolor="#99CCFF">ԭ����</td>
	<td  width="3%" bgcolor="#99CCFF">������</td>
	<td  width="5%">��Ƭ</td>
	<td  width="6%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT DECODE(jc_mmdgdmx.lx,'1','��ͬ','2','����') lx,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh, jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg||'��'||jc_mmdgdmx.qh md,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','����','4','�ı�') ctbs,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,TO_CHAR(jc_mmdgdmx.dj) dj,jc_mmzjxmx.ysl,jc_mmzjxmx.xsl,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\">','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jc_mmzjxmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm   ";
	ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
	ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm";
	ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
	ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.xh=jc_mmzjxmx.xh and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
	ls_sql+=" and jc_mmzjxmx.zjxxh="+zjxxh;
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
	ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
	pageObj.sql=ls_sql;
	//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	//������ʾ��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
<CENTER >
  <font size="2">��������ϸ</font>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="5%">����</td>
	<td  width="18%">�������</td>
	<td  width="8%">������</td>
	<td  width="10%">�ͺ�</td>
	<td  width="10%">������</td>
	<td  width="7%">����</td>
	<td  width="7%" bgcolor="#99CCFF">ԭ����</td>
	<td  width="7%" bgcolor="#99CCFF">������</td>
	<td  width="27%">��ע</td>
</tr>
<%
	ls_sql="SELECT TO_CHAR(jc_wjjddmx.lrxh) lrxh,DECODE(jc_wjjddmx.lx,'1','��ͬ��','2','����') lx,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjddmx.xinghao as jc_wjjbj_xinghao,mmsbsmc,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjzjxmx.ysl,jc_wjzjxmx.xsl,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jc_wjzjxmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+) and jc_wjjddmx.lrxh=jc_wjzjxmx.lrxh";
	ls_sql+=" and jc_wjzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
<CENTER >
  <font size="2">����������ϸ</font>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="6%">����</td>
	<td  width="30%">�����ͺ�</td>
	<td  width="10%">����</td>
	<td  width="10%" bgcolor="#99CCFF">ԭ����</td>
	<td  width="10%" bgcolor="#99CCFF">������</td>
	<td  width="37%">��ע</td>
</tr>
<%
	ls_sql="SELECT TO_CHAR(jc_blddmx.lrxh) lrxh,DECODE(jc_blddmx.lx,'1','��ͬ��','2','����') lx,blxh,TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blzjxmx.ysl,jc_blzjxmx.xsl,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jc_blzjxmx  ";
    ls_sql+=" where jc_blddmx.lrxh=jc_blzjxmx.lrxh";
	ls_sql+=" and jc_blzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.azwcsj)=="") {
		alert("������[��װ���ʱ��]��");
		FormName.azwcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.azwcsj, "��װ���ʱ��"))) {
		return false;
	}


	FormName.action="SaveAzJc_mmzjx.jsp";
	FormName.submit();
	return true;

}



//-->
</SCRIPT>
