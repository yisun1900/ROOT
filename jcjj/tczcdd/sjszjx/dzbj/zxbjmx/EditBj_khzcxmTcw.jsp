<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸Ŀͻ�������Ŀ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE3 {color: #0000CC}
.STYLE4 {font-weight: bold}
.STYLE6 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String cpbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String ppmc=null;
String ptcpsm=null;
double ysl=0;
double sl=0;
double dj=0;
String slStr=null;
String sfkgdj=null;
String lx=null;
String readStr="";
String fjddbh=null;
String xdjldw=null;
String clxlmc=null;


String sfkgh="";//�Ƿ�ɸ���  1�����ɻ���2���ɻ�
String sfkghStr="";
double khzdsl=0;//�ɻ��������
double ghzj=0;//�����ۼ�
String sfxzsl="";//�Ƿ���������  1�����ƣ�3��������
String sfxzslStr="";
double bzsl=0;//��׼����
double sjjmsl=0;//ʵ�ʼ�������
double sjsl=0;//ʵ������
String tcsjflbm="";
String txxx="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpbm,tccpdlbm,tccplbbm,clxlmc,bjjbbm,ppmc,ptcpsm,xdsl,dj,sfkgdj,lx,fjddbh,xdjldw";
	ls_sql+=" from  bj_khzcxmh,jxc_clxlbm";
	ls_sql+=" where bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm and zjxxh='"+zjxxh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ptcpsm=cf.fillNull(rs.getString("ptcpsm"));
		ysl=rs.getDouble("xdsl");
		dj=rs.getDouble("dj");
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1��ԭ��Ŀ��2�������3��������
		fjddbh=cf.fillNull(rs.getString("fjddbh"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
	}
	else{
		out.println("���󣡲����ڣ���ص��������³���");
		return;
	}
	rs.close();
	ps.close();

	String xclbz="";
	String clzt="";
	String clztmc="";
	ls_sql="select xclbz,jc_zcdd.clzt,clztmc";
	ls_sql+=" from  jc_zcdd,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt and ddbh='"+fjddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xclbz=cf.fillNull(rs.getString("xclbz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
	}
	rs.close();
	ps.close();
	if (xclbz.equals("2"))//1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ
	{
		//00��¼��Ԥ������02��Ԥ�����ѽ��գ�03��������֪ͨ��05���Ѳ����� 25��֪ͨ���ߣ�26�����ߣ�07����ͬδ��ɣ�09����ͬ����ɣ�11����ͬ��ȷ�ϣ�13�������ѽ��գ�27����⣻15��ȷ���ͻ�ʱ�䣻17����֪ͨ�ͻ���18���ѳ��⣻19�����ͻ���20�������ͻ���21����֪ͨ�˲�����23�����˲�����30��������᣻98:ȡ��Ԥ������99���˵�
		if (clzt.compareTo("11")>0 && !clzt.equals("25") && !clzt.equals("26"))
		{
			out.println("���󣡡����Ʋ�Ʒ�������ѽ��ܣ�����������");
			return;
		}
	}


	ls_sql="select xdsl";
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and oldsxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getDouble("xdsl");
	}
	rs.close();
	ps.close();


	if (sl==0)
	{
		slStr="";
	}
	else {
		slStr=""+sl;
	}

	if (sfkgdj.equals("Y") && lx.equals("2"))//�Ƿ�ɸĵ���  Y���ǣ�N����
	{
		readStr="";
	}
	else {
		readStr="readOnly";
	}

	ls_sql="select sfxzsl,bzsl,sjjmsl,sjsl,tcsjflbm,sfkgh,sfkgh,DECODE(sfkgh,'1','���ɻ�','2','�ɻ�') sfkghStr,khzdsl,ghzj";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sfkgh.equals("1"))
	{
		out.println("���󣡲��ܸ���");
		return;
	}

	if (sjjmsl>0)
	{
		out.println("�Ѽ��ⲻ����ѡ�񣬼�������:"+sjjmsl);
		return;
	}

	if (sfxzsl.equals("2"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		sfxzsl="1";
	}

	if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		txxx="<span class=\"STYLE1\"><B>���ѣ�����������������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������׼�������շ�</B></span>";
		sfxzslStr="������Ӽ�";
	}
	else if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			txxx="<span class=\"STYLE1\"><B>���ѣ������������������ɳ�������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������¼��</B></span>";
		}
		sfxzslStr="���ɳ���";
	}
	else{
		txxx="";
		sfxzslStr="������";
	}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_khzcxmTcw.jsp" name="insertform">
