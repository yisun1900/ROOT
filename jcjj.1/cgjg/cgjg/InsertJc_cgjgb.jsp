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

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String cgbm=null;

try {
	conn=cf.getConnection();
	int count=0;
	ls_sql="select NVL(max(cgbm),0)+1";
	ls_sql+=" from  jc_cgjgb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	cgbm=cf.addZero(count,5);

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�����۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�������</div>
              </td>
              <td width="34%"> 
                <input type="text" name="cgbm" value="<%=cgbm%>" size="20" maxlength="5" readonly>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��������</td>
              <td colspan="3"> 
                <input type="text" name="cgmc" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�Ű�</div>
              </td>
              <td width="34%"> 
                <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mbbm,mbmc from jdm_mbbm order by mbbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�Ű���</div>
              </td>
              <td width="35%"> 
                <select name="mbfbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mbfbbm,mbfbmc from jdm_mbfbbm order by mbfbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">����</div>
              </td>
              <td width="34%"> 
                <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xtbm,xtmc from jdm_xtbm order by xtbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <select name="lsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select lsbm,lsmc from jdm_lsbm order by lsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�߽Ű�</div>
              </td>
              <td width="34%"> 
                <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tjbbm,tjbmc from jdm_tjbbm order by tjbbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <select name="ctbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ctbm,ctmc from jdm_ctbm order by ctbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">����</div>
              </td>
              <td width="34%"> 
                <select name="jlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jlbm,jlmc from jdm_jlbm order by jlbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">װ���Ű嵥��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zsmbdj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��Ƭ</td>
              <td colspan="3"> 
                <input type="text" name="zp" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_sczp(insertform)" name="sczp" disabled>
                  <input type="button"  value="�鿴��Ƭ" onClick="f_ckzp(insertform)" name="ckzp" disabled>
                </p>
                <p> 
                  <input type="button"  value="¼��ع�۸�" onClick="f_lrtg(insertform)" name="lrtg" disabled>
                  <input type="button"  value="�鿴�ع�۸�" onClick="f_cktg(insertform)" name="cktg" disabled>
                  <input type="button"  value="¼�����۸�" onClick="f_lrdg(insertform)" name="lrdg" disabled>
                  <input type="button"  value="�鿴����۸�" onClick="f_ckdg(insertform)" name="ckdg" disabled>
                </p>
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
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cgmc)=="") {
		alert("������[��������]��");
		FormName.cgmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��������]��");
		FormName.dwbh.focus();
		return false;
	}

/*	
	if(	javaTrim(FormName.zsmbdj)=="") {
		alert("������[װ���Ű嵥��]��");
		FormName.zsmbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zsmbdj, "װ���Ű嵥��"))) {
		return false;
	}
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[�Ű�]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbfbbm)=="") {
		alert("��ѡ��[�Ű���]��");
		FormName.mbfbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("��ѡ��[����]��");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsbm)=="") {
		alert("��ѡ��[����]��");
		FormName.lsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tjbbm)=="") {
		alert("��ѡ��[�߽Ű�]��");
		FormName.tjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ctbm)=="") {
		alert("��ѡ��[����]��");
		FormName.ctbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jlbm)=="") {
		alert("��ѡ��[����]��");
		FormName.jlbm.focus();
		return false;
	}
*/
	FormName.action="SaveInsertJc_cgjgb.jsp";
	FormName.submit();
	FormName.sczp.disabled=false;
	FormName.ckzp.disabled=false;
	FormName.lrtg.disabled=false;
	FormName.cktg.disabled=false;
	FormName.lrdg.disabled=false;
	FormName.ckdg.disabled=false;
	return true;
}

function f_lrtg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	FormName.action="InsertJc_tgjgb.jsp";
	FormName.submit();
	return true;
}
function f_cktg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	FormName.action="Jc_tgjgbList.jsp";
	FormName.submit();
	return true;
}

function f_lrdg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	FormName.action="InsertJc_dgjgb.jsp";
	FormName.submit();
	return true;
}
function f_ckdg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	FormName.action="Jc_dgjgbList.jsp";
	FormName.submit();
	return true;
}

function f_sczp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zp)=="") {
		alert("������[��Ƭ]��");
		FormName.zp.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zp)=="") {
		alert("������[��Ƭ]��");
		FormName.zp.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
