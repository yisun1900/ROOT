<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=request.getParameter("kpjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	
	//初始化
	dzpd.Dzpd dzpd=new dzpd.Dzpd();

	//计算：派单考评各施工队单项得分(插入表：kp_pdkpdxdf)，包括：自动计算指标、人工评分指标
	// 系统会检查：每个施工队是否有人工考评得分，若没有系统报错，注意：各公司不同
	dzpd.getyZKpdxdf(conn,kpjlh);

//计算：施工队得分、排名，非直属队和直属队分别排名(kp_pdkpmx),上期排名、上期剩余大单额、上期剩余中单额、上期剩余小单额；
	dzpd.getyZKppm(conn,kpjlh);

	//计算:施工队级别、接单权重、大小单比例、最大接单额(kp_pdkpmx)＝班组数*单组最大接单额、扣减后最大分配单额
	//接单权重：根据【施工队级别】从【派单考评记录（kp_pdkpjl）】中取得，该参数由人工设置
	//大小单比例：根据【施工队级别】从【派单考评记录（kp_pdkpjl）】中取得，该参数由人工设置

	dzpd.getyZPj(conn,kpjlh);

	
	//上期实际签约额
	//上期大单签约额
	//上期中单签约额
	//上期小单签约额
	//上期实际大单比率
	//上期实际中单比率
	//上期实际小单比率

	//非直属队派大单额
	//非直属队派中单额
	//非直属队派小单额

	//直属队派大单额
	//直属队派中单额
	//直属队派小单额
	
	//非直属队可派单额=非直属队派单额
	//直属队可派单额=直属队派单额

	//上期剩余大单额、上期剩余中单额、上期剩余小单额、上期派单补偿总额、上期派单补偿大单额、上期派单补偿中单额、上期派单补偿小单额
	
	dzpd.getyZJcsj(conn,kpjlh);


	/*计算:考评总分、每分接单额、理论接单额(kp_pdkpmx)
	计算：考评总分、每分接单额
		某施工队考评总分（A）＝施工队考评得分×该施工队权重×该施工队班组数
		施工队考评总分之和（B）＝∑（各施工队考评总分（A））
		每分接单额（D）＝本期可派单总额（C）÷施工队考评总分之和（B）
	计算：理论接单额
		施工队理论接单总额（E）＝每分接单额（D）×施工队考评总分（A）
	*/

	dzpd.getyZKpzf(conn,kpjlh);

	/*
	计算:接单总额，剩余的单额优先满足排名在前的施工队，这样排名第一的施工队可能接到最大单额，鼓励大家争第一名

	分两种情况：理论接单总额>扣减后最大接单额、理论接单总额<=扣减后最大接单额，直属队和非直属队分别计算
	1、首先计算：理论接单总额>扣减后最大接单额的情况
			  接单总额＝扣减后最大接单额，同时汇总：因【理论接单总额>扣减后最大接单额】而产生的【剩余单额】
	2、计算：理论接单总额<＝扣减后最大接单额的情况，因不能满足最大接单能力，需要把【第1类】的剩余单进行分配，优先满足排名在前的施工队
			  接单总额＝理论接单总额＋剩余的单额，但不能超过【扣减后最大接单额】
	*/
	dzpd.getyZJdze(conn,kpjlh);



	//计算：施工队理论大单金额、理论中单金额、理论小单金额，理论接大单额=接单总额(jdze)*大单比率(ddbl)



	//计算：大单金额、中单金额、小单金额
	//如果大单满足不了A级队，不派B级队，优先满足排名靠前的施工队
	//如果满足，大单金额=理论大单金额，剩余分配B级队
	//大单剩余如何处理？优先满足排名靠前的施工队，这样排名第一的施工队可能接的都是大单，鼓励大家争第一名
	
	//分配中单时，计算：可接中单数
	//if （欠大单）：                                         then 可接中单数=理论接中单额＋欠大单额（理论接大单额－大单金额）
	//if （大单分配多了  and  大单金额＋理论接中单额 >  接单总额） then 可接中单数=接单总额－大单金额
	//if （大单分配多了  and  大单金额＋理论接中单额 <= 接单总额） then 可接中单数=理论接中单额
	dzpd.getyZDzxde(conn,kpjlh);


	//本期接单总额、本期大单额、本期中单额、本期小单额，本期接单总额=可接单总额+上期剩余单总额+上期派单补偿总额
	ls_sql=" update kp_pdkpmx set bqjdze=jdze+sqsydze+sqpdbcze,bqdde=ddje+sqsydde+sqpdbcdde,bqzde=zdje+sqsyzde+sqpdbczde,bqxde=xdje+sqsyxde+sqpdbcxde";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//剩余单总额、剩余大单金额、剩余中单金额、剩余小单金额
	ls_sql=" update kp_pdkpmx set sydze=bqjdze,syddje=bqdde,syzdje=bqzde,syxdje=bqxde";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("操作失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>