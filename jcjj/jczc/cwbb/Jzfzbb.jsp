<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
String wheresql1="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql1+=" and a.ssfgs='"+fgs+"'";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}
wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


String djyj=request.getParameter("djyj");
String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" >
<CENTER style='FONT-SIZE: 14px;border-collapse:collapse'>
  <B>��װ���ܷ���ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<table width="2400" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999" style='FONT-SIZE: 12px;border-collapse:collapse'>
  <tr bgcolor="#CCCCCC"  align="center">
  <td  width="60" width="23">ǩԼ�·�</td>
  <td  width="20">���</td>
  <td  width="60">״̬</td>
  <td  width="60">�깤ʱ��</td>
  <td  width="150">ǩԼ����</td>
  <td  width="60">���ʦ</td>
   
  <td  width="60">��ͬ��</td>
  <td  width="60">����</td>
  <td  width="60">����ǩԼ��</td>
  <td  width="60">ǩԼ����</td>
  <td  width="60">ʩ����</td>

 <td  width="200">���ݵ�ַ</td>
<td  width="60">�ʼ�Ա</td>
<td  width="60">����</td>
<td  width="60">һ�ڿ�</td>
<td  width="60">���ڿ�</td>
<td  width="60">β��</td>
<td  width="60">�˿�</td>
<td  width="60">ʵ�տ�ϼ�</td>


<td  width="60">���Ϸ�</td>
<td  width="60">������</td>
<td  width="60">���̿�</td>
<td  width="60">ʵ��ʩ����</td>
<td  width="60">��װʵ�ն�</td>
<td  width="60">��װ����</td>
<td  width="60">�Ҿ�ʵ�տ�</td>
<td  width="60">�Ҿӷ������</td>

<td  width="60">�Ҿӷ������</td>
<td  width="60">�Ҿӷ���</td>
<td  width="60">�������</td>
<td  width="60">����</td>
<td  width="60">��װ��ɱ���</td>
<td  width="60">�г���֤��</td>
<td  width="60">������������</td>
<td  width="60">��Ʒѷ��������</td>

<td  width="60">��Ʒ�������</td>
<td  width="60">�����ȯ�ϼ�</td>
<td  width="60">�г���ȯ��</td>

<%
	
	
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	//��ȡ�����
	double maxqye=0;
	double zqye=0;
	double zjxje=0;	
	double alljzje=0;	
	double allzqye=0;
	double jzje=0;
	double Xzqys=0;
	double allXzqys=0;
	double zjxze=0;
	double htje=0;	
	double maxhtje=0;
	double anydmvalue=0;//ĳһ���������
	double Alljjze=0;//���мҾ��ܶ�
	double Sjsmmvalue=0;
	double Sjscgvalue=0;
	double Sjsjjvalue=0;
	
	//�ܼ�

	
	
	

	int qys=0;
	int khsl=0;
	int row=0;
	int maxkhsl=0;
	int allqys=0;
	//�ҾӸ�����������
	int mmsl=0;
	int jjsl=0;
	int cgsl=0;
	int zcsl=0;
	//����Ҿ������ͱ���
	int mmslvalue=0;
	int jjslvalue=0;
	int cgslvalue=0;
	int zcslvalue=0;
	//����Ҿ�������
	int Allmmzsl=0;
	int Alljjzsl=0;
	int Allcgzsl=0;
	int sfke=0;

	//������
	double sge=0;
	double sfke=0;
	double khsskzer=0;
	double khjskze=0;
	double clf=0;
	double jzhjk=0;
	double tk=0;
	double eqk=0;
	double yqk=0;
	double sqk=0;
	double hqk=0;
	double lfdj=0;//��������
	double qye=0;
	String khbh="";
	
	String khxm="";
	String fwdz="";
	String sjs="";
	String sgdmc="";
	String zjxm="";
	String hth="";
	String qyrq="";
	String jgrq="";
	String ysgcjdmc="";

