<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cpbm=null;
String dqbm=null;
String bjjbbm=null;
String nbbm=null;
String cldl=null;
String clxl=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
String xdb=null;
String sh=null;
String sfxclxs=null;
String jsj=null;
String khxsdj=null;
String sgddj=null;
String lx=null;
String lbxmbm=null;
String cxxmbm=null;
String sfyx=null;
String yxkssj=null;
String yxjzsj=null;
String xuhao=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sjj1=null;
String sjj2=null;
String sjj3=null;
String sjj4=null;
String sjj5=null;
String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpbm,dqbm,bjjbbm,nbbm,cldl,clxl,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,khxsdj,sgddj,lx,lbxmbm,cxxmbm,sfyx,yxkssj,yxjzsj,xuhao,lrr,lrsj,bz,sjj1,sjj2,sjj3,sjj4,sjj5 ";
	ls_sql+=" from  tc_zck";
	ls_sql+=" where  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		cldl=cf.fillNull(rs.getString("cldl"));
		clxl=cf.fillNull(rs.getString("clxl"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdb=cf.fillNull(rs.getString("xdb"));
		sh=cf.fillNull(rs.getString("sh"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		jsj=cf.fillNull(rs.getString("jsj"));
		khxsdj=cf.fillNull(rs.getString("khxsdj"));
		sgddj=cf.fillNull(rs.getString("sgddj"));
		lx=cf.fillNull(rs.getString("lx"));
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		cxxmbm=cf.fillNull(rs.getString("cxxmbm"));
		sfyx=cf.fillNull(rs.getString("sfyx"));
		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sjj1=cf.fillNull(rs.getString("sjj1"));
		sjj2=cf.fillNull(rs.getString("sjj2"));
		sjj3=cf.fillNull(rs.getString("sjj3"));
		sjj4=cf.fillNull(rs.getString("sjj4"));
		sjj5=cf.fillNull(rs.getString("sjj5"));
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
<form method="post" action="SaveEditTc_zck.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="cpbm" size="20" maxlength="13"  value="<%=cpbm%>" readonly>  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select>  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"> 
    <input type="text" name="nbbm" size="20" maxlength="20"  value="<%=nbbm%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(editform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc",cldl);
%>
    </select>  </td>
  <td align="right" width="18%">��ƷС��</td> 
  <td width="32%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+cldl+"' order by clxlmc",clxl);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" size="20" maxlength="50"  value="<%=cpmc%>" >  </td>
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"> 
    <input type="text" name="xh" size="20" maxlength="100"  value="<%=xh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="gg" size="20" maxlength="100"  value="<%=gg%>" >  </td>
  <td align="right" width="18%">Ʒ��</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc",ppmc);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc",gysmc);
%>
    </select>  </td>
  <td align="right" width="18%">������λ</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�µ�������λ</td> 
  <td width="32%"> 
    <select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",xdjldw);
%>
    </select>  </td>
  <td align="right" width="18%">�µ���</td> 
  <td width="32%"> 
    <input type="text" name="xdb" size="20" maxlength="17"  value="<%=xdb%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="sh" size="20" maxlength="9"  value="<%=sh%>" >  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"><input type="text" name="xuhao" size="20" maxlength="9"  value="<%=xuhao%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��账��С��</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfxclxs","1+����ȡ��&2+����ȡ��&3+4��5��&4+������",sfxclxs);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����</td> 
  <td width="32%"> 
    <input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" >  </td>
  <td align="right" width="18%">�ͻ����۵���</td> 
  <td width="32%"> 
    <input type="text" name="khxsdj" size="20" maxlength="17"  value="<%=khxsdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������1</td>
  <td><input type="text" name="sjj1" size="20" maxlength="17"  value="<%=sjj1%>" ></td>
  <td align="right">������2</td>
  <td><input type="text" name="sjj2" size="20" maxlength="17"  value="<%=sjj2%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������3</td>
  <td><input type="text" name="sjj3" size="20" maxlength="17"  value="<%=sjj3%>" ></td>
  <td align="right">������4</td>
  <td><input type="text" name="sjj4" size="20" maxlength="17"  value="<%=sjj4%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʩ���ӵ���</td>
  <td><input type="text" name="sgddj" size="20" maxlength="17"  value="<%=sgddj%>" ></td>
  <td align="right">������5</td>
  <td><input type="text" name="sjj5" size="20" maxlength="17"  value="<%=sjj5%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td colspan="3"><%
	cf.radioToken(out, "lx","1+�ײ���&2+������&3+�����&4+�ײ���",lx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����Ŀ����</td> 
  <td width="32%"> 
    <input type="text" name="lbxmbm" size="20" maxlength="6"  value="<%=lbxmbm%>" >  </td>
  <td align="right" width="18%">������Ŀ����</td> 
  <td width="32%"> 
    <input type="text" name="cxxmbm" size="20" maxlength="6"  value="<%=cxxmbm%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���Ч</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "sfyx","1+��������&2+ֹͣ����&3+�׶�����&4+��ǰ��ʵ",sfyx);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ч��ʼʱ��</td> 
  <td width="32%"><input type="text" name="yxkssj" size="20" maxlength="10"  value="<%=yxkssj%>"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��Ч����ʱ��</td> 
  <td width="32%"><input type="text" name="yxjzsj" size="20" maxlength="10"  value="<%=yxjzsj%>" onDblClick="JSCalendar(this)" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
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
	//����Ajax
	cf.ajax(out);
%>

function changeDl(FormName)
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.clxl,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
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
	if(	javaTrim(FormName.cldl)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cldl.focus();
		return false;
	}
	if(	javaTrim(FormName.clxl)=="") {
		alert("��ѡ��[��ƷС��]��");
		FormName.clxl.focus();
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
		alert("��ѡ��[������λ]��");
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
	if(	javaTrim(FormName.sh)=="") {
		alert("������[���]��");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("��ѡ��[�Ƿ��账��С��]��");
		FormName.sfxclxs[0].focus();
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
	if(	javaTrim(FormName.khxsdj)=="") {
		alert("������[�ͻ����۵���]��");
		FormName.khxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.khxsdj, "�ͻ����۵���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgddj)=="") {
		alert("������[ʩ���ӵ���]��");
		FormName.sgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgddj, "ʩ���ӵ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyx)) {
		alert("��ѡ��[�Ƿ���Ч]��");
		FormName.sfyx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xuhao)=="") {
		alert("������[�������]��");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isFloat(FormName.xuhao, "�������"))) {
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
	if(!(isFloat(FormName.sjj1, "������1"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj2, "������2"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj3, "������3"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj4, "������4"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj5, "������5"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
