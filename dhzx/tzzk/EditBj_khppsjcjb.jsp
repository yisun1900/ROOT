<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String jgwzbm=null;
String tccplbbm=null;
String tcsjflbm=null;
String sfbxx=null;
String sfyxsj=null;
String jldw=null;
String sfxzsl=null;
String bzsl=null;
String sfkjm=null;
String yxjmzdsl=null;
String jmdj=null;
String sfkgh=null;
String khzdsl=null;
String ghzj=null;
String sfyqxtpp=null;
String sjsl=null;
String sjjshsl=null;
String sjjmsl=null;
String sjjmje=null;
String khbjjbbm=null;
String bjjbbm=null;
String sjsfsl=null;
String sjcj=null;
String sjsfje=null;
String sjsfycx=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherejgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String whereppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));

String khxm=null;
String fwdz=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select  bj_khppsjcjb.tcsjflbm,tcsjflmc,jxc_clxlbm.clxlmc,a.bjjbmc khbjjbbm,b.bjjbmc,sjsfsl,sjcj,sjsfje ,jldw ";
	ls_sql+=" FROM bj_khppsjcjb,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm a,bdm_bjjbbm b  ";
    ls_sql+=" where bj_khppsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khppsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
    ls_sql+=" and bj_khppsjcjb.khbjjbbm=a.bjjbbm(+) and bj_khppsjcjb.bjjbbm=b.bjjbbm(+)";
	ls_sql+=" and  (bj_khppsjcjb.khbh='"+wherekhbh+"') and  (bj_khppsjcjb.jgwzbm='"+wherejgwzbm+"') ";
	ls_sql+=" and  (bj_khppsjcjb.tccplbbm="+wheretccplbbm+")  ";
	ls_sql+=" and  (bj_khppsjcjb.ppmc='"+whereppmc+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tcsjflbm=cf.fillNull(rs.getString("tcsjflmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		sjsfsl=cf.fillNull(rs.getString("sjsfsl"));
		sjcj=cf.fillNull(rs.getString("sjcj"));
		sjsfje=cf.fillNull(rs.getString("sjsfje"));
	}
	rs.close();
	ps.close();

	if (khbjjbbm.equals(bjjbbm))
	{
		out.println("���󣡱���δ����");
		return;
	}

	String ssfgs="";
	String ysshbz="";
	ls_sql="SELECT ssfgs,ysshbz,khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
	//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	{
		out.println("����������[Ԥ�����]�������ٵ��ۿ�"+ysshbz);
//		return;
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
<form method="post" action="SaveEditbj_khppsjcjb.jsp" name="editform">
<div align="center">�޸��ײ��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ͻ�����</span></td>
  <td><%=khxm%></td>
  <td align="right"><span class="STYLE2">���ݵ�ַ</span></td>
  <td><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�ͻ����</span></td> 
  <td width="32%"><%=wherekhbh%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�ṹλ��</span></td> 
  <td width="32%"><%=wherejgwzbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">Ʒ��</span></td>
  <td><%=whereppmc%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">��Ʒ���</span></td> 
  <td width="32%"> 
<%=wheretccplbbm%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�ײ���������</span></td> 
  <td width="32%"><%=tcsjflbm%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFF66">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span>�����շ�����</span></td> 
  <td width="32%"> 
    <input type="text" name="sjsfsl" size="20" maxlength="17"  value="<%=sjsfsl%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������</td> 
  <td width="32%"><input type="text" name="sjcj" size="20" maxlength="17"  value="<%=sjcj%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�����շѽ��</span></td> 
  <td width="32%"><input type="text" name="sjsfje" size="20" maxlength="17"  value="<%=sjsfje%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="tsjcjbz" rows="3" cols="71"></textarea></td>
  </tr>
</table>
<BR>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ۼ���</td>
	<td  width="6%">������λ</td>
	<td  width="6%">����</td>
	<td  width="6%">����</td>
	<td  width="10%">�����</td>
	<td  width="10%">��Ʒ����</td>
	<td  width="14%">��Ʒ����</td>
	<td  width="10%">Ʒ��</td>
	<td  width="16%">�ͺ�</td>
	<td  width="16%">���</td>
</tr>
<%
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double dj=0;
	double jsj=0;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
//	String jldw=null;

	ls_sql="SELECT bj_khzcxm.sxh,bjjbmc,bj_khzcxm.sl,bj_khzcxm.dj,bj_khzcxm.jsj,bj_khzcxm.cpbm,bj_khzcxm.cpmc,bj_khzcxm.ppmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.jldw ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxm  ";
    ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.zclx in('1','2')";//�������� 1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
	ls_sql+=" and  (bj_khzcxm.khbh='"+wherekhbh+"') and  (bj_khzcxm.jgwzbm='"+wherejgwzbm+"') ";
	ls_sql+=" and  (bj_khzcxm.tccplbbm="+wheretccplbbm+")  ";
	ls_sql+=" and  (bj_khzcxm.ppmc='"+whereppmc+"')  ";
    ls_sql+=" order by bj_khzcxm.cpbm,bj_khzcxm.sxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		cpbm=cf.fillNull(rs.getString("cpbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=bjjbmc%></td>
			<td><%=jldw%></td>
			<td><%=sl%></td>
			<td><%=dj%></td>
			<td><%=jsj%>
			</td>
			<td><%=cpbm%></td>
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


%>
</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#CCCCCC" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
		<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
		<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
		<input type="hidden" name="whereppmc"  value="<%=whereppmc%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
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
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.sjsfsl)=="") {
		alert("������[�����շ�����]��");
		FormName.sjsfsl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfsl, "�����շ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("������[�������]��");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "�������"))) {
		return false;
	}

	FormName.sjsfje.value=FormName.sjsfsl.value*FormName.sjcj.value;

	if(	javaTrim(FormName.sjsfje)=="") {
		alert("������[�����շѽ��]��");
		FormName.sjsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfje, "�����շѽ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
