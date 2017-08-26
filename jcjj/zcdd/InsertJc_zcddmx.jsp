<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zcmc=null;
String xh=null;
String gg=null;
String zcysbm=null;
String zclbbm=null;
String sfbhpj=null;
String sfbhpjmc=null;
String pjts=null;
String jldwbm=null;
double lsj=0;
double yhj=0;
double cxhdbl=0;
String sfycx=null;
String sfycxmc=null;
double cxj=0;
String cxkssj=null;
String cxjzsj=null;
double lscxhdbl=0;
String gys=null;
String bz=null;
double cbj=0;
double cxcbj=0;


String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zcbm=cf.GB2Uni(request.getParameter("zcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double dpcxhdbl=0;
double dpcbj=0;
String	xzjg=null;


try {
	conn=cf.getConnection();

	ls_sql="select cbj,cxcbj,zcmc,zclbbm,xh,gg,zcysbm,yhj,sfbhpj,DECODE(sfbhpj,'Y','����','N','������') sfbhpjmc,pjts,jldwbm,lsj,yhj,cxhdbl,sfycx,DECODE(sfycx,'N','û����','Y','�д���') sfycxmc,cxj,cxkssj,cxjzsj,lscxhdbl,gys,bz";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbj=rs.getDouble("cbj");
		cxcbj=rs.getDouble("cxcbj");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		sfbhpjmc=cf.fillNull(rs.getString("sfbhpjmc"));
		pjts=cf.fillNull(rs.getString("pjts"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		lsj=rs.getDouble("lsj");
		yhj=rs.getDouble("yhj");
		cxhdbl=rs.getDouble("cxhdbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		sfycxmc=cf.fillNull(rs.getString("sfycxmc"));
		cxj=rs.getDouble("cxj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		gys=cf.fillNull(rs.getString("gys"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
	{
		dpcxhdbl=lscxhdbl;

		xzjg="2";//1:�����޼ۣ�2:������
		sfycx="Y";
		dj=cxj;
		dpcbj=cxcbj;
	}
	else
	{
		dpcxhdbl=cxhdbl;

		xzjg="1";//1:�����޼ۣ�2:������
		sfycx="N";
		dj=yhj;
		dpcbj=cbj;
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
<title>¼����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SaveInsertJc_zcddmx.jsp" name="editform" target="_blank">
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center" bgcolor="#E8E8FF"> 
      <td colspan="2" height="22"><b>������ţ�<%=ddbh%></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#0000CC">���ı���</font></td>
      <td width="79%"><%=zcbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��Ӧ��</font></td>
      <td width="79%"><%=gys%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��������</font></td>
      <td width="79%"><%=zcmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">�ͺ�</font></td>
      <td width="79%"><%=xh%>��<font color="#0000CC">���</font>��<%=gg%>��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%"> 
        <div align="right"><font color="#0000CC">���/ϵ��</font></div>
      </td>
      <td width="79%"><%=zclbbm%>��<font color="#0000CC">��������</font>��<%=cxhdbl%>%�� 
      </td>
    </tr>
    <%
	if (sfbhpj.equals("Y"))
	{
		%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">���</font></td>
      <td width="79%"> <%=sfbhpjmc%>��<%=pjts%><font color="#0000CC">��</font>�� 
      </td>
    </tr>
    <%
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">�����޼�</font></td>
      <td width="79%"><%=yhj%>��<font color="#0000CC">�г����</font>��<%=lsj%>��</td>
    </tr>
    <%
	if (sfycx.equals("Y"))
	{
		%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#CC0000">�������</font></td>
      <td width="79%"><%=sfycxmc%>��<font color="#CC0000">������</font>��<%=cxj%>��<font color="#CC0000">��������</font>��<%=lscxhdbl%>%��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#CC0000">������</font></td>
      <td width="79%">(<%=cxkssj%>)��(<%=cxjzsj%>)</td>
    </tr>
    <%
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��ע</font></td>
      <td width="79%"><%=bz%></td>
    </tr>
    <tr bgcolor="#E8E8FF" align="center"> 
      <td colspan="2" height="22"><b>¼�뵥Ʒ��ϸ</b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" bgcolor="#FFFFCC" align="right"><font color="#FF0000">*</font>ѡ��۸�</td>
      <td width="79%"> <%
				if (sfycx.equals("Y") && xzjg.equals("1"))
				{
					%> 
        <INPUT type="radio" name="xzjg" value="1" CHECKED onclick="dj.value='<%=yhj%>';cxhdbl.value='<%=cxhdbl%>';cbj.value='<%=cbj%>';f_jsjg(editform);">
        �����޼� 
        <INPUT type="radio" name="xzjg" value="2" onclick="dj.value='<%=cxj%>';cxhdbl.value='<%=lscxhdbl%>';cbj.value='<%=cxcbj%>';f_jsjg(editform);">
        ������ <% 
				}
				else if (sfycx.equals("Y") && xzjg.equals("2"))
				{
					%> 
        <INPUT type="radio" name="xzjg" value="1" onclick="dj.value='<%=yhj%>';cxhdbl.value='<%=cxhdbl%>';cbj.value='<%=cbj%>';f_jsjg(editform);">
        �����޼� 
        <INPUT type="radio" name="xzjg" value="2" CHECKED onclick="dj.value='<%=cxj%>';cxhdbl.value='<%=lscxhdbl%>';cbj.value='<%=cxcbj%>';f_jsjg(editform);">
        ������ <% 
				}
				else{
					%> 
        <INPUT type="radio" name="xzjg" value="1" CHECKED>
        �����޼� <% 
				}
%> &nbsp;&nbsp;<font color="#0000CC">ʵ����</font> 
        <input type="text" name="dj" size="8" maxlength="16"  value="<%=dj%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" bgcolor="#FFFFCC"> 
        <div align="right">��ɫ</div>
      </td>
      <td width="79%"> 
        <input type="text" name="zcysbm" size="20" maxlength="50"  value="<%=zcysbm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcpzwzbm)" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">��װλ��</td>
      <td width="79%"> 
        <input type="text" name="zcpzwzbm" size="20" maxlength="20"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl)">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>��������</td>
      <td width="79%"> 
        <input type="text" name="sl" size="10" maxlength="8"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">
        <%=jldwbm%> &nbsp;&nbsp;<font color="#0000CC">���Ϸ�</font> 
        <input type="text" name="je" size="14" maxlength="16"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right" bgcolor="#E8E8FF">Զ�̷�</td>
      <td width="79%"> 
        <input type="text" name="ycf" size="10" maxlength="9"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(qtfy[0])">
        Ԫ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>��������</td>
      <td width="79%"> <%
	cf.radioToken(out, "qtfy","1+��װ��&2+�ӹ���&3+�����շ�&W+��","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">�����ѽ��</td>
      <td width="79%"> 
        <input type="text" name="qtfyje" size="10" maxlength="9"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(bc)">
        Ԫ &nbsp;&nbsp;<font color="#0000CC">�μӴ�����������<b>����</b></font> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#0000CC">�������</font></td>
      <td width="79%"> 
        <input type="text" name="cxhdbl" size="10" maxlength="9"  value="<%=dpcxhdbl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
        % &nbsp;&nbsp;&nbsp;<font color="#0000CC">������</font> 
        <input type="text" name="cxhdje" size="12" maxlength="16"  value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right">��ע</td>
      <td width="79%"> 
        <textarea name="bz" cols="35" rows="4"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
		<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
		<input type="hidden" name="zcbm"  value="<%=zcbm%>" >
		<input type="hidden" name="cbj"  value="<%=dpcbj%>" >
          <input type="button"  value="����" name="bc" onClick="f_do(editform)">
          <input type="reset"  value="����">
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
function f_jsjg(FormName)//����FormName:Form������
{
	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);

	FormName.je.value=je;

	je=FormName.je.value*FormName.cxhdbl.value/100;
	je=round(je,2);

	FormName.cxhdje.value=je;
}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.dj)=="") {
		alert("������[ʵ������]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "ʵ������"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[��������]����<=0��");
		FormName.sl.select();
		return false;
	}

	if(	javaTrim(FormName.je)=="") {
		alert("������[���Ϸ�]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("��ѡ��[��������]��");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) {
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("������[�����ѽ��]��");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[�����ѽ��]����Ϊ0��");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}


	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("������[������������]��");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "������������"))) {
		return false;
	}
	if (FormName.cxhdbl.value<0 || FormName.cxhdbl.value>300)
	{
		alert("[������������]Ӧ��0����300��֮�䣡");
		FormName.cxhdbl.select();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
