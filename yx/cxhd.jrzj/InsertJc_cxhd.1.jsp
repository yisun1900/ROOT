<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>


<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
      <div align="center"> ��¼������</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="button"  value="����" onClick="f_do(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td width="30%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>���������</td>
              <td colspan="3"> 
                <input type="text" name="cxhdmc" value="" size="71" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�����</td>
              <td colspan="3"><input type="radio" name="hdlx" value="1">
                �޻
                <input type="radio" name="hdlx" value="2">
                ��˾�
                <input type="radio" name="hdlx" value="3">
                С���
                <input type="radio" name="hdlx" value="4">
                չ��
                <input type="radio" name="hdlx" value="5">
                �г��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ɹ��������</td>
              <td><%
	cf.radioToken(out, "kgxqthd","1+���ɹ���&2+�ɹ���","");
%></td>
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td><input type="text" name="dj" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>��ʼʱ��(>=)</td>
              <td><input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td colspan="2" align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>��������ʱ��(<=) </td>
              <td><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"><font color="#FF0000">*</font>ǩ������ʱ��(<=) </td>
              <td><input type="text" name="qdjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�<font color="#CC0033"><strong>���������������ۣ���������Ŀ����¼�롺������Ŀ���ۡ���</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
              <td colspan="3"><input type="radio" name="zklx" value="4">
                ���ۿ�
                <input type="radio" name="zklx" value="1">
                ȫ������
                <input type="radio" name="zklx" value="2">
�������
<input type="radio" name="zklx" value="2">
���̷Ѳ��ִ���</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ�����˫�ش���</td>
              <td colspan="3"><input type="radio" name="yxscdz" value="1">
                ��������ۿ��ۼ�
                  <input type="radio" name="yxscdz" value="2">
                �������������
                <input type="radio" name="yxscdz" value="9">
                ������</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td colspan="4" align="center"><p>ǩ���ۿ�</p></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>���̷��ۿ�</td>
              <td width="30%"> 
                <input type="text" name="gcfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">��>0��<=10��</font></b> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="21" align="right"><font color="#FF0000">*</font>������ۿ�</td>
              <td><input type="text" name="glfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
              <td><input type="text" name="sjzk" size="8" maxlength="8" >
                <b><font color="#0000FF">��>=0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
              <td width="30%"><input type="text" name="sjfzk" size="8" maxlength="8" >
                <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td colspan="4" align="center"><p>���������</p></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�������ۿ�����</td>
              <td colspan="3">
			  <INPUT type="radio" name="zjxzklx" value="1" onClick="f_lx(insertform)">
                ͬ��ͬ
                <INPUT type="radio" name="zjxzklx" value="2" onClick="f_lx(insertform)">
                �����ۿ� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���������ۿ�</td>
              <td><input type="text" name="gczxzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>���̼����ۿ�</td>
              <td><input type="text" name="gcjxzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="21" align="right"><font color="#FF0000">*</font>���������ۿ�</td>
              <td><input type="text" name="zxglfzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>���������ۿ�</td>
              <td><input type="text" name="jxglfzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>����˰���ۿ�</td>
              <td><input type="text" name="zxsjzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>����˰���ۿ�</td>
              <td><input type="text" name="jxsjzk" value="" size="8" maxlength="8" >
                  <b><font color="#0000FF">��>=0��<=10��</font></b></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">�����</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="19"></textarea>              </td>
            </tr>
        </table>
