<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String pplb=null;
String cldl=null;
String scsmc=null;
String bz=null;
String mrazhs=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String cwdm=null;
String ppfzr=null;
String sfxcl=null;
double tcycf=0;
String sfkgtcsl=null;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfkgtcsl,sfxcl,tcycf,ppbm,ppmc,pplb,cldl,scsmc,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm,mrazhs,ppfzr ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfkgtcsl=cf.fillNull(rs.getString("sfkgtcsl"));
		sfxcl=cf.fillNull(rs.getString("sfxcl"));
		tcycf=rs.getDouble("tcycf");
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		pplb=cf.fillNull(rs.getString("pplb"));
		cldl=cf.fillNull(rs.getString("cldl"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		bz=cf.fillNull(rs.getString("bz"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		mrazhs=cf.fillNull(rs.getString("mrazhs"));
		ppfzr=cf.fillNull(rs.getString("ppfzr"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppxx.jsp" name="insertform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>��Ʒ�Ʊ���</span></td>
    <td><input type="text" name="ppbm" size="10" maxlength="8"  value="<%=ppbm%>" readonly>
      �������޸ģ� </td>
    <td align="right">�������</td>
    <td><input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>��Ʒ������</td>
    <td colspan="3"><input type="text" name="ppmc" size="73" maxlength="50"  value="<%=ppmc%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ�����</td>
  <td width="32%">
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+����",pplb);
%> 
  </select></td>
  <td width="18%" align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td width="32%"><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc c1,scsmc c2 from jxc_scsxx where scslb in('1','3')  order by scsmc",scsmc);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���ϴ���</td>
  <td><select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc",cldl);
%>
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ�Ƹ�����</td>
  <td><input name="ppfzr" type="text" id="ppfzr" value="<%=ppfzr%>" size="20" maxlength="20" ></td>
  <td width="18%" align="right">ÿ�հ�װ��������</td>
  <td width="32%"><input type="text" name="mrazhs" value="<%=mrazhs%>" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ������</td>
  <td><%
	cf.radioToken(out, "sfxcl","Y+��Ҫ&N+��",sfxcl);
%></td>
  <td align="right">�Ƿ�ɸ��ײ�����</td>
  <td><%
	cf.radioToken(out, "sfkgtcsl","Y+����&N+��",sfkgtcsl);
%></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ż�</td>
  <td><%
	cf.radioToken(out, "sfyyh","N+��&Y+��",sfyyh);
%>  </td>
  <td align="right">�ײ�Զ�̷�</td>
  <td><input type="text" name="tcycf" value="<%=tcycf%>" size="20" maxlength="16"  ></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Żݿ�ʼʱ��</td>
  <td><input type="text" name="yhkssj" value="<%=yhkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�Żݽ���ʱ��</td>
  <td><input type="text" name="yhjzsj" value="<%=yhjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Ż�����</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"><%=yhnr%></textarea>  </td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="70" rows="2"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input type="reset"  value="����">
	  
	</div>      </td>
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
	if(	javaTrim(FormName.pplb)=="") {
		alert("��ѡ��[��Ʒ�����]��");
		FormName.pplb.focus();
		return false;
	}
	if(	javaTrim(FormName.cldl)=="") {
		alert("��ѡ��[���ϴ���]��");
		FormName.cldl.focus();
		return false;
	}

	if(	javaTrim(FormName.scsmc)=="") {
		alert("������[Ʒ��]��");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(!(isNumber(FormName.mrazhs, "ÿ�հ�װ��������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("������[�Żݿ�ʼʱ��]��");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "�Żݿ�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("������[�Żݽ���ʱ��]��");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "�Żݽ���ʱ��"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[�Żݿ�ʼʱ��]���ܴ���[�Żݽ���ʱ��]��");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("������[�Ż�����]��");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}


	if(!(isFloat(FormName.tcycf, "�ײ�Զ�̷�"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxcl)) {
		alert("��ѡ��[�Ƿ������]��");
		FormName.sfxcl[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
