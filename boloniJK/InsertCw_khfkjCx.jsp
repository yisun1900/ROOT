<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String khbh = request.getParameter("khbh");
String fkcs = request.getParameter("fkcs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {

	conn=cf.getConnection();

	if (fkcs!=null)
	{
		String fgsbh=null;
		double wdzgce=0;
		double qye=0;
		double sjf=0;
		double glf=0;
		double suijin=0;
		double zqguanlif=0;
		double guanlif=0;
		double zqwjrqyexm=0;
		double zhwjrqyexm=0;

		double zjxje=0;
		double zhzjxje=0;
		double zqzjxguanlif=0;
		double zjxguanlif=0;
		double zjxsuijin=0;
		double sfke=0;
		double zjxssk=0;

		ls_sql="select fgsbh,wdzgce,qye,sjf,glf,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm  ,zjxje,zhzjxje,zqzjxguanlif,zjxguanlif,zjxsuijin  ,sfke,zjxssk";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
			sjf=rs.getDouble("sjf");
			glf=rs.getDouble("glf");
			suijin=rs.getDouble("suijin");//税金
			zqguanlif=rs.getDouble("zqguanlif");//折前管理费
			guanlif=rs.getDouble("guanlif");//折后管理费
			zqwjrqyexm=rs.getDouble("zqwjrqyexm");//折前其它收费
			zhwjrqyexm=rs.getDouble("zhwjrqyexm");//折后其它收费

			zjxje=rs.getDouble("zjxje");
			zhzjxje=rs.getDouble("zhzjxje");
			zqzjxguanlif=rs.getDouble("zqzjxguanlif");//折前增减项管理费
			zjxguanlif=rs.getDouble("zjxguanlif");//折后增减项管理费
			zjxsuijin=rs.getDouble("zjxsuijin");//增减项税金

			sfke=rs.getDouble("sfke");
			zjxssk=rs.getDouble("zjxssk");
		}
		rs.close();
		ps.close();

		String lx=null;
		String sfbhglf=null;
		String sfbhsj=null;
		double yfkje=0;
		double bqfkbl=0;
		double yfkbl=0;
		ls_sql="select lx,sfbhglf,sfbhsj,bqfkbl,yfkbl ";
		ls_sql+=" from  cw_fkfamx,cw_khfkfa";
		ls_sql+=" where cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' and fkcs="+fkcs;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=cf.fillNull(rs.getString("lx"));//类型
			sfbhglf=cf.fillNull(rs.getString("sfbhglf"));//是否包含管理费
			sfbhsj=cf.fillNull(rs.getString("sfbhsj"));//是否包含税金
			bqfkbl=rs.getDouble("bqfkbl");//本期收款比率
			//out.println(bqfkbl);
			yfkbl=rs.getDouble("yfkbl");//累计收款比率
		}
		rs.close();
		ps.close();

		wdzgce=wdzgce+zqwjrqyexm;
		qye=qye+zhwjrqyexm;

		if (sfbhglf.equals("Y"))//N：不包含；Y：包含
		{
			wdzgce+=zqguanlif;
			qye+=guanlif;
			zjxje+=zqzjxguanlif;
			zhzjxje+=zjxguanlif;
		}
		if (sfbhsj.equals("Y"))//N：不包含；Y：包含
		{
			wdzgce+=suijin;
			qye+=suijin;
			zjxje+=zjxsuijin;
			zhzjxje+=zjxsuijin;
		}

/*
		1：按折前收款(不含增减项)；
		2：按折前收款（含增减项一次收取）
		3：按折前收款（含增减项分次收取）

		6：按折后收款(不含增减项)；
		7：按折后收款（含增减项一次收取）
		8：按折后收款（含增减项分次收取）

		A：折前增减项；
		B：折后增减项
*/		

		/*if (lx.equals("1"))
		{
			yfkje=wdzgce*yfkbl/100.0-sfke;//折前价×累计收款比率－家装实收款额
		}
		else if (lx.equals("2"))
		{
			yfkje=(wdzgce*yfkbl/100.0+zjxje)-sfke;//（折前价×累计收款比率＋折前增减项）－家装实收款额
		}
		else if (lx.equals("3"))
		{
			yfkje=(wdzgce+zjxje)*yfkbl/100.0-sfke;//（折前价＋折前增减项）×累计收款比率－家装实收款额
		}
		else if (lx.equals("6"))
		{
			yfkje=qye*yfkbl/100.0-sfke;//折后价×累计收款比率－家装实收款额
		}
		else if (lx.equals("7"))
		{
			yfkje=(qye*yfkbl/100.0+zhzjxje)-sfke;//（折后价×累计收款比率＋折后增减项）－家装实收款额
		}
		else if (lx.equals("8"))
		{
			yfkje=(qye+zhzjxje)*yfkbl/100.0-sfke;//（折后价＋折后增减项）×累计收款比率－家装实收款额
		}

		else if (lx.equals("A"))
		{
			yfkje=zjxje-zjxssk;//折前增减项－增减项实收款
		}
		else if (lx.equals("B"))
		{
			yfkje=zhzjxje-zjxssk;//折后增减项－增减项实收款
		}


		yfkje=cf.doubleTrim(yfkje);
		*/
       if (lx.equals("1"))
		{
			yfkje=wdzgce*bqfkbl/100.0;//折前价×累计收款比率－家装实收款额
		}
		else if (lx.equals("2"))
		{
			yfkje=(wdzgce*bqfkbl/100.0+zjxje);//（折前价×累计收款比率＋折前增减项）－家装实收款额
		}
		else if (lx.equals("3"))
		{
			yfkje=(wdzgce+zjxje)*bqfkbl/100.0;//（折前价＋折前增减项）×累计收款比率－家装实收款额
		}
		else if (lx.equals("6"))
		{
			yfkje=qye*bqfkbl/100.0;//折后价×累计收款比率－家装实收款额
		}
		else if (lx.equals("7"))
		{
			yfkje=(qye*bqfkbl/100.0+zhzjxje);//（折后价×累计收款比率＋折后增减项）－家装实收款额
		}
		else if (lx.equals("8"))
		{
			yfkje=(qye+zhzjxje)*bqfkbl/100.0;//（折后价＋折后增减项）×累计收款比率－家装实收款额
		}

		else if (lx.equals("A"))
		{
			yfkje=zjxje-zjxssk;//折前增减项－增减项实收款
		}
		else if (lx.equals("B"))
		{
			yfkje=zhzjxje-zjxssk;//折后增减项－增减项实收款
		}


		yfkje=cf.doubleTrim(yfkje);

		%>
			//parent.main.insertform.yfkbl.value="<%=yfkbl%>";
			parent.main.insertform.yfkje.value="<%=yfkje%>";
			//parent.main.insertform.fkje.value="<%=yfkje%>";
		<%

	}

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

//-->
</SCRIPT>
