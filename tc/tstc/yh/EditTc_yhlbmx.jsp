<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String lbxmbm=null;
String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
double zqdj=0;
double dj=0;
double sjzj=0;
double sl=0;
String bz=null;
String lrr=null;
String lrsj=null;
String lx=null;
String wherelbxmbm=cf.GB2Uni(request.getParameter("lbxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select lbxmbm,dqbm,bjjbbm,lbmc,xmmc,ppmc,xh,jldw,zqdj,dj,sjzj,sl,bz,lrr,lrsj,lx ";
	ls_sql+=" from tc_yhlbmx";
	ls_sql+=" where  (lbxmbm='"+wherelbxmbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		zqdj=rs.getDouble("zqdj");
		dj=rs.getDouble("dj");
		sjzj=rs.getDouble("sjzj");
		sl=rs.getDouble("sl");
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lx=cf.fillNull(rs.getString("lx"));
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
<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditTc_yhlbmx.jsp" name="editform" >
<div align="center">�ײ��Ż������ϸ��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>����</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>���ۼ���</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ŀ����</td> 
  <td width="32%"><input type="text" name="lbxmbm" value="<%=lbxmbm%>" size="20" maxlength="6" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�������</td> 
  <td width="32%"><select name="lbmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lbmc c1,lbmc c2 from tc_yhlb order by lbmc",lbmc);
%>
  </select></td>
  </tr>


<tr bgcolor="#FFFFFF">
  <td align="right">��Ŀ����</td>
  <td colspan="3"><input type="text" name="xmmc" value="<%=xmmc%>" size="73" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ʒ��</td>
  <td colspan="3"><input type="text" name="ppmc" value="<%=ppmc%>" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͺ�</td>
  <td colspan="3"><input type="text" name="xh" value="<%=xh%>" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ǰ����</td>
  <td><input type="text" name="zqdj" value="<%=zqdj%>" size="20" maxlength="17" ></td>
  <td align="right">�����ۼ�</td>
  <td><input type="text" name="sjzj" value="<%=sjzj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Żݵ���</td> 
  <td width="32%"><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" ></td>
  <td align="right" width="18%">������λ</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><input type="text" name="sl" value="<%=sl%>" size="20" maxlength="17" ></td>
  <td align="right">����</td>
  <td><%
	cf.radioToken(out, "lx","1+����&2+����",lx);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע������˵��</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="10"  ><%=bz%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span> </td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>

<input type="hidden" name="wherelbxmbm"  value="<%=wherelbxmbm%>" >

    <tr align="center"> 
      <td colspan="4"> 
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lbxmbm)=="") {
		alert("��ѡ��[�Ż���Ŀ����]��");
		FormName.lbxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("������[�������]��");
		FormName.lbmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.zqdj)=="") {
		alert("������[��ǰ����]��");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "��ǰ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[�Żݵ���]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "�Żݵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("������[�����ۼ�]��");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "�����ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
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
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
