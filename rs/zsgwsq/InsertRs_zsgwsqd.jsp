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

<body bgcolor="#FFFFFF">


<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String yhmc=null;
String xb=null;
String dwbh=null;
String xzzwbm=null;
String rzsj=null;
String lzrq=null;
String lzyy=null;

String fgsbh=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sqxh=null;

try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select NVL(max(substr(sqxh,6,5)),0)";
	ls_sql+=" from  rs_zsgwsqd";
	ls_sql+=" where fgsbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh=fgsbh+cf.addZero(count+1,5);

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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



<form method="post" action="SaveInsertRs_zsgwsqd.jsp" name="insertform" target="_blank">
  <div align="center">�����λ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">�������</font></td>
      <td width="30%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>�걨��˾</td>
      <td width="30%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>�����λ����</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fgsbh+"' and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="39" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>�����λ����</td>
      <td colspan="3"> 
        <input type="text" name="zsgwmc" value="" size="73" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>��������</td>
      <td width="30%"> 
        <input type="text" name="zbrs" value="" size="20" maxlength="8">
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>��������</td>
      <td width="30%"> 
        <input type="text" name="slrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>����������Ա�ṹ</td>
      <td colspan="3"> 
        <textarea name="bmryjg" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>������λְ��</td>
      <td colspan="3"> 
        <textarea name="zbgwzn" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>������λн�귶Χ</td>
      <td colspan="3"> 
        <input type="text" name="zbgwxcfw" value="" size="73" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>������������</td>
      <td colspan="3"> 
        <textarea name="sqzbly" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="30%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>��������</td>
      <td width="30%"> 
        <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("������[�������]��");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�걨��˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�����λ����]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zsgwmc)=="") {
		alert("��ѡ��[�����λ����]��");
		FormName.zsgwmc.select();
		return false;
	}
	if(	javaTrim(FormName.zbrs)=="") {
		alert("��ѡ��[��������]��");
		FormName.zbrs.select();
		return false;
	}
	if(!(isNumber(FormName.zbrs, "��������"))) {
		return false;
	}

	if(	javaTrim(FormName.slrq)=="") {
		alert("��ѡ��[��������]��");
		FormName.slrq.select();
		return false;
	}
	if(!(isDatetime(FormName.slrq, "��������"))) {
		return false;
	}

	if(	javaTrim(FormName.bmryjg)=="") {
		alert("��ѡ��[����������Ա�ṹ]��");
		FormName.bmryjg.select();
		return false;
	}
	if(	javaTrim(FormName.zbgwzn)=="") {
		alert("��ѡ��[������λְ��]��");
		FormName.zbgwzn.select();
		return false;
	}
	if(	javaTrim(FormName.zbgwxcfw)=="") {
		alert("��ѡ��[������λн�귶Χ]��");
		FormName.zbgwxcfw.select();
		return false;
	}

	if(	javaTrim(FormName.sqzbly)=="") {
		alert("������[������������]��");
		FormName.sqzbly.focus();
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
	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
