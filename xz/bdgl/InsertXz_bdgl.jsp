<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");

String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by ssfgs,dwbh");


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
      <div align="center">������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�����ֹ�˾</td>
              <td width="35%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
	%></td>
              <td width="15%" align="right">��������</td>
              <td width="35%"> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
//			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
		}
		else if (yhjs.equals("F0"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
		}
		else
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bdbh" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">������Χ</div>
              </td>
              <td width="35%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
                <input type="radio" name="fbfw" value="1">
                ����˾ 
                <input type="radio" name="fbfw" value="2">
                ���� <%
		}
		else{
			%> 
                <input type="radio" name="fbfw" value="1" checked>
                ����˾ <%
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">������</td>
              <td colspan="3"> 
                <input type="text" name="bdmc" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbr" value="<%=lrr%>" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"> ¼��ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <p> 
                  <textarea name="bz" cols="71" rows="3"></textarea>
                  &nbsp;</p>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button" name="sc" value="�ϴ�����" onClick="f_do1(insertform)" disabled>
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.fbfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.fbfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.fbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bdbh)=="") {
		alert("������[�����]��");
		FormName.bdbh.focus();
		return false;
	}
<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
			if(	!radioChecked(FormName.fbfw)) {
				alert("��ѡ��[������Χ]��");
				FormName.fbfw[0].focus();
				return false;
			}
			<%
		}
		else{
			%> 
			if(!FormName.fbfw.checked) {
				alert("������[������Χ]��");
				FormName.fbfw.focus();
				return false;
			}
			<%
		}
%>
	if(	javaTrim(FormName.bdmc)=="") {
		alert("������[������]��");
		FormName.bdmc.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.bdfj)=="") {
		alert("������[������]��");
		FormName.bdfj.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fbsj)=="") {
		alert("������[����ʱ��]��");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("������[������]��");
		FormName.fbr.focus();
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
	FormName.action="SaveInsertXz_bdgl.jsp";
	FormName.submit();
	FormName.sc.disabled=false;
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bdbh)=="") {
		alert("������[�����]��");
		FormName.bdbh.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}
//-->
</SCRIPT>
