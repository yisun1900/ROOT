<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String bjjbbm=null;
String cpbm=null;
String sku=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String ppmc=null;
String gysmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double dj=0;
String sfkgdj=null;
double tccldj=0;
double jsj=0;
double sh=0;
String sfcscp=null;
String xuhao=null;
String bz=null;
String sfxclxs=null;
String tcsjflbm=null;
String sfyx=null;
String yxkssj=null;
String yxjzsj=null;
String ssfgs=null;
String dqbm=null;

String sxh=cf.GB2Uni(request.getParameter("sxh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfyx,yxkssj,yxjzsj,bjjbbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,dj,tccldj,sfkgdj,jsj,sh,sfcscp,xuhao,bz,sfxclxs ";
	ls_sql+=" from  bj_khzcxm";
	ls_sql+=" where sxh='"+sxh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfyx=cf.fillNull(rs.getString("sfyx"));
		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		sku=cf.fillNull(rs.getString("sku"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdb=rs.getDouble("xdb");
		dj=rs.getDouble("dj");
		tccldj=rs.getDouble("tccldj");
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		jsj=rs.getDouble("jsj");
		sh=rs.getDouble("sh");

		sfcscp=cf.fillNull(rs.getString("sfcscp"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
	}
	rs.close();
	ps.close();


	ls_sql="select ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<form method="post" action="SaveEditBj_tczcbj.jsp" name="editform">
<div align="center">�ײ����ı��ۣ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ����</font></td> 
  <td width="32%"><input type="text" name="cpbm" size="20" maxlength="13"  value="<%=cpbm%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ��в�Ʒ</td>
  <td><%
	cf.radioToken(out, "sfcscp","Y+��&N+��",sfcscp);
%></td>
  <td align="right">SKU��</td>
  <td><input type="text" name="sku" size="20" maxlength="6"  value="<%=sku%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ʒ����</td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(editform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc",tccpdlbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>��Ʒ���</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where cldlmc=(select cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"') order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײ���������</td>
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc",tcsjflbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ʒ����</td> 
  <td width="32%"><input type="text" name="cpmc" size="20" maxlength="50"  value="<%=cpmc%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">Ʒ��</font></td> 
  <td width="32%">
  <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where ppmc='"+ppmc+"'",ppmc);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="50"  value="<%=xh%>" ></td>
  <td align="right" width="18%">���</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="50"  value="<%=gg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ӧ��</td>
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
      <%
	String sql="";
	sql="select jxc_gysxx.gysmc c1,jxc_gysxx.gysmc||'('||dqmc||')' c2 from jxc_gysxx,dm_dqbm where jxc_gysxx.dqbm=dm_dqbm.dqbm and jxc_gysxx.dqbm='"+dqbm+"' and jxc_gysxx.sfhz='Y' and jxc_gysxx.cllx in('1','3') order by gysmc";
	cf.selectItem(out,sql,gysmc);
%>
    </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ�����λ</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>���</td> 
  <td width="32%"><input type="text" name="sh" size="8" maxlength="9"  value="<%=sh%>" >
  %��0��100��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�µ�������λ</td>
  <td><select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",xdjldw);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>�µ���</td>
  <td><input type="text" name="xdb" value="<%=xdb%>" size="8" maxlength="9" >
    ���ۼ�����λ/�µ�������λ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ��账��С��</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfxclxs","1+����ȡ��&2+����ȡ��&3+4��5��&4+������",sfxclxs);
%>    <strong>�����������Ķ���ʱʹ�ã�</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>ʵ�ʵ���</td> 
  <td width="32%"> 
    <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�����</td> 
  <td width="32%"><input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���Ч</td>
  <td><%
	cf.radioToken(out, "sfyx","1+��Զ��Ч&2+��Ч&3+�׶���Ч",sfyx);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ч��ʼʱ��</td>
  <td><input type="text" name="yxkssj" size="20" maxlength="10"  value="<%=yxkssj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right">��Ч����ʱ��</td>
  <td><input type="text" name="yxjzsj" size="20" maxlength="10"  value="<%=yxjzsj%>" onDblClick="JSCalendar(this)"></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="sxh"  value="<%=sxh%>" >
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>


function changeDl(FormName)
{
	FormName.tccplbbm.length=1;

	if (FormName.tccpdlbm.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlbm,clxlmc  from jxc_clxlbm where cldlmc='"+FormName.tccpdlbm.options[FormName.tccpdlbm.selectedIndex].text+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToItem(editform.tccplbbm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfcscp)) {
		alert("��ѡ��[�Ƿ��в�Ʒ]��");
		FormName.sfcscp[0].focus();
		return false;
	}
	if (FormName.sfcscp[0].checked)
	{
		if(	javaTrim(FormName.sku)=="") {
			alert("������[SKU��]��");
			FormName.sku.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sku)!="") {
			alert("�ǳ��в�Ʒ������Ҫ����[SKU��]��");
			FormName.sku.select();
			return false;
		}
	}


	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("��ѡ��[��Ӧ��]��");
		FormName.gysmc.focus();
		return false;
	}




	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[���ۼ�����λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdjldw)=="") {
		alert("��ѡ��[�µ�������λ]��");
		FormName.xdjldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdb)=="") {
		alert("������[�µ���]��");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "�µ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("��ѡ��[�Ƿ��账��С��]��");
		FormName.sfxclxs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sh)=="") {
		alert("������[���]��");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "���"))) {
		return false;
	}
	if (parseFloat(FormName.sh.value)<0 || parseFloat(FormName.sh.value)>100)
	{
		alert("����[���]ֻ����0��100֮��");
		FormName.sh.select();
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

	if(	javaTrim(FormName.jsj)=="") {
		alert("������[�����]��");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "�����"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyx)) {
		alert("��ѡ��[�Ƿ���Ч]��");
		FormName.sfyx[0].focus();
		return false;
	}
	if (FormName.sfyx[2].checked)
	{
		if(	javaTrim(FormName.yxkssj)=="") {
			alert("������[��Ч��ʼʱ��]��");
			FormName.yxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)=="") {
			alert("������[��Ч����ʱ��]��");
			FormName.yxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
			return false;
		}

		if (FormName.yxjzsj.value<FormName.yxkssj.value)
		{
			alert("����[��Ч����ʱ��]<[��Ч��ʼʱ��]");
			FormName.yxjzsj.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yxkssj)!="") {
			alert("���󣡲�������[��Ч��ʼʱ��]��");
			FormName.yxkssj.select();
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)!="") {
			alert("���󣡲�������[��Ч����ʱ��]��");
			FormName.yxjzsj.select();
			return false;
		}
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>
