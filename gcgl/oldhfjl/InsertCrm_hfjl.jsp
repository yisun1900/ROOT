<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	//�طü�¼��
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	hfjlh=khbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center"><b>��<%=khxm%>��</b>�ɻط�����¼�루�طü�¼�ţ�<%=hfjlh%>��</div>

<table width="100%">
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_hfjl.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">���ʦ</td>
              <td width="37%">��Ʒ�����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%><br>
                ���ڷ���<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%><br>
                ���������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%> </td>
              <td width="15%" align="right">���ʦ�ط�����</td>
              <td width="35%"> 
                <textarea name="sjshfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">���̵���</td>
              <td width="37%">����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%><br>
                ��λ��<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%><br>
                ����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%></td>
              <td width="15%" align="right">���̵����ط�����</td>
              <td width="35%"> 
                <textarea name="zjyhfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">ʩ����</td>
              <td width="37%">�������ʣ�<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%><br>
                ʩ��������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%><br>
                �������ʣ�<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%> </td>
              <td width="15%" align="right">ʩ���ӻط�����</td>
              <td width="35%"> 
                <textarea name="sgdhfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">�ط�����</td>
              <td width="37%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option  value="24" selected>�깤�ط�</option>
                </select>
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">�ط�ʱ��</td>
              <td width="37%"> 
                <input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">�ط���</td>
              <td width="35%"> 
                <input type="text" name="hfr" value="<%=yhdlm%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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

	if(	javaTrim(FormName.hfr)=="") {
		alert("������[�ط���]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[�ط�ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
