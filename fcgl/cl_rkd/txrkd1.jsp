<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>
<%
String rkph=null;
String nian=null;
int maxbh=0;
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=request.getParameter("ssfgs");
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
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+dwbh+"' ";  
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

	ls_sql=" select to_char(sysdate,'yy') nian,NVL(MAX(to_number(SUBSTR(rkph,8,4))),0) maxbh ";
	ls_sql+=" from cl_rkd where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		nian = rs.getString("nian");
		maxbh = rs.getInt("maxbh")+1;
	}
	rs.close();
	ps.close();

	rkph = dwbh+nian+cf.addZero(maxbh,4);
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
      <div align="center"> �������(�������:<%=rkph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" target="_back">
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>�������</div>
              </td>
              <td> 
                <input type="radio" name="rklx" value="1">
                �»� 
                <input type="radio" name="rklx" value="2">
                �˻� </td>
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">��ⵥλ</font></div>
              </td>
              <td> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">��Ӧ��</td>
              <td>
                <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
					cf.selectItem(out,"select gysmc,gysmc from cl_gysbm order by gysbm","");
					%> 
                </select>
              </td>
              <td width="15%" align="right">�˻�ʩ����</td>
              <td>
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssfgs='"+dwbh+"' and cxbz='N' order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>�����</div>
              </td>
              <td> 
                <input type="text" name="rkr" size="20" maxlength="13" value="<%=yhmc%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font>���ʱ��</div>
              </td>
              <td> 
                <input type="text" name="rksj" size="20" maxlength="10" value="<%=cf.today()%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼����</font></div>
              </td>
              <td> 
                <input type="text" name="lrr" size="20" maxlength="13" value="<%=yhmc%>" readonly>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td> 
                <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�깺����</td>
              <td> 
                <input type="text" name="sgph" size="20" maxlength="11" value="" >
              </td>
              <td width="15%" bgcolor="#FFFFFF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="rkph" value="<%=rkph%>">
                <input type="button" name="cp" value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="button" name="xzcl" value="ѡ�����" onClick="f_xz(insertform)" disabled>
                <input type="button" name="xg" value="�޸�" onClick="f_xg(insertform)" disabled>
                &nbsp; 
                <input type="button" name="tjck" value=" �� �� " onClick="f_tj(insertform)" disabled>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.rklx)) {
		alert("��ѡ��[�������]��");
		FormName.rklx[0].focus();
		return false;
	}

	if (FormName.rklx[1].checked)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("������[�˻�ʩ����]��");
			FormName.sgd.focus();
			return false;
		}
		FormName.gysmc.value="";
	}
	else{
		if(	javaTrim(FormName.gysmc)=="") {
			alert("������[��Ӧ��]��");
			FormName.gysmc.focus();
			return false;
		}
		FormName.sgd.value="";
	}

	if(	javaTrim(FormName.rkr)=="") {
		alert("������[�����]��");
		FormName.rkr.focus();
		return false;
	}
	if(	javaTrim(FormName.rksj)=="") {
		alert("������[���ʱ��]��");
		FormName.rksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rksj, "���ʱ��"))) {
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

	if (FormName.rksj.value>FormName.lrsj.value)
	{
		alert("[���ʱ��]���ܴ���[¼��ʱ��]��");
		FormName.rksj.select();
		return false;
	}
	
	
	FormName.action="ServerInsertsgrk.jsp";
	FormName.submit();
	FormName.xzcl.disabled=false;
	return true;
}
function f_xz(FormName)//����FormName:Form������
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	FormName.tjck.disabled=false;
	FormName.xg.disabled=false;
	return true;
}
function f_xg(FormName)//����FormName:Form������
{
	FormName.action="Cl_rkmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	FormName.action="tjrkd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
