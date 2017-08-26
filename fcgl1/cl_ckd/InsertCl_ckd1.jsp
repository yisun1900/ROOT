<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String ckph=null;
String nian=cf.today("YY");

String yhmc=(String)session.getAttribute("yhmc");
String fgs=request.getParameter("fgs");

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;




try { 
	conn=cf.getConnection();


/***************************************************************\
|		����Ƿ�����ĩ��ת											|
\***************************************************************/
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+fgs+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//�����ݿ���ȡ����ǰ������� 
	} 
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("����û�н���<a href=\"/fcgl/qmjz/ydjz.jsp\">����ת</a>�����ܽ��п�������");
		return;
	}

	ls_sql=" select NVL(MAX(to_number(SUBSTR(ckph,8,4))),0) ";
	ls_sql+=" from cl_ckd where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		count = rs.getInt(1);
	}
	rs.close();
	ps.close();

	ckph = fgs+nian+cf.addZero(count+1,4);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">���ϳ��⣨<b>���ϵ��������</b>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC">��������</font></td>
      <td width="35%"> 
        <input type="text" name="ckph" value="<%=ckph%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">�ֹ�˾</font></td>
      <td width="35%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>������</td>
      <td width="35%"> 
        <input type="text" name="ckr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>����ʱ��</td>
      <td width="35%"> 
        <input type="text" name="cksj" value="<%=cf.today()%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="35%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="69" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="����ȯת��" onClick="f_djjlr(insertform)" name="djj" disabled>
        <input type="button"  value="����¼��" onClick="f_cklr(insertform)" name="cklr" disabled>
        <input type="button"  value="����¼��" onClick="f_zplr(insertform)" name="zplr" disabled>
        <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" disabled>
        <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" disabled>
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
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
	if(	javaTrim(FormName.ckr)=="") {
		alert("������[������]��");
		FormName.ckr.focus();
		return false;
	}
	if(	javaTrim(FormName.cksj)=="") {
		alert("������[����ʱ��]��");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "����ʱ��"))) {
		return false;
	}

	if (FormName.cksj.value>FormName.lrsj.value)
	{
		alert("[����ʱ��]���ܴ���[¼��ʱ��]��");
		FormName.cksj.select();
		return false;
	}

	FormName.action="SaveInsertCl_ckd1.jsp";
	FormName.submit();

	FormName.djj.disabled=false;
	FormName.cklr.disabled=false;
	FormName.zplr.disabled=false;
	return true;
}

function f_djjlr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="ChooseCkmc.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm.jsp?leixing=1";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_zplr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm.jsp?leixing=2";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="Cl_ckmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("������[��������]��");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="tjckd.jsp";
	FormName.ckmx.disabled=true;
	FormName.cklr.disabled=true;
	FormName.zplr.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

