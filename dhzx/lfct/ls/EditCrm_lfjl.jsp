<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ά������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "����";
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String dwbh=(String)session.getAttribute("dwbh");

String khxm=null;
String fwdz=null;
String sjs=null;
String khbh=null;

String lfjlh=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;
String xfxqr=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select lfjlh,crm_lfjl.khbh,lflxbm,smmb,jhsmsj,jhsmry,xfxqr,lrr,lrsj,lrbm,bz";
	ls_sql+=" from  crm_lfjl ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lflxbm=rs.getString("lflxbm");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		khbh=rs.getString("khbh");
		xfxqr=rs.getString("xfxqr");
		lrr=rs.getString("lrr");
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=rs.getString("lrbm");
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs";
	ls_sql+=" from  crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
	}
	rs.close();
	ps.close();
%>


<body>
<form name="form1" action="SaveEditCrm_lfjl.jsp" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">�����ƻ��޸�</div></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF" ><span class="STYLE2">�ͻ����</span></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khbh%></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">�ͻ�����</span> </td>
    <td bgcolor="#FFFFFF"><%=khxm%></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE2">���ݵ�ַ</span></td>
    <td bgcolor="#FFFFFF"><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">���ʦ</span></td>
    <td bgcolor="#FFFFFF"><%=sjs%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�ƻ�����ʱ��</td>
    <td bgcolor="#FFFFFF"><input type="text" name="jhsmsj" value="<%=jhsmsj%>"/></td>

	 <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>��������       </td>
    <td width="32%" bgcolor="#FFFFFF">      <select name="lflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option></option>
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm ",lflxbm);
	  %> 
    </select></td>
   </tr>
   <tr>
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�ƻ�������Ա</td>
    <td bgcolor="#FFFFFF" colspan=3><input name="jhsmry" type="text" value="<%=jhsmry%>" size="71" maxlength="50"/></td>
  </tr>
 
  <tr>
	 <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>����Ŀ��</td>
    <td bgcolor="#FFFFFF" colspan=3> <textarea name="smmb" cols="70" rows="6"><%=smmb%></textarea></td> 
	</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font>�Ƿ��������Աȷ��</td>
    <td><%
					cf.radioToken(out, "xfxqr","Y+��ȷ��&N+����ȷ��",xfxqr);
			  %></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">¼����</span></td>
    <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">¼��ʱ��</span></td>
    <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><span class="STYLE2">¼�벿��</span></td>
    <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><textarea name="bz" cols="75" rows="2"><%=bz%></textarea>
    </td>
  </tr>
<tr>	
    <td colspan="4" align="center"> 
        <input type="button" name="Submit" value="����" onClick="f_do(form1)"/>
		 <input type="reset" name="Submit2" value="����">
		 <input type="hidden" name="lfjlh" value="<%=lfjlh%>" />      </td>
</tr>
</table>
</form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.lflxbm)=="")
	{
		alert("�������Ͳ���Ϊ��");
		FormName.lflxbm.focus();
		return flase();
	}
	if(javaTrim(FormName.jhsmry)=="")
	{
		alert("�ƻ�������Ա����Ϊ��");
		FormName.jhsmry.focus();
		return flase();
	}
	
	if(javaTrim(FormName.smmb)=="")
	{
		alert("����Ŀ�겻��Ϊ��");
		FormName.smmb.focus();
		return flase();
	}
	
	if(javaTrim(FormName.jhsmsj)=="")
	{
		alert("�ƻ�����ʱ�䲻��Ϊ��");
		FormName.jhsmsj.focus();
		return flase();
	}

	if(	!radioChecked(FormName.xfxqr)) {
		alert("��ѡ��[�Ƿ��������Աȷ��]��");
		FormName.xfxqr[0].focus();
		return false;
	}
	
	if(!(isDatetime(FormName.jhsmsj, "¼��ʱ��"))) {
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

</SCRIPT>
