<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String bjjbbm=null;
String dqbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;

String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String xmlrr=cf.GB2Uni(request.getParameter("xmlrr"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT bj_zdyxmb.dqbm,bjjbbm,xmmc,dqmc,xmdlmc,xmxlmc,clcb,rgcb,jxcb,cbenj";
	ls_sql+=" FROM bj_zdyxmb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_zdyxmb.lrr='"+xmlrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_zdyxmb.dqbm=dm_dqbm.dqbm and bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		bjjbbm=rs.getString("bjjbbm");
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
	}
	else{
		out.println("������Ŀ������");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>��װ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE6 {color: #990000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">�޸ļ�װ���Ϸ����������ӻ�е��</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr>
        <td align="right"><span class="STYLE1">����</span></td>
        <td><%=dqmc%></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ���</span></td>
        <td><%=xmbh%></td>
        <td align="right"><span class="STYLE1">���ۼ���</span></td>
        <td><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ����</span></td>
        <td colspan="3"><%=xmmc%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">��Ŀ����</span></td>
        <td><%=xmdlbm%></td>
        <td align="right"><span class="STYLE1">��ĿС��</span></td>
        <td><%=xmxlbm%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">���ϳɱ�</span></td>
        <td><span class="STYLE6"><%=clcb%></span></td>
        <td align="right"><span class="STYLE6">�˹��ɱ�</span></td>
        <td><span class="STYLE6"><%=rgcb%></span></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">�ɱ���</span></td>
        <td><span class="STYLE6"><%=cbenj%>          <br>
        </span></td>
        <td align="right"><span class="STYLE6">��е�ɱ�</span></td>
        <td><span class="STYLE6"><%=jxcb%></span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="24" colspan="4" align="center" bgcolor="#FFFFCC">&nbsp;</td>
      </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>���Ϸ���</td>
      <td width="32%"><select name="glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm where glflbm='3' order by glflbm","");
%>
      </select></td>
      <td align="right" width="18%"><span class="STYLE2">*</span>����</td>
      <td width="32%"><input name="lx" type="radio"  value="1" checked>
��ӡ
  <input type="radio" name="lx"  value="2">
����ӡ </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>��е������</td>
      <td>
		<input type="text" name="glfxclmc" value="" size="20" maxlength="100" >      </td>
      <td align="right"><span class="STYLE2">*</span>������λ</td>
      <td><select name="jldwbm" id="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwbm","");
%>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>����</td>
      <td width="32%">
		<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>
		<input type="text" name="dj" value="" size="20" maxlength="17" ></td>
      <td align="right" width="18%"><span class="STYLE2">*</span>����</td>
      <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">¼����</span></td>
      <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">¼��ʱ��</span></td>
      <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��ע</td>
      <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>      </td>
    </tr>
    <tr align="center">
      <td colspan="4"><input type="button"  value="���ӻ�е" onClick="f_lrjx(insertform)" >
           <input type="hidden" name="xmlrr"  value="<%=xmlrr%>" >
          <input type="hidden" name="wlllbz"  value="N" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="hidden" name="glfxclbm" value="" size="20" maxlength="100"  readonly>
          <input type="hidden" name="jqsfl" value="0" size="20" maxlength="17" >
          <input type="hidden" name="bsfl" value="0" size="20" maxlength="17" >
          <input type="hidden" name="tvocsfl" value="0" size="20" maxlength="17" >    </td>
    </tr>
  </table>




</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_lrjx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ������]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.glflbm)=="") {
		alert("��ѡ��[���Ϸ���]��");
		FormName.glflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("������[��е������]��");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("������[������λ]��");
		FormName.jldwbm.focus();
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
	if(	javaTrim(FormName.xhl)=="") {
		alert("������[����]��");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("������[��ȩ�ͷ���]��");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "��ȩ�ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("������[���ͷ���]��");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "���ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("������[TVOC�ͷ���]��");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC�ͷ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="SaveInsertBj_zdyglfxbJxf.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>