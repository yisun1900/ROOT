<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>施工计划表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");

String khxm=null;
String fwdz=null;
String sjs=null;
String mbmc=null;
String sjkgrq=null;

String rwbm=null;
String rwmc=null;
String rwdx=null;
String rwxh=null;
String rwsfsj=null;
String rwts=null;
String yjhkssj=null;
String yjhjssj=null;
String yjhgzr=null;
String zxjhkssj=null;
String zxjhjssj=null;
String zxjhgzr=null;
String rwsfwc=null;
String rwsfwcmc=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String sfyq=null;
String sfyqmc=null;
String yqts=null;
String jddf=null;
String lrr=null;
String lrsj=null;
String bz=null;
String ysjg=null;
String ysjlh=null;
String ddbh=null;
String clztmc=null;

String sfsjysxm=null;
String gcysxmbm=null;
String sfsjzcxm=null;
String zcdlbm=null;
String sjzcjd=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,sjs,mbmc,sjkgrq";
	ls_sql+=" from  crm_khxx,gdm_sgjdmb";
	ls_sql+=" where  crm_khxx.mbbm=gdm_sgjdmb.mbbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		mbmc=cf.fillNull(rs.getString("mbmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#FFFFFF">
<div align="center">施工计划表单(<%=mbmc%>)</div>
<BR>
<table width="100%" border="0" style="FONT-SIZE:16" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td width="24%" >客户姓名：<%=khxm%></td>
	<td width="20%" >设计师：<%=sjs%></td>
	<td width="36%"  >房屋地址：<%=fwdz%></td>
    <td width="20%"  >实际开工：<%=sjkgrq%></td>
</tr>
</table>

<table width="240%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="2%">任务对象</td>
	<td  width="8%">任务名称</td>
	<td  width="2%">任务发生时间</td>
	<td  width="2%">标准任务天数</td>
	<td  width="3%">最新计划开始时间</td>
	<td  width="3%">最新计划结束时间</td>
	<td  width="2%">最新计划工作日</td>
	<td  width="2%">任务是否完成</td>
	<td  width="3%">实际开始时间</td>
	<td  width="3%">实际结束时间</td>
	<td  width="2%">实际工作日</td>
	<td  width="2%">是否延期</td>
	<td  width="2%">延期天数</td>
	<td  width="2%">任务得分</td>
	<td  width="3%">验收结果</td>
	<td  width="3%">验收记录号</td>
	<td  width="3%">订单编号</td>
	<td  width="3%">订单处理状态</td>
	<td  width="2%">是否涉及验收项目</td>
	<td  width="8%">验收项目</td>
	<td  width="2%">是否涉及主材项目</td>
	<td  width="3%">涉及主材大类</td>
	<td  width="3%">涉及主材节点</td>
	<td  width="2%">计划生成人</td>
	<td  width="3%">计划生成时间</td>
	<td  width="18%">备注</td>
	<td  width="3%">原计划开始时间</td>
	<td  width="3%">原计划结束时间</td>
	<td  width="2%">原计划工作日</td>
	<td  width="2%">任务编码</td>
</tr>


<%
	ls_sql="select rwbm,rwmc,DECODE(rwdx,'1','客户','2','施工队','3','供应商','4','设计师','5','质检') rwdx ";
	ls_sql+=" ,rwxh,rwsfsj,rwts,yjhkssj,yjhjssj,yjhgzr,zxjhkssj,zxjhjssj,zxjhgzr,rwsfwc,DECODE(rwsfwc,'Y','完成','N','否') rwsfwcmc";
	ls_sql+=" ,sjkssj,sjjssj,sjgzr";
	ls_sql+=" ,sfyq,DECODE(sfyq,'Y','延期','N','否') sfyqmc,yqts,jddf,crm_khsgjhb.lrr,crm_khsgjhb.lrsj,crm_khsgjhb.bz ";
	ls_sql+=" ,DECODE(ysjg,'0','没问题','1','整改未接收','2','接收','3','已处理','4','已解决','5','验收通过','6','验收未通过') ysjg,ysjlh ";
	ls_sql+=" ,ddbh,a.clztmc";
	ls_sql+=" ,DECODE(sfsjysxm,'Y','是','N','否') sfsjysxm,gcysxmmc,DECODE(sfsjzcxm,'Y','是','N','否') sfsjzcxm,zcdlbm,b.clztmc sjzcjd";
	ls_sql+=" from  crm_khsgjhb,jdm_zcddzt a,jdm_zcddzt b,dm_gcysxm";
	ls_sql+=" where  crm_khsgjhb.clzt=a.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.sjzcjd=b.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwdx=cf.fillNull(rs.getString("rwdx"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		rwsfsj=cf.fillNull(rs.getString("rwsfsj"));
		rwts=cf.fillNull(rs.getString("rwts"));
		yjhkssj=cf.fillNull(rs.getDate("yjhkssj"));
		yjhjssj=cf.fillNull(rs.getDate("yjhjssj"));
		yjhgzr=cf.fillNull(rs.getString("yjhgzr"));
		zxjhkssj=cf.fillNull(rs.getDate("zxjhkssj"));
		zxjhjssj=cf.fillNull(rs.getDate("zxjhjssj"));
		zxjhgzr=cf.fillNull(rs.getString("zxjhgzr"));

		rwsfwc=cf.fillNull(rs.getString("rwsfwc"));
		rwsfwcmc=cf.fillNull(rs.getString("rwsfwcmc"));
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjgzr=cf.fillHtml(rs.getString("sjgzr"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		sfyqmc=cf.fillNull(rs.getString("sfyqmc"));
		yqts=cf.fillNull(rs.getString("yqts"));
		jddf=cf.fillNull(rs.getString("jddf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));

		ysjg=cf.fillHtml(rs.getString("ysjg"));
		ysjlh=cf.fillHtml(rs.getString("ysjlh"));
		ddbh=cf.fillHtml(rs.getString("ddbh"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));
		sfsjysxm=cf.fillNull(rs.getString("sfsjysxm"));
		gcysxmbm=cf.fillHtml(rs.getString("gcysxmmc"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillHtml(rs.getString("zcdlbm"));
		sjzcjd=cf.fillHtml(rs.getString("sjzcjd"));

		if (zxjhjssj.compareTo(cf.today())<0 && rwsfwc.equals("N"))
		{
			sfyqmc="<span class='STYLE1'>延期</span>";
		}


		bz=cf.fillHtml(rs.getString("bz"));

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=rwxh%></td>
			<td><%=rwdx%></td>
			<td><%=rwmc%></td>
			<td><%=rwsfsj%></td>
			<td><%=rwts%></td>
			<td><%=zxjhkssj%></td>
			<td><%=zxjhjssj%></td>
			<td><%=zxjhgzr%></td>
			<td><%=rwsfwcmc%></td>
			<td><%=sjkssj%></td>
			<td><%=sjjssj%></td>
			<td><%=sjgzr%></td>
			<td><%=sfyqmc%></td>
			<td><%=yqts%></td>
			<td><%=jddf%></td>
			<td><%=ysjg%></td>
			<td><%=ysjlh%></td>
			<td><%=ddbh%></td>
			<td><%=clztmc%></td>

			<td><%=sfsjysxm%></td>
			<td><%=gcysxmbm%></td>
			<td><%=sfsjzcxm%></td>
			<td><%=zcdlbm%></td>
			<td><%=sjzcjd%></td>

			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=bz%></td>
			<td><%=yjhkssj%></td>
			<td><%=yjhjssj%></td>
			<td><%=yjhgzr%></td>
			<td><%=rwbm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
