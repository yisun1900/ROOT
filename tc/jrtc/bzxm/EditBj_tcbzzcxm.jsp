<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String jgwzbm=null;
String tccplbbm=null;
String bzsl=null;
String sfxzsl=null;
String sfbxx=null;
String sfyxsj=null;
String tcsjflbm=null;
String lrr=null;
String lrsj=null;
String sfyqxtpp=null;

String jldw=null;
String sfkjm=null;
String jmfl=null;
String jmjldw=null;
double yxjmzdsl=0;
double jmdj=0;
String sfkgh=null;
double khzdsl=0;
double ghzj=0;


String wherebjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzbm=request.getParameter("jgwzbm");
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjbbh,sfyqxtpp,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,bzsl,sfxzsl,sfbxx,sfyxsj,tcsjflbm,lrr,lrsj ";
	ls_sql+=" ,jldw,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj";
	ls_sql+=" from  bj_tcbzzcxm";
	ls_sql+=" where  (bjbbh='"+wherebjbbh+"') and (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		jmfl=cf.fillNull(rs.getString("jmfl"));
		jmjldw=cf.fillNull(rs.getString("jmjldw"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");

		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfyxsj=cf.fillNull(rs.getString("sfyxsj"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditBj_tcbzzcxm.jsp" name="editform">
<div align="center">�ײͱ�׼������Ŀ��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">���۰汾��</font></td>
    <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
      </select>
    </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
  <td bgcolor="#E8E8FF"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">���ۼ���</font></td>
  <td bgcolor="#E8E8FF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
  <td bgcolor="#E8E8FF"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">�ṹλ��</font></td> 
  <td width="32%" bgcolor="#E8E8FF"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm where jgwzmc='"+jgwzbm+"'",jgwzbm);
%>
  </select></td>
  <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��Ʒ���</td> 
  <td width="32%" bgcolor="#E8E8FF"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ƿ��ѡ��</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfbxx","Y+��&N+��",sfbxx);
%></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ƿ�Ҫ����ͬƷ��</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqxtpp","Y+��&N+��",sfyqxtpp);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�����Ƿ��շ�</td>
  <td><%
	cf.radioToken(out, "sfyxsj","Y+��&N+��",sfyxsj);
%></td>
  <td align="right">�ײ���������</td>
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc",tcsjflbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>������λ</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+������Ӽ�&2+���ɳ���&3+����������",sfxzsl);
%></td>
  <td align="right"><font color="#FF0000">*</font>��׼����</td>
  <td><input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ɼ���</td>
  <td><%
	cf.radioToken(out, "sfkjm","1+���ɼ���&2+�ɼ���",sfkjm);
%></td>
  <td align="right">�������</td>
  <td><input type="text" name="jmfl" size="20" maxlength="50"  value="<%=jmfl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������λ</td>
  <td><select name="jmjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jmjldw);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������������</td>
  <td><input type="text" name="yxjmzdsl" value="<%=yxjmzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">���ⵥ��</td>
  <td><input type="text" name="jmdj" value="<%=jmdj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ɸ���</td>
  <td><%
	cf.radioToken(out, "sfkgh","1+���ɻ�&2+�ɻ�",sfkgh);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">�ɻ��������</td>
  <td><input type="text" name="khzdsl" value="<%=khzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">�����ۼ�</td>
  <td><input type="text" name="ghzj" value="<%=ghzj%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherebjbbh"  value="<%=wherebjbbh%>" >
		<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
		<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
		<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
		<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
		<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("��ѡ��[�Ƿ�Ҫ����ͬƷ��]��");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("��ѡ��[�����Ƿ��շ�]��");
		FormName.sfyxsj[0].focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("������[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked || FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("���������������������[��׼����]��");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "��׼����"))) {
			return false;
		}
	}
	else
	{
		FormName.bzsl.value="";
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ�ɼ���]��");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.jmfl)=="") {
			alert("���󣡱�������[�������]��");
			FormName.jmfl.focus();
			return false;
		}
		if(	javaTrim(FormName.jmjldw)=="") {
			alert("���󣡱�������[���������λ]��");
			FormName.jmjldw.focus();
			return false;
		}
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("���󣡱�������[��������������]��");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("���󣡱�������[���ⵥ��]��");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "���ⵥ��"))) {
			return false;
		}
	}
	else
	{
		FormName.jmfl.value="";
		FormName.jmjldw.value="";
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	if(	!radioChecked(FormName.sfkgh)) {
		alert("��ѡ��[�Ƿ�ɸ���]��");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("���󣡱�������[�ɻ��������]��");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "�ɻ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("���󣡱�������[�����ۼ�]��");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "�����ۼ�"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
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
