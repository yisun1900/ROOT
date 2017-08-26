<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqbh=null;
String fpr=null;
String fpsj=null;
String khbh=null;
String cgmyd=null;
String sbyy=null;
String cgkh=null;
String ybjkh=null;
String ybjdz=null;
String hsqk=null;
String hsjg=null;
String wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select hsqk,hsjg,ybj_fpybj.sqbh,fpr,fpsj,ybj_fpybj.khbh,cgmyd,sbyy,b.khxm cgkh,a.khxm ybjkh,a.fwdz ybjdz";
	ls_sql+=" from  ybj_fpybj,ybj_cgsq,crm_khxx a,crm_khxx b";
	ls_sql+=" where  ybj_fpybj.sqbh=ybj_cgsq.sqbh";
	ls_sql+=" and ybj_fpybj.khbh=a.khbh and ybj_cgsq.khbh=b.khbh and sfyqd='Y'";
	ls_sql+=" and (ybj_fpybj.sqbh="+wheresqbh+") and  (ybj_fpybj.khbh='"+wherekhbh+"')  ";

    ls_sql+=" union ";

	ls_sql+=" select hsqk,hsjg,ybj_fpybj.sqbh,fpr,fpsj,ybj_fpybj.khbh,cgmyd,sbyy,b.khxm cgkh,a.khxm ybjkh,a.fwdz ybjdz";
	ls_sql+=" from  ybj_fpybj,ybj_cgsq,crm_khxx a,crm_zxkhxx b";
	ls_sql+=" where  ybj_fpybj.sqbh=ybj_cgsq.sqbh";
	ls_sql+=" and ybj_fpybj.khbh=a.khbh and ybj_cgsq.khbh=b.khbh and sfyqd='N'";
	ls_sql+=" and (ybj_fpybj.sqbh="+wheresqbh+") and  (ybj_fpybj.khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hsqk=cf.fillNull(rs.getString("hsqk"));
		hsjg=cf.fillNull(rs.getString("hsjg"));
		sqbh=cf.fillNull(rs.getString("sqbh"));
		fpr=cf.fillNull(rs.getString("fpr"));
		fpsj=cf.fillNull(rs.getDate("fpsj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cgmyd=cf.fillNull(rs.getString("cgmyd"));
		sbyy=cf.fillNull(rs.getString("sbyy"));
		cgkh=cf.fillNull(rs.getString("cgkh"));
		ybjkh=cf.fillNull(rs.getString("ybjkh"));
		ybjdz=cf.fillNull(rs.getString("ybjdz"));
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
<title>�����ιۻ�ִ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��ʵ�ιۻ�ִ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveHsYbj_fpybj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="35%"> <%=sqbh%>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ιۿͻ�</font></div>
              </td>
              <td width="35%"> <%=cgkh%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">������</font></td>
              <td width="35%"> <%=fpr%>
              </td>
              <td width="15%" align="right"><font color="#0000CC">����ʱ��</font></td>
              <td width="35%"> <%=fpsj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">�������</font></div>
              </td>
              <td width="35%"> <%=khbh%>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�����ͻ�</font></div>
              </td>
              <td width="35%"> <%=ybjkh%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">�ι������</font></div>
              </td>
              <td width="35%"> 
<%
	cf.selectToken(out,"Y+����&N+������",cgmyd,false);
%> 
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">������ַ</font></div>
              </td>
              <td width="35%"> <%=ybjdz%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">ʧ��ԭ��</font></td>
              <td colspan="3"> <%=sbyy%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ʵ���</td>
              <td width="35%"> 
<%
	cf.radioToken(out, "hsjg","Y+��ʵ&N+����ʵ",hsjg);
%>
               </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ʵ���</td>
              <td colspan="3"> 
                <textarea name="hsqk" cols="55" rows="3"><%=hsqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheresqbh"  value="<%=wheresqbh%>" >
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
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
	if(	!radioChecked(FormName.hsjg)) {
		alert("��ѡ��[��ʵ���]��");
		FormName.hsjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.hsqk)=="") {
		alert("������[��ʵ���]��");
		FormName.hsqk.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
