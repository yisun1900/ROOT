<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>施工队全年投诉</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String sgd=request.getParameter("sgd");

double allzqgczjf=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>
<div align="center"><br><b>施工队全年投诉（<%=sjfw%>－－<%=sjfw2%>）</b></div>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="2%">序号</td>
    <td width="4%">投诉记录号</td>
    <td width="7%">投诉内容</td>
    <td width="4%">客户姓名</td>
    <td width="11%">房屋地址</td>
    <td width="4%">人工辅料金额</td>
    <td width="4%">回单</td>
    <td width="4%">关系户</td>
    <td width="4%">设计师</td>
    <td width="4%">质检</td>
    <td width="4%">施工队</td>
    <td width="4%">工程进度</td>
    <td width="5%">签约日期</td>
    <td width="5%">合同开工日期</td>
    <td width="5%">实开工日期</td>
    <td width="5%">隐蔽工程</td>
    <td width="5%">中期验收</td>
    <td width="5%">合同竣工日期</td>
    <td width="5%">实竣工日期</td>
    <td width="3%">延期单天数</td>
    <td width="3%">合同工期</td>
    <td width="5%">应竣工日期</td>
  </tr>
  <%
String khbh=null;
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String pdsj=null;
String kgrq=null;
String sjkgrq=null;
String sybgcrq=null;
String szqsj=null;
String jgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;
String hzts=null;
String htgq=null;
String yjgrq=null;
String hdlxmc=null;
String khlxmc=null;
String tsjlh=null;
String tsnr=null;

double zqgczjf=0;
double tcsgze=0;


String ys=null;//颜色
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;



	int row=0;
	ls_sql="select crm_tsjl.tsjlh,crm_tsjl.tsnr,crm_khxx.khbh,hdlxmc,khlxmc,hth,khxm,lxfs,fwdz,sjs,zjxm,sgdmc sgd,qyrq,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,ysgcjdmc,pdclzt,sjjgrq,hzts,jgrq-kgrq htgq,jgrq+NVL(hzts,0) yjgrq,zqgczjf,crm_tckhqye.tcsgze";
	ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm,sq_sgd,dm_gcjdbm,crm_tckhqye,dm_hdlxbm,dm_khlxbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and crm_khxx.khbh=crm_tckhqye.khbh(+) ";
	ls_sql+=" and crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+) ";
	ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) ";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.tsbxsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_tsjl.tsbxsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.clzt!='9'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修 
		ls_sql+=" and crm_tsbm.tslxbm='21'";//工程投诉
		ls_sql+=" and crm_tsbm.tsxlbm='2101'";//施工队

		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
	ls_sql+=" order by crm_khxx.qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		hdlxmc=cf.fillHtml(rs.getString("hdlxmc"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
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
		gcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		hzts=cf.fillHtml(rs.getString("hzts"));
		zqgczjf=rs.getDouble("zqgczjf");
		tcsgze=rs.getDouble("tcsgze");
		htgq=cf.fillHtml(rs.getString("htgq"));
		yjgrq=cf.fillHtml(rs.getDate("yjgrq"));

		if (tcsgze!=0 )
		{
			zqgczjf=tcsgze;
		}

		allzqgczjf+=zqgczjf;

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

		if (gcjdbm.equals("2"))//1：未开工；2： 工程开工；4： 工程完工；5:：客户完结
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
    <td><A HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>" target="_blank"><%=tsjlh%></A></td>
    <td><%=tsnr%></td>
    <td><%=khxm%></td>
    <td><%=fwdz%></td>
    <td><%=zqgczjf%></td>
    <td><%=hdlxmc%></td>
    <td><%=khlxmc%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
    <td><%=gcjdmc%></td>
    <td bgcolor="<%=ys1%>"><%=qyrq%></td>
    <td bgcolor="<%=ys1%>"><%=kgrq%></td>
    <td bgcolor="<%=ys2%>"><%=sjkgrq%></td>
    <td bgcolor="<%=ys3%>"><%=sybgcrq%></td>
    <td bgcolor="<%=ys4%>"><%=szqsj%></td>
    <td bgcolor="#FFFFFF"><%=jgrq%></td>
    <td bgcolor="#FFFFFF"><%=sjjgrq%></td>
    <td bgcolor="#FFFFFF"><%=hzts%></td>
    <td bgcolor="#FFFFFF"><%=htgq%></td>
    <td bgcolor="#FFFFFF"><%=yjgrq%></td>
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

</table>
</body>
</html>
