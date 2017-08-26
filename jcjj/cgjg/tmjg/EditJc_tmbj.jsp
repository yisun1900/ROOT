<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tmbm=null;
String tmmc=null;
String tmxlbm=null;
String xh=null;
String ymjg=null;
String pmjg=null;
String ppbm=null;
String zp=null;
String bz=null;
String wheretmbm=cf.GB2Uni(request.getParameter("tmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tmbm,tmmc,tmxlbm,xh,ymjg,pmjg,ppbm,zp,bz ";
	ls_sql+=" from  jc_tmbj";
	ls_sql+=" where  (tmbm='"+wheretmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tmbm=cf.fillNull(rs.getString("tmbm"));
		tmmc=cf.fillNull(rs.getString("tmmc"));
		tmxlbm=cf.fillNull(rs.getString("tmxlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		ymjg=cf.fillNull(rs.getString("ymjg"));
		pmjg=cf.fillNull(rs.getString("pmjg"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		zp=cf.fillNull(rs.getString("zp"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveEditJc_tmbj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">̨�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tmbm" size="20" maxlength="5"  value="<%=tmbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">Ʒ��</div>
              </td>
              <td width="35%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from jdm_ppbm order by ppbm",ppbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">̨������</td>
              <td colspan="3"> 
                <input type="text" name="tmmc" size="72" maxlength="50"  value="<%=tmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">̨��ϵ��</div>
              </td>
              <td width="35%"> 
                <select name="tmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmxlbm,tmxlmc from jdm_tmxlbm order by tmxlbm",tmxlbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ͺ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" size="20" maxlength="20"  value="<%=xh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���׼۸�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ymjg" size="20" maxlength="9"  value="<%=ymjg%>" >
              </td>
              <td width="15%"> 
                <div align="right">ƽ�׼۸�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pmjg" size="20" maxlength="9"  value="<%=pmjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��Ƭ</td>
              <td colspan="3"> 
                <input type="text" name="zp" size="72" maxlength="50"  value="<%=zp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheretmbm"  value="<%=wheretmbm%>" >
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
	if(	javaTrim(FormName.tmbm)=="") {
		alert("������[̨�����]��");
		FormName.tmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmmc)=="") {
		alert("������[̨������]��");
		FormName.tmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.tmxlbm)=="") {
		alert("��ѡ��[̨��ϵ��]��");
		FormName.tmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ymjg)=="") {
		alert("������[���׼۸�]��");
		FormName.ymjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ymjg, "���׼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.pmjg)=="") {
		alert("������[ƽ�׼۸�]��");
		FormName.pmjg.focus();
		return false;
	}
	if(!(isFloat(FormName.pmjg, "ƽ�׼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
