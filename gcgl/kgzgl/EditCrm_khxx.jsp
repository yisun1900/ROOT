<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hth=null;
String sjs=null;
double qye=0;
double wdzgce=0;
double zjxje=0;
String kgrq=null;
String dwbh=null;
String qyrq=null;
String sjkgrq=null;
String sybgcrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String bz=null;

String hdbz=null;
String khlxbm=null;
String cgdz=null;

String jyjdrq=null;
String jhzqsj=null;
String szqsj=null;
String jgrq=null;

String kgzbz=null;

double gdkk=0;
String gdkkstr=null;
double sgebfb=0;
String sgebfbstr=null;
double sge=0;
String sgestr=null;
double clf=0;
String clfstr=null;

String kgzsj=null;
String kgzr=null;
String kgzsm=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select zjxje,gdkk,wdzgce,kgzsm,kgzbz,clf,sge,sgebfb,kgzsj,kgzr,jyjdrq,szqsj,jgrq,khbh,khxm,xb,fwdz,cqbm,lxfs,hth,sjs,qye,qyrq,sjkgrq,sybgcrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm,khlxbm,bz,dwbh,kgrq,cgdz,hdbz,khlxbm ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxje=rs.getDouble("zjxje");
		gdkk=rs.getDouble("gdkk");
		wdzgce=rs.getDouble("wdzgce");
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		clf=rs.getDouble("clf");
		sge=rs.getDouble("sge");
		sgebfb=rs.getDouble("sgebfb");
		kgzsj=cf.fillNull(rs.getDate("kgzsj"));
		kgzr=cf.fillNull(rs.getString("kgzr"));

		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillNull(rs.getString("bz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
	}

	if (gdkk==0)
	{
		gdkkstr="";
	}
	else{
		gdkkstr=""+gdkk;
	}
	if (sgebfb==0)
	{
		sgebfbstr="";
	}
	else{
		sgebfbstr=""+sgebfb;
	}
	if (sge==0)
	{
		sgestr="";
	}
	else{
		sgestr=""+sge;
	}
	if (clf==0)
	{
		clfstr="";
	}
	else{
		clfstr=""+clf;
	}

	if (kgzbz.equals("Y"))
	{
	}
	else{
		clf=0;
		sge=0;
		kgzsj=cf.today();
		kgzr=yhmc;
		kgzbz="N";
	}
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<title>������֤</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> ������֤</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">�ͻ����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <%=khbh%> </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">��ϵ��ʽ</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <%=lxfs%> </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">�ͻ�����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <%=khxm%> </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font></td>
              <td bgcolor="#FFFFFF"> <%=fwdz%> </td>
              <td bgcolor="#FFFFFF"> 
                <div align="right"></div>
              </td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">���ʦ</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <%=sjs%> </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">���̵���</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <%=zjxm%> </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">ʩ����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,false);
%> </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000FF">ʩ������</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">��ͬ��������</font></td>
              <td width="31%"> <%=kgrq%> </td>
              <td width="18%" align="right"><font color="#0000FF">��ͬ��������</font></td>
              <td width="33%"><%=jgrq%> </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"> <%=bz%> </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000FF">����ԭ����</font></td>
              <td width="31%" bgcolor="#CCFFCC"><%=wdzgce%></td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000FF">����ǩԼ��</font></td>
              <td width="33%" bgcolor="#CCFFCC"><%=qye%></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000FF">�ۼƹ����������ܶ�</font></td>
              <td width="31%" bgcolor="#CCFFCC"><%=zjxje%></td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000FF">����ʵ�ʷ�����</font></td>
              <td width="33%" bgcolor="#CCFFCC"><%=cf.formatDouble(qye+zjxje)%>������ԭ���ۣ��ۼƹ����������ܶ</td>
            </tr>
<%
	if (zjxje!=0)
	{
		%>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">ѡ�񿪹�֤����</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="radio" name="kgzjs" value="1" checked onclick="calValue(editform)">
                ����ԭ���� 
                <input type="radio" name="kgzjs" value="2" onclick="calValue(editform)">
                ����ʵ�ʷ����� </td>
              <td colspan="2" bgcolor="#CCFFCC"><b><font color="#CC0000">ע�⣺�ѷ����������������</font></b></td>
            </tr>
		<%
	}
%>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">������֤��־</td>
              <td width="31%" bgcolor="#CCFFCC"><%
	cf.radioToken(out,"kgzbz","Y+�ѳ�����֤&N+δ������֤",kgzbz,true);
%> </td>
              <td width="18%" align="right" bgcolor="#CCFFCC">�̶��ۿ�</td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="gdkk" size="20" maxlength="10"  value="<%=gdkkstr%>" >
              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">ʩ����ٷֱ�</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="text" name="sgebfb" size="8" maxlength="10"  value="<%=sgebfbstr%>" onchange="calValue(editform)">
                % </td>
              <td width="18%" align="right" bgcolor="#CCFFCC">ʩ����</td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="sge" size="20" maxlength="10"  value="<%=sgestr%>" onchange="calValue(editform)">
              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">���ϷѰٷֱ�</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="text" name="clfbfb" size="8" maxlength="10"  value="40" onchange="calValue(editform)">
                % </td>
              <td width="18%" align="right" bgcolor="#CCFFCC">���Ϸ�</td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="clf" size="20" maxlength="10"  value="<%=clfstr%>" >
              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">������֤ʱ��</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
              <td width="18%" align="right" bgcolor="#CCFFCC">������֤��</td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzr" size="20" maxlength="10"  value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">����֤��ע</td>
              <td colspan="3" bgcolor="#CCFFCC"> 
                <textarea name="kgzsm" cols="71"  rows="3"><%=kgzsm%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button"  value="��ӡ����֤" onClick="window.open('DyKgzCrm_khxx1.jsp?khbh=<%=wherekhbh%>')" name="dy" <%if (!kgzbz.equals("Y")) out.println("disabled");%>>
                  <input type="button"  value="��ӡ�¿���֤" onClick="window.open('DyKgzCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="dynew" <%if (!kgzbz.equals("Y")) out.println("disabled");%>>
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	if (<%=zjxje%>!=0 && FormName.kgzjs[1].checked)
	{
		var qye=<%=(wdzgce+zjxje)%>;
		var sge=qye*FormName.sgebfb.value/100.0;
		FormName.sge.value=round(sge,2);

		var clf=FormName.sge.value*FormName.clfbfb.value/100.0;
		FormName.clf.value=round(clf,2);
	}
	else{
		var qye=<%=wdzgce%>;
		var sge=qye*FormName.sgebfb.value/100.0;
		FormName.sge.value=round(sge,2);

		var clf=FormName.sge.value*FormName.clfbfb.value/100.0;
		FormName.clf.value=round(clf,2);
	}
}    

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.gdkk)=="") {
		alert("������[�̶��ۿ�]��");
		FormName.gdkk.focus();
		return false;
	}
	if(!(isFloat(FormName.gdkk, "�̶��ۿ�"))) {
		return false;
	}

	if(	javaTrim(FormName.sgebfb)=="") {
		alert("������[ʩ����ٷֱ�]��");
		FormName.sgebfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgebfb, "ʩ����ٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.sgebfb.value)==0)
	{
		alert("[ʩ����ٷֱ�]����Ϊ0��");
		FormName.sgebfb.select();
		return false;
	}
	if(	javaTrim(FormName.sge)=="") {
		alert("������[ʩ����]��");
		FormName.sge.focus();
		return false;
	}
	if(!(isFloat(FormName.sge, "ʩ����"))) {
		return false;
	}
	if (parseFloat(FormName.sge.value)==0)
	{
		alert("[ʩ����]����Ϊ0��");
		FormName.sge.select();
		return false;
	}

	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if (parseFloat(FormName.clf.value)==0)
	{
		alert("[���Ϸ�]����Ϊ0��");
		FormName.clf.select();
		return false;
	}
	if(	javaTrim(FormName.kgzr)=="") {
		alert("������[������֤��]��");
		FormName.kgzr.focus();
		return false;
	}
	if(	javaTrim(FormName.kgzsj)=="") {
		alert("������[������֤ʱ��]��");
		FormName.kgzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kgzsj, "������֤ʱ��"))) {
		return false;
	}

	
	FormName.submit();
	FormName.dy.disabled=false;
	FormName.dynew.disabled=false;
	return true;
}
//-->
</SCRIPT>

