<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">������ѯ
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="ChList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������</td>
              <td width="31%"> 
              <input type="text" name="FBillNo" size="20" maxlength="20">              </td>
              <td width="19%" align="right">������λ</td>
              <td width="31%"> 
                <input type="text" name="FModel" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td><input type="text" name="FDate" size="20" maxlength="20" onDblClick="JSCalendar(this)"></td>
              <td><div align="right">��</div></td>
              <td><input type="text" name="FDate2" size="20" maxlength="20" onDblClick="JSCalendar(this)"></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">פ��Ҿӹ���</td>
              <td width="31%"><input type="text" name="clgw" size="20" maxlength="20"></td>
              <td width="19%" align="right">��ĿרԱ</td>
              <td width="31%"><input type="text" name="xmzy" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">չ���Ҿӹ���</td>
              <td width="31%" bgcolor="#CCCCFF"><input type="text" name="ztjjgw" size="20" maxlength="20" ></td>
              <td width="19%" align="right">����ȷ����</td>
              <td width="31%"><input type="text" name="ddqrr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">����ȷ��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="ddqrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="ddqrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �ƻ�����ʱ�� ��              </td>
              <td width="31%"><input type="text" name="jhclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
                <input type="text" name="jhclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ʵ�ʲ���ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="sclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="sclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">��ͬ�ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="htshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="htshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ƻ��ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���ͻ�֪ͨʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="tzshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="tzshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">ʵ�ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
           
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(!(isDatetime(FormName.FDate, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.FDate2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "����ȷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj2, "����ȷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhclsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhclsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	
	if(!(isDatetime(FormName.sclsj, "ʵ�ʲ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sclsj2, "ʵ�ʲ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj2, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tzshsj, "���ͻ�֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tzshsj2, "���ͻ�֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sshsj, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sshsj2, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	

	

	FormName.action="DdList.jsp";
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

