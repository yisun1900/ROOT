<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String clzt=null;
String sfycp=null;
String jdqrjg=null;
String tpsftg=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select crm_xcjdjl.clzt,crm_xcjdjl.sfycp,crm_xcjdjl.jdqrjg,crm_xcjdjl.tpsftg,khbh,sqrq,sqr,sqrlxdh,sfxtp,jhjdrq,jhjdsj,sqsm,zcwcsj,lrr,lrsj,dwmc ";
	ls_sql+=" from  crm_xcjdjl,sq_dwxx";
	ls_sql+=" where crm_xcjdjl.jdjlh='"+jdjlh+"' and crm_xcjdjl.lrbm=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sfycp=cf.fillNull(rs.getString("sfycp"));
		jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
		tpsftg=cf.fillNull(rs.getString("tpsftg"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		zcwcsj=cf.fillNull(rs.getDate("zcwcsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ��ף�
	{
		if (!sfycp.equals("2") || !sfxtp.equals("N"))//1���в�Ʒ��2���޲�Ʒ
		{
			out.println("����δȷ��");
			return;
		}
	}
	else if (clzt.equals("2"))
	{
		if (!sfycp.equals("1") || !jdqrjg.equals("Y"))//1���в�Ʒ��2���޲�Ʒ
		{
			out.println("����ȷ��δͨ��");
			return;
		}
	}
	else if (clzt.equals("4"))
	{
		if (!sfycp.equals("2") || !sfxtp.equals("Y") || !tpsftg.equals("Y"))//1���в�Ʒ��2���޲�Ʒ
		{
			out.println("����������δȷ�ϻ�����δͨ��");
			return;
		}
	}
	else{
		out.println("�����ѷ�����δȷ�����");
		return;
	}



	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
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
<title>��������ʱ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #0000FF}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform"  >
<div align="center">��������ʱ�䣨���׼�¼�ţ�<%=jdjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���̵���</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><%=sqrq%></td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><%=sqr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ϵ�绰</td> 
  <td colspan="3"><%=sqrlxdh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ���������</td> 
  <td width="32%"><%=jhjdrq%></td>
  <td align="right" width="18%">�ƻ�����ʱ��</td> 
  <td width="32%"><%=jhjdsj%> 
    ʱ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������</td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",sfxtp,true);
%></td>
  <td align="right">������ʱ��</td>
  <td><%=zcwcsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"><%=sqsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2"><strong>¼��ʱ��</strong></span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">¼�벿��</td>
  <td>
    <%=dwmc%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span>����ȷ�Ͻ�������</td>
  <td><input type="text" name="zzqrjdrq" size="20" maxlength="10"  value="<%=jhjdrq%>" onDblClick="JSCalendar(this)">
  </td>
  <td align="right"><span class=" STYLE4">*</span>����ȷ�Ͻ���ʱ��</td>
  <td><input type="text" name="zzqrjdsj" size="6" maxlength="8"  value="<%=jhjdsj%>" >
    ʱ
    ��<strong>¼��Сʱ</strong>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">���׷�����</span></td>
  <td><input type="text" name="fbr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">���׷���ʱ��</span></td>
  <td><input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="button" type="button" onClick="window.open('/pdgl/psgd/EditCrm_khxxMain.jsp?khbh=<%=khbh%>')"  value="�ɹ���">
	  <input type="button" onClick="window.open('/pdgl/pgj/EditCrm_khxx.jsp?khbh=<%=khbh%>')"  value="�ɹܼ�">
	  <input type="button" onClick="window.open('/pdgl/pdd/EditCrm_khxx.jsp?khbh=<%=khbh%>')"  value="��רԱ">
	</div>      </td>
    </tr>
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
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
 
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


</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.zzqrjdrq)=="") {
		alert("������[����ȷ�Ͻ�������]��");
		FormName.zzqrjdrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zzqrjdrq, "����ȷ�Ͻ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zzqrjdsj)=="") {
		alert("������[����ȷ�Ͻ���ʱ��]��");
		FormName.zzqrjdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.zzqrjdsj, "����ȷ�Ͻ���ʱ��"))) {
		return false;
	}
	if (FormName.zzqrjdsj.value<0 || FormName.zzqrjdsj.value>24)
	{
		alert("[����ȷ�Ͻ���ʱ��]ֻ����0��24Сʱ֮�䣡");
		FormName.zzqrjdsj.select();
		return false;
	}

	if(	javaTrim(FormName.fbr)=="") {
		alert("������[���׷�����]��");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("������[���׷���ʱ��]��");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "���׷���ʱ��"))) {
		return false;
	}
	FormName.action="SaveFbCrm_xcjdjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
