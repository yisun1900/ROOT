<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;

String fgsbh=request.getParameter("fgsbh");
String khzq=request.getParameter("khzq");
String tcqssj=request.getParameter("tcqssj");
String tcjzsj=request.getParameter("tcjzsj");


String[] khbh=request.getParameterValues("khbh");
String[] hdbz=request.getParameterValues("hdbz");
String[] tckh=request.getParameterValues("tckh");
String[] dianz=request.getParameterValues("dianz");
String[] weny=request.getParameterValues("weny");
String[] khjl=request.getParameterValues("khjl");
String[] sjs=request.getParameterValues("sjs");
String[] cly=request.getParameterValues("cly");
String[] zjxm=request.getParameterValues("zjxm");
String[] xqzg=request.getParameterValues("xqzg");
String[] xqzz=request.getParameterValues("xqzz");
String[] xqzy=request.getParameterValues("xqzy");
String[] wlyxzg=request.getParameterValues("wlyxzg");
String[] yxzy=request.getParameterValues("yxzy");
String[] wzch=request.getParameterValues("wzch");
String[] wysj=request.getParameterValues("wysj");
String[] wzcxy=request.getParameterValues("wzcxy");
String[] dhzy=request.getParameterValues("dhzy");
String[] wztgy=request.getParameterValues("wztgy");
String[] siji=request.getParameterValues("siji");

String[] fwmj=request.getParameterValues("fwmj");
String[] sjf=request.getParameterValues("sjf");
String[] ycf=request.getParameterValues("ycf");
String[] zqje=request.getParameterValues("zqje");
String[] zk=request.getParameterValues("zk");
String[] suijin=request.getParameterValues("suijin");
String[] zhjtjs=request.getParameterValues("zhjtjs");
String[] zjxje=request.getParameterValues("zjxje");
String[] zjxbl=request.getParameterValues("zjxbl");
String[] tcwzczx=request.getParameterValues("tcwzczx");


String[] dzsjftcbl=request.getParameterValues("dzsjftcbl");
String[] dzqysjftc=request.getParameterValues("dzqysjftc");
String[] dzzxftcbl=request.getParameterValues("dzzxftcbl");
String[] dzqyzxtc=request.getParameterValues("dzqyzxtc");
String[] dztcxj=request.getParameterValues("dztcxj");
String[] dzkhbl=request.getParameterValues("dzkhbl");
String[] dztcze=request.getParameterValues("dztcze");

String[] wyzxftcbl=request.getParameterValues("wyzxftcbl");
String[] wyqyzxtc=request.getParameterValues("wyqyzxtc");

String[] khjlsjftcbl=request.getParameterValues("khjlsjftcbl");
String[] khjlqysjftc=request.getParameterValues("khjlqysjftc");
String[] khjlzxftcbl=request.getParameterValues("khjlzxftcbl");
String[] khjlqyzxtc=request.getParameterValues("khjlqyzxtc");
String[] khjltcxj=request.getParameterValues("khjltcxj");
String[] khjlkhbl=request.getParameterValues("khjlkhbl");
String[] khjltcze=request.getParameterValues("khjltcze");

String[] sjssjftcbl=request.getParameterValues("sjssjftcbl");
String[] sjsqysjftc=request.getParameterValues("sjsqysjftc");
String[] sjszxftcbl=request.getParameterValues("sjszxftcbl");
String[] sjsqyzxtc=request.getParameterValues("sjsqyzxtc");
String[] sjstchj=request.getParameterValues("sjstchj");


String[] zjzxftcbl=request.getParameterValues("zjzxftcbl");
String[] zjqyzxtc=request.getParameterValues("zjqyzxtc");
String[] zjtcxj=request.getParameterValues("zjtcxj");
String[] zjkhbl=request.getParameterValues("zjkhbl");
String[] zjtchj=request.getParameterValues("zjtchj");

String[] clyzxftcbl=request.getParameterValues("clyzxftcbl");
String[] clyqyzxtc=request.getParameterValues("clyqyzxtc");
String[] clykhbl=request.getParameterValues("clykhbl");
String[] clytc=request.getParameterValues("clytc");

