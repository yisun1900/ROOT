<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqxh=null;
String xcpbm=null;
String xcpmc=null;
String xcpflbm=null;
String jldw=null;
double dj=0;
double jhlqsl=0;
String mxsfxsp=null;
String sfxspmc=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
String wherexcpbm=cf.GB2Uni(request.getParameter("xcpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String sfxsp=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,sfxsp";
	ls_sql+=" from  oa_xcplqsq";
	ls_sql+=" where  (sqxh="+wheresqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
	}
	rs.close();
	ps.close();

	ls_sql="select sqxh,xcpbm,xcpmc,xcpflbm,jldw,dj,jhlqsl,sfxsp,DECODE(sfxsp,'N','����Ҫ','Y','��Ҫ') sfxspmc";
	ls_sql+=" from  oa_xcplqmx";
	ls_sql+=" where  (sqxh="+wheresqxh+") and  (xcpbm='"+wherexcpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		xcpbm=cf.fillNull(rs.getString("xcpbm"));
		xcpmc=cf.fillNull(rs.getString("xcpmc"));
		xcpflbm=cf.fillNull(rs.getString("xcpflbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		jhlqsl=rs.getDouble("jhlqsl");
		sfxspmc=cf.fillNull(rs.getString("sfxspmc"));
		mxsfxsp=cf.fillNull(rs.getString("sfxsp"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveEditOa_xcplqmx.jsp" name="insertform">
<div align="center">
    <div align="center">ӡˢƷ��ȡ��ϸ</div>
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="32%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefl(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflbm",xcpflbm);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�������</font></td>
      <td width="32%"> 
        <input type="text" name="sqxh" size="20" maxlength="8"  value="<%=sqxh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ</td>
      <td width="32%"> 
        <select name="xcpbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <option value=""></option>
          <%
		ls_sql="select oa_xcpbm.xcpbm,oa_xcpbm.xcpmc ";
		ls_sql+=" from oa_xcpbm,oa_xcplqfw";
		ls_sql+=" where oa_xcpbm.xcpbm=oa_xcplqfw.xcpbm and oa_xcplqfw.fgsbh='"+fgsbh+"' and oa_xcpbm.xcpflbm='"+xcpflbm+"'";
		ls_sql+=" order by oa_xcpbm.xcpbm";
		
		cf.selectItem(out,ls_sql,xcpbm);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�ƻ���ȡ����</td>
      <td width="32%"> 
        <input type="text" name="jhlqsl" size="20" maxlength="16"  value="<%=jhlqsl%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">������λ</font></td>
      <td width="32%"> 
        <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">����</font></td>
      <td width="32%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�Ƿ�������</font></td>
      <td width="32%"> 
        <input type="text" name="sfxspmc" value="<%=sfxspmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
			<input type="button"  value="����" onClick="f_do(insertform)">
			<input type="reset"  value="����">
			<input type="hidden" name="xcpmc" size="20" maxlength="50"  value="<%=xcpmc%>" >
			<input type="hidden" name="sfxsp" value="<%=mxsfxsp%>" size="20" maxlength="20" >
			<input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
			<input type="hidden" name="wherexcpbm"  value="<%=wherexcpbm%>" >
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
//��ѯҳ��ʹ�ã���������������
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefl(FormName)
{
	if(	javaTrim(FormName.xcpflbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	FormName.xcpbm.length=1;
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&sqxh=<%=sqxh%>&xcpflbm="+FormName.xcpflbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.xcpbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&xcpbm="+FormName.xcpbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("������[�������]��");
		FormName.sqxh.focus();
		return false;
	}
	if(!(isNumber(FormName.sqxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.xcpbm)=="") {
		alert("������[ӡˢƷ]��");
		FormName.xcpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpmc)=="") {
		alert("������[ӡˢƷ����]��");
		FormName.xcpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("��ѡ��[ӡˢƷ����]��");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("������[�ƻ���ȡ����]��");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlqsl, "�ƻ���ȡ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
