<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String[] ygbh=request.getParameterValues("ygbh");
%>
<title>��������Ϣ����</title>
<div align="center">
  <p><font color="red"><b>������Ϣ����:<%=ygbh.length%></b></font></p>
  </div>
<form method="post" name="selectform">
<%
for (int i=0;i<ygbh.length;i++)
{
	out.print("<input type=\"hidden\" value=\""+ygbh[i]+"\" name=\"ygbh\" >");
}
%>
<DIV align="center">
  <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">��Ϣǰ׺</td>
      <td width="75%"> 
	   <select name="xxqz" style="FONT-SIZE:12PX;WIDTH:200PX">
                  <option value=""></option>
                  <option value="Y">�Զ�ƥ��ͻ������Ա�</option>
                  <option value="N">ֻ������Ϣ��ƥ������</option>
                </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">��Ϣ����</td>
      <td width="75%"> 
        <textarea name="xxnr" rows="5" cols="55"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center">
          <input type="button"  value="����" onClick="f_ph(selectform)" name="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset"  value="����" name="reset">
        </div>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center">
          ����ʱ��:<input type="text" name="dfsj" size="11" maxlength="10"  ondblclick="JSCalendar(this)">
		  Сʱ:<select name="dfxs" style="FONT-SIZE:12PX;WIDTH:60PX">
                  <option value=""></option>
                  <option value="0">00:00</option>
				  <option value="1">01:00</option>
				  <option value="2">02:00</option>
				  <option value="3">03:00</option>
				  <option value="4">04:00</option>
				  <option value="5">05:00</option>
				  <option value="6">06:00</option>
				  <option value="7">07:00</option>
				  <option value="8">08:00</option>
				  <option value="9">09:00</option>
				  <option value="10">10:00</option>
				  <option value="11">11:00</option>
				  <option value="12">12:00</option>
				  <option value="13">13:00</option>
				  <option value="14">14:00</option>
				  <option value="15">15:00</option>
				  <option value="16">16:00</option>
				  <option value="17">17:00</option>
				  <option value="18">18:00</option>
				  <option value="19">19:00</option>
				  <option value="20">20:00</option>
				  <option value="21">21:00</option>
				  <option value="22">22:00</option>
				  <option value="23">23:00</option>
                </select>
          <input type="button"  value="��ʱ����" onClick="f_df(selectform)" name="button">
        </div>
      </td>
    </tr>
	<tr> 
      <td colspan="2"  bgcolor="#FFFFFF"> 
         <div align="left">
  <p><font color="red"><b>������Ϣǰ׺:</b></font></p>
  <p><font color="blue">ѡ���Զ�ƥ��ͻ������Ա�:</font>ϵͳ�Զ��ӿͻ������ж�ȡ�ͻ�����,�Ա�,��ӵ���Ϣ��,;����,�ͻ�����:����,�Ա�:��.ϵͳ���Զ���������Ϣ����ǰ������ "��������,"</p>
  <p><font color="blue">ѡ��ֻ������Ϣ��ƥ������:</font>ϵͳֻ�������������Ϣ����!</p>
  <p><font color="blue">��Ϣ����:</font>��Ϣ���ݲ��ܳ���60����,�����ѡ����[�Զ�ƥ��ͻ������Ա�]��Ϣ���ݲ��ܳ���55����,�������ϵͳ��ʾ:��Ϣ���ݳ���!!!</p>
   <p><font color="blue">��ʱ����:</font>��ʱ����ʱ����ϵͳʱ��Ϊ׼,��������ǰ1Сʱ�趨���Ķ�ʱ����!</p>
  </div>
      </td>
    </tr>
  </table>
  </DIV>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xxqz)=="") {
		alert("��ѡ��[��Ϣǰ׺]��");
		FormName.xxqz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxnr)=="") {
		alert("������[��Ϣ����]��");
		FormName.xxnr.focus();
		return false;
	}
	var maxzs=60
	if (javaTrim(FormName.xxqz)=="Y")
	{
		maxzs=55
	}
	if (FormName.xxnr.value.length>maxzs)
	{
		alert("��Ϣ���ݳ���!!!");
		FormName.xxnr.focus();
		return false;
	}
	FormName.action="dx_plqfyg.jsp";
	FormName.submit();
	return true;
}
function f_df(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xxqz)=="") {
		alert("��ѡ��[��Ϣǰ׺]��");
		FormName.xxqz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxnr)=="") {
		alert("������[��Ϣ����]��");
		FormName.xxnr.focus();
		return false;
	}
	if(	javaTrim(FormName.dfsj)=="") {
		alert("������[����ʱ��]��");
		FormName.dfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.dfsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dfxs)=="") {
		alert("��ѡ��[Сʱ]��");
		FormName.dfxs.focus();
		return false;
	}
	var maxzs=60
	if (javaTrim(FormName.xxqz)=="Y")
	{
		maxzs=55
	}
	if (FormName.xxnr.value.length>maxzs)
	{
		alert("��Ϣ���ݳ���!!!");
		FormName.xxnr.focus();
		return false;
	}
	FormName.action="dx_saverdsfsyg.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>