<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String hfjlh=null;
String jglxmc=null;
String khbh=null;

String hfsm=null;

String clfs=null;
String hfbm=null;
String hfsj=null;
String hfr=null;

String khxm=null;
String bz=null;
String fwdz=null;


String dwbh=null;
String dwmc=null;
String clzt=null;
String xwtclqk=null;
String clr=null;
String clsj=null;


String wherehfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_sjhfjl.bz,khxm,fwdz,crm_sjhfjl.hfjlh,jglxmc,dwmc,crm_sjhfjl.khbh,hfsm,crm_sjhfjl.clfs,crm_sjhfjl.hfsj,crm_sjhfjl.hfr";
	ls_sql+=" from  crm_sjhfjl,dm_jglxbm,crm_khxx,sq_dwxx";
	ls_sql+=" where crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm and crm_sjhfjl.hfbm=sq_dwxx.dwbh and  (crm_sjhfjl.hfjlh="+wherehfjlh+")  ";
	ls_sql+=" and crm_sjhfjl.khbh=crm_khxx.khbh";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		jglxmc=cf.fillNull(rs.getString("jglxmc"));
		khbh=cf.fillNull(rs.getString("khbh"));

		hfbm=cf.fillNull(rs.getString("dwmc"));
		hfsm=cf.fillNull(rs.getString("hfsm"));

		clfs=cf.fillNull(rs.getString("clfs"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
	}
	rs.close();

	ls_sql="select dwmc,clzt,xwtclqk,clr,clsj ";
	ls_sql+=" from  crm_sjhffkbm,sq_dwxx";
	ls_sql+=" where  crm_sjhffkbm.dwbh=sq_dwxx.dwbh and hfjlh="+wherehfjlh+" and crm_sjhffkbm.dwbh='"+wheredwbh+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		clzt=cf.fillNull(rs.getString("clzt"));
		xwtclqk=cf.fillNull(rs.getString("xwtclqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));

		if (clr.equals(""))
		{
			clr=yhmc;
		}
		if (clsj.equals(""))
		{
			clsj=cf.today();
		}
	}
	rs.close();

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
<title>����ط�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">��<%=dwmc%>������ط�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveClCrm_hfjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"> �طü�¼�� </td>
              <td><%=hfjlh%> </td>
              <td align="right">�طý��</td>
              <td><%=jglxmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �ͻ���� </td>
              <td><%=khbh%> </td>
              <td align="right"> �ͻ����� </td>
              <td><%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ط�˵��</td>
              <td colspan="3"><%=hfsm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ط���</td>
              <td><%=hfr%></td>
              <td align="right">�طò���</td>
              <td><%=hfbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ����ʽ </td>
              <td><%
	cf.selectToken(out,"0+���账��&1+������ز���",clfs,true);
%>
              </td>
              <td align="right">�ط�ʱ��</td>
              <td><%=hfsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" height="18">��ע</td>
              <td colspan="3" height="18"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��ز��Ŵ������</td>
              <td colspan="3"> 
                <textarea name="xwtclqk" cols="69" rows="10"><%=xwtclqk%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">������</div>              </td>
              <td width="32%"> 
                <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" readonly>              </td>
              <td width="21%"> 
                <div align="right">����ʱ��</div>              </td>
              <td width="34%"> 
                <input type="text" name="clsj" size="20" maxlength="10"  value="<%=clsj%>" readonly>
                <input type="hidden" name="wherehfjlh"  value="<%=wherehfjlh%>" >
                <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >              </td>
            </tr>
            <tr> 
              <td width="22%" height="2">&nbsp;</td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>              </td>
              <td width="21%" height="2">&nbsp;</td>
              <td width="34%" height="2"> 
                <input type="reset"  value="����">              </td>
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
	if(	javaTrim(FormName.xwtclqk)=="") {
		alert("��ѡ��[��ز��Ŵ������]��");
		FormName.xwtclqk.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("��ѡ��[������]��");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
