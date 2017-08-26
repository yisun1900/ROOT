<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String gdzcmc=null;
String ygbh=null;
String yjrssbm=null;
String yjrssfgs=null;
String bgr=null;
String gsbh=cf.GB2Uni(request.getParameter("gsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gsbh,gdzcmc,ygbh,dwbh,fgsbh,bgr";
	ls_sql+=" from  xz_gdzcb";
	ls_sql+=" where  (gsbh='"+gsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gsbh=cf.fillNull(rs.getString("gsbh"));
		gdzcmc=cf.fillNull(rs.getString("gdzcmc"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yjrssbm=cf.fillNull(rs.getString("dwbh"));
		yjrssfgs=cf.fillNull(rs.getString("fgsbh"));
		bgr=cf.fillNull(rs.getString("bgr"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertXz_gdzcyjjl.jsp" name="insertform" target="_blank">
<div align="center">�̶��ʲ��ƽ���¼</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�̶��ʲ����</font></td>
      <td width="31%"> 
        <input type="text" name="gsbh" value="<%=gsbh%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�̶��ʲ�����</font></td>
      <td width="32%"> 
        <input type="text" name="gdzcmc" value="<%=gdzcmc%>" size="20" maxlength="50" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ��������ֹ�˾</font></td>
      <td width="31%"> 
        <select name="yjrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yjrssfgs+"'","");
%> 
        </select>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�����������ֹ�˾</td>
      <td width="32%"> 
        <select name="jsrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
           <option value=""></option>
         <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select fgsbh from xz_gdzcssfw where gsbh='"+gsbh+"') order by dwbh","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ�����������</font></td>
      <td width="31%"> 
        <select name="yjrssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yjrssbm+"'","");
%> 
        </select>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>��������������</td>
      <td width="32%"> 
        <select name="jsrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <option value=""></option>
          <%
//	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fgsbh+"' order by dwbh","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ���</font></td>
      <td width="31%"> 
        <select name="yjrxh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where ygbh='"+ygbh+"' ",ygbh);
%> 
        </select>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>������</td>
      <td width="32%"> 
        <select name="jsrxh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="jsr.value=jsrxh.options[jsrxh.selectedIndex].text">
          <%
		out.println("<option value=\"\"></option>");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#CC0000">*</font>�ƽ�ʱ��</td>
      <td><input type="text" name="yjsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="hidden" name="yjr" value="<%=bgr%>" >
		<input type="hidden" name="jsr" value="" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//��ѯҳ��ʹ�ã���������������
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefgs(FormName)
{
	if(	javaTrim(FormName.jsrssfgs)=="") 
	{
		return false;
	}
	
	FormName.jsrssbm.length=1;
	FormName.jsrxh.length=1;
	
	var str="InsertXz_gdzcyjjlCx.jsp?jsrssfgs="+FormName.jsrssfgs.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.jsrssbm)=="") 
	{
		return false;
	}

	
	FormName.jsrxh.length=1;
	
	var str="InsertXz_gdzcyjjlCx.jsp?jsrssbm="+FormName.jsrssbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gsbh)=="") {
		alert("������[�̶��ʲ����]��");
		FormName.gsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcmc)=="") {
		alert("������[�̶��ʲ�����]��");
		FormName.gdzcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.yjrssfgs)=="") {
		alert("������[�ƽ��������ֹ�˾]��");
		FormName.yjrssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yjrssbm)=="") {
		alert("������[�ƽ�����������]��");
		FormName.yjrssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjrxh)=="") {
		alert("������[�ƽ���]��");
		FormName.yjrxh.focus();
		return false;
	}
	if(!(isNumber(FormName.yjrxh, "�ƽ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("������[�ƽ�ʱ��]��");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jsrssfgs)=="") {
		alert("������[�����������ֹ�˾]��");
		FormName.jsrssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrssbm)=="") {
		alert("������[��������������]��");
		FormName.jsrssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrxh)=="") {
		alert("������[������]��");
		FormName.jsrxh.focus();
		return false;
	}
	if(!(isNumber(FormName.jsrxh, "������"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
