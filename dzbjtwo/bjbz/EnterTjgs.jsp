<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String[] xmbh = request.getParameterValues("xmbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" >
		<input type="hidden" name="bjbbh"  value="<%=bjbbh%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
		<input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
<%
	for (int i=0;i<xmbh.length ;i++ )
	{
		%>
		<input type="hidden" name="xmbh"  value="<%=xmbh[i]%>" >
		<%
	}

%>
		1�������޸Ĺ��̱��� 
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td rowspan="3" align="right">�����޸Ĺ�ʽ</td>
              <td width="65%"> 
                <select name="jgfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="bj">����Ԥ���</option>
                </select>
                <input type="text" name="jgxs" size="14">
                <input type="button"  value="���ӹ�ʽ" onClick="f_zjgs(selectform)" name="button">
                <input type="reset" value="����" name="reset">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td width="65%">����Ƿ���С��
                <input type="radio" name="blxs" value="1" checked>
                ȡ�� 
                <input type="radio" name="blxs" value="2">
                ����С�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="65%"> 
                <input type="text" name="jggs" size="30" readonly="true">
                <input type="button"  value="�޸ļ۸�" onClick="f_jg(selectform)" name="button3">
              </td>
            </tr>
          </table>
          <BR>2���滻�������ղ��ϼ��
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr valign="middle" bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="38"> 
                <div align="center">�¹��ղ��ϼ�� 
                  <textarea name="gycl" cols="77" rows="8"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="��ʼ�滻" onClick="f_gycl(selectform)" name="button22">
                </div>
              </td>
            </tr>
          </table>
          <BR>3���滻���ֹ��ղ��ϼ��
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38"> 
                <div align="center">���滻���� 
                  <textarea name="oldgycl" cols="36" rows="4"></textarea>
                </div>
              </td>
              <td width="50%" height="38"> 
                <div align="center">�滻������ 
                  <textarea name="newgycl" cols="36" rows="4"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="��ʼ�滻" onClick="f_bfgycl(selectform)" name="button2">
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

function f_zjgs(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jgfh)=="" && javaTrim(FormName.jgxs)=="") {
		alert("��ѡ��[����]��Ȼ���ٵ����ť��");
		FormName.jgfh.focus();
		return false;
	}

	FormName.jggs.value+=FormName.jgfh.value+FormName.jgxs.value;

}

function f_jg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jggs)=="") {
		alert("���[���ӹ�ʽ]��ť������[�۸��޸Ĺ�ʽ]��");
		FormName.jggs.focus();
		return false;
	}

	if ( !confirm("ȷʵҪ������?") )	
	{
		return;
	}

	FormName.action="UpdateTj.jsp";
	FormName.submit();
	return true;
}

function f_gycl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gycl)=="") {
		alert("������[�¹��ղ���]��");
		FormName.gycl.focus();
		return false;
	}

	if ( !confirm("ȷʵҪ������?") )	
	{
		return;
	}

	FormName.action="UpdateGycl.jsp";
	FormName.submit();
	return true;
}
function f_bfgycl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.oldgycl)=="") {
		alert("������[���滻����]��");
		FormName.oldgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.newgycl)=="") {
		alert("������[�滻������]��");
		FormName.newgycl.focus();
		return false;
	}

	if ( !confirm("ȷʵҪ������?") )	
	{
		return;
	}

	FormName.action="UpdateBfGycl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
