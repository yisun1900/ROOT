<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
String zcmc=null;
double dj=0;
String sl=null;
double jsbl=0;
double cbj=0;
String xinghao=null;
String gg=null;
String jsfs =null;
String sxbz =null;
String sxhtyy =null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zcbm,xsxh,zcmc,xinghao,gg,jsfs,jsbl,cbj,dj,DECODE(sxbz,'1','����д','2','��д') sxbz,sxhtyy";
	ls_sql+=" from  bj_khzcmx";
	ls_sql+=" where xh="+xh;
	ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		jsfs=cf.fillNull(rs.getString("jsfs"));
		jsbl=rs.getDouble("jsbl");
		cbj=rs.getDouble("cbj");
		dj=rs.getDouble("dj");
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxhtyy=cf.fillNull(rs.getString("sxhtyy"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_khzcmxJsj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">���ı���</font></td>
              <td width="31%"><%=zcbm%></td>
              <td width="19%" align="right"><font color="#0000CC">��������</font></td>
              <td width="31%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">�ͺ�</font></td>
              <td width="31%"><%=xinghao%></td>
              <td width="19%" align="right"><font color="#0000CC">���</font></td>
              <td width="31%"><%=gg%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">��д��־</td>
              <td width="31%"><%=sxbz%></td> 
              <td width="19%" align="right">��д��ͬԭ��</td>
              <td width="31%"><%=sxhtyy%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>�����</td>
              <td><input type="text" name="cbj" size="17" maxlength="9"  value="<%=cbj%>"  >
Ԫ</td>
              <td align="right"><font color="#0000CC">ʵ������</font></td>
              <td><%=dj%>Ԫ
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input name="jsbl" type="hidden" value="<%=jsbl%>" size="10" maxlength="9"  >
				<input type="hidden" name="jsfs"  value="<%=jsfs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
				<input type="hidden" name="xh"  value="<%=xh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>              </td>
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

	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�����]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�����"))) {
		return false;
	}

	if (parseFloat(FormName.cbj.value)<0 )
	{
		alert("[�����]������ڵ���0��");
		FormName.cbj.select();
		return false;
	}

	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}

	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("[�������]ֻ����0��100֮�䣡");
		FormName.jsbl.select();
		return false;
	}

		if (parseFloat(FormName.cbj.value) > <%=dj%>)
		{
			alert("���ѣ�[ʵ������:<%=dj%>]С��[�����:"+FormName.cbj.value+"]");
		}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
