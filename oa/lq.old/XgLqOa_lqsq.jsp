<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");


String bgypbm=null;
String slr=null;
String sqrq=null;
String jhlqsl=null;
String jhlqrq=null;
String lqzt=null;
String slqsl=null;
String blr=null;
String lqsj=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bgypbm,slr,sqrq,jhlqsl,jhlqrq,lqzt,slqsl,blr,lqsj,bz ";
	ls_sql+=" from  oa_lqsq";
	ls_sql+=" where  xh="+wherexh;
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bgypbm=cf.fillNull(rs.getString("bgypbm"));
		slr=cf.fillNull(rs.getString("slr"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		jhlqsl=cf.fillNull(rs.getString("jhlqsl"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lqzt=cf.fillNull(rs.getString("lqzt"));
		slqsl=cf.fillNull(rs.getString("slqsl"));
		blr=cf.fillNull(rs.getString("blr"));
		lqsj=cf.fillNull(rs.getDate("lqsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}

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

<html>
<head>
<title>��ȡ�칫��Ʒ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��ȡ�칫��Ʒ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveXgLqOa_lqsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�칫��Ʒ</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select bgypbm,bgypmc from oa_bgypbm order by bgypbm",bgypbm,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">������</font></div>
              </td>
              <td width="32%"> <%=slr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">��������</font></div>
              </td>
              <td width="32%"> <%=sqrq%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ƻ���ȡ����</font></div>
              </td>
              <td width="32%"> <%=jhlqsl%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ƻ���ȡ����</font></div>
              </td>
              <td width="32%"> <%=jhlqrq%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ȡ״̬</div>
              </td>
              <td width="32%"> 
                <select name="lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">����ȡ</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">ʵ��ȡ����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="slqsl" size="20" maxlength="8"  value="<%=slqsl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="blr" size="20" maxlength="20"  value="<%=blr%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">��ȡʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lqsj" size="20" maxlength="10"  value="<%=lqsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
	if(	javaTrim(FormName.slqsl)=="") {
		alert("������[ʵ��ȡ����]��");
		FormName.slqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.slqsl, "ʵ��ȡ����"))) {
		return false;
	}
	if (FormName.slqsl.value=="0")
	{
		alert("[ʵ��ȡ����]����Ϊ0��");
		FormName.slqsl.select();
		return false;
	}
	if(	javaTrim(FormName.blr)=="") {
		alert("������[������]��");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("������[��ȡʱ��]��");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "��ȡʱ��"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
