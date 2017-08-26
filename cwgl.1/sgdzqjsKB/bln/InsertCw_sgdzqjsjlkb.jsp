<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
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
.STYLE2 {color: #0000FF}
.STYLE4 {
	color: #990033;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double wdzgce=0;
double qye=0;
double zqgczjf=0;
double zhgczjf=0;
double zjxje=0;
double zhzjxje=0;

double zqsjgck=0;
double zhsjgck=0;

double jzsqk=0;
double jzzqk=0;
double jzssk=0;
double sskbl=0;


double zqje=0;
double jsbl=50;
double jsje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqgczjf,zhgczjf,zjxje,zhzjxje";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("1"))//1:�������ڽ�������
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}

	zqsjgck=zqgczjf+zjxje;
	zhsjgck=zhgczjf+zhzjxje;

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


	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdzqjsjlKB";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
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
<form method="post" action="SaveInsertCw_sgdzqjsjlkb.jsp" name="insertform" >
<div align="center"><strong>�����ڴ����ڽ���</strong></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF"> 
  <td  width="15%"  align="center">��ͬ��</td>
  <td  width="10%"  align="center">������;</td>
  <td  width="14%"  align="center">���ʽ</td>
  <td  width="8%"  align="center">�տ���</td>
  <td  width="10%" align="center">�տ�����</td>
  <td align="center">��ע</td>
</tr>
<%
 //�������ڴ�ϵͳȡ��װʵ�տ���
	
	String contractId=null;
	String custId=request.getParameter("khbh");
	String orderId=hth;  //�������
	double allamount=0;
	
	Pay pay=new Pay();

	Double amount=0.0;// �տ���
	java.util.Date payTime;// �տ�����
	String payType;// ���ʽ
	String billNo;// Ʊ�ݱ��
	String payForUse;// ������;
	String remark;// ��ע��Ϣ
	String person;// ¼����
	Date time;// ¼��ʱ��

	DateFormat f1;
	f1 = DateFormat.getDateInstance();
	

	
	String url = cf.getValue("kb_url");
	Service service = new Service();
	Call call;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	QName qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
		new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//�趨����Ĳ�����
	call.addParameter("orderId", qn, ParameterMode.IN);
	//�趨���صĲ���
	call.setReturnType(qn, Pay[].class);

	Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});
	for(int i=0;i<obj.length;i++)
	{
		 amount=obj[i].getAmont();
		 payTime=obj[i].getPayTime();// �տ�����
		 payForUse=obj[i].getPayForUse();// ������;
		 remark=obj[i].getRemark();// ��ע��Ϣ
		 payType=obj[i].getPayType();// ���ʽ

		 if (payForUse.equals("��װ��Ʒ�"))
		 {
			 continue;
		 }

		 allamount=allamount+amount;

		 if (payForUse.equals("��װ���ڿ�") && !payType.equals("�����ڴ��Ż�ȯ����") && !payType.equals("���ĳ��Ż�ȯ����"))
		 {
			 jzsqk+=amount;
		 }
		 if (payForUse.equals("��װ���ڿ�") && !payType.equals("�����ڴ��Ż�ȯ����") && !payType.equals("���ĳ��Ż�ȯ����"))
		 {
			 jzzqk+=amount;
		 }

		%>
		<tr bgcolor="#CCCCFF"> 
		  <td align="center"><%=orderId%></td>
		  <td align="center"><%=payForUse%> </td>
		  <td align="center"><%=payType%> </td>
		  <td align="center"><%=amount%> </td>
		  <td align="center"><%=f1.format(payTime)%> </td>
		  <td align="center"><%=remark%> </td>
		</tr>
		<%
	}
					 
	jzssk=allamount;

	if (qye==0)
	{
		sskbl=0;
	}
	else{
		sskbl=cf.round(jzssk*100/qye,2);
	}

	zqje=jzzqk;

	jsje=cf.round(zqje*jsbl/100*0.88,2);
 //ȡ��װ�����
 %>
 </table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
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
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ�ܶ��ǰ��</font></td>
    <td><%=wdzgce%></td>
    <td align="right"><font color="#0000FF">��ͬ�ܶ</font>�ۺ�<font color="#0000FF">��</font></td>
    <td><%=qye%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���̺�ͬ���ǰ��</font></td>
    <td><%=zqgczjf%></td>
    <td align="right"><font color="#0000FF">���̺�ͬ�</font>�ۺ�<font color="#0000FF">��</font></td>
    <td><%=zhgczjf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�����������ǰ��</font></td>
    <td><%=zjxje%></td>
    <td align="right"><font color="#0000FF">���������</font>�ۺ�<font color="#0000FF">��</font></td>
    <td><%=zhzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʵ�ʹ��̿��ǰ��</font></td>
    <td><%=zqsjgck%></td>
    <td align="right"><font color="#0000FF">ʵ�ʹ��̿</font>�ۺ�<font color="#0000FF">��</font></td>
    <td><%=zhsjgck%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��װ���ڿ�</span></td>
    <td><%=jzsqk%></td>
    <td align="right"><span class="STYLE2">��װ���ڿ�</span></td>
    <td><%=jzzqk%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4">�ۼƼ�װʵ�տ�</span></td>
    <td><%=jzssk%></td>
    <td align="right"><span class="STYLE4">ʵ�տ����</span></td>
    <td><%=sskbl%>%</td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">�����¼��</span></td> 
  <td width="31%"> 
    <input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">�ͻ����</span></td> 
  <td width="31%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">ʩ����</span></td> 
  <td width="31%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select>  </td>
  <td align="right" width="19%"><span class="STYLE2">�ֳ�������</span></td> 
  <td width="31%"> 
    <input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��������</td> 
  <td width="31%"> 
    <input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��������</td> 
  <td width="31%"> 
    <input type="text" name="jskjs" value="<%=zqje%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>�������</td> 
  <td width="31%"> 
    <input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>������</td> 
  <td width="31%"> 
    <input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" >  </td>
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

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)
{
	var jsje=0;//���Ϸ�
	jsje=FormName.jskjs.value*FormName.jsbl.value/100*0.88;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.sgbz)=="") {
		alert("������[�ֳ�������]��");
		FormName.sgbz.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jskjs)=="") {
		alert("������[��������]��");
		FormName.jskjs.focus();
		return false;
	}
	if(!(isFloat(FormName.jskjs, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.jskjs.value)==0)
	{
		alert("����[��������]����Ϊ0");
		FormName.jskjs.select();
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)==0)
	{
		alert("����[�������]����Ϊ0");
		FormName.jsbl.select();
		return false;
	}

	if(	javaTrim(FormName.jsje)=="") {
		alert("������[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
