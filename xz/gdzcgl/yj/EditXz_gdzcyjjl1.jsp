<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String gsbh=null;
String gdzcmc=null;
String yjrxh=null;
String yjr=null;
String yjsj=null;
String jsrxh=null;
String jsr=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String yjrssbm=null;
String jsrssbm=null;
String yjrssfgs=null;
String jsrssfgs=null;
String wheregsbh=cf.GB2Uni(request.getParameter("gsbh"));
String whereyjsj=cf.GB2Uni(request.getParameter("yjsj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gsbh,gdzcmc,yjrxh,yjr,yjsj,jsrxh,jsr,lrr,lrsj,lrbm,xz_gdzcyjjl.bz,yjrssbm,jsrssbm,yjrssfgs,jsrssfgs ";
	ls_sql+=" from  xz_gdzcyjjl";
	ls_sql+=" where (gsbh='"+wheregsbh+"') and  (yjsj=TO_DATE('"+whereyjsj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gsbh=cf.fillNull(rs.getString("gsbh"));
		gdzcmc=cf.fillNull(rs.getString("gdzcmc"));
		yjrxh=cf.fillNull(rs.getString("yjrxh"));
		yjr=cf.fillNull(rs.getString("yjr"));
		yjsj=cf.fillNull(rs.getDate("yjsj"));
		jsrxh=cf.fillNull(rs.getString("jsrxh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		yjrssbm=cf.fillNull(rs.getString("yjrssbm"));
		jsrssbm=cf.fillNull(rs.getString("jsrssbm"));
		yjrssfgs=cf.fillNull(rs.getString("yjrssfgs"));
		jsrssfgs=cf.fillNull(rs.getString("jsrssfgs"));
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXz_gdzcyjjl.jsp" name="insertform">
  <div align="center">�޸Ĺ̶��ʲ��ƽ���Ϣ</div>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�̶��ʲ����</font></td>
      <td width="31%"> 
        <input type="text" name="gsbh" size="20" maxlength="20"  value="<%=gsbh%>" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">�̶��ʲ�����</font></td>
      <td width="30%"> 
        <input type="text" name="gdzcmc" size="20" maxlength="50"  value="<%=gdzcmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ��������ֹ�˾</font></td>
      <td width="31%"> 
        <select name="yjrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yjrssfgs+"'","");
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>�����������ֹ�˾</td>
      <td width="30%">
        <select name="jsrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select fgsbh from xz_gdzcssfw where gsbh='"+gsbh+"') order by dwbh",jsrssfgs);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ�����������</font></td>
      <td width="31%"> 
        <select name="yjrssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yjrssbm+"'","");
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>��������������</td>
      <td width="30%"> 
        <select name="jsrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+jsrssfgs+"' order by dwbh",jsrssbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">�ƽ���</font></td>
      <td width="31%">
        <select name="yjrxh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where ygbh='"+yjrxh+"' ",yjrxh);
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>������ </td>
      <td width="30%"> 
        <select name="jsrxh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="jsr.value=jsrxh.options[jsrxh.selectedIndex].text">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where   sfzszg in('Y','N') and dwbh='"+jsrssbm+"' order by yhmc",jsrxh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�ƽ�ʱ��</td>
      <td width="31%"> 
        <input type="text" name="yjsj" size="20" maxlength="10"  value="<%=yjsj%>" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="30%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
		<input type="hidden" name="yjr" value="<%=yjr%>" >
		<input type="hidden" name="jsr" value="<%=jsr%>" >
          <input type="hidden" name="oldjsrxh" value="<%=jsrxh%>" >
          <input type="hidden" name="oldyjsj" value="<%=yjsj%>" >
          <input type="hidden" name="wheregsbh"  value="<%=wheregsbh%>" >
          <input type="hidden" name="whereyjsj"  value="<%=whereyjsj%>" >
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����">
        </div>
      </td>
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
