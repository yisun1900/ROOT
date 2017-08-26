<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sgd=null;
String fksj=null;
String fkr=null;
String fkje=null;
String fkyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String shr=null;
String shsj=null;
String shsm=null;
String skksm=null;
String fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sgd,fksj,fkr,fkje,fkyy,lrr,lrsj,lrbm,bz,shr,shsj,shsm,skksm ";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where  (fkjlh='"+fkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		fksj=cf.fillNull(rs.getDate("fksj"));
		fkr=cf.fillNull(rs.getString("fkr"));
		fkje=cf.fillNull(rs.getString("fkje"));
		fkyy=cf.fillNull(rs.getString("fkyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));
		skksm=cf.fillNull(rs.getString("skksm"));
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
<title>ʩ���ӷ���ۿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveKkCw_sgdfkjl.jsp" name="editform">
<div align="center">ʩ���ӷ���ۿ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>������Ϣ</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">�����¼��</span></td>
    <td><input type="text" name="fkjlh" value="<%=fkjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">ʩ����</span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','') from sq_sgd where sgd='"+sgd+"'",sgd);
%>
      </select>    </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">������</span></td>
  <td><%=fkr%></td>
  <td align="right"><span class="STYLE3">����ʱ��</span></td>
  <td><%=fksj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">����ԭ��</span></td>
  <td colspan="3"><%=fkyy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE3">¼����</span></td> 
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%"><span class="STYLE3">¼��ʱ��</span></td> 
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">¼�벿��</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE3">��ע</span></td> 
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>�����Ϣ</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">������</span></td>
  <td><%=fkje%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">�����</span></td>
  <td><%=shr%></td>
  <td align="right"><span class="STYLE3">���ʱ��</span></td>
  <td><%=shsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">���˵��</span></td>
  <td colspan="3">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">ʵ�ۿ���</span></td>
  <td><input type="text" name="skkr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">ʵ�ۿ�ʱ��</span></td>
  <td><input type="text" name="skksj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ۿ�˵��</td>
  <td colspan="3"><textarea name="skksm" cols="75" rows="3"><%=skksm%></textarea></td>
</tr>
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
	if(	javaTrim(FormName.skkr)=="") {
		alert("������[ʵ�ۿ���]��");
		FormName.skkr.focus();
		return false;
	}
	if(	javaTrim(FormName.skksj)=="") {
		alert("������[ʵ�ۿ�ʱ��]��");
		FormName.skksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.skksj, "ʵ�ۿ�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
