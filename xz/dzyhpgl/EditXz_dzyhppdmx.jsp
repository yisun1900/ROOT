<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

String pdxh=null;
String bh=null;
String mc=null;
String dw=null;
String sl=null;
String xhjgg=null;
String grsj=null;
String dwbh=null;
String gryz=null;
String zrr=null;
String pdr=null;
String pdsj=null;
String bz=null;
String wherepdxh=cf.GB2Uni(request.getParameter("pdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pdxh,bh,mc,dw,sl,xhjgg,grsj,dwbh,gryz,zrr,pdr,pdsj,bz ";
	ls_sql+=" from  xz_dzyhppdmx";
	ls_sql+=" where  (pdxh='"+wherepdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdxh=cf.fillNull(rs.getString("pdxh"));
		bh=cf.fillNull(rs.getString("bh"));
		mc=cf.fillNull(rs.getString("mc"));
		dw=cf.fillNull(rs.getString("dw"));
		sl=cf.fillNull(rs.getString("sl"));
		xhjgg=cf.fillNull(rs.getString("xhjgg"));
		grsj=cf.fillNull(rs.getDate("grsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		gryz=cf.fillNull(rs.getString("gryz"));
		zrr=cf.fillNull(rs.getString("zrr"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_dzyhppdmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�̵����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pdxh" size="20" maxlength="7"  value="<%=pdxh%>" readonly >
              </td>
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bh" size="20" maxlength="10"  value="<%=bh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mc" size="20" maxlength="20"  value="<%=mc%>" >
              </td>
              <td width="15%"> 
                <div align="right">��λ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dw" size="20" maxlength="2"  value="<%=dw%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" size="20" maxlength="9"  value="<%=sl%>" >
              </td>
              <td width="15%"> 
                <div align="right">�ͺż����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xhjgg" size="20" maxlength="20"  value="<%=xhjgg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="grsj" size="20" maxlength="10"  value="<%=grsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">ʹ�ò���</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
			if (yhjs.equals("A0") || yhjs.equals("A1"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where   dwlx in ('A0','A1','F0','F1','F2') order by dwbh",dwbh);
			}
			else if (yhjs.equals("F0") || yhjs.equals("F1"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where    dwlx in ('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh",dwbh);
			}
			else
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
			}
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ԭֵ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gryz" size="20" maxlength="17"  value="<%=gryz%>" >
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zrr" size="20" maxlength="8"  value="<%=zrr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�̵���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pdr" size="20" maxlength="8"  value="<%=pdr%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">�̵�ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=pdsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="79" rows="3"><%=bz%></textarea>
                <div align="right">&nbsp;</div>
              </td>
            </tr>
            <input type="hidden" name="wherepdxh"  value="<%=wherepdxh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.pdxh)=="") {
		alert("������[�̵����]��");
		FormName.pdxh.focus();
		return false;
	}
	if(	javaTrim(FormName.bh)=="") {
		alert("������[���]��");
		FormName.bh.focus();
		return false;
	}
	if(	javaTrim(FormName.mc)=="") {
		alert("������[����]��");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.dw)=="") {
		alert("������[��λ]��");
		FormName.dw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.grsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[ʹ�ò���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isFloat(FormName.gryz, "����ԭֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("������[�̵�ʱ��]��");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�̵�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
