<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=null;
String bjjbbm=null;
String cpbm=null;
String kbcpbm=null;
String kbwlbm=null;
String yxthsj=null;
String cpdl=null;
String cpxl=null;
String cpmc=null;
String ppmc=null;
String gysmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double jsj=0;
double sh=0;
String xuhao=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sfxclxs=null;
String sfyx=null;
String yxkssj=null;
String yxjzsj=null;
double lsj =0;
double sjj =0;
String cllx =null;
String cptz =null;
String czlx =null;
String cpks =null;
String cplx =null;
String sfkgdj =null;

String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfkgdj,cptz,czlx,cpks,cplx,lsj,sjj,cllx,sfyx,yxkssj,yxjzsj,dqbm,bjjbbm,cpbm,kbcpbm,kbwlbm,yxthsj,cpdl,cpxl,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,jsj,sh,xuhao,lrr,lrsj,bz,sfxclxs ";
	ls_sql+=" from  tckb_zck";
	ls_sql+=" where (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		cptz=cf.fillNull(rs.getString("cptz"));
		czlx=cf.fillNull(rs.getString("czlx"));
		cpks=cf.fillNull(rs.getString("cpks"));
		cplx=cf.fillNull(rs.getString("cplx"));
		lsj=rs.getDouble("lsj");
		sjj=rs.getDouble("sjj");
		cllx=cf.fillNull(rs.getString("cllx"));
		sfyx=cf.fillNull(rs.getString("sfyx"));
		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		kbcpbm=cf.fillNull(rs.getString("kbcpbm"));
		kbwlbm=cf.fillNull(rs.getString("kbwlbm"));
		yxthsj=cf.fillNull(rs.getString("yxthsj"));
		cpdl=cf.fillNull(rs.getString("cpdl"));
		cpxl=cf.fillNull(rs.getString("cpxl"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdb=rs.getDouble("xdb");
		jsj=rs.getDouble("jsj");
		sh=rs.getDouble("sh");

		xuhao=cf.fillNull(rs.getString("xuhao"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
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
<form method="post" action="SaveEditTckb_zck.jsp" name="editform">
<div align="center">�ײ����ı��ۣ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">����</font></td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">���ۼ���</font></td> 
  <td width="32%">
  <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ����</font></td> 
  <td width="32%"><input type="text" name="cpbm" size="20" maxlength="13"  value="<%=cpbm%>" readonly></td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"><input type="text" name="xuhao" size="20" maxlength="8"  value="<%=xuhao%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ʊ����ϱ���</td>
  <td><input type="text" name="kbwlbm" value="<%=kbwlbm%>" size="20" maxlength="20" ></td>
  <td align="right"><font color="#FF0000">*</font>�Ʊ���Ʒ����</td>
  <td><input type="text" name="kbcpbm" value="<%=kbcpbm%>" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ʒ����</td>
  <td><select name="cpdl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(editform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc",cpdl);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>��ƷС��</td>
  <td><select name="cpxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc=(select cldlmc from jxc_cldlbm where cldlmc='"+cpdl+"') order by clxlmc",cpxl);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ʒ����</td> 
  <td width="32%"><input type="text" name="cpmc" size="20" maxlength="100"  value="<%=cpmc%>" ></td>
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
  <td align="right">��Ʒ����</td>
  <td colspan="3"><input name="cptz" type="text" value="<%=cptz%>" size="73" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input name="czlx" type="text"  value="<%=czlx%>" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ��ʽ</td>
  <td><input type="text" name="cpks" value="<%=cpks%>" size="20" maxlength="50" ></td>
  <td align="right">��Ʒ����</td>
  <td><input name="cplx" type="text" value="<%=cplx%>" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��Ӧ��</font></td>
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
      <%
	String sql="";
	sql="select jxc_gysxx.gysmc c1,jxc_gysxx.gysmc||'('||dqmc||')' c2 from jxc_gysxx,dm_dqbm where jxc_gysxx.dqbm=dm_dqbm.dqbm and jxc_gysxx.dqbm='"+dqbm+"' and jxc_gysxx.sfhz='Y' and jxc_gysxx.cllx in('1','3') and gysmc='"+gysmc+"'";
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
  <td align="right"><font color="#FF0000">*</font>�����</td>
  <td><input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" ></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ɸĵ���</td>
  <td><%
	cf.radioToken(out, "sfkgdj","Y+�ɸ�&N+��",sfkgdj);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���ۼ�</td>
  <td><input type="text" name="lsj" value="<%=lsj%>" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>���ڼ�</td>
  <td><input type="text" name="sjj" value="<%=sjj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�����滻����</td>
  <td><%
	cf.radioToken(out, "yxthsj","Y+����&N+��",yxthsj);
%></td>
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><%
	cf.radioToken(out, "cllx","1+���ڲ�Ʒ&2+�����Ʒ",cllx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���Ч</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfyx","1+��������&2+ֹͣ����&3+�׶�����&4+��ǰ��ʵ",sfyx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ч��ʼʱ��</td>
  <td><input type="text" name="yxkssj" size="20" maxlength="10"  value="<%=yxkssj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right">��Ч����ʱ��</td>
  <td><input type="text" name="yxjzsj" size="20" maxlength="10"  value="<%=yxjzsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherecpbm"  value="<%=wherecpbm%>" >
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
	cf.ajax(out);//����AJAX
%>


function changeDl(FormName)
{
	FormName.cpxl.length=1;

	if (FormName.cpdl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlbm,clxlmc  from jxc_clxlbm where cldlmc='"+FormName.cpdl.options[FormName.cpdl.selectedIndex].text+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToItem(editform.cpxl,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
		return false;
	}
	if(!(isFloat(FormName.xuhao, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.kbwlbm)=="") {
		alert("������[�Ʊ����ϱ���]��");
		FormName.kbwlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kbcpbm)=="") {
		alert("������[�Ʊ���Ʒ����]��");
		FormName.kbcpbm.focus();
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



	if(	javaTrim(FormName.cpdl)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cpdl.focus();
		return false;
	}
	if(	javaTrim(FormName.cpxl)=="") {
		alert("��ѡ��[��ƷС��]��");
		FormName.cpxl.focus();
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

	
	if(	javaTrim(FormName.jsj)=="") {
		alert("������[�����]��");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[���ۼ�]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj)=="") {
		alert("������[���ڼ�]��");
		FormName.sjj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj, "���ڼ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfkgdj)) {
		alert("��ѡ��[�Ƿ�ɸĵ���]��");
		FormName.sfkgdj[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.yxthsj)) {
		alert("��ѡ��[�����滻����]��");
		FormName.yxthsj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cllx)) {
		alert("��ѡ��[��������]��");
		FormName.cllx[0].focus();
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
