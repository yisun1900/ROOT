<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
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
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���벿��</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqsj" value=<%=cf.today()%> size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="20" maxlength="6" onblur= "" >
              </td>
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" value="" size="20" maxlength="30"  >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">��ʽ 
              </td>
              <td width="35%"> 
                <input type="text" name="xs" value="" size="20" maxlength="30" >
              </td>
              <td width="15%"> 
                <p align="right">���ʱ�� 
              </td>
              <td width="35%"> 
                <input type="text" name="wcsj" value=<%=cf.today()%> size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="zznr" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ɫҪ��</div>
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="ysyq" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">�������� 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="wznr" cols="72" rows="5"></textarea>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">����Ҫ��</div>
              </td>
              <td width="85%" colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="qtyq" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%">
                <div align="right">���ļ���</div>
              </td>
              <td width="85%" colspan="3">
                <input type="file" name="loadname" size="72" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> ���ܲ��ž������ </td>
              <td width="85%" colspan="3"> 
                <textarea name="zgbmjlyj" cols="72" rows="2"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button"  value="�ϴ����ļ�" onClick="f_do2(insertform)" name="button">
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

//function calValue(FormName){
//if (javaTrim(FormName.jg)!=""&& javaTrim(FormName.sl)!="")
//{
//	
//FormName.fyzj.value=parseFloat(FormName.jg.value)*parseFloat(FormName.sl.value);
		
//}
//}    
function f_do(FormName)//����FormName:Form������
{
	
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
		}
	if(	javaTrim(FormName.zznr)=="") {
		alert("������[��������]��");
		FormName.zznr.focus();
		return false;
	}
	
	if(	javaTrim(FormName.wcsj)=="") {
		alert("������[���ʱ��]��");
		FormName.wcsj.focus();
		return false;
	}
	if(	javaTrim(FormName.loadname)=="") {
		alert("������[���ļ���]��");
		FormName.loadname.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "���ʱ��"))) {
		return false;
	}
	FormName.action="SaveInsertQh_xcpzzsh.jsp";		
	FormName.submit();
	return true;
}
function f_do2(FormName)//����FormName:Form������
{

	FormName.action="loadFile.jsp";	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
