<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String rzsj=null;
String dwbh=null;
String ssfgs=null;
String bianma=null;
String yldhtbh=null;
String ldhtlx=null;
String ldhtqx=null;
String htksrq=null;
String htdqrq=null;

String getshbxh=null;
String getsbblsj=null;
String getylbx=null;
String getjylbx=null;
String getsybx=null;
String getgsby=null;
String getsyx=null;
String getjbxdd=null;
double getsbzrjs=0;
double getyjsxe=0;
double getgsjbfe=0;
double getgrjbfe=0;
String getsfjgjj=null;
double getgsjgjj=0;
double getgrjgjj=0;
double getjndbtc=0;

String ysbbljlh=null;
String sbbljlh=null;

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yhmc,bianhao,sfzh,xzzwbm,rzsj,dwbh,ssfgs,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yldhtbh=cf.fillNull(rs.getString("ldhtbh"));
		ldhtlx=cf.fillNull(rs.getString("ldhtlx"));
		ldhtqx=cf.fillNull(rs.getString("ldhtqx"));
		htksrq=cf.fillNull(rs.getDate("htksrq"));
		htdqrq=cf.fillNull(rs.getDate("htdqrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select sbbljlh,shbxh,sbblsj,ylbx,jylbx,sybx,gsby,syx,jbxdd,sbzrjs,yjsxe,gsjbfe,grjbfe,jndbtc,sfjgjj";
	ls_sql+=" from  rs_ygsbxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysbbljlh=cf.fillNull(rs.getString("sbbljlh"));

		getshbxh=cf.fillNull(rs.getString("shbxh"));
		getsbblsj=cf.fillNull(rs.getDate("sbblsj"));
		getylbx=cf.fillNull(rs.getString("ylbx"));
		getjylbx=cf.fillNull(rs.getString("jylbx"));
		getsybx=cf.fillNull(rs.getString("sybx"));
		getgsby=cf.fillNull(rs.getString("gsby"));
		getsyx=cf.fillNull(rs.getString("syx"));
		getjbxdd=cf.fillNull(rs.getString("jbxdd"));
		getsbzrjs=rs.getDouble("sbzrjs");
		getyjsxe=rs.getDouble("yjsxe");
		getgsjbfe=rs.getDouble("gsjbfe");
		getgrjbfe=rs.getDouble("grjbfe");
		getjndbtc=rs.getDouble("jndbtc");
		getsfjgjj=cf.fillNull(rs.getString("sfjgjj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(sbbljlh,6,5)),0)";
	ls_sql+=" from  rs_sbbljl";
	ls_sql+=" where lrbm='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sbbljlh=lrbm+cf.addZero(count+1,5);

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


<form method="post" action="SaveInsertBgRs_sbbljl.jsp" name="insertform" target="_blank">
  <div align="center"> �籣��� </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099">�����ֹ�˾</font></td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%> </td>
      <td align="right" width="19%"><font color="#000099"></font><font color="#000099">��������</font></td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099"></font><font color="#000099">Ա�����</font></td>
      <td width="31%"><%=ygbh%> </td>
      <td align="right" width="19%"><font color="#000099">����</font></td>
      <td width="31%"><%=bianhao%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099"></font><font color="#000099">Ա������</font></td>
      <td width="31%"><%=yhmc%> </td>
      <td align="right" width="19%"><font color="#000099">���֤��</font></td>
      <td width="31%"><%=sfzh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099">��ְ����</font></td>
      <td width="31%"><%=rzsj%> </td>
      <td align="right" width="19%"><font color="#000099">����ְ��</font></td>
      <td width="31%"><%=xzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�籣�����¼��</td>
      <td width="31%"> 
        <input type="text" name="sbbljlh" value="<%=sbbljlh%>" size="20" maxlength="10" readonly>      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�������</td>
      <td width="31%"><%
	cf.radioToken(out, "lx","2+���&3+ͣ��&4+ת��","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>��ᱣ�պ�</td>
      <td width="31%"> 
        <input type="text" name="shbxh" value="<%=getshbxh%>" size="20" maxlength="20" >      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�籣����ʱ��</td>
      <td width="31%"> 
        <input type="text" name="sbblsj" value="<%=getsbblsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ����ҽ�Ʊ���</td>
      <td width="31%"><%
	cf.radioToken(out, "ylbx","Y+��&N+��",getylbx);
%></td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ�������ϱ���</td>
      <td width="31%"><%
	cf.radioToken(out, "jylbx","Y+��&N+��",getjylbx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ����ʧҵ����</td>
      <td width="31%"><%
	cf.radioToken(out, "sybx","Y+��&N+��",getsybx);
%></td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ���ɹ��˱���</td>
      <td width="31%"><%
	cf.radioToken(out, "gsby","Y+��&N+��",getgsby);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ������������</td>
      <td width="31%"><%
	cf.radioToken(out, "syx","Y+��&N+��",getsyx);
%></td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�ɱ��յص�</td>
      <td width="31%"> 
        <input type="text" name="jbxdd" size="20" maxlength="50"  value="<%=getjbxdd%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>���ɻ���</td>
      <td width="31%"> 
        <input type="text" name="yjsxe" size="20" maxlength="17"  value="<%=getyjsxe%>" >      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>��˾�����Ѷ�</td>
      <td width="31%"> 
        <input type="text" name="gsjbfe" size="20" maxlength="17"  value="<%=getgsjbfe%>" >      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���˽����Ѷ�</td>
      <td width="31%"> 
        <input type="text" name="grjbfe" size="20" maxlength="17"  value="<%=getgrjbfe%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ��ס��������</td>
      <td width="31%"><%
	cf.radioToken(out, "sfjgjj","Y+��&N+��",getsfjgjj);
%> </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���ɴ�ͳ��</td>
      <td width="31%"><input type="text" name="jndbtc" value="<%=getjndbtc%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��˾��ס��������</td>
      <td width="31%"> 
        <input type="text" name="gsjgjj" size="20" maxlength="17"  value="<%=getgsjgjj%>" >      </td>
      <td align="right" width="19%">���˽�ס��������</td>
      <td width="31%"> 
        <input type="text" name="grjgjj" size="20" maxlength="17"  value="<%=getgrjgjj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">����ͣ��ʱ��</td>
      <td width="31%">
        <input type="text" name="bxtjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="19%">����ת��ʱ��</td>
      <td width="31%">
        <input type="text" name="bxzcsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="31%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="ysbbljlh" value="<%=ysbbljlh%>">
        <input type="hidden" name="ygbh" value="<%=ygbh%>" >
        <input type="hidden" name="bianhao" value="<%=bianhao%>" >
        <input type="hidden" name="yhmc" value="<%=yhmc%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
    </tr>
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
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[�������]��");
		FormName.lx[0].focus();
		return false;
	}
	if (FormName.lx[1].checked)
	{
		if(	javaTrim(FormName.bxtjsj)=="") {
			alert("������[����ͣ��ʱ��]��");
			FormName.bxtjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxtjsj, "����ͣ��ʱ��"))) {
			return false;
		}
	}
	else if (FormName.lx[2].checked)
	{
		if(	javaTrim(FormName.bxzcsj)=="") {
			alert("������[����ת��ʱ��]��");
			FormName.bxzcsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxzcsj, "����ת��ʱ��"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sbbljlh)=="") {
		alert("������[�籣�����¼��]��");
		FormName.sbbljlh.focus();
		return false;
	}
	if(	javaTrim(FormName.shbxh)=="") {
		alert("������[��ᱣ�պ�]��");
		FormName.shbxh.focus();
		return false;
	}
	if(	javaTrim(FormName.sbblsj)=="") {
		alert("������[�籣����ʱ��]��");
		FormName.sbblsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbblsj, "�籣����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.ylbx)) {
		alert("��ѡ��[�Ƿ����ҽ�Ʊ���]��");
		FormName.ylbx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jylbx)) {
		alert("��ѡ��[�Ƿ�������ϱ���]��");
		FormName.jylbx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sybx)) {
		alert("��ѡ��[�Ƿ����ʧҵ����]��");
		FormName.sybx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.gsby)) {
		alert("��ѡ��[�Ƿ���ɹ��˱���]��");
		FormName.gsby[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.syx)) {
		alert("��ѡ��[�Ƿ������������]��");
		FormName.syx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jbxdd)=="") {
		alert("������[�ɱ��յص�]��");
		FormName.jbxdd.focus();
		return false;
	}

	if(	javaTrim(FormName.yjsxe)=="") {
		alert("������[���ɻ���]��");
		FormName.yjsxe.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsxe, "���ɻ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gsjbfe)=="") {
		alert("������[��˾�����Ѷ�]��");
		FormName.gsjbfe.focus();
		return false;
	}
	if(!(isFloat(FormName.gsjbfe, "��˾�����Ѷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.grjbfe)=="") {
		alert("������[���˽����Ѷ�]��");
		FormName.grjbfe.focus();
		return false;
	}
	if(!(isFloat(FormName.grjbfe, "���˽����Ѷ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjgjj)) {
		alert("��ѡ��[�Ƿ��ס��������]��");
		FormName.sfjgjj[0].focus();
		return false;
	}
	if(!(isFloat(FormName.gsjgjj, "��˾��ס��������"))) {
		return false;
	}
	if(!(isFloat(FormName.grjgjj, "���˽�ס��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jndbtc)=="") {
		alert("������[���ɴ�ͳ��]��");
		FormName.jndbtc.focus();
		return false;
	}
	if(!(isFloat(FormName.jndbtc, "���ɴ�ͳ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
