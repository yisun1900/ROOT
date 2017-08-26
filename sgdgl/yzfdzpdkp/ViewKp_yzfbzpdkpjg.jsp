<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">班长派单考评记录（排序：班长分值、队长分值、班长客户满意度、队长客户满意度、班长级别、队长级别）</font></B>
</CENTER>
<table border="1" width="220%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">排名</td>
	<td  width="6%">考评时间</td>
	<td  width="4%">所属分公司</td>
	<td  width="3%">施工队</td>
	<td  width="2%">队长级别</td>
	<td  width="2%">队长总分</td>
	<td  width="2%">队长满意度</td>
	<td  width="3%">派单说明</td>
	<td  width="3%">班长</td>
	<td  width="2%">班长级别</td>
	<td  width="2%">班长总分</td>
	<td  width="2%">班长满意度</td>
	<td  width="2%">停单</td>
	<td  width="2%">质保金达标</td>
	<td  width="2%">工人数量</td>
	<td  width="2%">已用工人数量</td>
	<td  width="2%">可用工人数量</td>

	<td  width="3%">可接单额最小值</td>
	<td  width="3%">可接单额最大值</td>
	<td  width="2%">最小在施工地数</td>
	<td  width="2%">最大在施工地数</td>
	<td  width="2%">班长在施工地数</td>
	<td  width="3%"><strong><font color="#0000FF">闲置施工力量加分</font></strong></td>

	<td  width="3%"><strong><font color="#0000FF">班长级别加分</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">班长派单减分</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">班长完工加分</font></strong></td>

	<td  width="3%">巡检工地平均扣分</td>
	<td  width="3%"><strong><font color="#0000FF">巡检工地减分</font></strong></td>
	<td  width="3%">工地验收平均扣分</td>
	<td  width="3%"><font color="#0000FF"><strong>工地验收减分</strong></font></td>
	<td  width="2%">危险投诉次数</td>
	<td  width="2%">严重投诉次数</td>
	<td  width="3%">一般投诉次数</td>
	<td  width="3%">轻微投诉次数</td>
	<td  width="3%"><strong><font color="#0000FF">投诉减分</font></strong></td>
	<td  width="2%">延期工地数</td>
	<td  width="2%"><strong><font color="#0000FF">延期工地减分</font></strong></td>
	<td  width="2%">安全事故工伤人数</td>
	<td  width="2%">安全事故工亡人数</td>
	<td  width="3%"><strong><font color="#0000FF">安全事故减分</font></strong></td>
