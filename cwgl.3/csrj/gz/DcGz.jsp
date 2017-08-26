<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>计算工资</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%" >序号</td>
	<td  width="2%" >姓名</td>
	<td  width="2%" >行政职务</td>
	<td  width="3%" >所属部门</td>

	<td  width="2%">基本工资</td>
	<td  width="2%">岗位工资</td>
	<td  width="2%">工龄工资</td>
	<td  width="2%">交通补贴</td>
	<td  width="2%">通讯补贴</td>
	<td  width="2%">餐饮补贴</td>
	<td  width="2%">其它补贴</td>
	<td  width="2%">扣保洁费</td>
	<td  width="2%">考核工资</td>
	<td  width="2%">底薪</td>
	<td  width="2%">底薪上浮</td>

	<td  width="3%">业绩考核扣款</td>

	<td  width="2%">实际出勤天数</td>
	<td  width="2%">加班天数</td>
	<td  width="2%">缺勤扣款</td>
	<td  width="2%">加班费</td>

	<td  width="2%">扣社保</td>
	<td  width="2%">扣意外险</td>

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
PreparedStatement ps1=null;
ResultSet rs1=null;
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


	double jbgz_zj=0;
	double gwgz_zj=0;
	double glgz_zj=0;
	double jtbt_zj=0;
	double dhbt_zj=0;
	double cb_zj=0;
	double buzhu_zj=0;
	double kbjf_zj=0;
	double dixin_zj=0;//底薪
	double dxsf_zj=0;

	double jxgzjs_zj=0;
	double jxfz_zj=0;
	double jxgz_zj=0;

	double khyj_zj=0;
	double bqyjze_zj=0;
	double sqyj_zj=0;
	double khgz_zj=0;
	double yjkhkk_zj=0;

	double cqts_zj=0;
	double sjts_zj=0;
	double bjts_zj=0;
	double kgts_zj=0;
	double cjts_zj=0;
	double jbts_zj=0;

	double sjkk_zj=0;
	double bjkk_zj=0;
	double cjkk_zj=0;
	double kgkk_zj=0;
	double qqkk_zj=0;
	double jbf_zj=0;

	double kbx_zj=0;
	double kywx_zj=0;

	double jf_zj=0;
	double kzbj_zj=0;
	double qtkk_zj=0;

	double yfgz_zj=0;
	double ksk_zj=0;
	double sfgz_zj=0;
	
	
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N'";
	ls_sql+=" and dwlx in('F0','F1','F2')";
	ls_sql+=" order by dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getdwbh=cf.fillNull(rs1.getString("dwbh"));
		dwmc=cf.fillNull(rs1.getString("dwmc"));

		double jbgz_xj=0;
		double gwgz_xj=0;
		double glgz_xj=0;
		double jtbt_xj=0;
		double dhbt_xj=0;
		double cb_xj=0;
		double buzhu_xj=0;
		double kbjf_xj=0;
		double dixin_xj=0;//底薪
		double dxsf_xj=0;

		double jxgzjs_xj=0;
		double jxfz_xj=0;
		double jxgz_xj=0;

		double khyj_xj=0;
		double bqyjze_xj=0;
		double sqyj_xj=0;
		double khgz_xj=0;
		double yjkhkk_xj=0;

		double cqts_xj=0;
		double sjts_xj=0;
		double bjts_xj=0;
		double kgts_xj=0;
		double cjts_xj=0;
		double jbts_xj=0;

		double sjkk_xj=0;
		double bjkk_xj=0;
		double cjkk_xj=0;
		double kgkk_xj=0;
		double qqkk_xj=0;
		double jbf_xj=0;

		double kbx_xj=0;
		double kywx_xj=0;

		double jf_xj=0;
		double kzbj_xj=0;
		double qtkk_xj=0;

		double yfgz_xj=0;
		double ksk_xj=0;
		double sfgz_xj=0;


		String ygbh=null;
		String bianhao=null;
		String getyhmc=null;
		String xzzwbm=null;
		String zwbm=null;
		String zwmc=null;
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
		double kbjf=0;
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
		double kywx=0;

		double jf=0;
		double kzbj=0;
		double qtkk=0;

		double yfgz=0;
		double ksk=0;
		double sfgz=0;

		
		
		
		ls_sql="select ygbh,bianhao,yhmc,xzzwbm,rs_gzmxb.zwbm,zwmc,rs_gzmxb.dwbh,dwmc,lx,DECODE(lx,'1','固定工资','2','浮动') lxmc,txbz,DECODE(txbz,'N','未停薪','Y','停薪') txbzmc";
		ls_sql+=" ,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,kbjf,dixin,dxsf  ,jxgzjs,jxfz,jxgz  ,khyj,bqyjze,sqyj,khgz,yjkhkk  ";
		ls_sql+=" ,cqts,sjts,bjts,kgts,cjts,jbts,sjkk,bjkk,cjkk,kgkk,qqkk,jbf ";
		ls_sql+=" ,kbx,kywx,jf,kzbj,qtkk,yfgz,ksk,sfgz ";
		ls_sql+=" from rs_gzmxb,sq_dwxx,dm_zwbm";
		ls_sql+=" where rs_gzmxb.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and rs_gzmxb.zwbm=dm_zwbm.zwbm(+)";
		ls_sql+=" and rs_gzmxb.khzq='"+khzq+"' and rs_gzmxb.dwbh='"+getdwbh+"'";
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
			kbjf=rs.getDouble("kbjf");
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
			kywx=rs.getDouble("kywx");

			jf=rs.getDouble("jf");
			kzbj=rs.getDouble("kzbj");
			qtkk=rs.getDouble("qtkk");

			yfgz=rs.getDouble("yfgz");
			ksk=rs.getDouble("ksk");
			sfgz=rs.getDouble("sfgz");



			jbgz_xj+=jbgz;
			gwgz_xj+=gwgz;
			glgz_xj+=glgz;
			jtbt_xj+=jtbt;
			dhbt_xj+=dhbt;
			cb_xj+=cb;
			buzhu_xj+=buzhu;
			kbjf_xj+=kbjf;
			dixin_xj+=dixin;//底薪
			dxsf_xj+=dxsf;

			jxgzjs_xj+=jxgzjs;
			jxfz_xj+=jxfz;
			jxgz_xj+=jxgz;

			khyj_xj+=khyj;
			bqyjze_xj+=bqyjze;
			sqyj_xj+=sqyj;
			khgz_xj+=khgz;
			yjkhkk_xj+=yjkhkk;

			cqts_xj+=cqts;
			sjts_xj+=sjts;
			bjts_xj+=bjts;
			kgts_xj+=kgts;
			cjts_xj+=cjts;
			jbts_xj+=jbts;

			sjkk_xj+=sjkk;
			bjkk_xj+=bjkk;
			cjkk_xj+=cjkk;
			kgkk_xj+=kgkk;
			qqkk_xj+=qqkk;
			jbf_xj+=jbf;

			kbx_xj+=kbx;
			kywx_xj+=kywx;

			jf_xj+=jf;
			kzbj_xj+=kzbj;
			qtkk_xj+=qtkk;

			yfgz_xj+=yfgz;
			ksk_xj+=ksk;
			sfgz_xj+=sfgz;


 ///////////////////////////
			jbgz_zj+=jbgz;
			gwgz_zj+=gwgz;
			glgz_zj+=glgz;
			jtbt_zj+=jtbt;
			dhbt_zj+=dhbt;
			cb_zj+=cb;
			buzhu_zj+=buzhu;
			kbjf_zj+=kbjf;
			dixin_zj+=dixin;//底薪
			dxsf_zj+=dxsf;

			jxgzjs_zj+=jxgzjs;
			jxfz_zj+=jxfz;
			jxgz_zj+=jxgz;

			khyj_zj+=khyj;
			bqyjze_zj+=bqyjze;
			sqyj_zj+=sqyj;
			khgz_zj+=khgz;
			yjkhkk_zj+=yjkhkk;

			cqts_zj+=cqts;
			sjts_zj+=sjts;
			bjts_zj+=bjts;
			kgts_zj+=kgts;
			cjts_zj+=cjts;
			jbts_zj+=jbts;

			sjkk_zj+=sjkk;
			bjkk_zj+=bjkk;
			cjkk_zj+=cjkk;
			kgkk_zj+=kgkk;
			qqkk_zj+=qqkk;
			jbf_zj+=jbf;

			kbx_zj+=kbx;
			kywx_zj+=kywx;

			jf_zj+=jf;
			kzbj_zj+=kzbj;
			qtkk_zj+=qtkk;

			yfgz_zj+=yfgz;
			ksk_zj+=ksk;
			sfgz_zj+=sfgz;

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
				<td ><%=getyhmc%>			</td>
				<td ><%=xzzwbm%></td>
				<td ><%=dwmc%></td>
				<td ><%=jbgz%></td>
				<td ><%=gwgz%></td>
				<td ><%=glgz%></td>
				<td ><%=jtbt%></td>
				<td ><%=dhbt%></td>
				<td ><%=cb%></td>
				<td ><%=buzhu%></td>
				<td ><%=kbjf%></td>
				<td ><%=khgz%></td>
				<td ><%=dixin%></td>
				<td ><%=dxsf%></td>

				<td ><%=yjkhkk%></td>

				<td ><%=cqts%></td>
				<td ><%=jbts%></td>
				<td ><%=qqkk%></td>
				<td ><%=jbf%></td>

				<td ><%=kbx%></td>
				<td ><%=kywx%></td>

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

		%>
		<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="4">【<%=dwmc%>】小计</td>

			<td><B><%=jbgz_xj%></B></td>
			<td><B><%=gwgz_xj%></B></td>
			<td><B><%=glgz_xj%></B></td>
			<td><B><%=jtbt_xj%></B></td>
			<td><B><%=dhbt_xj%></B></td>
			<td><B><%=cb_xj%></B></td>
			<td><B><%=buzhu_xj%></B></td>
			<td><B><%=kbjf_xj%></B></td>
			<td><B><%=khgz_xj%></B></td>
			<td><B><%=dixin_xj%></B></td>
			<td><B><%=dxsf_xj%></B></td>

			<td><B><%=yjkhkk_xj%></B></td>

			<td><B><%=cqts_xj%></B></td>
			<td><B><%=jbts_xj%></B></td>
			<td><B><%=qqkk_xj%></B></td>
			<td><B><%=jbf_xj%></B></td>

			<td><B><%=kbx_xj%></B></td>
			<td><B><%=kywx_xj%></B></td>

			<td><B><%=jf_xj%></B></td>
			<td><B><%=qtkk_xj%></B></td>

			<td><B><%=yfgz_xj%></B></td>
			<td><B><%=kzbj_xj%></B></td>
			<td><B><%=ksk_xj%></B></td>
			<td><B><%=sfgz_xj%></B></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
