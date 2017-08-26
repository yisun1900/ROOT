<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>计算工资</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%" >序号</td>
	<td  width="1%" >修改</td>
	<td  width="2%" >员工编号</td>
	<td  width="2%" >姓名</td>
	<td  width="2%" >行政职务</td>
	<td  width="2%" >工种</td>
	<td  width="3%" >所属部门</td>

	<td  width="2%">类型</td>
	<td  width="2%">停薪标志</td>
	<td  width="2%">基本工资</td>
	<td  width="2%">岗位工资</td>
	<td  width="2%">工龄工资</td>
	<td  width="2%">交通补贴</td>
	<td  width="2%">通讯补贴</td>
	<td  width="2%">餐饮补贴</td>
	<td  width="2%">其它补贴</td>
	<td  width="3%">考核工资</td>
	<td  width="3%">底薪</td>
	<td  width="2%">底薪上浮</td>

	<td  width="3%">绩效工资基数</td>
	<td  width="2%">绩效分值</td>
	<td  width="3%">绩效工资</td>

	<td  width="3%">考核业绩</td>
	<td  width="3%">本期业绩总额</td>
	<td  width="3%">连续3期业绩</td>
	<td  width="3%">业绩考核扣款</td>

	<td  width="2%">实际出勤天数</td>
	<td  width="2%">事假天数</td>
	<td  width="2%">病假天数</td>
	<td  width="2%">旷工天数</td>
	<td  width="2%">产假天数</td>
	<td  width="2%">加班天数</td>
	<td  width="2%">事假扣款</td>
	<td  width="2%">病假扣款</td>
	<td  width="2%">旷工扣款</td>
	<td  width="2%">产假扣款</td>
	<td  width="2%">缺勤扣款</td>
	<td  width="2%">加班费</td>

	<td  width="2%">扣保险</td>
	<td  width="2%">奖罚</td>
	<td  width="2%">其他款项</td>
	<td  width="3%">应发工资</td>
	<td  width="3%">扣质保金</td>
	<td  width="2%">扣个税</td>
	<td  width="3%">实发工资</td>
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


	String ygbh=null;
	String bianhao=null;
	String getyhmc=null;
	String xzzwbm=null;
	String zwbm=null;
	String zwmc=null;
	String getdwbh=null;
	String dwmc=null;
	String lx=null;
	String lxmc=null;
	String txbz=null;
	String txbzmc=null;

	double jbgz=0;
	double gwgz=0;
	double glgz=0;
	double jtbt=0;
	double dhbt=0;
	double cb=0;
	double buzhu=0;
	double dixin=0;//底薪
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

	
	
	ls_sql="select ygbh,bianhao,yhmc,xzzwbm,rs_gzmxb.zwbm,zwmc,rs_gzmxb.dwbh,dwmc,lx,DECODE(lx,'1','固定工资','2','浮动') lxmc,txbz,DECODE(txbz,'N','未停薪','Y','停薪') txbzmc";
	ls_sql+=" ,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,dixin,dxsf  ,jxgzjs,jxfz,jxgz  ,khyj,bqyjze,sqyj,khgz,yjkhkk  ";
	ls_sql+=" ,cqts,sjts,bjts,kgts,cjts,jbts,sjkk,bjkk,cjkk,kgkk,qqkk,jbf ";
	ls_sql+=" ,kbx,jf,kzbj,qtkk,yfgz,ksk,sfgz ";
	ls_sql+=" from rs_gzmxb,sq_dwxx,dm_zwbm";
	ls_sql+=" where rs_gzmxb.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_gzmxb.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and rs_gzmxb.khzq='"+khzq+"' and rs_gzmxb.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_gzmxb.dwbh,rs_gzmxb.xzzwbm,rs_gzmxb.ygbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		getyhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		zwmc=cf.fillHtml(rs.getString("zwmc"));
		getdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		txbz=cf.fillNull(rs.getString("txbz"));
		txbzmc=cf.fillNull(rs.getString("txbzmc"));

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
			<td ><A HREF="EditRs_gzmxb.jsp?khzq=<%=khzq%>&ssfgs=<%=ssfgs%>&ygbh=<%=ygbh%>" target="_blank">修改</>
			</td>
			<td ><%=ygbh%>
			</td>
			<td ><%=getyhmc%>
			</td>
			<td ><%=xzzwbm%></td>
			<td ><%=zwmc%></td>
			<td ><%=dwmc%></td>
			<td ><%=lxmc%></td>
			<td ><%=txbzmc%></td>

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
