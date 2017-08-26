<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
//设置显示合并列

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String wheresql="";
	String lrsj=null;
	String lrsj2=null;

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+lrsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.ssfgs='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
	}
	String clzt=request.getParameter("clzt");
	if (clzt.equals("2"))
	{
		wheresql+=" and  crm_tsjl.clzt not in('3','9')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	}
	else if (clzt.equals("3"))
	{
		wheresql+=" and  crm_tsjl.clzt='3'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>录入投诉记录(<%=lrsj%>--<%=lrsj2%>)</B>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="3%">投诉记录号</td>
	<td  width="3%">要求解决时间</td>
	<td  width="3%">严重程度</td>
	<td  width="2%">来源</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="7%">客户姓名</td>
	<td  width="7%">地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="3%">完工日期</td>
	<td  width="18%">投诉报修内容</td>
	<td  width="11%">投诉报修备注</td>
	<td  width="4%">原因</td>
	<td  width="4%">责任部门</td>
	<td  width="6%">涉及供应商</td>
	<td  width="17%">处理情况</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;

	String tsjlh=null;
	String yqjjsj=null;
	String yzcdmc=null;
	String slfsmc=null;
	String lrr=null;
	String getlrsj=null;
	String tsnr=null;
	String bz=null;
		
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String sgd=null;
	String zjxm=null;
	String sjjgrq=null;

	String bgcolor="#FFFFF";
	
	ls_sql=" SELECT crm_tsjl.tsjlh,crm_tsjl.yqjjsj,yzcdmc,slfsmc,crm_tsjl.lrr,crm_tsjl.lrsj,tsnr,crm_tsjl.bz";
	ls_sql+=" ,crm_tsjl.khbh,khxm||'('||lxfs||')' khxm,fwdz,sjs,sgdmc,zjxm,sjjgrq";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='1'";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.yzcdbm desc,crm_tsjl.yqjjsj,crm_tsjl.lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		yzcdmc=cf.fillHtml(rs.getString("yzcdmc"));
		slfsmc=cf.fillNull(rs.getString("slfsmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		getlrsj=cf.fillNull(rs.getDate("lrsj"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		bz=cf.fillHtml(rs.getString("bz"));


		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		sgd=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));

		row++;

		if (row%2==1)
		{
			bgcolor="#FFFFF";
		}
		else {
			bgcolor="#E8E8FF";
		}

		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_tsbm,crm_tspp";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		String tsxlmc=null;
		String dwmc=null;
		String tspp=null;
		String clqk=null;
		String clsj=null;
		String clr=null;
		ls_sql=" SELECT tsxlmc,dwmc,crm_tspp.tspp,crm_tsbm.clqk,crm_tsbm.clsj,crm_tsbm.clr";
		ls_sql+=" FROM crm_tsbm,dm_tsxlbm,sq_dwxx,crm_tspp";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tsxlmc=cf.fillNull(rs1.getString("tsxlmc"));
			dwmc=cf.fillNull(rs1.getString("dwmc"));
			tspp=cf.fillHtml(rs1.getString("tspp"));
			clqk=cf.fillHtml(rs1.getString("clqk"));
			clsj=cf.fillHtml(rs1.getDate("clsj"));
			clr=cf.fillHtml(rs1.getString("clr"));


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td rowspan="<%=count%>"><%=row%></td>
				<td rowspan="<%=count%>"><%=tsjlh%></td>
				<td rowspan="<%=count%>"><%=yqjjsj%></td>
				<td rowspan="<%=count%>"><%=yzcdmc%></td>
				<td rowspan="<%=count%>"><%=slfsmc%></td>
				<td rowspan="<%=count%>"><%=lrr%></td>
				<td rowspan="<%=count%>"><%=getlrsj%></td>

				<td rowspan="<%=count%>" align="left"><%=khxm%></td>
				<td rowspan="<%=count%>" align="left"><%=fwdz%></td>
				<td rowspan="<%=count%>"><%=sjs%></td>
				<td rowspan="<%=count%>"><%=sgd%></td>
				<td rowspan="<%=count%>"><%=zjxm%></td>
				<td rowspan="<%=count%>"><%=sjjgrq%></td>


				<td rowspan="<%=count%>" align="left"><%=tsnr%></td>
				<td rowspan="<%=count%>" align="left"><%=bz%></td>

				<td><%=tsxlmc%></td>
				<td><%=dwmc%></td>
				<td><%=tspp%></td>
				<td align="left"><%=clqk%></td>
			</tr>
			<%
		}

		
		while (rs1.next())
		{
			tsxlmc=cf.fillNull(rs1.getString("tsxlmc"));
			dwmc=cf.fillNull(rs1.getString("dwmc"));
			tspp=cf.fillHtml(rs1.getString("tspp"));
			clqk=cf.fillHtml(rs1.getString("clqk"));
			clsj=cf.fillHtml(rs1.getDate("clsj"));
			clr=cf.fillHtml(rs1.getString("clr"));


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><%=tsxlmc%></td>
				<td><%=dwmc%></td>
				<td><%=tspp%></td>
				<td><%=clqk%></td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();


	
	}
	rs.close();
	ps.close();

%>
</table>
<CENTER >
  <B>录入报修记录(<%=lrsj%>--<%=lrsj2%>)</B>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="3%">报修记录号</td>
	<td  width="3%">要求解决时间</td>
	<td  width="3%">严重程度</td>
	<td  width="2%">来源</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="7%">客户姓名</td>
	<td  width="7%">地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="3%">完工日期</td>
	<td  width="18%">投诉报修内容</td>
	<td  width="11%">投诉报修备注</td>
	<td  width="4%">原因</td>
	<td  width="4%">责任部门</td>
	<td  width="6%">涉及供应商</td>
	<td  width="17%">处理情况</td>
</tr>

<%


	ls_sql=" SELECT crm_tsjl.tsjlh,crm_tsjl.yqjjsj,yzcdmc,slfsmc,crm_tsjl.lrr,crm_tsjl.lrsj,tsnr,crm_tsjl.bz";
	ls_sql+=" ,crm_tsjl.khbh,khxm||'('||lxfs||')' khxm,fwdz,sjs,sgdmc,zjxm,sjjgrq";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='2'";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.yzcdbm desc,crm_tsjl.yqjjsj,crm_tsjl.lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		yzcdmc=cf.fillHtml(rs.getString("yzcdmc"));
		slfsmc=cf.fillNull(rs.getString("slfsmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		getlrsj=cf.fillNull(rs.getDate("lrsj"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		bz=cf.fillHtml(rs.getString("bz"));


		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		sgd=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));

		row++;

		if (row%2==1)
		{
			bgcolor="#FFFFF";
		}
		else {
			bgcolor="#E8E8FF";
		}

		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_tsbm,crm_tspp";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		String tsxlmc=null;
		String dwmc=null;
		String tspp=null;
		String clqk=null;
		String clsj=null;
		String clr=null;
		ls_sql=" SELECT tsxlmc,dwmc,crm_tspp.tspp,crm_tsbm.clqk,crm_tsbm.clsj,crm_tsbm.clr";
		ls_sql+=" FROM crm_tsbm,dm_tsxlbm,sq_dwxx,crm_tspp";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tsxlmc=cf.fillNull(rs1.getString("tsxlmc"));
			dwmc=cf.fillNull(rs1.getString("dwmc"));
			tspp=cf.fillHtml(rs1.getString("tspp"));
			clqk=cf.fillHtml(rs1.getString("clqk"));
			clsj=cf.fillHtml(rs1.getDate("clsj"));
			clr=cf.fillHtml(rs1.getString("clr"));


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td rowspan="<%=count%>"><%=row%></td>
				<td rowspan="<%=count%>"><%=tsjlh%></td>
				<td rowspan="<%=count%>"><%=yqjjsj%></td>
				<td rowspan="<%=count%>"><%=yzcdmc%></td>
				<td rowspan="<%=count%>"><%=slfsmc%></td>
				<td rowspan="<%=count%>"><%=lrr%></td>
				<td rowspan="<%=count%>"><%=getlrsj%></td>

				<td rowspan="<%=count%>" align="left"><%=khxm%></td>
				<td rowspan="<%=count%>" align="left"><%=fwdz%></td>
				<td rowspan="<%=count%>"><%=sjs%></td>
				<td rowspan="<%=count%>"><%=sgd%></td>
				<td rowspan="<%=count%>"><%=zjxm%></td>
				<td rowspan="<%=count%>"><%=sjjgrq%></td>


				<td rowspan="<%=count%>" align="left"><%=tsnr%></td>
				<td rowspan="<%=count%>" align="left"><%=bz%></td>

				<td><%=tsxlmc%></td>
				<td><%=dwmc%></td>
				<td><%=tspp%></td>
				<td align="left"><%=clqk%></td>
			</tr>
			<%
		}

		
		while (rs1.next())
		{
			tsxlmc=cf.fillNull(rs1.getString("tsxlmc"));
			dwmc=cf.fillNull(rs1.getString("dwmc"));
			tspp=cf.fillHtml(rs1.getString("tspp"));
			clqk=cf.fillHtml(rs1.getString("clqk"));
			clsj=cf.fillHtml(rs1.getDate("clsj"));
			clr=cf.fillHtml(rs1.getString("clr"));


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><%=tsxlmc%></td>
				<td><%=dwmc%></td>
				<td><%=tspp%></td>
				<td><%=clqk%></td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();


	
	}
	rs.close();
	ps.close();













}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
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