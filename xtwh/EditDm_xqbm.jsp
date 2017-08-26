<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xqbm=null;
String xqmc=null;
String cqbm=null;
String dqbm=null;
String yhdlm=null;
String kfs=null;
String sldh=null;
String mpmjj=null;
String rzsj=null;
String bz=null;
String wherexqbm=cf.GB2Uni(request.getParameter("xqbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xqbm,xqmc,cqbm,dqbm,yhdlm,kfs,sldh,mpmjj,rzsj,bz ";
	ls_sql+=" from  dm_xqbm";
	ls_sql+=" where  (xqbm='"+wherexqbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		xqbm=cf.fillNull(rs.getString("xqbm"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		kfs=cf.fillNull(rs.getString("kfs"));
		sldh=cf.fillNull(rs.getString("sldh"));
		mpmjj=cf.fillNull(rs.getString("mpmjj"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
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

<form method="post" action="SaveEditDm_xqbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">С������</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="xqbm" size="20" maxlength="7"  value="<%=xqbm%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�û���½��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��������</font></div>
              </td>
              <td width="35%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��������</font></div>
              </td>
              <td width="35%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">С������</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="xqmc" size="69" maxlength="50"  value="<%=xqmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">������</td>
              <td colspan="3"> 
                <input type="text" name="kfs" size="69" maxlength="50"  value="<%=kfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��¥�绰</td>
              <td colspan="3"> 
                <input type="text" name="sldh" size="69" maxlength="50"  value="<%=sldh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��סʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rzsj" size="20" maxlength="10"  value="<%=rzsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">ÿƽ�׾���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mpmjj" size="20" maxlength="8"  value="<%=mpmjj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexqbm"  value="<%=wherexqbm%>" >
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
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С������]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("������[С������]��");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("������[�û���½��]��");
		FormName.yhdlm.focus();
		return false;
	}
	if(!(isNumber(FormName.mpmjj, "ÿƽ�׾���"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��סʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
