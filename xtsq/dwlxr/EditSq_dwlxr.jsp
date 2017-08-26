<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherelxrxm=cf.GB2Uni(request.getParameter("lxrxm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,lxrxm,zw,sj,bgdh,cz,sflz,bz ";
	ls_sql+=" from  sq_dwlxr";
	ls_sql+=" where  (dwbh='"+wheredwbh+"' and lxrxm='"+wherelxrxm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lxrxm=cf.fillNull(rs.getString("lxrxm"));
		zw=cf.fillNull(rs.getString("zw"));
		sj=cf.fillNull(rs.getString("sj"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		cz=cf.fillNull(rs.getString("cz"));
		sflz=cf.fillNull(rs.getString("sflz"));
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
      <div align="center"> ���޸���ϵ����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditSq_dwlxr.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������λ</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='G0' order by dwbh",dwbh,false);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��ϵ������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxrxm" size="20" maxlength="20"  value="<%=lxrxm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ְ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zw" size="20" maxlength="50"  value="<%=zw%>" >
              </td>
              <td width="15%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" size="20" maxlength="50"  value="<%=sj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�칫�绰</td>
              <td colspan="3"> 
                <input type="text" name="bgdh" size="73" maxlength="50"  value="<%=bgdh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">Ա��״̬</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "sflz","M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����",sflz);
%> </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cz" size="20" maxlength="50"  value="<%=cz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
            <input type="hidden" name="wherelxrxm"  value="<%=wherelxrxm%>" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[������λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("������[��ϵ������]��");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sflz)) {
		alert("��ѡ��[Ա��״̬]��");
		FormName.sflz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
