<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String btsr=null;
String tsnr=null;
String tsr=null;
String tssj=null;
String slr=null;
String slsj=null;
String slbm=null;
String clzt=null;
String clr=null;
String clkssj=null;
String cljssj=null;
String clqk=null;

String btsfgs=null;
String btsbm=null;
String slfgs=null;

String wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select slfgs,btsfgs,btsbm,tsjlh,btsr,tsnr,tsr,tssj,slr,slsj,slbm,clzt,clr,clkssj,cljssj,clqk ";
	ls_sql+=" from  crm_nbtsjl";
	ls_sql+=" where  (tsjlh="+wheretsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		slfgs=cf.fillNull(rs.getString("slfgs"));
		btsfgs=cf.fillNull(rs.getString("btsfgs"));
		btsbm=cf.fillNull(rs.getString("btsbm"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		btsr=cf.fillNull(rs.getString("btsr"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		tsr=cf.fillNull(rs.getString("tsr"));
		tssj=cf.fillNull(rs.getDate("tssj"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slbm=cf.fillNull(rs.getString("slbm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clr=cf.fillNull(rs.getString("clr"));
		clkssj=cf.fillNull(rs.getDate("clkssj"));
		cljssj=cf.fillNull(rs.getDate("cljssj"));
		clqk=cf.fillNull(rs.getString("clqk"));
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
<title>�����ڲ�Ͷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����ڲ�������������¼�ţ�<%=tsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveClCrm_nbtsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"><%=btsr%> </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"><%=tsr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������ֹ�˾</td>
              <td width="33%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+btsfgs+"'",btsfgs,true);
	%> </td>
              <td width="18%" align="right">����������</td>
              <td width="32%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+btsbm+"'",btsbm,true);
	%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="33%"> <%=tssj%> </td>
              <td width="18%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="33%"> <%=slsj%> </td>
              <td width="18%"> 
                <div align="right">¼����</div>
              </td>
              <td width="32%"> <%=slr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��������</td>
              <td colspan="3"> <%=tsnr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="33%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ����&2+�ڴ���&3+�ѽ��","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����ʼʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="clkssj" size="20" maxlength="10"  value="<%=clkssj%>" >
              </td>
              <td width="18%"> 
                <div align="right">�������ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cljssj" size="20" maxlength="10"  value="<%=cljssj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������</td>
              <td colspan="3"> 
                <textarea name="clqk" cols="71" rows="5"><%=clqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheretsjlh"  value="<%=wheretsjlh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
	if(	javaTrim(FormName.clzt)=="") {
		alert("������[����״̬]��");
		FormName.clzt.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("������[������]��");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clqk)=="") {
		alert("������[�������]��");
		FormName.clqk.focus();
		return false;
	}
	if(	javaTrim(FormName.clkssj)=="") {
		alert("������[����ʼʱ��]��");
		FormName.clkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clkssj, "����ʼʱ��"))) {
		return false;
	}
	if (FormName.clzt.value=="3")
	{
		if(	javaTrim(FormName.cljssj)=="") {
			alert("������[�������ʱ��]��");
			FormName.cljssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cljssj, "�������ʱ��"))) {
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
