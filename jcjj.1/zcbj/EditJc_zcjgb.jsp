<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcmc=null;
String zcdlbm=null;
String zcxlbm=null;
String xh=null;
String gg=null;
String lsj=null;
String yhj=null;
String dwbh=null;
String zp=null;
String bz=null;
String zclbbm=null;
String zcysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String sfyh=null;

String cbj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String dqbm=null;
String sftjcp=null;

double jsbl=0;
double cxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;
String gys=null;
String cpsm=null;

String zcbm=cf.GB2Uni(request.getParameter("zcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sftjcp,lscxhdbl,cxcbj,jsbl,cxhdbl,cpjb,fgsx,cd,gys,dqbm,zcbm,zcmc,zcdlbm,zcxlbm,xh,gg,lsj,yhj,dwbh,zp,bz,zclbbm,zcysbm,jldwbm,sfbhpj,pjts,sfyh,cbj,sfycx,cxj,cxkssj,cxjzsj,cpsm ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where  (zcbm='"+zcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		jsbl=rs.getDouble("jsbl");
		cxhdbl=rs.getDouble("cxhdbl");
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		gys=cf.fillNull(rs.getString("gys"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		sfyh=cf.fillNull(rs.getString("sfyh"));

		cbj=cf.fillNull(rs.getString("cbj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
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
<%
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸����ı�����Ϣ�����ı��룺<%=zcbm%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
	}
%> 
                </select>
              </td>
              <td width="17%" align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ��Ƽ���Ʒ</td>
              <td width="33%"><%
	cf.radioToken(out, "sftjcp","Y+��&N+��",sftjcp);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>���Ĵ���</td>
              <td width="32%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm where zcdlmc='"+zcdlbm+"'",zcdlbm);
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>����С��</td>
              <td width="33%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm where zcxlmc='"+zcxlbm+"'",zcxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>Ʒ�ƹ�Ӧ��</td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=dwbh%>"><%=dwbh%></option>
                </select>
              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��������</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" size="73" maxlength="50"  value="<%=zcmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="<%=zclbbm%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ɫ</td>
              <td width="32%"> 
                <input type="text" name="zcysbm" value="<%=zcysbm%>" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�г����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>�����޼�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhj" size="20" maxlength="9"  value="<%=yhj%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>�������</td>
              <td width="33%"> 
                <input type="text" name="jsbl" value="<%=jsbl%>" size="12" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��������</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="cxhdbl" value="<%=cxhdbl%>" size="12" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="17%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�Ƿ��д���</td>
              <td width="33%" bgcolor="#E8E8FF"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���",sfycx);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">������ʼʱ��</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��������ʱ��</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" value="<%=cxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">������</td>
              <td width="32%"> 
                <input type="text" name="cxj" value="<%=cxj%>" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right">���������</td>
              <td width="33%"> 
                <input type="text" name="cxcbj" value="<%=cxcbj%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">�����ڼ�������</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="<%=lscxhdbl%>" size="12" maxlength="9" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="17%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��л�</td>
              <td width="33%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "sfyh","Y+�л�&N+�޻�",sfyh);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�Ƿ�������</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+����&N+������",sfbhpj);
%> </td>
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="pjts" size="20" maxlength="8"  value="<%=pjts%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="<%=cpjb%>" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fgsx" value="<%=fgsx%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ʒ˵��</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200"  value="<%=cpsm%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="cd" value="<%=cd%>" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right"><font color="#0000CC">��Ƭ����</font></td>
              <td width="33%"> 
                <input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="zcbm"  value="<%=zcbm%>" >
            <tr> 
              <td colspan="4"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_do1(editform)" name="button">
                  <input type="button"  value="�鿴��Ƭ" onClick="f_do2(editform)" name="button">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sftjcp)) {
		alert("��ѡ��[�Ƿ��Ƽ���Ʒ]��");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.zcbm)=="") {
		alert("������[���ı���]��");
		FormName.zcbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("������[��������]��");
		FormName.zcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[�г����]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "�г����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("������[�����޼�]��");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "�����޼�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�����]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("����[�������]Ӧ��0��100֮��");
		FormName.jsbl.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("������[��������]��");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.cxhdbl.value)<0 || parseFloat(FormName.cxhdbl.value)>100)
	{
		alert("����[��������]Ӧ��0��100֮��");
		FormName.cxhdbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("������[������]��");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "������"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcbj)=="") {
			alert("������[���������]��");
			FormName.cxcbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcbj, "���������"))) {
			return false;
		}
		if(	javaTrim(FormName.lscxhdbl)=="") {
			alert("������[�����ڼ�������]��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.lscxhdbl, "�����ڼ�������"))) {
			return false;
		}
		if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
		{
			alert("����[�����ڼ�������]Ӧ��0��100֮��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjzsj.select();
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}

	if(	!radioChecked(FormName.sfyh)) {
		alert("��ѡ��[�Ƿ��л�]��");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbhpj)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfbhpj[0].focus();
		return false;
	}
	if (FormName.sfbhpj[0].checked)
	{
		if(	javaTrim(FormName.pjts)=="") {
			alert("������[�������]��");
			FormName.pjts.focus();
			return false;
		}
		if(!(isNumber(FormName.pjts, "�������"))) {
			return false;
		}
	}
	else{
		FormName.pjts.value="";
	}


	
	FormName.action="SaveEditJc_zcjgb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zcbm)=="") {
		alert("������[���ı���]��");
		FormName.zcbm.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zcbm)=="") {
		alert("������[���ı���]��");
		FormName.zcbm.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
