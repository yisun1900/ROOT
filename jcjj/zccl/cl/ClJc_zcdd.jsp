<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
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
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
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

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String cltzsm=null;

try {
	conn=cf.getConnection();

	ls_sql="select cltzsm,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cltzsm=cf.fillNull(rs.getString("cltzsm"));
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
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">������������ţ�<%=ddbh%>�� 

</div>
<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right">����֪ͨ˵��</td>
      <td colspan="3"><%=cltzsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        ������֪ͨʱ��      </td>
      <td width="31%"> <%=tzclsj%> </td>
      <td width="19%" align="right"> 
        �ƻ�����ʱ��      </td>
      <td width="31%"><%=jhclsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        ʵ������      </td>
      <td width="31%"> 
        <input type="text" name="sclr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td width="19%" align="right"> 
        ʵ����ʱ��      </td>
      <td width="31%"> 
        <input type="text" name="sclsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center"> &nbsp; 
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)" name="button">
          <input type="reset"  value="����" name="reset">
      <input type="button"  value="��ӡ�ͻ���Ϣ" onClick="window.open('/khxx/dyKhJbxx.jsp?khbh=<%=khbh%>')" name="button2" >      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      �ͻ����    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      ��ͬ��    </td>
    <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">�ͻ�����</td>
    <td width="31%"><%=khxm%></td>
    <td width="19%" align="right">�ʼ�</td>
    <td width="31%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="19%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      ʩ����    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%" align="right"> 
      �೤    </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      ��װǩԼ����    </td>
    <td width="31%"> <%=qyrq%> </td>
    <td width="19%" align="right"> 
      ��װǩԼ��    </td>
    <td width="31%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">��ͬ��������</td>
    <td width="31%"><%=kgrq%></td>
    <td width="19%" align="right">��ͬ��������</td>
    <td width="31%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">�μӴ����</td>
    <td width="31%"> <%=cxhdbm%> </td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" bgcolor="#FFFFFF" align="right">���Ĵ���</td>
    <td width="31%"> <%=zcdlbm%> </td>
    <td width="19%" align="right">Ʒ��</td>
    <td width="31%"> <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">�ͻ���������</td>
    <td width="31%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%></td>
    <td width="19%" align="right">����ص�</td>
    <td width="31%"><%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      פ��Ҿӹ���    </td>
    <td width="31%"> <%=clgw%> </td>
    <td width="19%" align="right"> 
      չ���Ҿӹ���    </td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="19%" align="right">��ĿרԱ</td>
    <td width="31%"><%=xmzy%></td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">��Ʒ����</td>
    <td width="31%"><%
	cf.selectToken(out,"1+�Ƕ���ʽ��Ʒ&2+����ʽ��Ʒ",xclbz,true);
%></td>
    <td width="19%" align="right">�ƻ�����ʱ��</td>
    <td width="31%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      �ȴ��ͻ�֪ͨ    </td>
    <td width="31%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
    <td width="19%" align="right"> 
      ��ͬ�ͻ�ʱ��    </td>
    <td width="31%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      ǩ��ͬʱ��    </td>
    <td width="31%"><%=qhtsj%> </td>
    <td width="19%" align="right"> 
      �ɼ����ֹʱ��    </td>
    <td width="31%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      ��ͬ�ܶ�    </td>
    <td width="31%"> <%=hkze%> </td>
    <td width="19%" align="right"> 
      ��������    </td>
    <td width="31%"><%=zjhze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      �������ܶ�    </td>
    <td width="31%"> <%=hkze+zjhze%></td>
    <td width="19%" align="right"> 
      �����������    </td>
    <td width="31%"><%=htcxhdje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">����ȷ����</td>
    <td width="31%"><%=ddqrr%></td>
    <td width="19%" align="right">����ȷ��ʱ��</td>
    <td width="31%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="19%" align="right" bgcolor="#CCFFCC"> 
      ����֪ͨ¼����    </td>
    <td width="31%"> <%=cltzr%></td>
    <td width="19%" align="right"> 
      ������֪ͨʱ��    </td>
    <td width="31%"><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">��ע</td>
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

	if(	javaTrim(FormName.sclr)=="") {
		alert("��ѡ��[ʵ������]��");
		FormName.sclr.focus();
		return false;
	}
	if(	javaTrim(FormName.sclsj)=="") {
		alert("��ѡ��[ʵ����ʱ��]��");
		FormName.sclsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sclsj, "ʵ����ʱ��"))) {
		return false;
	}

	FormName.action="SaveClJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
