<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String cpbm=null;
String clgw=null;
String pp=null;
String gys=null;
String sjfy=null;
String ysqk=null;
String yazrq=null;
String sazrq=null;
String sl=null;
String bz=null;
String azbz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,cpbm,clgw,pp,gys,sjfy,ysqk,yazrq,sazrq,sl,bz,azbz ";
	ls_sql+=" from  crm_dgqk";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (cpbm='"+wherecpbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		clgw=cf.fillNull(rs.getString("clgw"));
		pp=cf.fillNull(rs.getString("pp"));
		gys=cf.fillNull(rs.getString("gys"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		ysqk=cf.fillNull(rs.getString("ysqk"));
		yazrq=cf.fillNull(rs.getDate("yazrq"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		sl=cf.fillNull(rs.getString("sl"));
		bz=cf.fillNull(rs.getString("bz"));
		azbz=cf.fillNull(rs.getString("azbz"));
	}
	rs.close();

	ls_sql="select khxm,fwdz,lxfs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
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
<title>��װ�Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��װ�Ǽ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_dgqk.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">�ͻ����</font></div>
              </td>
              <td width="35%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="35%"><%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td width="35%"><%=fwdz%></td>
              <td width="15%" align="right"><font color="#0000CC">��ϵ��ʽ</font></td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">��Ʒ</font></td>
              <td width="35%"> 
<%
	cf.selectItem(out,"select cpbm,cpmc from dm_cpbm order by cpbm",cpbm,true);
%> 
              </td>
              <td width="15%" align="right"><font color="#0000FF">����</font></td>
              <td width="35%"> <%=sl%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">Ʒ��</font></div>
              </td>
              <td width="35%"> <%=pp%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">��Ӧ��</font></div>
              </td>
              <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh",gys,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">ʵ�ʷ���</font></div>
              </td>
              <td width="35%"> <%=sjfy%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">���Ϲ���</font></div>
              </td>
              <td width="35%"> <%=clgw%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">��ע</font></div>
              </td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" bgcolor="#FFFFCC"> 
                <div align="right">��װ��־</div>
              </td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <select name="azbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+δ��װ&Y+�Ѱ�װ","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" bgcolor="#FFFFCC"> 
                <div align="right">ʵ�ʰ�װ����</div>
              </td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="sazrq" size="20" maxlength="10"  value="<%=sazrq%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">Ӧ��װ����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="yazrq" size="20" maxlength="10"  value="<%=yazrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">�����������</td>
              <td colspan="3"> 
                <textarea name="ysqk" cols="55" rows="3"><%=ysqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wherecpbm"  value="<%=wherecpbm%>" >
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
	if(	javaTrim(FormName.azbz)=="") {
		alert("��ѡ��[��װ��־]��");
		FormName.azbz.focus();
		return false;
	}
	if (FormName.azbz.value=="Y")
	{
		if(	javaTrim(FormName.sazrq)=="") {
			alert("��ѡ��[ʵ�ʰ�װ����]��");
			FormName.sazrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.sazrq, "ʵ�ʰ�װ����"))) {
			return false;
		}
		if(	javaTrim(FormName.ysqk)=="") {
			alert("��ѡ��[�����������]��");
			FormName.ysqk.focus();
			return false;
		}
	}
	else{
		FormName.sazrq.value="";
		FormName.ysqk.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
