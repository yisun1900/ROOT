<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppgys=null;
String zcdlbm=null;
String zcxlbm=null;
String yj=null;
String zhj=null;
String dj=null;
String ssk=null;
String rq=null;
String bz=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String whereppgys=cf.getParameter(request,"ppgys");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppgys,zcdlbm,zcxlbm,yj,zhj,dj,ssk,rq,bz ";
	ls_sql+=" from  jc_khzcgmmx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (ppgys='"+whereppgys+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppgys=cf.fillNull(rs.getString("ppgys"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		yj=cf.fillNull(rs.getString("yj"));
		zhj=cf.fillNull(rs.getString("zhj"));
		dj=cf.fillNull(rs.getString("dj"));
		ssk=cf.fillNull(rs.getString("ssk"));
		rq=cf.fillNull(rs.getDate("rq"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_khzcgmmx.jsp" name="editform">
<div align="center">�޸ģ��ͻ����Ĺ�����ϸ���ͻ���ţ�<%=wherekhbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">���Ĵ���</td>
  <td bgcolor="#FFFFCC"><%=zcdlbm%></td>
  <td align="right" bgcolor="#FFFFCC">����С��</td>
  <td bgcolor="#FFFFCC"><%=zcxlbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC">Ʒ�ƹ�Ӧ������</td> 
  <td colspan="3" bgcolor="#FFFFCC"><%=ppgys%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>ԭ��</td> 
  <td width="32%"><input type="text" name="yj" size="20" maxlength="17"  value="<%=yj%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�ۺ��</td> 
  <td width="32%"><input type="text" name="zhj" size="20" maxlength="17"  value="<%=zhj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>����</td> 
  <td width="32%"><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>ʵ�տ�</td> 
  <td width="32%"><input type="text" name="ssk" size="20" maxlength="17"  value="<%=ssk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"><input type="text" name="rq" size="20" maxlength="10"  value="<%=rq%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
<input type="hidden" name="whereppgys"  value="<%=whereppgys%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.yj)=="") {
		alert("������[ԭ��]��");
		FormName.yj.focus();
		return false;
	}
	if(!(isFloat(FormName.yj, "ԭ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zhj)=="") {
		alert("������[�ۺ��]��");
		FormName.zhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhj, "�ۺ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("������[ʵ�տ�]��");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "ʵ�տ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.rq, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