<div align="center"><B>[<%=jgwzbm%>]ѡ�������[<%=clxlmc%>]�ͺ�</B></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">����</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="8%">Ʒ��</td>
	<td  width="12%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="5%">���ۼ�����λ</td>
	<td  width="5%">��������</td>
	<td  width="5%">�µ�������λ</td>
	<td  width="5%">�µ�����</td>
	<td  width="5%">����</td>
	<td  width="6%">�շ�</td>
	<td  width="6%">���ۼ���</td>
	<td  width="15%">���ײ�Ʒ˵��</td>
</tr>
<%

	String lxmc=null;
	String bjjbmc=null;
	double getsl=0;
	double getxdsl=0;
	double allgetsl=0;
	double allgetxdsl=0;
	double getdj=0;
	double getje=0;
	double allgetje=0;
	String getptcpsm=null;
	String getcpbm=null;
	String cpmc=null;
	String getppmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	String getxdjldw=null;
	ls_sql="SELECT DECODE(bj_khzcxmh.lx,'1','ԭ��Ŀ','2','����','3','����','4','������') lxmc,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.xdsl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw,bj_khzcxmh.xdjldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('1','2','3')";//1���ײ����������ڣ�2���ײ����������⣻3�������������������ڣ�4�������������������⡢��������շѡ�ѡ������
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
    ls_sql+=" order by bj_khzcxmh.ppmc,bj_khzcxmh.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lxmc=cf.fillNull(rs.getString("lxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		getsl=rs.getDouble("sl");
		getxdsl=rs.getDouble("xdsl");
		getdj=rs.getDouble("dj");
		getje=rs.getDouble("je");
		getptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		getcpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		getppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		getxdjldw=cf.fillHtml(rs.getString("xdjldw"));

		allgetsl+=getsl;
		allgetxdsl+=getxdsl;
		allgetje+=getje;

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=lxmc%></td>
			<td><%=getcpbm%></td>
			<td><%=cpmc%></td>
			<td><%=getppmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=jldw%></td>
			<td><%=getsl%></td>
			<td><%=getxdjldw%></td>
			<td><%=getxdsl%></td>
			<td><%=getdj%></td>
			<td><%=getje%></td>
			<td><%=bjjbmc%></td>
			<td><%=getptcpsm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFF"  align="center">
		<td>С ��</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allgetsl%></td>
		<td>&nbsp;</td>
		<td><%=allgetxdsl%></td>
		<td>&nbsp;</td>
		<td><%=allgetje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
</table>

<BR>

<div align="center">�޸Ŀͻ�������Ŀ</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">���������</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ����</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ���</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">�ṹλ��</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">���ۼ���</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value="<%=ppmc%>"><%=ppmc%></option>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
	String sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'��'||dj||'/'||jldw||'��' from bj_khzcxmh where zjxxh='"+zjxxh+"' and sxh="+sxh;
	cf.selectItem(out,sql,cpbm);
%>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE6">�µ�������λ</span></td>
  <td><span class="STYLE6"><%=xdjldw%></span></td>
  <td align="right"><span class="STYLE1"><strong>ԭ����</strong></span></td>
  <td><%=ysl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="sl" value="<%=slStr%>" size="10" maxlength="17" >
      <span class="STYLE4">����¼�븺��</span></td>
  <td align="right"><span class="STYLE1">*</span>ʵ�ʵ���</td>
  <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" <%=readStr%>></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("�����ͺ�");if (tccplbbm.equals("50")) out.println("�Ӿ�");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="<%=ptcpsm%>" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="ysl" value="<%=ysl%>"> 
	<input type="hidden" name="oldcpbm" value="<%=cpbm%>"> 
	<input type="hidden" name="sxh" value="<%=sxh%>">	</td>
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
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if ((parseFloat(FormName.sl.value)+parseFloat(FormName.ysl.value))<0)
	{
		alert("����[��������]���ܳ���ԭ����[<%=ysl%>]��");
		FormName.sl.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[ʵ�ʵ���]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "ʵ�ʵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>