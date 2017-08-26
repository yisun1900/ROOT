<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String str=cf.getItemData("select shxmxlbm,shxmxlmc,shxmdlbm from dm_ysshxmxlbm order by shxmdlbm,shxmxlbm");

String shxmbm=null;
String shxmmc=null;
String shxmdlbm=null;
String shxmxlbm=null;
double kf=0;
String kfgz=null;
String bz=null;
String whereshxmbm=cf.GB2Uni(request.getParameter("shxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select shxmbm,shxmmc,shxmdlbm,shxmxlbm,kf,kfgz,bz ";
	ls_sql+=" from  dm_ysshxmbm";
	ls_sql+=" where  (shxmbm='"+whereshxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shxmbm=cf.fillNull(rs.getString("shxmbm"));
		shxmmc=cf.fillNull(rs.getString("shxmmc"));
		shxmdlbm=cf.fillNull(rs.getString("shxmdlbm"));
		shxmxlbm=cf.fillNull(rs.getString("shxmxlbm"));
		kf=rs.getDouble("kf");
		kfgz=cf.fillNull(rs.getString("kfgz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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

<form method="post" action="SaveEditDm_shxmbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><span class="STYLE1">*</span>�����Ŀ����</div>              </td>
              <td width="31%"> 
                <select name="shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(shxmdlbm,shxmxlbm,<%=str%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_ysshxmdlbm order by shxmdlbm",shxmdlbm);
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right"><span class="STYLE1">*</span>�����ĿС��</div>              </td>
              <td width="32%"> 
                <select name="shxmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmxlbm,shxmxlmc from dm_ysshxmxlbm where shxmdlbm='"+shxmdlbm+"'  order by shxmdlbm,shxmxlbm",shxmxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><span class="STYLE1">*</span>�����Ŀ����</div>              </td>
              <td width="31%"> 
                <input type="text" name="shxmbm" size="20" maxlength="4"  value="<%=shxmbm%>" >              </td>
              <td width="18%"> 
                <div align="right"><span class="STYLE1">*</span>�۷�</div>              </td>
              <td width="32%"> 
                <input type="text" name="kf" size="20" maxlength="8"  value="<%=kf%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><span class="STYLE1">*</span>�����Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="shxmmc" size="71" maxlength="100"  value="<%=shxmmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>�۷ֹ���</td>
              <td colspan="3"><%
	cf.radioToken(out, "kfgz","1+��2����˿�ʼ�۷�<BR>&2+ÿ�ζ��۷�<BR>&3+��ͬ��Ŀ����2�ο�ʼ�۷�<BR>&4+��ͬ��Ŀֻ��1�η�",kfgz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="74" rows="4"><%=bz%></textarea></td>
            </tr>
            <input type="hidden" name="whereshxmbm"  value="<%=whereshxmbm%>" >
            <tr> 
              <td width="19%" height="2">&nbsp;</td>
              <td width="31%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="32%" height="2"> 
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
	if(	javaTrim(FormName.shxmbm)=="") {
		alert("������[�����Ŀ����]��");
		FormName.shxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmmc)=="") {
		alert("������[�����Ŀ����]��");
		FormName.shxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("��ѡ��[�����Ŀ����]��");
		FormName.shxmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmxlbm)=="") {
		alert("��ѡ��[�����ĿС��]��");
		FormName.shxmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("������[�۷�]��");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "�۷�"))) {
		return false;
	}
	if(	!radioChecked(FormName.kfgz)) {
		alert("��ѡ��[�۷ֹ���]��");
		FormName.kfgz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
