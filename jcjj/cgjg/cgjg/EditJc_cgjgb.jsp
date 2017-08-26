<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cgbm=null;
String cgmc=null;
String zsmbdj=null;
String mbbm=null;
String mbfbbm=null;
String xtbm=null;
String lsbm=null;
String tjbbm=null;
String ctbm=null;
String jlbm=null;
String dwbh=null;
String zp=null;
String bz=null;
String wherecgbm=cf.GB2Uni(request.getParameter("cgbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgbm,cgmc,zsmbdj,mbbm,mbfbbm,xtbm,lsbm,tjbbm,ctbm,jlbm,dwbh,zp,bz ";
	ls_sql+=" from  jc_cgjgb";
	ls_sql+=" where  (cgbm='"+wherecgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgbm=cf.fillNull(rs.getString("cgbm"));
		cgmc=cf.fillNull(rs.getString("cgmc"));
		zsmbdj=cf.fillNull(rs.getString("zsmbdj"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
		mbfbbm=cf.fillNull(rs.getString("mbfbbm"));
		xtbm=cf.fillNull(rs.getString("xtbm"));
		lsbm=cf.fillNull(rs.getString("lsbm"));
		tjbbm=cf.fillNull(rs.getString("tjbbm"));
		ctbm=cf.fillNull(rs.getString("ctbm"));
		jlbm=cf.fillNull(rs.getString("jlbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���޸ĳ���۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cgbm" size="20" maxlength="5"  value="<%=cgbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc",dwbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��������</td>
              <td colspan="3"> 
                <input type="text" name="cgmc" size="71" maxlength="50"  value="<%=cgmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�Ű�</div>
              </td>
              <td width="35%"> 
                <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mbbm,mbmc from jdm_mbbm order by mbbm",mbbm);
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
	cf.selectItem(out,"select mbfbbm,mbfbmc from jdm_mbfbbm order by mbfbbm",mbfbbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xtbm,xtmc from jdm_xtbm order by xtbm",xtbm);
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
	cf.selectItem(out,"select lsbm,lsmc from jdm_lsbm order by lsbm",lsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�߽Ű�</div>
              </td>
              <td width="35%"> 
                <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tjbbm,tjbmc from jdm_tjbbm order by tjbbm",tjbbm);
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
	cf.selectItem(out,"select ctbm,ctmc from jdm_ctbm order by ctbm",ctbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <select name="jlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jlbm,jlmc from jdm_jlbm order by jlbm",jlbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">װ���Ű嵥��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zsmbdj" size="20" maxlength="9"  value="<%=zsmbdj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��Ƭ</td>
              <td colspan="3"> 
                <input type="text" name="zp" size="72" maxlength="50"  value="<%=zp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherecgbm"  value="<%=wherecgbm%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="����" onClick="f_do(editform)">
                    <input type="reset"  value="����">
                    <input type="button"  value="�ϴ���Ƭ" onClick="f_sczp(editform)" name="sczp" >
                    <input type="button"  value="�鿴��Ƭ" onClick="f_ckzp(editform)" name="ckzp" >
                  </p>
                  <p> 
                    <input type="button"  value="¼��ع�۸�" onClick="f_lrtg(editform)" name="lrtg" >
                    <input type="button"  value="�鿴�ع�۸�" onClick="f_cktg(editform)" name="cktg" >
                    <input type="button"  value="¼�����۸�" onClick="f_lrdg(editform)" name="lrdg" >
                    <input type="button"  value="�鿴����۸�" onClick="f_ckdg(editform)" name="ckdg" >
                  </p>
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

	FormName.action="SaveEditJc_cgjgb.jsp";
	FormName.submit();
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