String[] xqzgzxftcbl=request.getParameterValues("xqzgzxftcbl");
String[] xqzgqyzxtc=request.getParameterValues("xqzgqyzxtc");
String[] xqzgkhbl=request.getParameterValues("xqzgkhbl");
String[] xqzgtc=request.getParameterValues("xqzgtc");

String[] xqzzzxftcbl=request.getParameterValues("xqzzzxftcbl");
String[] xqzzqyzxtc=request.getParameterValues("xqzzqyzxtc");
String[] xqzzkhbl=request.getParameterValues("xqzzkhbl");
String[] xqzztc=request.getParameterValues("xqzztc");

String[] xqzyzxftcbl=request.getParameterValues("xqzyzxftcbl");
String[] xqzyqyzxtc=request.getParameterValues("xqzyqyzxtc");
String[] xqzykhbl=request.getParameterValues("xqzykhbl");
String[] xqzytc=request.getParameterValues("xqzytc");

String[] wlyxzgzxftcbl=request.getParameterValues("wlyxzgzxftcbl");
String[] wlyxzgqyzxtc=request.getParameterValues("wlyxzgqyzxtc");
String[] wlyxzgkhbl=request.getParameterValues("wlyxzgkhbl");
String[] wlyxzgtc=request.getParameterValues("wlyxzgtc");

String[] yxzyzxftcbl=request.getParameterValues("yxzyzxftcbl");
String[] yxzyqyzxtc=request.getParameterValues("yxzyqyzxtc");

String[] wzchzxftcbl=request.getParameterValues("wzchzxftcbl");
String[] wzchqyzxtc=request.getParameterValues("wzchqyzxtc");

String[] wysjzxftcbl=request.getParameterValues("wysjzxftcbl");
String[] wysjqyzxtc=request.getParameterValues("wysjqyzxtc");

String[] wzcxyzxftcbl=request.getParameterValues("wzcxyzxftcbl");
String[] wzcxyqyzxtc=request.getParameterValues("wzcxyqyzxtc");

String[] dhzyzxftcbl=request.getParameterValues("dhzyzxftcbl");
String[] dhzyqyzxtc=request.getParameterValues("dhzyqyzxtc");

String[] wztgyzxftcbl=request.getParameterValues("wztgyzxftcbl");
String[] wztgyqyzxtc=request.getParameterValues("wztgyqyzxtc");
String[] wztgykhbl=request.getParameterValues("wztgykhbl");
String[] wztgytc=request.getParameterValues("wztgytc");

String[] sjzxftcbl=request.getParameterValues("sjzxftcbl");
String[] sjqyzxtc=request.getParameterValues("sjqyzxtc");

String[] jjze=request.getParameterValues("jjze");

String[] lx=request.getParameterValues("lx");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql=" insert into cw_jrtcph (khzq,ssfgs,tcqssj,tcjzsj,tcdsl,zxktcze,sjftcze,clzt,lrr,lrbm  ,lrsj,bz)";
	ls_sql+=" values ( ?,?,TO_DATE(?,'YYYY-MM-DD'),TO_DATE(?,'YYYY-MM-DD'),?,?,?,?,?,? ,SYSDATE,'' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,fgsbh);
	ps.setString(3,tcqssj);
	ps.setString(4,tcjzsj);
	ps.setInt(5,0);
	ps.setDouble(6,0);
	ps.setDouble(7,0);
	ps.setString(8,"1");//1：结算；2：审批同意；3：审批不同意
	ps.setString(9,yhmc);
	ps.setString(10,lrbm);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="update crm_khxx  set sjsjsbz='"+lx[i]+"'";//0：未提成；1：签单提成；2：结算提成
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_jrtcmx";
		ls_sql+=" where khzq='"+khzq+"' and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		out.println(khbh[i]);
		out.println(hdbz[i]);
		out.println(tckh[i]);
		out.println(dianz[i]);
		out.println(weny[i]);
		out.println("khjl="+khjl[i]);
		out.println("sjs="+sjs[i]);
		out.println("cly="+cly[i]);
		out.println(zjxm[i]);
		out.println(xqzg[i]);
		out.println(xqzz[i]);
		out.println(xqzy[i]);
		out.println(wlyxzg[i]);
		out.println(yxzy[i]);
		out.println(wzch[i]);
		out.println(wysj[i]);
		out.println(wzcxy[i]);
		out.println(dhzy[i]);
		out.println(wztgy[i]);
		out.println(siji[i]);
