<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String wheresql="";


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_khxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_khxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_khxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_khxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_khxx.zybm='"+zybm+"')";
	}


	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}


	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khlxbm=null;
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+khlxbm+"')";
	}

	String fwmj=null;
	fwmj=request.getParameter("fwmj");
	if (fwmj!=null)
	{
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj>="+fwmj+") ";
	}
	fwmj=request.getParameter("fwmj2");
	if (fwmj!=null)
	{
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj<="+fwmj+") ";
	}
	String qye=null;
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+qye+") ";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}

	String sjjgrq=null;
	sjjgrq=request.getParameter("sjjgrq");
	if (sjjgrq!=null)
	{
		sjjgrq=sjjgrq.trim();
		if (!(sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq>=TO_DATE('"+sjjgrq+"','YYYY/MM/DD'))";
	}
	sjjgrq=request.getParameter("sjjgrq2");
	if (sjjgrq!=null)
	{
		sjjgrq=sjjgrq.trim();
		if (!(sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq<=TO_DATE('"+sjjgrq+"','YYYY/MM/DD'))";
	}

	String yqts=null;
	yqts=request.getParameter("yqts");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts>="+yqts+")";
	}
	yqts=request.getParameter("yqts2");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts<="+yqts+")";
	}

	String[] hxmjbm=null;
	hxmjbm=request.getParameterValues("hxmjbm");
	if (hxmjbm!=null)
	{
		wheresql+=cf.arrayToSQL(hxmjbm,"crm_khxx.hxmjbm");
	}

	String[] zxjwbm=null;
	zxjwbm=request.getParameterValues("zxjwbm");
	if (zxjwbm!=null)
	{
		wheresql+=cf.arrayToSQL(zxjwbm,"crm_khxx.zxjwbm");
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int khzs=0;
int allkhsl=0;
int allhtgq=0;
int allsjgq=0;
int allkgyq=0;
int allyqtsl=0;
String gcyqyybm=null;
String gcyqyymc=null;
int khsl=0;
double khbfb=0;
double yqtsl=0;
double yqtbfb=0;
double htgq=0;
double sjgq=0;
double kgyq=0;
double yql=0;

int yqkhzs=0;

try {
	conn=cf.getConnection();

	//��ȡ�ͻ�����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ȡ���ڿͻ�����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where (crm_khxx.gcsfyq='2')";//1��δ���ڣ�2������
	ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yqkhzs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ȡ���ڿͻ�����
	ls_sql="SELECT count(crm_khxx.khbh),sum(jgrq-kgrq),sum(sjjgrq-sjkgrq),sum(sjkgrq-kgrq)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where (crm_khxx.gcsfyq='2')";//1��δ���ڣ�2������
	ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
	ls_sql+=" and jgrq is not null and kgrq is not null and sjjgrq is not null and sjkgrq is not null";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allkhsl=rs.getInt(1);
		allhtgq=rs.getInt(2);
		allsjgq=rs.getInt(3);
		allkgyq=rs.getInt(4);
	}
	rs.close();
	ps.close();

	
%>
	<CENTER >
	  <B>����ԭ��������ͻ�����<%=khzs%>��������<%=yqkhzs%>��������<%=cf.formatDouble(yqkhzs*100.0/khzs)%>%��</B><BR>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="12%">����ԭ��</td>
	  <td  width="9%">������</td>
	  <td  width="7%">���ڿͻ���</td>
	  <td  width="19%">���ڿͻ����ٷֱ�</td>
	  <td  width="9%">ƽ����ͬ����</td>
	  <td  width="9%">ƽ��ʵ�ʹ���</td>
	  <td  width="8%">ƽ����������</td>
	  <td  width="8%">ƽ���깤����</td>
	  <td  width="19%">�깤���������ٷֱ�</td>
	</tr>

<%
	//��ȡ��������
	ls_sql="SELECT sum(crm_gcyqyymx.yqts)";
	ls_sql+=" FROM crm_khxx,crm_gcyqyymx";
	ls_sql+=" where crm_khxx.khbh=crm_gcyqyymx.khbh";
	ls_sql+=" and crm_khxx.gcsfyq='2'";//1��δ���ڣ�2������
	ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
	ls_sql+=" and jgrq is not null and kgrq is not null and sjjgrq is not null and sjkgrq is not null";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allyqtsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (allyqtsl==0)
	{
		return;
	}

		
	ls_sql="SELECT crm_gcyqyymx.gcyqyybm,gcyqyymc,count(*),ROUND(count(*)*100.0/"+khzs+",2),ROUND(count(*)*100.0/"+allkhsl+",1),ROUND(sum(crm_gcyqyymx.yqts)/count(*),1),ROUND(sum(crm_gcyqyymx.yqts)*100.0/"+allyqtsl+",1),ROUND(sum(jgrq-kgrq)/count(*),1),ROUND(sum(sjjgrq-sjkgrq)/count(*),1),ROUND(sum(sjkgrq-kgrq)/count(*),1)";
	ls_sql+=" FROM crm_khxx,crm_gcyqyymx,dm_gcyqyybm";
	ls_sql+=" where  crm_khxx.khbh=crm_gcyqyymx.khbh and crm_gcyqyymx.gcyqyybm=dm_gcyqyybm.gcyqyybm";
	ls_sql+=" and crm_khxx.gcsfyq='2'";//1��δ���ڣ�2������
	ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
	ls_sql+=" and jgrq is not null and kgrq is not null and sjjgrq is not null and sjkgrq is not null";
    ls_sql+=wheresql;
    ls_sql+=" group by crm_gcyqyymx.gcyqyybm,gcyqyymc";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		gcyqyybm=rs1.getString("gcyqyybm");
		gcyqyymc=rs1.getString("gcyqyymc");
		khsl=rs1.getInt(3);
		yql=rs1.getDouble(4);
		khbfb=rs1.getDouble(5);
		yqtsl=rs1.getDouble(6);
		yqtbfb=rs1.getDouble(7);
		htgq=rs1.getDouble(8);
		sjgq=rs1.getDouble(9);
		kgyq=rs1.getDouble(10);


		%>
		<tr align="center">
			<td ><%=gcyqyymc%></td>
			<td  align="center"><%=yql%>%</td>
			<td  align="center"><%=khsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(120/100.0*khbfb)%>" height="14"><%=khbfb%>%</td>
			<td  align="center"><%=htgq%>��</td>
			<td  align="center"><%=sjgq%>��</td>
			<td  align="center"><%=kgyq%>��</td>
			<td  align="center"><%=yqtsl%>��</td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(120/100.0*yqtbfb)%>" height="14"><%=yqtbfb%>%</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

%>
	<tr align="center" bgcolor="#CCCCCC">
		<td >�� ��</td>
		<td  align="center"><%=cf.formatDouble(allkhsl*100.0/khzs)%>%</td>
		<td  align="center"><%=allkhsl%></td>
		<td  align="left"><img src="/images/ColuGif.gif" width="120" height="14"></td>
		<td  align="center"><%=allhtgq/allkhsl%>��</td>
		<td  align="center"><%=allsjgq/allkhsl%>��</td>
		<td  align="center"><%=allkgyq/allkhsl%>��</td>
		<td  align="center"><%=allyqtsl/allkhsl%>��</td>
		<td  align="left"><img src="/images/ColuGif.gif" width="120" height="14"></td>
	</tr>
</table>

<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<p><b>��ע���ͻ�����<%=khzs%>�����ڿͻ�����<%=yqkhzs%>����Ϣδ����¼��<%=yqkhzs-allkhsl%></b></p>
<p><b>����ԭ��</b>����ɹ������ڵĸ���ԭ��</p>
<p><b>������</b>��ĳ��ԭ�����ڵĿͻ����¿ͻ����������������ڼ�δ���ڣ�</p>
<p><b>���ڿͻ���</b>��ĳ��ԭ��������ڵĿͻ���</p>
<p><b>���ڿͻ����ٷֱ�</b>��ĳ��ԭ�����ڿͻ���/��������</p>
<p><b>ƽ����ͬ���ڣ�������</b>������ͬ�깤���ڣ���ͬ��������)�����ڿͻ���</p>
<p><b>ƽ��ʵ�ʹ��ڣ�������</b>����ʵ���깤���ڣ�ʵ�ʿ�������)�����ڿͻ���</p>
<p><b>ƽ���������ڣ�������</b>����ʵ�ʿ������ڣ���ͬ��������)�����ڿͻ���</p>
<p><b>ƽ���깤���ڣ�������</b>����ʵ���깤���ڣ���ͬ�깤����)�����ڿͻ���</p>
<p><b>�깤���������ٷֱ�</b>��ĳ��ԭ���깤��������֮��/����������</p>
</body>
</html>