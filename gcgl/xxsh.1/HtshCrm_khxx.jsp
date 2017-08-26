<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
double qye=0;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;
String htshbz=null;
String zjxm =null;
String qyrq =null;
String jyjdrq =null;
double wdzgce =0;
double zkl=0;
String sfyyh=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String yhyy=null;
double suijin=0;
double suijinbfb=0;
double zjxje=0;
double glftd=0;


String xxshr=null;
String xxshsj=null;
String htshdf=null;
String xxshyj=null;
String sfyrz=null;
String rzsc=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select cxhdbmzh,cxhdbmxq,rzsc,sfyrz,glftd,suijin,suijinbfb,zjxje,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,xxshr,xxshsj,xxshyj,htshbz,zjxm,qyrq,jyjdrq,wdzgce,zkl,sfyyh,cxhdbm,yhyy";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		glftd=rs.getDouble("glftd");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxje=rs.getDouble("zjxje");
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xxshr=cf.fillNull(rs.getString("xxshr"));
		xxshsj=cf.fillNull(rs.getDate("xxshsj"));
		xxshyj=cf.fillNull(rs.getString("xxshyj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

	}
	rs.close();

	if (xxshr.equals(""))
	{
		xxshr=yhmc;
	}
	if (xxshsj.equals(""))
	{
		xxshsj=cf.today();
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>��Ϣ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ϣ��� </div>
  
<form method="post" action="" name="selectform" target='_blank'>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="30%"><%=khbh%> </td>
      <td width="18%"> 
        <div align="right">��ͬ��</div>
      </td>
      <td width="33%"><%=hth%> </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">�ͻ�����</td>
      <td width="30%" bgcolor="#CCCCFF"> 
        <input type="text" name="khxm" size="20" maxlength="50" value="<%=khxm%>">
      </td>
      <td width="18%" bgcolor="#CCCCFF" align="right">��ϵ��ʽ</td>
      <td width="33%" bgcolor="#CCCCFF"> 
        <input type="text" name="lxfs" size="20" maxlength="50" value="<%=lxfs%>">
      </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
      <td colspan="3" bgcolor="#CCCCFF"> 
        <input type="text" name="fwdz" size="71" maxlength="50" value="<%=fwdz%>">
      </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
      <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">װ�����ʦ</td>
      <td width="33%" bgcolor="#CCCCFF"><%=sjs%></td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF"> 
        <div align="right">���̵���</div>
      </td>
      <td width="30%" bgcolor="#CCCCFF"><%=zjxm%> </td>
      <td width="18%" bgcolor="#CCCCFF"> 
        <div align="right">ʩ����</div>
      </td>
      <td width="33%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
      <td width="30%" bgcolor="#CCCCFF"><%=qyrq%></td>
      <td width="18%" align="right" bgcolor="#CCCCFF">���齻������</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jyjdrq%></td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">��ͬ��������</td>
      <td width="30%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="18%" align="right" bgcolor="#CCCCFF">��ͬ��������</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">����ԭ����</td>
      <td width="30%"><%=wdzgce%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right">ʵ���ۿ���</td>
      <td width="33%"><%=zkl%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">����ǩԼ��</td>
      <td width="30%"><%=qye%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right"></td>
      <td width="33%"></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�Ƿ����Ż�</td>
      <td width="30%"><%
	cf.radioToken(out, "Y+��&N+��",sfyyh,true);
%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�Ż�����</td>
      <td colspan="3"><%=yhyy%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�μӹ�˾�����</td>
      <td colspan="3"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" width="19%">�μ�С�������</td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�μ�չ������</td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�Ƿ�����֤</td>
      <td width="30%"><%
	cf.radioToken(out, "Y+��&N+��",sfyrz,true);
%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right">��֤�г�</td>
      <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><b>˰��</b></td>
      <td width="30%"><%=cf.formatDouble(suijin)%>��<%=suijinbfb%>����</td>
      <td width="18%" bgcolor="#E8E8FF" align="right">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">���ʱ��</td>
      <td width="30%"> 
        <input type="text" name="xxshsj" size="20" maxlength="10" value="<%=xxshsj%>" readonly>
      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">�����</td>
      <td width="33%"> 
        <input type="text" name="xxshr" size="20" maxlength="20" value="<%=xxshr%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">��Ϣ������</td>
      <td colspan="3"> 
        <textarea name="xxshyj" rows="3" cols="71"><%=xxshyj%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button" value="¼�벻�ϸ���Ŀ" onClick="f_lr(selectform)" name="lr" >
          <input type="button"  value="������" onClick="f_do(selectform)" name="wc" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
        </div>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxshsj)=="") {
		alert("������[��ͬ���ʱ��]��");
		FormName.xxshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xxshsj, "��ͬ���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xxshr)=="") {
		alert("������[��ͬ�����]��");
		FormName.xxshr.focus();
		return false;
	}

	FormName.action="SaveKpdCrm_khxx.jsp";
	FormName.submit();
	return true;
}


function f_lr(FormName)//����FormName:Form������
{

	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
