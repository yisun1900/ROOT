<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gysbm=null;
String gys=null;
String dqbm=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String bz=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
String wheregysbm=request.getParameter("gysbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yhzmc="";

try {
	conn=cf.getConnection();

	ls_sql="select gysbm,gys,dqbm,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,bz,cwdm,kdlxtbz ";
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gys=cf.fillNull(rs.getString("gys"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bz=cf.fillNull(rs.getString("bz"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select yhzmc ";
	ls_sql+=" from  sq_yhssz,sq_yhz";
	ls_sql+=" where sq_yhssz.yhdlm='"+yhdlm+"' and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yhzmc+=cf.fillNull(rs.getString("yhzmc"))+"��";
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �޸ġ�<font color="#0000FF"><b>��Ӧ��</b></font>����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">��Ӧ�̱��</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="gysbm" size="20" maxlength="5"  value="<%=gysbm%>" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">��������</font></div>
              </td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��Ӧ������</td>
              <td colspan="3"> 
                <input type="text" name="gys" size="74" maxlength="50"  value="<%=gys%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��Ӧ�̵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="gysdz" size="74" maxlength="100"  value="<%=gysdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��Ӧ�̵绰</td>
              <td colspan="3"> 
                <input type="text" name="gysdh" size="74" maxlength="50"  value="<%=gysdh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ӧ�̴���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" >
              </td>
              <td width="19%"> 
                <div align="right">EMail</div>
              </td>
              <td width="31%"> 
                <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������</td>
              <td width="31%"> 
                <input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">��Ӧ�̸�����</td>
              <td width="31%"> 
                <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">ϵͳ��Ȩ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ɵ�½ϵͳ��־</td>
              <td width="31%"><%
	cf.radioToken(out, "kdlxtbz","Y+�ɵ�½&N+���ɵ�½",kdlxtbz);
%></td>
              <td rowspan="4" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td rowspan="4">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
<%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","select ssfgs from sq_gyssqfgs where gysbm='"+wheregysbm+"'");
%>
                </select>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û���¼��</td>
              <td width="31%"> 
                <input type="text" name="yhdlm" value="<%=yhdlm%>" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">�û�����</font></td>
              <td width="31%"> 
                <input type="text" name="yhkl" value="<%=yhkl%>" size="20" maxlength="50" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û�����</td>
              <td width="31%"> 
                <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û�������</td>
              <td colspan="3"><%=yhzmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="¼����ϵ��" onClick="f_lr(editform)" name="lr" >
                  <input type="button"  value="�鿴��ϵ��" onClick="f_ck(editform)" name="ck" >
                  <input type="button"  value="�û���Ȩ" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)" >
                  <input type="button"  value="��������" onClick="editform.yhkl.value='111111'" name="button">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱��]��");
		FormName.gysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("������[��Ӧ������]��");
		FormName.gys.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}

	if(	javaTrim(FormName.gysdh)=="") {
		alert("������[��Ӧ�̵绰]��");
		FormName.gysdh.focus();
		return false;
	}

	if(	javaTrim(FormName.yhdlm)!="") 
	{
		if(	javaTrim(FormName.yhkl)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
		if(	!radioChecked(FormName.kdlxtbz)) {
			alert("��ѡ��[�ɵ�½ϵͳ��־]��");
			FormName.kdlxtbz[0].focus();
			return false;
		}

	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.target="";
	FormName.action="SaveEditSq_gysbm.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("������[��Ӧ������]��");
		FormName.gys.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertSq_gyslxr.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("������[��Ӧ������]��");
		FormName.gys.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Sq_gyslxrList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
