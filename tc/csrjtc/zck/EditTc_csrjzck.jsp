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
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double sh=0;
String sfxclxs=null;
double yjsj=0;
double ykhxsdj=0;
double ysgddj=0;
double jsj=0;
double khxsdj=0;
double sgddj=0;
String lrr=null;
String lrsj=null;
String bz=null;
String bzmc=null;
String zp=null;
String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpbm,dqbm,bjjbbm,nbbm,tccpdlbm,tccplbbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,yjsj,ykhxsdj,ysgddj,jsj,khxsdj,sgddj,lrr,lrsj,bz,bzmc,zp ";
	ls_sql+=" from  tc_csrjzck";
	ls_sql+=" where  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		yjsj=rs.getDouble("yjsj");
		ykhxsdj=rs.getDouble("ykhxsdj");
		ysgddj=rs.getDouble("ysgddj");
		jsj=rs.getDouble("jsj");
		khxsdj=rs.getDouble("khxsdj");
		sgddj=rs.getDouble("sgddj");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		bzmc=cf.fillNull(rs.getString("bzmc"));
		zp=cf.fillNull(rs.getString("zp"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditTc_csrjzck.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right">���ۼ���</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="cpbm" size="20" maxlength="13"  value="<%=cpbm%>" readonly>  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="20"  value="<%=nbbm%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select cldlbm c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc",tccpdlbm);
%>
    </select></td>
  <td align="right" width="18%">��ƷС��</td> 
  <td width="32%"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="bzmc" value="<%=bzmc%>" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
    <input type="text" name="ppmc" size="20" maxlength="50"  value="<%=ppmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td width="32%"> 
    <input type="text" name="gysmc" size="20" maxlength="50"  value="<%=gysmc%>" >  </td>
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
  <td align="right" width="18%">�Ƿ��账��С��</td> 
  <td width="32%"> 
    <input type="text" name="sfxclxs" size="20" maxlength="1"  value="<%=sfxclxs%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>ԭ�����</strong></td> 
  <td width="32%"> 
    <input type="text" name="yjsj" size="20" maxlength="17"  value="<%=yjsj%>" >  </td>
  <td width="18%" align="right"><span class="STYLE1">�����</span></td>
  <td width="32%"><input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><strong>ԭ�ͻ����۵���</strong></td>
  <td><input type="text" name="ykhxsdj" size="20" maxlength="17"  value="<%=ykhxsdj%>" ></td>
  <td align="right"><span class="STYLE1">�ͻ����۵���</span></td>
  <td><input type="text" name="khxsdj" size="20" maxlength="17"  value="<%=khxsdj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>ԭʩ���ӵ���</strong></td> 
  <td width="32%"> 
    <input type="text" name="ysgddj" size="20" maxlength="17"  value="<%=ysgddj%>" >  </td>
  <td width="18%" align="right"><span class="STYLE1">ʩ���ӵ���</span></td>
  <td width="32%"><input type="text" name="sgddj" size="20" maxlength="17"  value="<%=sgddj%>" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��Ƭ����</td>
  <td><input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>    </td>
  </tr>
</table>

<BR>
<div align="center">
<table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td height="27" colspan="7" align="center" bgcolor="#CCCCCC"><strong>�����������</strong></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="12%" height="27" bgcolor="#CCCCCC"><strong>���ۼ���</strong></td>
  <td width="14%" bgcolor="#CCCCCC"><strong>ԭ�����շѼ�</strong></td>
  <td width="14%" bgcolor="#CCCCCC"><strong>�����շѼ�</strong></td>
  <td width="14%" bgcolor="#CCCCCC"><strong>�Ƿ����</strong></td>
  <td width="14%" bgcolor="#CCCCCC"><strong>���ۿ�ʼʱ��</strong></td>
  <td width="15%" bgcolor="#CCCCCC"><strong>���۽���ʱ��</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>���������շѼ�</strong></td>
</tr>
<%
	String getbjjbbm=null;
	String getbjjbmc=null;

	ls_sql="select bjjbbm,bjjbmc";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where lx='2'";
	ls_sql+=" order by yxj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		getbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		double ysjsfj=0;
		double sjsfj=0;
		String sfdz="";
		String dzkssj="";
		String dzjzsj="";
		double dzsjsfj=0;
		ls_sql="select ysjsfj,sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
		ls_sql+=" from  tc_csrjzcsjcjb";
		ls_sql+=" where cpbm='"+cpbm+"' and bjjbbm='"+getbjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ysjsfj=rs1.getDouble("ysjsfj");
			sjsfj=rs1.getDouble("sjsfj");
			sfdz=cf.fillNull(rs1.getString("sfdz"));
			dzkssj=cf.fillNull(rs1.getDate("dzkssj"));
			dzjzsj=cf.fillNull(rs1.getDate("dzjzsj"));
			dzsjsfj=rs1.getDouble("dzsjsfj");
		}
		rs1.close();
		ps1.close();

		String ysjsfjStr="";
		if (ysjsfj!=0)
		{
			ysjsfjStr=""+ysjsfj;
		}
		String sjsfjStr="";
		if (sjsfj!=0)
		{
			sjsfjStr=""+sjsfj;
		}
		String dzsjsfjStr="";
		if (dzsjsfj!=0)
		{
			dzsjsfjStr=""+dzsjsfj;
		}

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><input type="hidden" name="getbjjbbm" size="20" maxlength="20"  value="<%=getbjjbbm%>" >
			<%=getbjjbmc%>		  </td>
		  <td><input type="text" name="ysjsfj" size="10" maxlength="10"  value="<%=ysjsfjStr%>" ></td>
		  <td><input type="text" name="sjsfj" size="10" maxlength="10"  value="<%=sjsfjStr%>" ></td>
		  <td><select name="sfdz" style="FONT-SIZE:12PX;WIDTH:82PX">
              <%
	cf.selectToken(out,"1+���ۿ�&2+����",sfdz);
%>
            </select></td>
		  <td><input type="text" name="dzkssj" size="10" maxlength="10"  value="<%=dzkssj%>" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzjzsj" size="10" maxlength="10"  value="<%=dzjzsj%>" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzsjsfj" size="10" maxlength="10"  value="<%=dzsjsfjStr%>" ></td>
	  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
    <tr> 
      <td colspan="7" >
	<div align="center">
		<input type="hidden" name="wherecpbm"  value="<%=wherecpbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>

</div>
</form>
</body>
</html>

<%
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
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
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("������[��ƷС��]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ��]��");
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
	if(	javaTrim(FormName.sfxclxs)=="") {
		alert("������[�Ƿ��账��С��]��");
		FormName.sfxclxs.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("������[ԭ�����]��");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsj, "ԭ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ykhxsdj)=="") {
		alert("������[ԭ�ͻ����۵���]��");
		FormName.ykhxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ykhxsdj, "ԭ�ͻ����۵���"))) {
		return false;
	}
	if(	javaTrim(FormName.ysgddj)=="") {
		alert("������[ԭʩ���ӵ���]��");
		FormName.ysgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysgddj, "ԭʩ���ӵ���"))) {
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