</tr>
<%
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String kpsj=null;
	String dwmc=null;
	String sgdmc=null;
	String dzjb=null;
	int dzzf=0;
	int dzkhmyd=0;
	String bzmc=null;
	String bzjb=null;
	int bzzf=0;
	int bzkhmyd=0;
	String tdbz=null;

	String zbjsfdb=null;
	int grsl=0;
	int yygrsl=0;
	int kygrsl=0;
	int kjdzxz=0;
	int kjdzdz=0;
	int zxzsgds=0;
	int zdzsgds=0;
	int mqzsgds=0;

	int xzjf=0;//闲置施工力量加分
	int bzjbjf=0;
	int bzpdjf=0;
	int bzwgjf=0;
	int xjgdpjkf=0;
	int xjgdjf=0;
	int gdyspjkf=0;
	int gdysjf=0;
	int wxtss=0;
	int yztss=0;
	int ybtss=0;
	int qwtss=0;
	int tsjf=0;
	int yqgds=0;
	int yqgdjf=0;
	int aqsggsrs=0;
	int aqsggwrs=0;
	int aqsgjf=0;


	int row=0;

	ls_sql="SELECT kpsj,dwmc,sgdmc,a.sgdjbmc dzjb,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(sq_sgd.pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) dzzf ";
	ls_sql+=" ,sq_sgd.khmyd dzkhmyd,kp_yzfbzpdkpjg.bzmc,b.sgdjbmc bzjb,(NVL(-1*sq_bzxx.bzpdjf,0)+NVL(sq_bzxx.bzwgjf,0)+NVL(sq_bzxx.pdkpf,0)+(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0))) bzzf ";
	ls_sql+=" ,sq_bzxx.khmyd bzkhmyd,DECODE(sq_bzxx.tdbz,'Y','<font color=\"#FF0000\">停单</font>','N','正常','K','<font color=\"#FF0000\">开除</font>','L','<font color=\"#FF0000\">离职</font>') tdbz ";

	ls_sql+=" ,DECODE(kp_yzfbzpdkpjg.zbjsfdb,'Y','达标','N','<font color=\"#FF0000\">否</font>') zbjsfdb,sq_bzxx.grsl,sq_bzxx.yygrsl ";
	ls_sql+=" ,sq_bzxx.kygrsl,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,NVL(sq_bzxx.zxzsgds,0) zxzsgds,NVL(sq_bzxx.zdzsgds,0) zdzsgds,NVL(sq_bzxx.mqzsgds,0) mqzsgds";
	
	ls_sql+=" ,(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0)) xzjf,bzjbjf,NVL(-1*sq_bzxx.bzpdjf,0) bzpdjf,NVL(sq_bzxx.bzwgjf,0) bzwgjf";
	ls_sql+=" ,xjgdpjkf,-1*xjgdjf xjgdjf,gdyspjkf,-1*gdysjf gdysjf,wxtss,yztss,ybtss,qwtss,-1*tsjf tsjf,yqgds,-1*yqgdjf yqgdjf,aqsggsrs,aqsggwrs,-1*aqsgjf aqsgjf";
	
	ls_sql+=" FROM kp_yzfbzpdkpjg,sq_sgd,sq_bzxx,sq_sgdjbbm a,sq_sgdjbbm b,sq_dwxx  ";
    ls_sql+=" where kp_yzfbzpdkpjg.sgd=sq_sgd.sgd and sq_sgd.sgdjbbm=a.sgdjbbm and kp_yzfbzpdkpjg.bzjbbm=b.sgdjbbm";
    ls_sql+=" and kp_yzfbzpdkpjg.ssfgs=sq_dwxx.dwbh";
    ls_sql+=" and kp_yzfbzpdkpjg.sgd=sq_bzxx.sgd and kp_yzfbzpdkpjg.bzmc =sq_bzxx.bzmc ";
    ls_sql+=" and  kp_yzfbzpdkpjg.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by kp_yzfbzpdkpjg.ssfgs,sq_bzxx.tdbz,kp_yzfbzpdkpjg.zbjsfdb desc,bzzf desc,dzzf desc,sq_bzxx.khmyd desc,sq_sgd.khmyd desc,sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kpsj=cf.fillNull(rs.getString("kpsj"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzjb=cf.fillNull(rs.getString("dzjb"));
		dzzf=rs.getInt("dzzf");
		dzkhmyd=rs.getInt("dzkhmyd");
		bzmc=cf.fillNull(rs.getString("bzmc"));
		bzjb=cf.fillNull(rs.getString("bzjb"));
		bzzf=rs.getInt("bzzf");
		bzkhmyd=rs.getInt("bzkhmyd");
		tdbz=cf.fillNull(rs.getString("tdbz"));

		zbjsfdb=cf.fillNull(rs.getString("zbjsfdb"));
		grsl=rs.getInt("grsl");
		yygrsl=rs.getInt("yygrsl");
		kygrsl=rs.getInt("kygrsl");
		kjdzxz=rs.getInt("kjdzxz");
		kjdzdz=rs.getInt("kjdzdz");
		zxzsgds=rs.getInt("zxzsgds");
		zdzsgds=rs.getInt("zdzsgds");
		mqzsgds=rs.getInt("mqzsgds");

		xzjf=rs.getInt("xzjf");
		bzjbjf=rs.getInt("bzjbjf");
		bzpdjf=rs.getInt("bzpdjf");
		bzwgjf=rs.getInt("bzwgjf");
		xjgdpjkf=rs.getInt("xjgdpjkf");
		xjgdjf=rs.getInt("xjgdjf");
		gdyspjkf=rs.getInt("gdyspjkf");
		gdysjf=rs.getInt("gdysjf");
		wxtss=rs.getInt("wxtss");
		yztss=rs.getInt("yztss");
		ybtss=rs.getInt("ybtss");
		qwtss=rs.getInt("qwtss");
		tsjf=rs.getInt("tsjf");
		yqgds=rs.getInt("yqgds");
		yqgdjf=rs.getInt("yqgdjf");
		aqsggsrs=rs.getInt("aqsggsrs");
		aqsggwrs=rs.getInt("aqsggwrs");
		aqsgjf=rs.getInt("aqsgjf");

		String pdsm="&nbsp;";

			
			row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=kpsj%></td>
			<td><%=dwmc%></td>
			<td><%=sgdmc%></td>
			<td><%=dzjb%></td>
			<td><%=dzzf%></td>
			<td><%=dzkhmyd%>%</td>
			<td><%=pdsm%></td>
			<td><%=bzmc%></td>
			<td><%=bzjb%></td>
			<td><%=bzzf%></td>
			<td><%=bzkhmyd%>%</td>
			<td><%=tdbz%></td>

			<td><%=zbjsfdb%></td>
			<td><%=grsl%></td>
			<td><%=yygrsl%></td>
			<td><%=kygrsl%></td>
			<td><%=kjdzxz%></td>
			<td><%=kjdzdz%></td>
			<td><%=zxzsgds%></td>
			<td><%=zdzsgds%></td>
			<td><%=mqzsgds%></td>

			<td><%=xzjf%></td>
			<td><%=bzjbjf%></td>
			<td><%=bzpdjf%></td>
			<td><%=bzwgjf%></td>
			<td><%=xjgdpjkf%></td>
			<td><%=xjgdjf%></td>
			<td><%=gdyspjkf%></td>
			<td><%=gdysjf%></td>
			<td><%=wxtss%></td>
			<td><%=yztss%></td>
			<td><%=ybtss%></td>
			<td><%=qwtss%></td>
			<td><%=tsjf%></td>
			<td><%=yqgds%></td>
			<td><%=yqgdjf%></td>
			<td><%=aqsggsrs%></td>
			<td><%=aqsggwrs%></td>
			<td><%=aqsgjf%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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