</form>
	  

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_lx(FormName)//����FormName:Form������
{
	if (FormName.zjxzklx[0].checked)//ͬ��ͬ 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("������[���������]��");
		FormName.cxhdmc.focus();
		return false;
	}

	if(	javaTrim(FormName.gcfzk)=="") {
		alert("������[���̷��ۿ�]��");
		FormName.gcfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzk, "���̷��ۿ�"))) {
		return false;
	}
	if (FormName.gcfzk.value<=0 || FormName.gcfzk.value>10)
	{
		alert("����[���̷��ۿ�]Ӧ����0��10֮�䣡");
		FormName.gcfzk.select();
		return false;
	}

	if(	javaTrim(FormName.gczxzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����0��10֮�䣡");
		FormName.gczxzk.select();
		return false;
	}

	if(	javaTrim(FormName.glfzk)=="") {
		alert("������[������ۿ�]��");
		FormName.glfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
		FormName.glfzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjzk)=="") {
		alert("������[˰���ۿ�]��");
		FormName.sjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
		return false;
	}
	if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
	{
		alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
		FormName.sjzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjfzk)=="") {
		alert("������[��Ʒ��ۿ�]��");
		FormName.sjfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
		return false;
	}
	if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
	{
		alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.sjfzk.select();
		return false;
	}

	if(	!radioChecked(FormName.zjxzklx)) {
		alert("��ѡ��[�������ۿ�����]��");
		FormName.zjxzklx[0].focus();
		return false;
	}
	if (FormName.zjxzklx[0].checked)//ͬ��ͬ 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
	
	if(	javaTrim(FormName.gczxzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����0��10֮�䣡");
		FormName.gczxzk.select();
		return false;
	}

	if(	javaTrim(FormName.gcjxzk)=="") {
		alert("������[���̼����ۿ�]��");
		FormName.gcjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzk, "���̼����ۿ�"))) {
		return false;
	}
	if (FormName.gcjxzk.value<0 || FormName.gcjxzk.value>10)
	{
		alert("����[���̼����ۿ�]Ӧ����1��10֮�䣡");
		FormName.gcjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.zxglfzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.zxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxglfzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.zxglfzk.value<0 || FormName.zxglfzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����1��10֮�䣡");
		FormName.zxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxglfzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.jxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxglfzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.jxglfzk.value<0 || FormName.jxglfzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����1��10֮�䣡");
		FormName.jxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zxsjzk)=="") {
		alert("������[����˰���ۿ�]��");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxsjzk, "����˰���ۿ�"))) {
		return false;
	}
	if (FormName.zxsjzk.value<0 || FormName.zxsjzk.value>10)
	{
		alert("����[����˰���ۿ�]Ӧ����1��10֮�䣡");
		FormName.zxsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxsjzk)=="") {
		alert("������[����˰���ۿ�]��");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxsjzk, "����˰���ۿ�"))) {
		return false;
	}
	if (FormName.jxsjzk.value<0 || FormName.jxsjzk.value>10)
	{
		alert("����[����˰���ۿ�]Ӧ����1��10֮�䣡");
		FormName.jxsjzk.select();
		return false;
	}
	
	if(	javaTrim(FormName.clfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.clfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcfzk.select();
		return false;
	}
	if(	javaTrim(FormName.rgfzk)=="") {
		alert("������[�˹����ۿ�]��");
		FormName.rgfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfzk, "�˹����ۿ�"))) {
		return false;
	}
	if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
	{
		alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
		FormName.rgfzk.select();
		return false;
	}
	if(	javaTrim(FormName.ysfzk)=="") {
		alert("������[������ۿ�]��");
		FormName.ysfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysfzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ysfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxfzk)=="") {
		alert("������[��е���ۿ�]��");
		FormName.jxfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfzk, "��е���ۿ�"))) {
		return false;
	}
	if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
	{
		alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
		FormName.jxfzk.select();
		return false;
	}
	if(	javaTrim(FormName.shfzk)=="") {
		alert("������[��ķ��ۿ�]��");
		FormName.shfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.shfzk, "��ķ��ۿ�"))) {
		return false;
	}
	if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
	{
		alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.shfzk.select();
		return false;
	}
	if(	javaTrim(FormName.qtfzk)=="") {
		alert("������[�������ۿ�]��");
		FormName.qtfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfzk, "�������ۿ�"))) {
		return false;
	}
	if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
	{
		alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.qtfzk.select();
		return false;
	}
	
	if (parseFloat(FormName.gcfzk.value)!=10 && (parseFloat(FormName.clfzk.value)!=10 || parseFloat(FormName.zcfzk.value)!=10 || parseFloat(FormName.rgfzk.value)!=10 || parseFloat(FormName.ysfzk.value)!=10 || parseFloat(FormName.jxfzk.value)!=10 || parseFloat(FormName.shfzk.value)!=10 || parseFloat(FormName.qtfzk.value)!=10) )
	{
		alert("����[���̷��ۿ�]��[���̷Ѳ��ִ���]����ͬʱ���ڣ�");
		FormName.gcfzk.select();
		return false;
	}
	
	
	if(	javaTrim(FormName.gcfjzk)=="") {
		alert("������[���̷Ѿ��ۿ�]��");
		FormName.gcfjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfjzk, "���̷Ѿ��ۿ�"))) {
		return false;
	}
	if (FormName.gcfjzk.value<=0 || FormName.gcfjzk.value>10)
	{
		alert("����[���̷Ѿ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.gcfjzk.select();
		return false;
	}
	if(	javaTrim(FormName.jzk)=="") {
		alert("������[ȫ�����ۿ�]��");
		FormName.jzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzk, "ȫ�����ۿ�"))) {
		return false;
	}
	if (FormName.jzk.value<=0 || FormName.jzk.value>10)
	{
		alert("����[ȫ�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.jzk.select();
		return false;
	}

	if(	!radioChecked(FormName.hdlx)) {
		alert("��ѡ��[�����]��");
		FormName.hdlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgxqthd)) {
		alert("��ѡ��[�ɹ��������]��");
		FormName.kgxqthd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zklx)) {
		alert("��ѡ��[�ۿ�����]��");
		FormName.zklx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yxscdz)) {
		alert("��ѡ��[�Ƿ�����˫�ش���]��");
		FormName.yxscdz[0].focus();
		return false;
	}

	if (FormName.zklx[0].checked)
	{
		if (parseFloat(FormName.gcfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���̷��ۿ�]Ӧ��Ϊ10��");
			FormName.gcfzk.select();
			return false;
		}

		if (parseFloat(FormName.gczxzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���������ۿ�]Ӧ��Ϊ10��");
			FormName.gczxzk.select();
			return false;
		}

		if (parseFloat(FormName.glfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[������ۿ�]Ӧ��Ϊ10��");
			FormName.glfzk.select();
			return false;
		}
		if (parseFloat(FormName.sjzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[˰���ۿ�]Ӧ��Ϊ10��");
			FormName.sjzk.select();
			return false;
		}
		if (parseFloat(FormName.sjfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��Ʒ��ۿ�]Ӧ��Ϊ10��");
			FormName.sjfzk.select();
			return false;
		}
		if (parseFloat(FormName.gcfjzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���̷Ѿ��ۿ�]Ӧ��Ϊ10��");
			FormName.jzk.select();
			return false;
		}
		if (parseFloat(FormName.jzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[ȫ�����ۿ�]Ӧ��Ϊ10��");
			FormName.jzk.select();
			return false;
		}

	
		if (parseFloat(FormName.clfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.clfzk.select();
			return false;
		}
		if (parseFloat(FormName.zcfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.zcfzk.select();
			return false;
		}
		if (parseFloat(FormName.rgfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[�˹����ۿ�]Ӧ��Ϊ10��");
			FormName.rgfzk.select();
			return false;
		}
		if (parseFloat(FormName.ysfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[������ۿ�]Ӧ��Ϊ10��");
			FormName.ysfzk.select();
			return false;
		}
		if (parseFloat(FormName.jxfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��е���ۿ�]Ӧ��Ϊ10��");
			FormName.jxfzk.select();
			return false;
		}
		if (parseFloat(FormName.shfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.shfzk.select();
			return false;
		}
		if (parseFloat(FormName.qtfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[�������ۿ�]Ӧ��Ϊ10��");
			FormName.qtfzk.select();
			return false;
		}
	
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.kssj)=="") {
		alert("������[��ʼʱ��]��");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjssj)=="") {
		alert("������[��������ʱ��]��");
		FormName.cxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qdjssj)=="") {
		alert("������[ǩ������ʱ��]��");
		FormName.qdjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qdjssj, "ǩ������ʱ��"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.cxjssj.value)
	{
		alert("[��������ʱ��]����С��[��ʼʱ��]��");
		FormName.cxjssj.select();
		return false;
	}
	if (FormName.kssj.value>FormName.qdjssj.value)
	{
		alert("[ǩ������ʱ��]����С��[��ʼʱ��]��");
		FormName.qdjssj.select();
		return false;
	}




	FormName.action="SaveInsertJc_cxhd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
