<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̼���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
    String yhmc=(String)session.getAttribute("yhmc");
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
%>
<%
String tjrq=request.getParameter("tjrq");
String tjrq2=request.getParameter("tjrq2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allzsgs=0;//Ŀǰ��ʩ��������
int allwggs=0;//�������깤����
int allxkgds=0;//δ�ɵ�����
int allpdwkgs=0;//�ɵ���δ��������
int wkgs=0;//�����ڿ���������
int ljwkgs=0;//�ۼƿ���������
int wybs=0;//���������ι�������������
int ljwybs=0;//�ۼ����ι�������������
int wzqs=0;//��������������������
int ljwzqs=0;//�ۼ���������������
int wjgs=0;//�������깤������
int ljwjgs=0;//�ۼ��깤������

try {
	conn=cf.getConnection();


	//Ŀǰ��ʩ��������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='1' and gcjdbm!='5'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzsgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�������깤����
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='5'";
	ls_sql+=" and sjjgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and sjjgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allwggs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�¿���������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm='2' ";
	ls_sql+=" and sjkgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and sjkgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allxkgds=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�ɵ���δ��������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm='1' and pdclzt!='1'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allpdwkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();


	//�����ڿ���������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where kgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and kgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (kgrq<sjkgrq or (sjkgrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�ۼƿ���������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and kgrq<=SYSDATE";
	ls_sql+=" and (kgrq<sjkgrq or (sjkgrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//���������ι�������������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhybgcrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and jhybgcrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and (jhybgcrq<sybgcrq or (sybgcrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wybs=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�ۼ����ι�������������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhybgcrq<=SYSDATE";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (jhybgcrq<sybgcrq or (sybgcrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwybs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//��������������������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhzqsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and jhzqsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and (jhzqsj<szqsj or (szqsj is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wzqs=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//�ۼ���������������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhzqsj<=SYSDATE";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (jhzqsj<szqsj or (szqsj is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwzqs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�������깤������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and jgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=" and ((jgrq<sjjgrq and gcjdbm='5') or (gcjdbm!='5'))";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//�ۼ��깤������
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' ";
	ls_sql+=" and ((jgrq<sjjgrq and gcjdbm='5') or (gcjdbm!='5' and jgrq<=SYSDATE))";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwjgs=rs.getInt(1);
	}
	ps.close();
	rs.close();
 wybs+=wjgs+wzqs+wkgs;
}
catch (Exception e) {
	out.print("Exception: " + e);
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

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">
<b>�����ڴ�<%=fgs%>װ�ηֹ�˾</b><br>����ʩ����� 
ʱ�䣨<%=tjrq%>----<%=tjrq2%>�� ͳ���ˣ�<%=yhmc%>
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
    <td width="10%" > 
      <div align="center"><b>�� ��&nbsp; </b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��</b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��&nbsp; </b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��</b></div>

    </td>
	<td width="10%" > 
      <div align="center"><b>�� ��&nbsp; </b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��</b></div>

    </td>
	<td width="10%" > 
      <div align="center"><b>�� ��&nbsp; </b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��</b></div>

    </td>
	  </td>
	<td width="10%" > 
      <div align="center"><b>�� ��&nbsp; </b></div>
    </td>
    <td width="10%" > 
      <div align="center"><b>�� ��</b></div>

    </td>
  </tr>
  <tr align="center"> 
    <td width="10%" >Ŀǰ��ʩ��������</td>
    <td width="10%" ><%=allzsgs%></td>
    <td width="10%" >�������깤����</td>
    <td width="10%" ><%=allwggs%></td>
  
  
    <td width="10%" align="center" >�¿�����������</td>
    <td width="10%" align="center" ><%=allxkgds%></td>
    <td width="10%" align="right" >
      <div align="center">δ��������</div>
    </td>
    <td width="10%" >
      <div align="center"><%=allpdwkgs%></div>
    </td>
 
    <td width="10%" align="right" > 
      <div align="center">���ڹ�������</div>
    </td>
    <td width="10%" > 
      <div align="center"><%=wybs%></a></div>
    </td>
    
  </tr>
</table>



<div align="center"><br><b>Ŀǰ��ʩ������ϸ</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
  <td width="7%">���</td>
    <td width="7%">��ͬ��</td>
    <td width="5%">�ͻ�����</td>
    <td width="18%">���ݵ�ַ</td>
    <td width="5%">���ʦ</td>
    <td width="5%">�ʼ�</td>
    <td width="5%">ʩ����</td>
    <td width="6%">���̽���</td>
    <td width="7%">ǩԼ����</td>
    <td width="7%">�ɵ�ʱ��</td>
    <td width="7%">Ӧ��������</td>
    <td width="7%">ʵ��������</td>
    <td width="7%">���ι���</td>
    <td width="7%">��������</td>
    <td width="7%">Ӧ��������</td>
  </tr>
  <%


String hth=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String qyrq=null;
String pdsj=null;
String kgrq=null;
String sjkgrq=null;
String sybgcrq=null;
String szqsj=null;
String jgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;

String ys=null;
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;

try {

	int row=0;
	ls_sql="select hth,khxm,fwdz,sjs,zjxm,sgdmc sgd,qyrq,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,gcjdmc,pdclzt";
	ls_sql+=" from  crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.zt='2' and crm_khxx.gcjdbm!='5' and crm_khxx.gcjdbm!='1'";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.gcjdbm,qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		pdsj=cf.fillHtml(rs.getDate("pdsj"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
		szqsj=cf.fillHtml(rs.getDate("szqsj"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}

		if (pdclzt.equals("1"))
		{
			ys1="#FFFFFF";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else{
			ys1="#FF9999";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}

		if (gcjdbm.equals("2"))//1��δ������2�� ���Ͻ�����3�����ι������գ�4�� �������գ�5:���깤
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("3"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("4"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FF6699";
		}

%> 
  <tr align="center" bgcolor="<%=ys%>">
  <td><%=row%></td>
    <td><%=hth%></td>
    <td><%=khxm%></td>
    <td><%=fwdz%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
    <td><%=gcjdmc%></td>
    <td bgcolor="<%=ys1%>"><%=qyrq%></td>
    <td bgcolor="<%=ys1%>"><%=pdsj%></td>
    <td bgcolor="<%=ys1%>"><%=kgrq%></td>
    <td bgcolor="<%=ys2%>"><%=sjkgrq%></td>
    <td bgcolor="<%=ys3%>"><%=sybgcrq%></td>
    <td bgcolor="<%=ys4%>"><%=szqsj%></td>
    <td bgcolor="#FFFFFF"><%=jgrq%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
</body>
</html>
