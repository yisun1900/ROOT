<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���㹤��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%" >���</td>
	<td  width="3%" >��������</td>

	<td  width="2%">��������</td>
	<td  width="2%">��λ����</td>
	<td  width="2%">���乤��</td>
	<td  width="2%">��ͨ����</td>
	<td  width="2%">ͨѶ����</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="3%">���˹���</td>
	<td  width="3%">��н</td>
	<td  width="2%">��н�ϸ�</td>

	<td  width="3%">��Ч���ʻ���</td>
	<td  width="2%">��Ч��ֵ</td>
	<td  width="3%">��Ч����</td>

	<td  width="3%">����ҵ��</td>
	<td  width="3%">����ҵ���ܶ�</td>
	<td  width="3%">����3��ҵ��</td>
	<td  width="3%">ҵ�����˿ۿ�</td>

	<td  width="2%">ʵ�ʳ�������</td>
	<td  width="2%">�¼�����</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="2%">�Ӱ�����</td>
	<td  width="2%">�¼ٿۿ�</td>
	<td  width="2%">���ٿۿ�</td>
	<td  width="2%">�����ۿ�</td>
	<td  width="2%">���ٿۿ�</td>
	<td  width="2%">ȱ�ڿۿ�</td>
	<td  width="2%">�Ӱ��</td>

	<td  width="2%">�۱���</td>
	<td  width="2%">����</td>
	<td  width="2%">��������</td>
	<td  width="3%">Ӧ������</td>
	<td  width="3%">���ʱ���</td>
	<td  width="2%">�۸�˰</td>
	<td  width="3%">ʵ������</td>
</tr>


<%
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=request.getParameter("ssfgs");
String khzq=request.getParameter("khzq");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;