%>
<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="4"><B>总 计</B></td>

	<td><B><%=jbgz_zj%></B></td>
	<td><B><%=gwgz_zj%></B></td>
	<td><B><%=glgz_zj%></B></td>
	<td><B><%=jtbt_zj%></B></td>
	<td><B><%=dhbt_zj%></B></td>
	<td><B><%=cb_zj%></B></td>
	<td><B><%=buzhu_zj%></B></td>
	<td><B><%=kbjf_zj%></B></td>
	<td><B><%=khgz_zj%></B></td>
	<td><B><%=dixin_zj%></B></td>
	<td><B><%=dxsf_zj%></B></td>

	<td><B><%=yjkhkk_zj%></B></td>

	<td><B><%=cqts_zj%></B></td>
	<td><B><%=jbts_zj%></B></td>
	<td><B><%=qqkk_zj%></B></td>
	<td><B><%=jbf_zj%></B></td>

	<td><B><%=kbx_zj%></B></td>
	<td><B><%=kywx_zj%></B></td>

	<td><B><%=jf_zj%></B></td>
	<td><B><%=qtkk_zj%></B></td>

	<td><B><%=yfgz_zj%></B></td>
	<td><B><%=kzbj_zj%></B></td>
	<td><B><%=ksk_zj%></B></td>
	<td><B><%=sfgz_zj%></B></td>
</tr>

<%	
	
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