//	out.println(maxqye);
	ls_sql="SELECT distinct(crm_khxx.khbh) as khbh,to_char(crm_khxx.qyrq,'mm') yue,crm_khxx.khxm,a.dwmc dm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_khxx.hth,to_char(crm_khxx.qyrq,'yyyy-mm-dd') as qyrq,crm_khxx.qye,ysgcjdmc,to_char(crm_khxx.jgrq,'yyyy-mm-dd') jgrq,sfke,sge";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,cw_khfkjl,sq_sgd,dm_gcjdbm ";
	ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and crm_khxx.zt='2'";
	//ls_sql+=wheresql;
	ls_sql+=" ORDER BY to_char(crm_khxx.qyrq,'mm')";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{	
		khbh="";
		sge=0;
		sfke=0;
		khbh=rs.getString("khbh");
		yue=rs.getString("yue");
		khxm=cf.fillNull(rs.getString("khxm"));
		dm=cf.fillNull(rs.getString("dm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=rs.getString("sjs");
		sgdmc=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		hth=rs.getString("hth");
		qyrq=cf.fillNull(rs.getString("qyrq"));
		qye=rs.getDouble("qye");
		jgrq=cf.fillNull(rs.getString("jgrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		sge=rs.getDouble("sge");//ʩ����
		sfke=rs.getDouble("sfke");//��װʵ�տ��
		row++;
		
		//������в�ѯ:��������
		hqk=0;
		lfdj=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.fklxbm='52' and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			lfdj=rs1.getDouble(1);//��������
		}
		rs1.close();
		ps1.close();

		//������в�ѯ:һ�ڿ�
		yqk=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.fkcs='1' and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			yqk=rs1.getDouble(1);//һ�ڿ�
		}
		rs1.close();
		ps1.close();
		//������в�ѯ:���ڿ�
		eqk=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.fkcs='2' and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			eqk=rs1.getDouble(1);//���ڿ�
		}
		rs1.close();
		ps1.close();
		//������в�ѯ:β��
		sqk=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.fkcs='3' and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sqk=rs1.getDouble(1);//β��
		}
		rs1.close();
		ps1.close();

		//������в�ѯ:�˿�
		tk=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where fkje<0 and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tk=rs1.getDouble(1);//β��
		}
		rs1.close();
		ps1.close();

		hqk=sqk+eqk+yqk+lfdj;//ʵ�տ�ϼ�
		
		//������в�ѯ:��װ�����
		jzhjk=0;//clear
		ls_sql="SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.fklxbm='91' and cw_khfkjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			jzhjk=rs1.getDouble(1);//β��
		}
		rs1.close();
		ps1.close();

		//������в�ѯ:���Ϸ�
		clf=0;//clear
		khsskzer=0;
		khjskze=0;//���̿�
		ls_sql="SELECT sum(clf),sum(khjskze),sum(khsskze)";
		ls_sql+=" FROM cw_gdjsjl";
		ls_sql+=" where cw_gdjsjl.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			clf=rs1.getDouble(1);//β��
			khjskze=rs1.getDouble(2);
			khsskzer=s1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		//������в�ѯ:���Ϸ�
		clf=0;//clear
		khsskzer=0;
		khjskze=0;//���̿�
		ls_sql="SELECT sum(clf),sum(khjskze),sum(khsskze)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			clf=rs1.getDouble(1);//β��
			khjskze=rs1.getDouble(2);
			khsskzer=s1.getDouble(3);
		}
		rs1.close();
		ps1.close();
%>
<TR>
 <td  width="60" width="23" align="center"><%=yue%>��</td>
  <td  width="20" align="center"><%=row%></td>
  <td  width="60" align="center"><%=ysgcjdmc%></td>
  <td  width="70" align="center"><%=jgrq%></td>
  <td  width="150" align="center"><%=dm%></td>
  <td  width="60" align="center"><%=sjs%></td>
   
  <td  width="60" align="center"><%=hth%></td>
  <td  width="60" align="center"><%=khxm%></td>
  <td  width="60" align="center"><%=qye%></td>
  <td  width="70" align="center"><%=qyrq%></td>
  <td  width="60" align="center"><%=sgdmc%></td>

 <td  width="200"><%=fwdz%></td>
<td  width="60" align="center"><%=zjxm%></td>
<td  width="60" align="center"><%=lfdj%></td>
<td  width="60" align="center"><%=yqk%></td>
<td  width="60" align="center"><%=eqk%></td>
<td  width="60" align="center"><%=sqk%></td>
<td  width="60" align="center"><%=tk%></td>
<td  width="60" align="center"><%=hqk%></td>


<td  width="60"><%=clf%></td>
<td  width="60">������</td>
<td  width="60">���̿�</td>
<td  width="60">ʵ��ʩ����</td>
<td  width="60">��װʵ�ն�</td>
<td  width="60"><%=jzhjk%></td>
<td  width="60">�Ҿ�ʵ�տ�</td>
<td  width="60">�Ҿӷ������</td>

<td  width="60">�Ҿӷ������</td>
<td  width="60">�Ҿӷ���</td>
<td  width="60">�������</td>
<td  width="60">����</td>
<td  width="60">��װ��ɱ���</td>
<td  width="60">�г���֤��</td>
<td  width="60">������������</td>
<td  width="60">��Ʒѷ��������</td>

<td  width="60">��Ʒ�������</td>
<td  width="60">�����ȯ�ϼ�</td>
<td  width="60">�г���ȯ��</td>
</TR>
<%
	}
	rs.close();
	ps.close();
%>
</table>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