try {
	conn=cf.getConnection();

	String tcqssj=null;
	String tcjzsj=null;
	double qqts=0;
	ls_sql="select TO_CHAR(ksrq,'YYYY-MM-DD'),TO_CHAR(zzrq,'YYYY-MM-DD'),qqts ";
	ls_sql+=" from  rs_gzb";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcqssj=rs.getString(1);
		tcjzsj=rs.getString(2);
		qqts=rs.getDouble(3);
	}
	rs.close();
	ps.close();


	int row=0;


	String getdwbh=null;
	String dwmc=null;

	double jbgz=0;
	double gwgz=0;
	double glgz=0;
	double jtbt=0;
	double dhbt=0;
	double cb=0;
	double buzhu=0;
	double dixin=0;//��н
	double dxsf=0;

	double jxgzjs=0;
	double jxfz=0;
	double jxgz=0;

	double khyj=0;
	double bqyjze=0;
	double sqyj=0;
	double khgz=0;
	double yjkhkk=0;

	double cqts=0;
	double sjts=0;
	double bjts=0;
	double kgts=0;
	double cjts=0;
	double jbts=0;

	double sjkk=0;
	double bjkk=0;
	double cjkk=0;
	double kgkk=0;
	double qqkk=0;
	double jbf=0;

	double kbx=0;

	double jf=0;
	double kzbj=0;
	double qtkk=0;

	double yfgz=0;
	double ksk=0;
	double sfgz=0;

	
	
	ls_sql="select rs_gzmxb.dwbh,dwmc";
	ls_sql+=" ,sum(jbgz) jbgz,sum(gwgz) gwgz,sum(glgz) glgz,sum(jtbt) jtbt,sum(dhbt) dhbt,sum(cb) cb,sum(buzhu) buzhu,sum(dixin) dixin,sum(dxsf) dxsf,sum(jxgzjs) jxgzjs,sum(jxfz) jxfz,sum(jxgz) jxgz,sum(khyj) khyj,sum(bqyjze) bqyjze,sum(sqyj) sqyj,sum(khgz) khgz,sum(yjkhkk) yjkhkk";
	ls_sql+=" ,sum(cqts) cqts,sum(sjts) sjts,sum(bjts) bjts,sum(kgts) kgts,sum(cjts) cjts,sum(jbts) jbts,sum(sjkk) sjkk,sum(bjkk) bjkk,sum(cjkk) cjkk,sum(kgkk) kgkk,sum(qqkk) qqkk,sum(jbf) jbf";
	ls_sql+=" ,sum(kbx) kbx,sum(jf) jf,sum(kzbj) kzbj,sum(qtkk) qtkk,sum(yfgz) yfgz,sum(ksk) ksk,sum(sfgz) sfgz";
	ls_sql+=" from rs_gzmxb,sq_dwxx";
	ls_sql+=" where rs_gzmxb.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_gzmxb.khzq='"+khzq+"' and rs_gzmxb.ssfgs='"+ssfgs+"'";
    ls_sql+=" group by rs_gzmxb.dwbh,dwmc";
    ls_sql+=" order by rs_gzmxb.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));

		jbgz=rs.getDouble("jbgz");
		gwgz=rs.getDouble("gwgz");
		glgz=rs.getDouble("glgz");
		jtbt=rs.getDouble("jtbt");
		dhbt=rs.getDouble("dhbt");
		cb=rs.getDouble("cb");
		buzhu=rs.getDouble("buzhu");
		dixin=rs.getDouble("dixin");
		dxsf=rs.getDouble("dxsf");

		jxgzjs=rs.getDouble("jxgzjs");
		jxfz=rs.getDouble("jxfz");
		jxgz=rs.getDouble("jxgz");

		khyj=rs.getDouble("khyj");
		bqyjze=rs.getDouble("bqyjze");
		sqyj=rs.getDouble("sqyj");
		khgz=rs.getDouble("khgz");
		yjkhkk=rs.getDouble("yjkhkk");

		cqts=rs.getDouble("cqts");
		sjts=rs.getDouble("sjts");
		bjts=rs.getDouble("bjts");
		kgts=rs.getDouble("kgts");
		cjts=rs.getDouble("cjts");
		jbts=rs.getDouble("jbts");
		sjkk=rs.getDouble("sjkk");
		bjkk=rs.getDouble("bjkk");
		kgkk=rs.getDouble("kgkk");
		cjkk=rs.getDouble("cjkk");
		qqkk=rs.getDouble("qqkk");
		jbf=rs.getDouble("jbf");

		kbx=rs.getDouble("kbx");

		jf=rs.getDouble("jf");
		kzbj=rs.getDouble("kzbj");
		qtkk=rs.getDouble("qtkk");

		yfgz=rs.getDouble("yfgz");
		ksk=rs.getDouble("ksk");
		sfgz=rs.getDouble("sfgz");


		row++;

		String bgcolor="";
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=dwmc%></td>

			<td ><%=jbgz%></td>
			<td ><%=gwgz%></td>
			<td ><%=glgz%></td>
			<td ><%=jtbt%></td>
			<td ><%=dhbt%></td>
			<td ><%=cb%></td>
			<td ><%=buzhu%></td>
			<td ><%=khgz%></td>
			<td ><%=dixin%></td>
			<td ><%=dxsf%></td>

			<td ><%=jxgzjs%></td>
			<td ><%=jxfz%></td>
			<td ><%=jxgz%></td>

			<td ><%=khyj%></td>
			<td ><%=bqyjze%></td>
			<td ><%=sqyj%></td>
			<td ><%=yjkhkk%></td>

			<td ><%=cqts%></td>
			<td ><%=sjts%></td>
			<td ><%=bjts%></td>
			<td ><%=kgts%></td>
			<td ><%=cjts%></td>
			<td ><%=jbts%></td>
			<td ><%=sjkk%></td>
			<td ><%=bjkk%></td>
			<td ><%=kgkk%></td>
			<td ><%=cjkk%></td>
			<td ><%=qqkk%></td>
			<td ><%=jbf%></td>

			<td ><%=kbx%></td>

			<td ><%=jf%></td>
			<td ><%=qtkk%></td>

			<td ><%=yfgz%></td>
			<td ><%=kzbj%></td>
			<td ><%=ksk%></td>
			<td ><%=sfgz%></td>
		
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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
</table>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

//-->
</SCRIPT>
