<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

Double allamount=0.00;// �տ���
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;


String htshr=null;
String htshsj=null;
String htshdf=null;
String htshyj=null;


String pms="";
String dj="";
String qsjhtsj="";
String sjhtje="";
String sfzhm="";
String lrr=null;
String lrbm =null;
String lrsj=null;
String bz="";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();


	ls_sql="select qsjhtsj,pms,dj,sjhtje,lrr,lrsj,bz ";
	ls_sql+=" from  crm_sjhtxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qsjhtsj=cf.fillNull(rs.getDate("qsjhtsj"));
		pms=cf.fillNull(rs.getString("pms"));
		dj=cf.fillNull(rs.getString("dj"));
		sjhtje=cf.fillNull(rs.getString("sjhtje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,htshr,htshsj,htshyj";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		htshr=cf.fillNull(rs.getString("htshr"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		htshyj=cf.fillNull(rs.getString("htshyj"));
	}
	rs.close();

	if (htshr.equals(""))
	{
		htshr=yhmc;
	}
	if (htshsj.equals(""))
	{
		htshsj=cf.today();
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>��ͬ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��ͬ��� </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF"> 
  <td align="center">��ͬ��</td>
  <td align="center">������;</td>
  <td align="center">�տ���</td>
  <td align="center">�տ�����</td>
  <td align="center">��ע</td>
</tr>
<%
 //�������ڴ�ϵͳȡ��װʵ�տ���
	
		String contractId=null;
		String custId=request.getParameter("khbh");
		//String url = cf.getValue("kb_url");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			String orderId=hth;  //�������
			
			Pay pay=new Pay();

			Double amount=0.0;// �տ���
			java.util.Date payTime;// �տ�����
			String payType;// ���ʽ
			String billNo;// Ʊ�ݱ��
			String payForUse;// ������;
			String remark;// ��ע��Ϣ
			String person;// ¼����
			Date time;// ¼��ʱ��

			
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
				
						DateFormat f1;
						f1 = DateFormat.getDateInstance();
						

						 Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});
						 for(int i=0;i<obj.length;i++)
							 {
							 amount=obj[i].getAmont();
							 payTime=obj[i].getPayTime();// �տ�����
							 payForUse=obj[i].getPayForUse();// ������;
							 remark=obj[i].getRemark();// ��ע��Ϣ
							 allamount=allamount+amount;


%>
		 
			<tr bgcolor="#CCCCFF"> 
			  <td align="center"><%=orderId%></td>
			  <td align="center"><%=payForUse%> </td>
			  <td align="center"><%=amount%> </td>
			  <td align="center"><%=f1.format(payTime)%> </td>
			  <td align="center"><%=remark%> </td>
			</tr>
		
<%
							}
						
					 
 //ȡ��װ�����
 %>
 </table>
  
<form method="post" action="" name="selectform" target='_blank'>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="21%"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="29%"><%=khbh%> </td>
      <td width="21%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="29%"><%=khxm%> </td>
    </tr>
    <tr> 
      <td width="21%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
      <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="21%" bgcolor="#CCCCFF" align="right">��ͬ��</td>
      <td width="29%" bgcolor="#CCCCFF"><%=hth%></td>
    </tr>
    <tr> 
      <td width="21%" align="right" bgcolor="#CCCCFF">��ϵ��ʽ</td>
      <td width="29%" bgcolor="#CCCCFF"><%=lxfs%></td>
      <td width="21%" align="right" bgcolor="#CCCCFF">����ǩԼ��</td>
      <td width="29%" bgcolor="#CCCCFF"><%=qye%></td>
    </tr>
    <tr> 
      <td width="21%" align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
    </tr>
    <tr> 
      <td width="21%" bgcolor="#CCCCFF"> 
        <div align="right">װ�����ʦ</div>
      </td>
      <td width="29%" bgcolor="#CCCCFF"><%=sjs%> </td>
      <td width="21%" bgcolor="#CCCCFF"> 
        <div align="right">ʩ����</div>
      </td>
      <td width="29%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="21%" align="right" bgcolor="#CCCCFF">Ӧ��������</td>
      <td width="29%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="21%" align="right" bgcolor="#CCCCFF">Ӧ��������</td>
      <td width="29%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
      <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#FFFFFF">��ƺ�ͬ��</td>
      <td bgcolor="#FFFFFF"><%=hth%></td>
      <td align="right" bgcolor="#FFFFFF">ǩ��ƺ�ͬʱ�� </td>
      <td bgcolor="#FFFFFF"><%=qsjhtsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">ƽ����</td>
      <td><%=pms%></td>
      <td align="right">����</td>
      <td><%=dj%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#FFFFFF">��ƺ�ͬ���</td>
      <td bgcolor="#FFFFFF"><%=sjhtje%></td>
      <td align="right" bgcolor="#FFFFFF">���֤����</td>
      <td bgcolor="#FFFFFF"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��ƺ�ͬ˵��</td>
      <td colspan="3"><%=bz%> </td>
    </tr>
  <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">���ʱ��</td>
      <td width="28%"> 
        <input type="text" name="htshsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>
      </td>
      <td width="23%" bgcolor="#E8E8FF" align="right">�����</td>
      <td width="27%"> 
        <input type="text" name="htshr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">��ͬ������</td>
      <td colspan="3"> 
        <textarea name="htshyj" rows="3" cols="71"><%=htshyj%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button" value="�޸Ĳ��ϸ���Ŀ" onClick="f_lr(selectform)" name="lr" >
          <input type="button"  value="����" onClick="f_wc(selectform)" name="wc" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
		  <input type="button"  value="��ӡ��ͬ˵����" onClick="f_ck(selectform)" name="ck" >
  <input type="button" onClick="window.open('/khxx/ViewCw_jzfkjh.jsp?khbh=<%=khbh%>')"  value="��װ����ƻ�">
        </div>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.htshyj)=="") {
		alert("������[��ͬ������]��");
		FormName.htshyj.focus();
		return false;
	}

	FormName.target="";
	FormName.action="SaveWcshCrm_khxx.jsp";
	FormName.submit();
	return true;
}


function f_lr(FormName)//����FormName:Form������
{
	FormName.target="_blank";
	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{

	FormName.action="dyhtsm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
