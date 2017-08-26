<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;
double hkze=0;
double zjhze=0;
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String tzshr=null;
String tzshsj=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;
String kclf=null;
String jctdyybm=null;
String tdsm=null;
String tdblr=null;
String tdsj=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select jctdyybm,tdsm,kclf,tdblr,tdsj,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj,tzshr,tzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));
		tdsm=cf.fillNull(rs.getString("tdsm"));
		kclf=cf.fillNull(rs.getString("kclf"));
		tdblr=cf.fillNull(rs.getString("tdblr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
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
<title>�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�޸�ȡ��Ԥ������������ţ�<%=ddbh%>��</div> 

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>�۲�����</td>
      <td width="35%"> 
        <input type="text" name="kclf" value="<%=kclf%>" size="20" maxlength="16" >
      </td>
      <td width="15%" align="right"><font color="#FF0000">*</font>�˵�ԭ��</td>
      <td width="35%"> 
        <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm",jctdyybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"> 
        <font color="#FF0000">*</font><font color="#0000CC">�˵�������</font> </td>
      <td width="35%"> 
        <input type="text" name="tdblr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="15%" align="right"> 
        <font color="#FF0000">*</font><font color="#0000CC">�˵�ʱ��      </font></td>
      <td width="35%"> 
        <input type="text" name="tdsj" value="<%=tdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>�˵�˵��</td>
      <td colspan="3"> 
        <textarea name="tdsm" rows="4" cols="72"><%=tdsm%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4">
          <div align="center">
            <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
            <input type="button"  value="����" onClick="f_do(editform)">
            <input type="reset"  value="����" name="reset">
            
          </div></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right" bgcolor="#CCCCFF"> 
      �ͻ����    </td>
    <td width="35%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="16%" align="right" bgcolor="#CCCCFF"> 
      ��ͬ��    </td>
    <td width="34%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">�ͻ�����</td>
    <td width="35%"><%=khxm%></td>
    <td width="16%" align="right">�ʼ�</td>
    <td width="34%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="15%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td width="35%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="16%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td width="34%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right"> 
      ʩ����    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="16%" align="right"> 
      �೤    </td>
    <td width="34%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right"> 
      ��װǩԼ����    </td>
    <td width="35%"> <%=qyrq%> </td>
    <td width="16%" align="right"> 
      ��װǩԼ��    </td>
    <td width="34%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">��ͬ��������</td>
    <td width="35%"><%=kgrq%></td>
    <td width="16%" align="right">��ͬ��������</td>
    <td width="34%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">�μӴ����</td>
    <td width="35%"> <%=cxhdbm%> </td>
    <td width="16%" align="right">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" bgcolor="#FFFFFF" align="right">���Ĵ���</td>
    <td width="35%"> <%=zcdlbm%> </td>
    <td width="16%" align="right">Ʒ��</td>
    <td width="34%"> <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">�ͻ���������</td>
    <td width="35%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%></td>
    <td width="16%" align="right">����ص�</td>
    <td width="34%"><%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      פ��Ҿӹ���    </td>
    <td width="35%"> <%=clgw%> </td>
    <td width="16%" align="right"> 
      չ���Ҿӹ���    </td>
    <td width="34%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="15%" align="right">��ĿרԱ</td>
    <td width="35%"><%=xmzy%></td>
    <td width="16%" align="right">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">�������־</td>
    <td width="35%"><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
    <td width="16%" align="right">�ƻ�����ʱ��</td>
    <td width="34%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      �ȴ��ͻ�֪ͨ    </td>
    <td width="35%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
    <td width="16%" align="right"> 
      ��ͬ�ͻ�ʱ��    </td>
    <td width="34%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      ǩ��ͬʱ��    </td>
    <td width="35%"><%=qhtsj%> </td>
    <td width="16%" align="right"> 
      �ɼ����ֹʱ��    </td>
    <td width="34%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      ��ͬ�ܶ�    </td>
    <td width="35%"> <%=hkze%> </td>
    <td width="16%" align="right"> 
      ����������    </td>
    <td width="34%"> <%=zjhze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      �������ܶ�    </td>
    <td width="35%"><%=hkze+zjhze%> </td>
    <td width="16%" align="right"> 
      �����������    </td>
    <td width="34%"><%=htcxhdje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">����ȷ����</td>
    <td width="35%"><%=ddqrr%></td>
    <td width="16%" align="right">����ȷ��ʱ��</td>
    <td width="34%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right" bgcolor="#CCFFCC"> 
      ����֪ͨ¼����    </td>
    <td width="35%"> <%=cltzr%></td>
    <td width="16%" align="right"> 
      ������֪ͨʱ��    </td>
    <td width="34%"><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right"> 
      ʵ������    </td>
    <td width="35%"> <%=sclr%></td>
    <td width="16%" align="right"> 
      ʵ����ʱ��    </td>
    <td width="34%"><%=sclsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right"> 
      ���ͻ�֪ͨ��    </td>
    <td width="35%"><%=tzshr%> </td>
    <td width="16%" align="right"> 
      ���ͻ�֪ͨʱ��    </td>
    <td width="34%"><%=tzshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.kclf)=="") {
		alert("��ѡ��[�۲�����]��");
		FormName.kclf.focus();
		return false;
	}
	if(!(isFloat(FormName.kclf, "�۲�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jctdyybm)=="") {
		alert("��ѡ��[�˵�ԭ��]��");
		FormName.jctdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdblr)=="") {
		alert("��ѡ��[�˵�������]��");
		FormName.tdblr.focus();
		return false;
	}
	if(	javaTrim(FormName.tdsj)=="") {
		alert("��ѡ��[�˵�ʱ��]��");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdsm)=="") {
		alert("��ѡ��[�˵�˵��]��");
		FormName.tdsm.focus();
		return false;
	}

	FormName.action="SaveXgQxYdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
