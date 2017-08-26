<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String sgph=request.getParameter("sgph");

String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;
String psfs=null;
String jhshsj=null;

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	ls_sql=" select lrr,lrsj,dwbh,bz,psfs,jhshsj ";
	ls_sql+=" from cl_clsgd where sgph='"+sgph+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		lrr = cf.fillNull(rs.getString("lrr"));
		lrsj = cf.fillNull(rs.getDate("lrsj"));
		dwbh = cf.fillNull(rs.getString("dwbh"));
		bz = cf.fillNull(rs.getString("bz"));
		jhshsj = cf.fillNull(rs.getDate("jhshsj"));
		psfs = cf.fillNull(rs.getString("psfs"));
	}
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
<title>�޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�޸Ĳ����깺��(�깺����:<%=sgph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" target="_back">
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">�깺��λ</font></td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ͷ�ʽ</td>
              <td width="32%"><%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs);
%></td>
              <td width="18%" align="right">�ƻ��ͻ�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input name="sgph" type="hidden" value="<%=sgph%>">
                <input type="button" name="cp" value=" �� �� " onClick="f_do(insertform)">
                &nbsp; 
                <input type="button"   value="�鿴���" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=dwbh%>')">
                <input type="reset"   value=" �� �� " name="reset">
                &nbsp; 
                <input type="button" name="xzcl" value="ѡ�����" onClick="f_xz(insertform)" >
                <input type="button" name="xg" value="�޸�" onClick="f_xg(insertform)" >
                &nbsp; 
                <input type="button" name="tjsg" value=" �� �� " onClick="f_tj(insertform)" >
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

	FormName.action="ServerEditCl_clsgd.jsp";
	FormName.submit();
	return true;
}
function f_xz(FormName)//����FormName:Form������
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
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
