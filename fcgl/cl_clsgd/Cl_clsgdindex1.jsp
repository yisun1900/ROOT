<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=request.getParameter("ssfgs");

String sgph=null;
String nian=null;
int maxbh=0;

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	ls_sql=" select to_char(sysdate,'yy') nian,NVL(MAX(to_number(SUBSTR(sgph,8,4))),0) maxbh ";
	ls_sql+=" from cl_clsgd where dwbh='"+ssfgs+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		nian = rs.getString("nian");
		maxbh = rs.getInt("maxbh")+1;
	}

	sgph = ssfgs+nian+cf.addZero(maxbh,4);
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��д�����깺��(�깺����:<%=sgph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" target="_back">
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼����</font></div>
              </td>
              <td width="28%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">�깺��λ</font></td>
              <td width="28%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>
              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">���ͷ�ʽ</td>
              <td width="28%"> 
                <input type="radio" name="psfs" value="1">
                ���� 
                <input type="radio" name="psfs" value="2">
                ���� 
                <input type="radio" name="psfs" value="9">
                ���� </td>
              <td width="20%" align="right">�ƻ��ͻ�ʱ��</td>
              <td width="30%"> 
                <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input name="sgph" type="hidden" value="<%=sgph%>">
                <input type="button" name="cp" value=" �� �� " onClick="f_do(insertform)">
                &nbsp; 
                <input type="button"   value="�鿴���" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=ssfgs%>')">
                <input type="reset"   value=" �� �� " name="reset">
                &nbsp; 
                <input type="button" name="xzcl" value="ѡ�����" onClick="f_xz(insertform)" disabled>
                <input type="button" name="xg" value="�޸�" onClick="f_xg(insertform)" disabled>
                &nbsp; 
                <input type="button" name="tjsg" value=" �� �� " onClick="f_tj(insertform)" disabled>
                &nbsp; </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�깺��λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jhshsj)=="") {
		alert("������[�ƻ��ͻ�ʱ��]��");
		FormName.jhshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}

	FormName.action="ServerInsertsgdph.jsp";
	FormName.submit();
	FormName.cp.disabled=true;
	FormName.reset.disabled=true;
	FormName.xzcl.disabled=false;
	return true;
}
function f_xz(FormName)//����FormName:Form������
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	FormName.tjsg.disabled=false;
	FormName.xg.disabled=false;
	return true;
}
function f_xg(FormName)//����FormName:Form������
{
	FormName.action="Cl_clsgmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	FormName.action="tjdgd.jsp";
	FormName.submit();
	FormName.xzcl.disabled=true;
	FormName.xg.disabled=true;
	return true;
}
//-->
</SCRIPT>
