<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String sgd=null;
String sgbz=null;
String pdr=null;
String pdsj=null;
String hfsj=null;
String hfr=null;
String hfjl=null;
String jjyy=null;
String hsqk=null;
String dwbh=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,sgd,sgbz,pdsj,pdr,hfsj,hfr,hfjl,jjyy,hsqk,dwbh ";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		jjyy=cf.fillNull(rs.getString("jjyy"));
		hsqk=cf.fillNull(rs.getString("hsqk"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	if (dwbh.equals(""))
	{
		dwbh=(String)session.getAttribute("dwbh");
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ظ��ɵ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditPd_pdjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="32%"> <%=khbh%>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">ʩ����</font></td>
              <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> 
              </td>
              <td width="15%" align="right"><font color="#0000FF">ʩ������</font></td>
              <td width="35%"> <%=sgbz%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ɵ���</font></div>
              </td>
              <td width="32%"> <%=pdr%>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">�ɵ�ʱ��</font></div>
              </td>
              <td width="35%"> <%=pdsj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ظ���</td>
              <td width="32%"> 
                <input type="text" name="hfr" size="20" maxlength="20"  value="<%=yhdlm%>" readonly>
              </td>
              <td width="15%" align="right">�ظ�ʱ��</td>
              <td width="35%"> 
                <input type="text" name="hfsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ظ�����</div>
              </td>
              <td width="32%"> 
                <select name="hfjl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectToken(out,"4+�����ɵ�&3+�ܾ��ɵ�",hfjl);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ظ�����</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ܾ�ԭ��</div>
              </td>
              <td colspan="3"> 
                <textarea name="jjyy" cols="55" rows="3"><%=jjyy%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> <font color="#0000CC">�쵼�������<BR>
                �����쵼��д��</font></td>
              <td colspan="3"> 
                <textarea name="ldspyj" cols="55" rows="3" readonly="true"></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)" <% if (hfjl.equals("5")) out.println("disabled");%>>
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
	if(	javaTrim(FormName.hfr)=="") {
		alert("������[�ظ���]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[�ظ�ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ظ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.hfjl)=="") {
		alert("������[�ظ�����]��");
		FormName.hfjl.focus();
		return false;
	}
	if (FormName.hfjl.value=="3")
	{
		if(	javaTrim(FormName.jjyy)=="") {
			alert("������[�ܾ�ԭ��]��");
			FormName.jjyy.focus();
			return false;
		}
	}
	else{
		FormName.jjyy.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
