<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ssfgs=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;


double gcfqdzk=10;
double gczxzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

double hdzsjz=10;
double djjje=10;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

try {
	conn=cf.getConnection();

	String ysshbz="";
	ls_sql="select cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
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
		return;
	}

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double htjz=dzbj.getHtjz(conn,khbh,"yz");//��ͬ��ֵ���ۺ��ͬ�ܶ������������;�ֵ�����ʹ���ȯ��˰���ۺ�

	if (htjz<0)
	{
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
		return;
	}

	ls_sql="select gcfqdzk,gczxzk,glfzk,sjzk,sjfzk ,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		gczxzk=rs.getDouble("gczxzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");

		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	int sqtszkcs=0;//ÿ�����������ۿ۴���
	ls_sql="select sqtszkcs";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqtszkcs=rs.getInt("sqtszkcs");
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where lrr='"+yhmc+"' and clzt='2'  and (SYSDATE-lrsj)<31";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>sqtszkcs)
	{
		out.println("������ÿ�¡����������ۿ۴�����������Ϊ["+sqtszkcs+"]��Ŀǰ�Ѵﵽ��"+count);
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�����ۿ�</div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">����״̬</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">���̷�ǩ���ۿ�</td>
	<td  width="6%">���������ۿ�</td>
	<td  width="6%">������ۿ�</td>
	<td  width="6%">˰���ۿ�</td>
	<td  width="6%">��Ʒ��ۿ�</td>
	<td  width="6%">¼����</td>
	<td  width="46%">����ԭ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT DECODE(crm_tzzkjl.clzt,'1','δ���','2','ֱ���޸��ۿ۳ɹ�','3','������','4','����ͨ���Ѹ��ۿ�','5','����δͨ��'),crm_tzzkjl.lrsj,crm_tzzkjl.gcfqdzk,crm_tzzkjl.gczxzk,crm_tzzkjl.glfzk,crm_tzzkjl.sjzk,crm_tzzkjl.sjfzk, crm_tzzkjl.lrr,crm_tzzkjl.tzyy ";
	ls_sql+=" FROM crm_zxkhxx,crm_tzzkjl  ";
    ls_sql+=" where crm_tzzkjl.khbh=crm_zxkhxx.khbh ";
    ls_sql+=" and crm_tzzkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tzzkjl.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�μӹ�˾�</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>
	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С�������</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>
	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">չ������</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>
	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ԭ��</td> 
  <td colspan="3"> 
    <textarea name="tzyy" cols="71" rows="3"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>�ͻ��ۿ�</p></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̷�ǩ���ۿ�</td>
  <td><input type="text" name="gcfqdzk" value="<%=gcfqdzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>0��<=10��</font></b> </td>
  <td align="right"><font color="#FF0000">*</font>���������ۿ�</td>
  <td><input type="text" name="gczxzk" value="<%=gczxzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="21" align="right"><font color="#FF0000">*</font>������ۿ�</td>
  <td><input type="text" name="glfzk" value="<%=glfzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
  <td><input type="text" name="sjzk" value="<%=sjzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
  <td><input type="text" name="sjfzk" value="<%=sjfzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>���̷Ѳ��ִ���</p></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
  <td align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̣��˹����ۿ�</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣�������ۿ�</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̣���е���ۿ�</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣���ķ��ۿ�</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̣��������ۿ�</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">����ȯ���</span></td>
  <td><input type="text" name="djjje" value="<%=djjje%>" size="20" maxlength="16" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">����;�ֵ</span></td>
  <td><input type="text" name="hdzsjz" value="<%=hdzsjz%>" size="20" maxlength="16" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input type="hidden" name="khbh" value="<%=khbh%>" > 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button" onClick="f_bfdz(insertform)"  value="���ֹ�����Ŀ����">
	<input type="button" onClick="f_dxdz(insertform)"  value="����������Ŀ����">
	<input type="button" onClick="f_qtdz(insertform)"  value="�����շ���Ŀ����">
	<input type="button" onClick="f_wcdz(insertform)"  value="����ۿ��޸�">
	<input type="reset"  value="����" name="reset">
	<input type="button" onClick="window.open('\\dzbj\\zxbjmx\\ViewBj.jsp?khbh=<%=khbh%>')"  value="�鿴����"></td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.tzyy)=="") {
		alert("������[����ԭ��]��");
		FormName.tzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.gcfqdzk)=="") {
		alert("������[���̷�ǩ���ۿ�]��");
		FormName.gcfqdzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfqdzk, "���̷�ǩ���ۿ�"))) {
		return false;
	}
	if (FormName.gcfqdzk.value<1 || FormName.gcfqdzk.value>10)
	{
		alert("����[���̷�ǩ���ۿ�]Ӧ����1��10֮�䣡");
		FormName.gcfqdzk.select();
		return false;
	}

	if(	javaTrim(FormName.gczxzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.gczxzk.value<1 || FormName.gczxzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����1��10֮�䣡");
		FormName.gczxzk.select();
		return false;
	}

	if(	javaTrim(FormName.glfzk)=="") {
		alert("������[������ۿ�]��");
		FormName.glfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.glfzk.value<1 || FormName.glfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����1��10֮�䣡");
		FormName.glfzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjzk)=="") {
		alert("������[˰���ۿ�]��");
		FormName.sjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
		return false;
	}
	if (FormName.sjzk.value<1 || FormName.sjzk.value>10)
	{
		alert("����[˰���ۿ�]Ӧ����1��10֮�䣡");
		FormName.sjzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjfzk)=="") {
		alert("������[��Ʒ��ۿ�]��");
		FormName.sjfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
		return false;
	}
	if (FormName.sjfzk.value<1 || FormName.sjfzk.value>10)
	{
		alert("����[��Ʒ��ۿ�]Ӧ����1��10֮�䣡");
		FormName.sjfzk.select();
		return false;
	}

	
	
	
	if(	javaTrim(FormName.clfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.clfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcfzk.select();
		return false;
	}
	if(	javaTrim(FormName.rgfzk)=="") {
		alert("������[�˹����ۿ�]��");
		FormName.rgfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfzk, "�˹����ۿ�"))) {
		return false;
	}
	if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
	{
		alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
		FormName.rgfzk.select();
		return false;
	}
	if(	javaTrim(FormName.ysfzk)=="") {
		alert("������[������ۿ�]��");
		FormName.ysfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysfzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ysfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxfzk)=="") {
		alert("������[��е���ۿ�]��");
		FormName.jxfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfzk, "��е���ۿ�"))) {
		return false;
	}
	if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
	{
		alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
		FormName.jxfzk.select();
		return false;
	}
	if(	javaTrim(FormName.shfzk)=="") {
		alert("������[��ķ��ۿ�]��");
		FormName.shfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.shfzk, "��ķ��ۿ�"))) {
		return false;
	}
	if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
	{
		alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.shfzk.select();
		return false;
	}
	if(	javaTrim(FormName.qtfzk)=="") {
		alert("������[�������ۿ�]��");
		FormName.qtfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfzk, "�������ۿ�"))) {
		return false;
	}
	if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
	{
		alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.qtfzk.select();
		return false;
	}

	if (parseFloat(FormName.gcfqdzk.value)!=10 && (parseFloat(FormName.clfzk.value)!=10 || parseFloat(FormName.zcfzk.value)!=10 || parseFloat(FormName.rgfzk.value)!=10 || parseFloat(FormName.ysfzk.value)!=10 || parseFloat(FormName.jxfzk.value)!=10 || parseFloat(FormName.shfzk.value)!=10 || parseFloat(FormName.qtfzk.value)!=10) )
	{
		alert("����[���̷�ǩ���ۿ�]��[���̷Ѳ��ִ���]����ͬʱ���ڣ�");
		FormName.gcfqdzk.select();
		return false;
	}
	
	
	
	
	
	
	
	
	if(	javaTrim(FormName.djjje)=="") {
		alert("������[����ȯ���]��");
		FormName.djjje.focus();
		return false;
	}
	if(!(isFloat(FormName.djjje, "����ȯ���"))) {
		return false;
	}
	
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("������[����;�ֵ]��");
		FormName.hdzsjz.focus();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "����;�ֵ"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_tzzkjl.jsp";
	FormName.submit();
	return true;
}

function f_bfdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_bfxmtzk.jsp";
	FormName.submit();
	return true;
}

function f_dxdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_gcdxtzk.jsp";
	FormName.submit();
	return true;
}

function f_qtdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_qtxmtzk.jsp";
	FormName.submit();
	return true;
}

function f_wcdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="wcdz.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
