<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>新开工统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgsbh=request.getParameter("fgs");


String fgsmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=rs.getString(2);
	} 
	rs.close();
	ps.close();


%>
<div align="center"><br><b>在施工工地－未交中期款（<%=fgsmc%>）</b></div>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="2%">序号</td>
    <td width="4%">合同号</td>
    <td width="4%">客户姓名</td>
    <td width="10%">房屋地址</td>
    <td width="4%">折后合同额</td>
    <td width="4%">折前工程费</td>
    <td width="4%">报价级别</td>
    <td width="3%">设计师</td>
    <td width="3%">质检</td>
    <td width="3%">施工队</td>
    <td width="4%">工程进度</td>
    <td width="4%">签约日期</td>
    <td width="4%">派单时间</td>
    <td width="4%">合同开工日期</td>
    <td width="4%">实开工日期</td>
    <td width="4%">计划隐蔽工程</td>
    <td width="4%">实际隐蔽工程</td>
    <td width="4%">计划中期验收</td>
    <td width="4%">实际中期验收</td>
    <td width="4%">合同竣工日期</td>
    <td width="4%">实竣工日期</td>
    <td width="2%">延期单天数</td>
    <td width="2%">合同工期</td>
    <td width="4%">应竣工日期</td>
    <td width="4%">财务实收款</td>
    <td width="3%">家装收款期数</td>
  </tr>
  <%
String khbh=null;
String hth=null;
String khxm=null;
String lxfs=null;
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
String sjjgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;
String hzts=null;
String cwsfke=null;
String htgq=null;
String yjgrq=null;
double qye=0;
double zqgczjf=0;
String fkcsmc=null;
String bjjb=null;
String bjjbmc=null;

String jhybgcrq=null;
String jhzqsj=null;

String ys=null;//颜色
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;



	int row=0;
	ls_sql="select qye,zqgczjf,fkcsmc,bjjb,bjjbmc,jhybgcrq,jhzqsj,khbh,hth,khxm,lxfs,fwdz,sjs,zjxm,sgdmc sgd,qyrq,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,ysgcjdmc,pdclzt,sjjgrq,hzts,jgrq-kgrq htgq,jgrq+NVL(hzts,0) yjgrq,cwsfke";
	ls_sql+=" from  crm_khxx,sq_sgd,dm_gcjdbm,bdm_bjjbbm,cw_fkcs";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm ";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_khxx.cwjzkfkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" and  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm='3'";
		//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成;7: 合同异常终止
		ls_sql+=" and cwsfke>100 and cwjzkfkcs=1";
	ls_sql+=" order by crm_khxx.qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		fkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		jhybgcrq=cf.fillHtml(rs.getDate("jhybgcrq"));
		jhzqsj=cf.fillHtml(rs.getDate("jhzqsj"));
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
		cwsfke=cf.fillHtml(rs.getString("cwsfke"));
		htgq=cf.fillHtml(rs.getString("htgq"));
		yjgrq=cf.fillHtml(rs.getDate("yjgrq"));

		String lx="";
		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lx=rs1.getString("lx");
		}
		rs1.close();
		ps1.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			ls_sql="select tcsgze";
			ls_sql+=" from  crm_tckhqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zqgczjf=rs1.getDouble("tcsgze");
			}
			rs1.close();
			ps1.close();
		}

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
    <td><%=hth%></td>
    <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
    <td><%=fwdz%></td>
    <td><%=qye%></td>
    <td><%=zqgczjf%></td>
    <td><%=bjjbmc%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
    <td><%=gcjdmc%></td>
    <td bgcolor="<%=ys1%>"><%=qyrq%></td>
    <td bgcolor="<%=ys1%>"><%=pdsj%></td>
    <td bgcolor="<%=ys1%>"><%=kgrq%></td>
    <td bgcolor="<%=ys2%>"><%=sjkgrq%></td>
    <td bgcolor="<%=ys3%>"><%=jhybgcrq%></td>
    <td bgcolor="<%=ys3%>"><%=sybgcrq%></td>
    <td bgcolor="<%=ys4%>"><%=jhzqsj%></td>
    <td bgcolor="<%=ys4%>"><%=szqsj%></td>
    <td bgcolor="#FFFFFF"><%=jgrq%></td>
    <td bgcolor="#FFFFFF"><%=sjjgrq%></td>
    <td bgcolor="#FFFFFF"><%=hzts%></td>
    <td bgcolor="#FFFFFF"><%=htgq%></td>
    <td bgcolor="#FFFFFF"><%=yjgrq%></td>
    <td><%=cwsfke%></td>
    <td><%=fkcsmc%></td>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>
