<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double jzk=0;
double gcfjzk=0;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;


String zjxzklx="";
double gczxzk=10;
double gcjxzk=10;
double zxglfzk=10;
double jxglfzk=10;
double zxsjzk=10;
double jxsjzk=10;

String hdlx=null;
String kgxqthd=null;
String zklx=null;
String bz=null;
String yxscdz=null;

String kssj=null;
String cxjssj=null;
String qdjssj=null;

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cxhdmc,fgsbh,dj,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,yxscdz,sjzk,sjfzk,jzk,gcfjzk,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" ,zjxzklx,gczxzk,gcjxzk,zxglfzk,jxglfzk,zxsjzk,jxsjzk ";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));//1��ͬ��ͬ��2�������ۿ�
		gczxzk=rs.getDouble("gczxzk");
		gcjxzk=rs.getDouble("gcjxzk");
		zxglfzk=rs.getDouble("zxglfzk");
		jxglfzk=rs.getDouble("jxglfzk");
		zxsjzk=rs.getDouble("zxsjzk");
		jxsjzk=rs.getDouble("jxsjzk");

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		jzk=rs.getDouble("jzk");
		gcfjzk=rs.getDouble("gcfjzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
		yxscdz=cf.fillNull(rs.getString("yxscdz"));

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

	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));
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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">���޸Ĵ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="hidden" name="oldkssj" value="<%=kssj%>">
            <input type="button"  value="����" onClick="f_do(insertform)">
            <input type="button" name="scfj" value="�ϴ�����" onClick="f_scfj(insertform)" >
            <input type="button" name="xs" value="ҵ��ϵ��" onClick="f_xs(insertform)" >
            <input type="reset"  value="����">
                <br>
                <br>
            <input type="button" value="��ѡ������Ϣ" onClick="f_zsxx(insertform)" >
            <input type="button" value="��ѡ������Ϣ" onClick="f_dxzsxx(insertform)" >
            <input type="button" value="������Ŀ����" onClick="f_bfdz(insertform)" >
            <input name="button" type="button" onClick="f_bfdz(insertform)" value="�������ۿ�" >
            <input name="button2" type="button" onClick="f_bfdz(insertform)" value="���ַ��ô���" >
            <input type="button" value="����ȯ" onClick="f_djj(insertform)" >
            <input type="button" value="�μӻ����" onClick="f_dm(insertform)" >
            <input type="button" value="����С��" onClick="f_xq(insertform)" >
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">���������</font></td>
      <td width="30%"> 
        <input type="text" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>�ֹ�˾</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>���������</td>
      <td colspan="3"> 
        <input type="text" name="cxhdmc" size="71" maxlength="50"  value="<%=cxhdmc%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�����</td>
      <td colspan="3"><%
	cf.radioToken(out, "hdlx","1+�޻&2+��˾�&3+С���&4+չ��&5+�г��",hdlx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ɹ��������</td>
      <td><%
	cf.radioToken(out, "kgxqthd","1+���ɹ���&2+�ɹ���",kgxqthd);
%></td>
      <td align="right"><font color="#FF0000">*</font>����</td>
      <td><input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��      
      <input type="button" name="sjd" value="¼�����ʱ���" onClick="f_sjd(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>��ʼʱ��(>=)</td>
      <td><input type="text" name="kssj" value="<%=kssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>��������ʱ��(<=)</td>
      <td><input type="text" name="cxjssj" value="<%=cxjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right"><font color="#FF0000">*</font>ǩ������ʱ��(<=)</td>
      <td><input type="text" name="qdjssj" value="<%=qdjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�<font color="#CC0033"><strong>���������������ۣ���������Ŀ����¼�롺������Ŀ���ۡ���</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
      <td colspan="3"><%
	cf.radioToken(out, "zklx","4+���ۿ�&1+ȫ������&2+�������&3+���ַ��ô���&4+������Ŀ����",zklx);
%></td>
    </tr>
    
    <tr bgcolor="#FFFFCC">
      <td colspan="4" align="center"><p>��ͬ�ۿ�</p></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>���̷��ۿ�</td>
      <td width="30%"> 
        <input type="text" name="gcfzk" size="8" maxlength="9"  value="<%=gcfzk%>" >
        <b><font color="#0000FF">��>0��<=10��</font></b> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>������ۿ�</td>
      <td><input type="text" name="glfzk" size="8" maxlength="9"  value="<%=glfzk%>" >
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
      <td><input type="text" name="sjzk" size="8" maxlength="8" value="<%=sjzk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
      <td><input type="text" name="sjfzk" size="8" maxlength="8" value="<%=sjfzk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">�����</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="19"><%=bz%></textarea>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_lx(FormName)//����FormName:Form������
{
	if (FormName.zjxzklx[0].checked)//ͬ��ͬ 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("������[���������]��");
		FormName.cxhdmc.focus();
		return false;
	}

	if(	javaTrim(FormName.gcfzk)=="") {
		alert("������[���̷��ۿ�]��");
		FormName.gcfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzk, "���̷��ۿ�"))) {
		return false;
	}
	if (FormName.gcfzk.value<=0 || FormName.gcfzk.value>10)
	{
		alert("����[���̷��ۿ�]Ӧ����0��10֮�䣡");
		FormName.gcfzk.select();
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
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����0��10֮�䣡");
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
	if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
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
	if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
	{
		alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
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
	if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
	{
		alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.sjfzk.select();
		return false;
	}

	if(	!radioChecked(FormName.zjxzklx)) {
		alert("��ѡ��[�������ۿ�����]��");
		FormName.zjxzklx[0].focus();
		return false;
	}
	if (FormName.zjxzklx[0].checked)//ͬ��ͬ 
	{
		FormName.gczxzk.value=FormName.gcfzk.value;
		FormName.gcjxzk.value=FormName.gcfzk.value;
		FormName.zxglfzk.value=FormName.glfzk.value;
		FormName.jxglfzk.value=FormName.glfzk.value;
		FormName.zxsjzk.value=FormName.sjzk.value;
		FormName.jxsjzk.value=FormName.sjzk.value;
	}
	
	if(	javaTrim(FormName.gczxzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.gczxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.gczxzk.value<0 || FormName.gczxzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����0��10֮�䣡");
		FormName.gczxzk.select();
		return false;
	}

	if(	javaTrim(FormName.gcjxzk)=="") {
		alert("������[���̼����ۿ�]��");
		FormName.gcjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzk, "���̼����ۿ�"))) {
		return false;
	}
	if (FormName.gcjxzk.value<0 || FormName.gcjxzk.value>10)
	{
		alert("����[���̼����ۿ�]Ӧ����1��10֮�䣡");
		FormName.gcjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.zxglfzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.zxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxglfzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.zxglfzk.value<0 || FormName.zxglfzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����1��10֮�䣡");
		FormName.zxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxglfzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.jxglfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxglfzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.jxglfzk.value<0 || FormName.jxglfzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����1��10֮�䣡");
		FormName.jxglfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zxsjzk)=="") {
		alert("������[����˰���ۿ�]��");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zxsjzk, "����˰���ۿ�"))) {
		return false;
	}
	if (FormName.zxsjzk.value<0 || FormName.zxsjzk.value>10)
	{
		alert("����[����˰���ۿ�]Ӧ����1��10֮�䣡");
		FormName.zxsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxsjzk)=="") {
		alert("������[����˰���ۿ�]��");
		FormName.zxsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxsjzk, "����˰���ۿ�"))) {
		return false;
	}
	if (FormName.jxsjzk.value<0 || FormName.jxsjzk.value>10)
	{
		alert("����[����˰���ۿ�]Ӧ����1��10֮�䣡");
		FormName.jxsjzk.select();
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

	if (parseFloat(FormName.gcfzk.value)!=10 && (parseFloat(FormName.clfzk.value)!=10 || parseFloat(FormName.zcfzk.value)!=10 || parseFloat(FormName.rgfzk.value)!=10 || parseFloat(FormName.ysfzk.value)!=10 || parseFloat(FormName.jxfzk.value)!=10 || parseFloat(FormName.shfzk.value)!=10 || parseFloat(FormName.qtfzk.value)!=10) )
	{
		alert("����[���̷��ۿ�]��[���̷Ѳ��ִ���]����ͬʱ���ڣ�");
		FormName.gcfzk.select();
		return false;
	}
	
	
	
	
	if(	javaTrim(FormName.gcfjzk)=="") {
		alert("������[���̷Ѿ��ۿ�]��");
		FormName.gcfjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfjzk, "���̷Ѿ��ۿ�"))) {
		return false;
	}
	if (FormName.gcfjzk.value<=0 || FormName.gcfjzk.value>10)
	{
		alert("����[���̷Ѿ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.gcfjzk.select();
		return false;
	}

	if(	javaTrim(FormName.jzk)=="") {
		alert("������[ȫ�����ۿ�]��");
		FormName.jzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzk, "ȫ�����ۿ�"))) {
		return false;
	}
	if (FormName.jzk.value<=0 || FormName.jzk.value>10)
	{
		alert("����[ȫ�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.jzk.select();
		return false;
	}

	if(	!radioChecked(FormName.hdlx)) {
		alert("��ѡ��[�����]��");
		FormName.hdlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgxqthd)) {
		alert("��ѡ��[�ɹ��������]��");
		FormName.kgxqthd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zklx)) {
		alert("��ѡ��[�ۿ�����]��");
		FormName.zklx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yxscdz)) {
		alert("��ѡ��[�Ƿ�����˫�ش���]��");
		FormName.yxscdz[0].focus();
		return false;
	}

	if (FormName.zklx[0].checked)
	{
		if (parseFloat(FormName.gcfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���̷��ۿ�]Ӧ��Ϊ10��");
			FormName.gcfzk.select();
			return false;
		}

		if (parseFloat(FormName.gczxzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���������ۿ�]Ӧ��Ϊ10��");
			FormName.gczxzk.select();
			return false;
		}

		if (parseFloat(FormName.glfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[������ۿ�]Ӧ��Ϊ10��");
			FormName.glfzk.select();
			return false;
		}
		if (parseFloat(FormName.sjzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[˰���ۿ�]Ӧ��Ϊ10��");
			FormName.sjzk.select();
			return false;
		}
		if (parseFloat(FormName.sjfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��Ʒ��ۿ�]Ӧ��Ϊ10��");
			FormName.sjfzk.select();
			return false;
		}
		if (parseFloat(FormName.gcfjzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���̷Ѿ��ۿ�]Ӧ��Ϊ10��");
			FormName.jzk.select();
			return false;
		}
		if (parseFloat(FormName.jzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[ȫ�����ۿ�]Ӧ��Ϊ10��");
			FormName.jzk.select();
			return false;
		}

	
		if (parseFloat(FormName.clfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.clfzk.select();
			return false;
		}
		if (parseFloat(FormName.zcfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[���ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.zcfzk.select();
			return false;
		}
		if (parseFloat(FormName.rgfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[�˹����ۿ�]Ӧ��Ϊ10��");
			FormName.rgfzk.select();
			return false;
		}
		if (parseFloat(FormName.ysfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[������ۿ�]Ӧ��Ϊ10��");
			FormName.ysfzk.select();
			return false;
		}
		if (parseFloat(FormName.jxfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��е���ۿ�]Ӧ��Ϊ10��");
			FormName.jxfzk.select();
			return false;
		}
		if (parseFloat(FormName.shfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[��ķ��ۿ�]Ӧ��Ϊ10��");
			FormName.shfzk.select();
			return false;
		}
		if (parseFloat(FormName.qtfzk.value)!=10)
		{
			alert("����[�ۿ�����]Ϊ���ۿۣ�[�������ۿ�]Ӧ��Ϊ10��");
			FormName.qtfzk.select();
			return false;
		}
	}


	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.kssj)=="") {
		alert("������[��ʼʱ��]��");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjssj)=="") {
		alert("������[��������ʱ��]��");
		FormName.cxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qdjssj)=="") {
		alert("������[ǩ������ʱ��]��");
		FormName.qdjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qdjssj, "ǩ������ʱ��"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.cxjssj.value)
	{
		alert("[��������ʱ��]����С��[��ʼʱ��]��");
		FormName.cxjssj.select();
		return false;
	}
	if (FormName.kssj.value>FormName.qdjssj.value)
	{
		alert("[ǩ������ʱ��]����С��[��ʼʱ��]��");
		FormName.qdjssj.select();
		return false;
	}
	
	
	FormName.action="SaveEditJc_cxhd.jsp";
	FormName.submit();
	return true;
}

function f_scfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}

function f_sjd(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	
	FormName.action="InsertJc_cxhdsj.jsp";
	FormName.submit();
	return true;
	
}

function f_xq(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdxq.jsp";
	FormName.submit();
	return true;
	
}

function f_xs(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdyjxs.jsp";
	FormName.submit();
	return true;
	
}


function f_dm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhddm.jsp";
	FormName.submit();
	return true;
}

function f_zsxx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdzsxx.jsp";
	FormName.submit();
	return true;
}

function f_dxzsxx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddxzsxx.jsp";
	FormName.submit();
	return true;
}

function f_bfdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdbfxmdz.jsp";
	FormName.submit();
	return true;
}

function f_djj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddjj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
