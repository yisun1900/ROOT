<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String pplb=null;
String clxl=null;
String scsmc=null;
String bz=null;
String mrazhs=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String cwdm=null;
String ppfzr=null;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,pplb,clxl,scsmc,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm,mrazhs,ppfzr ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		pplb=cf.fillNull(rs.getString("pplb"));
		clxl=cf.fillNull(rs.getString("clxl"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		bz=cf.fillNull(rs.getString("bz"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		mrazhs=cf.fillNull(rs.getString("mrazhs"));
		ppfzr=cf.fillNull(rs.getString("ppfzr"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppxx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ�����</td>
  <td width="32%">
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePplb(editform)">
    <option value=""></option>
                  <%
	cf.selectToken(out,"1+����&2+����",pplb);
%> 
  </select></td>
  <td width="18%" rowspan="8" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
  <td width="32%" rowspan="8"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="14" multiple>
    <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","select ssfgs from jxc_ppgysdzb where ppbm='"+whereppbm+"'");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����С��</td>
  <td><select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='1'  order by clxlmc",clxl);
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='2'  order by clxlmc",clxl);
	out.print("<optgroup label=\"ͨ����\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='3'  order by clxlmc",clxl);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc c1,scsmc c2 from jxc_scsxx where scslb in ('3','"+pplb+"') order by scsmc",scsmc);

%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>��Ʒ�Ʊ���</span></td>
  <td><input type="text" name="ppbm" size="10" maxlength="8"  value="<%=ppbm%>" readonly>
    �������޸ģ� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ��</td>
  <td><input type="text" name="ppmc" size="20" maxlength="50"  value="<%=ppmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ�Ƹ�����</td>
  <td><input name="ppfzr" type="text" id="ppfzr" value="<%=ppfzr%>" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ÿ�հ�װ��������</td>
  <td><input type="text" name="mrazhs" value="<%=mrazhs%>" size="20" maxlength="8" ></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ż�</td>
  <td><%
	cf.radioToken(out, "sfyyh","N+��&Y+��",sfyyh);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Żݿ�ʼʱ��</td>
  <td><input type="text" name="yhkssj" value="<%=yhkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�Żݽ���ʱ��</td>
  <td><input type="text" name="yhjzsj" value="<%=yhjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Ż�����</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"><%=yhnr%></textarea>  </td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="70" rows="2"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
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

function changePplb(FormName) 
{
	FormName.scsmc.length=1;

	if (FormName.pplb.value=="")
	{
		return;
	}


	var sql;
	sql="select scsmc from jxc_scsxx where scslb in ('3','"+FormName.pplb.value+"') order by scsmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(editform.scsmc,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.pplb)=="") {
		alert("��ѡ��[��Ʒ�����]��");
		FormName.pplb.focus();
		return false;
	}
	if(	javaTrim(FormName.clxl)=="") {
		alert("������[����С��]��");
		FormName.clxl.focus();
		return false;
	}

	if(	javaTrim(FormName.scsmc)=="") {
		alert("������[Ʒ��]��");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(!(isNumber(FormName.mrazhs, "ÿ�հ�װ��������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("������[�Żݿ�ʼʱ��]��");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "�Żݿ�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("������[�Żݽ���ʱ��]��");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "�Żݽ���ʱ��"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[�Żݿ�ʼʱ��]���ܴ���[�Żݽ���ʱ��]��");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("������[�Ż�����]��");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