*/

		ls_sql="insert into cw_jrtcmx ( khzq,khbh,hdbz,tckh,dianz,weny,khjl,sjs,cly,zjxm,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji,fwmj,sjf,ycf,zqje,zk,suijin,zhjtjs,zjxje,zjxbl,tcwzczx,dzsjftcbl,dzqysjftc,dzjssjftc,dzzxftcbl,dzqyzxtc,dzjszxtc,dztcxj,dzkhbl,dztcze,wyzxftcbl,wyqyzxtc,wyjszxtc,khjlsjftcbl,khjlqysjftc,khjljssjftc,khjlzxftcbl,khjlqyzxtc,khjljszxtc,khjltcxj,khjlkhbl,khjltcze,sjssjftcbl,sjsqysjftc,sjsjssjftc,sjszxftcbl,sjsqyzxtc,sjsjszxtc,sjsycftcbl,sjsycftc,sjstchj,zjzxftcbl,zjqyzxtc,zjjszxtc,zjycftcbl,zjycftc,zjtcxj,zjkhbl,zjtchj,clyzxftcbl,clyqyzxtc,clyjszxtc,clykhbl,clytc,xqzgzxftcbl,xqzgqyzxtc,xqzgjszxtc,xqzgkhbl,xqzgtc,xqzzzxftcbl,xqzzqyzxtc,xqzzjszxtc,xqzzkhbl,xqzztc,xqzyzxftcbl,xqzyqyzxtc,xqzyjszxtc,xqzykhbl,xqzytc,wlyxzgzxftcbl,wlyxzgqyzxtc,wlyxzgjszxtc,wlyxzgkhbl,wlyxzgtc,yxzyzxftcbl,yxzyqyzxtc,wzchzxftcbl,wzchqyzxtc,wysjzxftcbl,wysjqyzxtc,wzcxyzxftcbl,wzcxyqyzxtc,dhzyzxftcbl,dhzyqyzxtc,wztgyzxftcbl,wztgyqyzxtc,wztgyjszxtc,wztgykhbl,wztgytc,sjzxftcbl,sjqyzxtc,jjze,lx,lrr,lrsj,bz,xuhao,ssfgs ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,'',?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khzq);
		ps.setString(2,khbh[i]);
		ps.setString(3,hdbz[i]);
		ps.setString(4,tckh[i]);
		ps.setString(5,cf.GB2Uni(dianz[i]));
		ps.setString(6,cf.GB2Uni(weny[i]));
		ps.setString(7,cf.GB2Uni(khjl[i]));
		ps.setString(8,cf.GB2Uni(sjs[i]));
		ps.setString(9,cf.GB2Uni(cly[i]));
		ps.setString(10,cf.GB2Uni(zjxm[i]));
		ps.setString(11,cf.GB2Uni(xqzg[i]));
		ps.setString(12,cf.GB2Uni(xqzz[i]));
		ps.setString(13,cf.GB2Uni(xqzy[i]));
		ps.setString(14,cf.GB2Uni(wlyxzg[i]));
		ps.setString(15,cf.GB2Uni(yxzy[i]));
		ps.setString(16,cf.GB2Uni(wzch[i]));
		ps.setString(17,cf.GB2Uni(wysj[i]));
		ps.setString(18,cf.GB2Uni(wzcxy[i]));
		ps.setString(19,cf.GB2Uni(dhzy[i]));
		ps.setString(20,cf.GB2Uni(wztgy[i]));
		ps.setString(21,cf.GB2Uni(siji[i]));

		ps.setString(22,fwmj[i]);
		ps.setString(23,sjf[i]);
		ps.setString(24,ycf[i]);
		ps.setString(25,zqje[i]);
		ps.setString(26,zk[i]);
		ps.setString(27,suijin[i]);
		ps.setString(28,zhjtjs[i]);
		ps.setString(29,zjxje[i]);
		ps.setString(30,zjxbl[i]);
		ps.setString(31,tcwzczx[i]);

		ps.setString(32,dzsjftcbl[i]);
		ps.setString(33,dzqysjftc[i]);
		ps.setDouble(34,0);
		ps.setString(35,dzzxftcbl[i]);
		ps.setString(36,dzqyzxtc[i]);
		ps.setDouble(37,0);
		ps.setString(38,dztcxj[i]);
		ps.setString(39,dzkhbl[i]);
		ps.setString(40,dztcze[i]);

		ps.setString(41,wyzxftcbl[i]);
		ps.setString(42,wyqyzxtc[i]);
		ps.setDouble(43,0);

		ps.setString(44,khjlsjftcbl[i]);
		ps.setString(45,khjlqysjftc[i]);
		ps.setDouble(46,0);
		ps.setString(47,khjlzxftcbl[i]);
		ps.setString(48,khjlqyzxtc[i]);
		ps.setDouble(49,0);
		ps.setString(50,khjltcxj[i]);
		ps.setString(51,khjlkhbl[i]);
		ps.setString(52,khjltcze[i]);

		ps.setString(53,sjssjftcbl[i]);
		ps.setString(54,sjsqysjftc[i]);
		ps.setDouble(55,0);
		ps.setString(56,sjszxftcbl[i]);
		ps.setString(57,sjsqyzxtc[i]);
		ps.setDouble(58,0);
		ps.setDouble(59,0);
		ps.setDouble(60,0);
		ps.setString(61,sjstchj[i]);

		ps.setString(62,zjzxftcbl[i]);
		ps.setString(63,zjqyzxtc[i]);
		ps.setDouble(64,0);
		ps.setDouble(65,0);
		ps.setDouble(66,0);
		ps.setString(67,zjtcxj[i]);
		ps.setString(68,zjkhbl[i]);
		ps.setString(69,zjtchj[i]);

		ps.setString(70,clyzxftcbl[i]);
		ps.setString(71,clyqyzxtc[i]);
		ps.setDouble(72,0);
		ps.setString(73,clykhbl[i]);
		ps.setString(74,clytc[i]);

		ps.setString(75,xqzgzxftcbl[i]);
		ps.setString(76,xqzgqyzxtc[i]);
		ps.setDouble(77,0);
		ps.setString(78,xqzgkhbl[i]);
		ps.setString(79,xqzgtc[i]);

		ps.setString(80,xqzzzxftcbl[i]);
		ps.setString(81,xqzzqyzxtc[i]);
		ps.setDouble(82,0);
		ps.setString(83,xqzzkhbl[i]);
		ps.setString(84,xqzztc[i]);

		ps.setString(85,xqzyzxftcbl[i]);
		ps.setString(86,xqzyqyzxtc[i]);
		ps.setDouble(87,0);
		ps.setString(88,xqzykhbl[i]);
		ps.setString(89,xqzytc[i]);

		ps.setString(90,wlyxzgzxftcbl[i]);
		ps.setString(91,wlyxzgqyzxtc[i]);
		ps.setDouble(92,0);
		ps.setString(93,wlyxzgkhbl[i]);
		ps.setString(94,wlyxzgtc[i]);

		ps.setString(95,yxzyzxftcbl[i]);
		ps.setString(96,yxzyqyzxtc[i]);

		ps.setString(97,wzchzxftcbl[i]);
		ps.setString(98,wzchqyzxtc[i]);

		ps.setString(99,wysjzxftcbl[i]);
		ps.setString(100,wysjqyzxtc[i]);

		ps.setString(101,wzcxyzxftcbl[i]);
		ps.setString(102,wzcxyqyzxtc[i]);

		ps.setString(103,dhzyzxftcbl[i]);
		ps.setString(104,dhzyqyzxtc[i]);

		ps.setString(105,wztgyzxftcbl[i]);
		ps.setString(106,wztgyqyzxtc[i]);
		ps.setDouble(107,0);
		ps.setString(108,wztgykhbl[i]);
		ps.setString(109,wztgytc[i]);

		ps.setString(110,sjzxftcbl[i]);
		ps.setString(111,sjqyzxtc[i]);

		ps.setString(112,jjze[i]);

		ps.setString(113,lx[i]);
		ps.setString(114,yhmc);
		ps.setInt(115,i+1);
		ps.setString(116,fgsbh);

		ps.executeUpdate();
		ps.close();
	}


	conn.commit();
		
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
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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