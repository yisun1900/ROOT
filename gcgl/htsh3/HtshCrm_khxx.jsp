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
PreparedStatement ps=null;
String ls_sql=null;
String wheresql="";

Double allamount=0.00;// �տ���
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String hth=null;
String sjs=null;
double qye=0;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;
String htshbz=null;
String zjxm =null;
String qyrq =null;
String jyjdrq =null;
double wdzgce =0;
double zkl=0;
String sfyyh=null;
String cxhdbm=null;
String yhyy=null;
double suijin=0;
double suijinbfb=0;
double zjxje=0;
double glftd=0;
double guanlif=0;
double fj=0;

String xxshr=null;
String xxshsj=null;
String htshdf=null;
String xxshyj=null;
String sfyrz=null;
String rzsc=null;
String htshsj=null;
String htshr=null;
String htshyj=null;
String khjl=null;
String bjjb=null;

String pms="";
String dj="";
String qsjhtsj="";
String sjhtje="";
String sfzhm="";
String lrr=null;
String lrbm =null;
String lrsj=null;
String bz="";
String djjzsfs=null;
double zsbfb=0;

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

	ls_sql="select crm_khxx.guanlif,crm_khxx.qtdh,crm_khxx.email,htshsj,htshr,htshyj,rzsc,sfyrz,glftd,suijin,suijinbfb,zjxje,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,xxshr,xxshsj,xxshyj,htshbz,zjxm,qyrq,jyjdrq,wdzgce,zkl,sfyyh,cxhdbm,yhyy,khjl,bjjb,djjzsfs";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx,crm_khdjj";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		guanlif=rs.getDouble("guanlif");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		htshr=cf.fillNull(rs.getString("htshr"));
		htshyj=cf.fillNull(rs.getString("htshyj"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		glftd=rs.getDouble("glftd");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxje=rs.getDouble("zjxje");
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xxshr=cf.fillNull(rs.getString("xxshr"));
		xxshsj=cf.fillNull(rs.getDate("xxshsj"));
		xxshyj=cf.fillNull(rs.getString("xxshyj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		khjl=cf.fillNull(rs.getString("khjl"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));

	}
	rs.close();

	ls_sql="select zsbfb";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsbfb=rs.getDouble("zsbfb");

	}
	rs.close();
	ps.close();

	ls_sql="select fj ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);


	if (rs.next())
	{
		fj=rs.getDouble("fj");
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


%>

<html>
<head>
<title>��ͬ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">��ͬ��� </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr bgcolor="#CCCCFF"> 
			  <td  width="15%"  align="center">��ͬ��</td>
			  <td  width="10%"  align="center">������;</td>
			  <td  width="8%"  align="center">�տ���</td>
			  <td  width="10%" align="center">�տ�����</td>
			  <td align="center">��ע</td>
			</tr>
<%
 //�������ڴ�ϵͳȡ��װʵ�տ���
	
		String contractId=null;
		String custId=request.getParameter("khbh");
		//String url = cf.getValue("kb_url");
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
<form method="post" action="" name="selectform" >
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="20%"> 
        <div align="right">�ͻ����</div>      </td>
      <td width="30%"><%=khbh%> </td>
      <td width="19%"> 
        <div align="right">��ͬ��</div>      </td>
      <td width="31%"><%=hth%> </td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#CCCCFF" align="right">�ͻ�����</td>
      <td width="30%" bgcolor="#CCCCFF"><%=khxm%> </td>
      <td width="19%" bgcolor="#CCCCFF" align="right">�ͻ�����</td>
      <td width="31%" bgcolor="#CCCCFF"><%=khjl%></td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#CCCCFF">�ֻ�</td>
      <td width="30%" bgcolor="#CCCCFF"><%=lxfs%></td>
	  <td width="19%" bgcolor="#CCCCFF" align="right">סլ���ۼ�</td>
      <td width="31%" bgcolor="#CCCCFF"><%=fj%></td>
    </tr>
    <tr>
      <td width="20%" align="right" bgcolor="#CCCCFF">�����绰</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=qtdh%>      </td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#CCCCFF">�����ʼ�</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=email%>      </td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%> </td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
      <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="19%" bgcolor="#CCCCFF" align="right">װ�����ʦ</td>
      <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#CCCCFF"> 
        <div align="right">���̵���</div>      </td>
      <td width="30%" bgcolor="#CCCCFF"><%=zjxm%> </td>
      <td width="19%" bgcolor="#CCCCFF"> 
        <div align="right">ʩ����</div>      </td>
      <td width="31%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
      <td width="30%" bgcolor="#CCCCFF"><%=qyrq%></td>
      <td width="19%" align="right" bgcolor="#CCCCFF">��������</td>
      <td width="31%" bgcolor="#CCCCFF"><%=jyjdrq%></td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#CCCCFF">��ͬ��������</td>
      <td width="30%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="19%" align="right" bgcolor="#CCCCFF">��ͬ��������</td>
      <td width="31%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">����ԭ����</td>
      <td width="30%"><%=wdzgce%></td>
      <td width="19%" bgcolor="#E8E8FF" align="right">ʵ���ۿ���</td>
      <td width="31%"><%=zkl%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">����ǩԼ��</td>
      <td width="30%"><%=qye%></td>
      <td width="19%" bgcolor="#E8E8FF" align="right">װ������</td>
      <td width="31%"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">�Ƿ����Ż�</td>
      <td width="30%"><%
	cf.radioToken(out, "2+��",djjzsfs,true);	
%></td>
      <td width="19%" bgcolor="#E8E8FF" align="right">�μӴ����</td>
      <td width="31%"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">�Ż�����</td>
      <td colspan="3"><%=zsbfb%>%������</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">�Ƿ�����֤</td>
      <td width="30%"><%
	cf.radioToken(out, "Y+��&N+��",sfyrz,true);
%></td>
      <td width="19%" bgcolor="#E8E8FF" align="right">��֤�г�</td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%"><b>˰��</b></td>
      <td width="30%"><%=cf.formatDouble(suijin)%>��<%=suijinbfb%>����</td>
      <td align="right">��Ŀ������</td>
      <td><%=cf.formatDouble(guanlif)%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      
      <td bgcolor="#E8E8FF" align="right">����ǩԼ��</td>
      <td><%=cf.formatDouble(qye)%></td>
	   <td align="right">ʵ�ռ�װ��</td>
      <td ><%=allamount%></td>
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
      <td align="right" bgcolor="#FFFFFF">����֤����</td>
      <td bgcolor="#FFFFFF"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��ƺ�ͬ˵��</td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%"><span class="STYLE1"><span class="STYLE2">*</span>���ʱ��</span></td>
      <td width="30%"> 
        <input type="text" name="htshsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>      </td>
      <td width="19%" bgcolor="#E8E8FF" align="right"><span class="STYLE1"><span class="STYLE2">*</span>�����</span></td>
      <td width="31%"> 
        <input type="text" name="htshr" size="20" maxlength="20" value="<%=yhmc%>" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">��ͬ������</td>
      <td colspan="3"> 
        <textarea name="htshyj" rows="3" cols="71"><%=htshyj%></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center">
          <!--<input type="button" value="¼�벻�ϸ���Ŀ" onClick="f_lr(selectform)"  >-->
          <input type="button"  value="������" onClick="f_wc(selectform)"  >
		   <input type="button"  value="��ӡ��ͬ˵����" onClick="f_ck(selectform)" name="ck" >
   <input type="button" onClick="window.open('/khxx/ViewCw_jzfkjh.jsp?khbh=<%=khbh%>')"  value="��װ����ƻ�">
         <input type="hidden" name="khbh"  value="<%=khbh%>" >
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_lr(FormName)//����FormName:Form������
{
	FormName.target="_blank";
	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}


function f_wc(FormName)//����FormName:Form������
{

	FormName.target="";
	FormName.action="SaveWcshCrm_khxx.jsp";
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
<%
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