<%@ page contentType="text/html;charset=gb2312" %>
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
String jlbz = request.getParameter("jlbz");//0+正常派单&5+大单抵小单&6+小单抵大单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单
String deflbm = request.getParameter("deflbm");//所属城区编码
String sgd = request.getParameter("sgd");//所属城区编码
String ssfgs = request.getParameter("ssfgs");//所属城区编码
String kpjlh = request.getParameter("kpjlh");//所属城区编码
String cqbm = request.getParameter("cqbm");//所属城区编码
String yxxq=cf.GB2Uni(request.getParameter("yxxq"));

if (jlbz==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String sgdsql="";

String xzsgd=null;
String xzsgdmc=null;
String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	String dlx="";
	if (deflbm.equals("1"))//1:大单
	{
		if (jlbz.equals("0"))//0+正常派单
		{
			dlx="1";
		}
		else if (jlbz.equals("5"))//5+大单抵小单
		{
			dlx="2";
		}
		else if (jlbz.equals("6"))//6+小单抵大单
		{
			%>
				alert("不能进行小单抵大单");
				//-->
				</SCRIPT>
			<%
			return;
		}
		else
		{
			dlx="1";
		}
	}
	else if (deflbm.equals("2"))
	{
		if (jlbz.equals("0"))//0+正常派单
		{
			dlx="2";
		}
		else if (jlbz.equals("5"))//5+大单抵小单
		{
			dlx="3";
		}
		else if (jlbz.equals("6"))//6+小单抵大单
		{
			dlx="1";
		}
		else
		{
			dlx="2";
		}
	}
	else if (deflbm.equals("3"))
	{
		if (jlbz.equals("0"))//0+正常派单
		{
			dlx="3";
		}
		else if (jlbz.equals("5"))//5+大单抵小单
		{
			%>
				alert("不能进行大单抵小单");
				//-->
				</SCRIPT>
			<%
			return;
		}
		else if (jlbz.equals("6"))//6+小单抵大单
		{
			dlx="2";
		}
		else
		{
			dlx="3";
		}
	}

//	ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（可接单：'||(kjdds-yjdds)||'大'||(kjzds-yjzds)||'中'||(kjxds-yjxds)||'小）（'||sq_sgd.sgd||'）' sgdmc,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kp_sgdkpjg.bqpm";
//（可接单：'||(kjdds-yjdds)||'大'||(kjzds-yjzds)||'中'||(kjxds-yjxds)||'小）
	
	double kjdds=0;
	double kjzds=0;
	double kjxds=0;
	double kjdzs=0;
	double yjdzs=0;
	int row=0;

	//被选施工队
	ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,0 aa,0 bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
	ls_sql+=" from sq_sgd,kp_sgdkpjg";
	ls_sql+=" where sq_sgd.sgd='"+sgd+"'";
	ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xzsgd=rs.getString(1);
		xzsgdmc=rs.getString(2);
		kjdds=rs.getDouble(3);
		kjzds=rs.getDouble(4);
		kjxds=rs.getDouble(5);
		kjdzs=rs.getDouble(8);
		yjdzs=rs.getDouble(9);

		row++;
		sgdsql+=",'"+xzsgd+"'";

		xzsgdmc=xzsgdmc+"（可接单："+cf.formatDouble(kjdds)+"大"+cf.formatDouble(kjzds)+"中"+cf.formatDouble(kjxds)+"小）（可接总数："+cf.formatDouble(kjdzs)+"；已接总数："+cf.formatDouble(yjdzs)+"）";

		%>
			parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
		<%
	}
	rs.close();
	ps.close();


	if (!yxxq.equals(""))
	{
		//小区可接单施工队
		if (dlx.equals("1"))//1:大单
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjdds>yjdds";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjzds-yjzds)/kjzds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjzds>yjzds ";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjxds-yjxds)/kjxds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjxds>yjxds";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (dlx.equals("3"))
		{
			ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
		}
		else{
			ls_sql+="  order by bb desc,bqpm";
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getDouble(3);
			kjzds=rs.getDouble(4);
			kjxds=rs.getDouble(5);
			kjdzs=rs.getDouble(8);
			yjdzs=rs.getDouble(9);

			row++;
			sgdsql+=",'"+xzsgd+"'";

			xzsgdmc=xzsgdmc+"（可接单："+cf.formatDouble(kjdds)+"大"+cf.formatDouble(kjzds)+"中"+cf.formatDouble(kjxds)+"小）（可接总数："+cf.formatDouble(kjdzs)+"；已接总数："+cf.formatDouble(yjdzs)+"）";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}

	if (row<5)
	{
		//本城区可接单施工队
		if (dlx.equals("1"))//1:大单
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjdds>yjdds";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjzds-yjzds)/kjzds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjzds>yjzds ";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjxds-yjxds)/kjxds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjxds>yjxds";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (dlx.equals("3"))
		{
			ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
		}
		else{
			ls_sql+="  order by bb desc,bqpm";
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getDouble(3);
			kjzds=rs.getDouble(4);
			kjxds=rs.getDouble(5);
			kjdzs=rs.getDouble(8);
			yjdzs=rs.getDouble(9);

			row++;
			sgdsql+=",'"+xzsgd+"'";

			xzsgdmc=xzsgdmc+"（可接单："+cf.formatDouble(kjdds)+"大"+cf.formatDouble(kjzds)+"中"+cf.formatDouble(kjxds)+"小）（可接总数："+cf.formatDouble(kjdzs)+"；已接总数："+cf.formatDouble(yjdzs)+"）";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}

	if (row<5)
	{
		//非本城区可接单施工队
		if (dlx.equals("1"))//1:大单
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjdds>yjdds";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjzds-yjzds)/kjzds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjzds>yjzds ";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）（排名：'||kp_sgdkpjg.bqpm||'）（'||sq_sgd.sgd||'）' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjxds-yjxds)/kjxds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_sgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_sgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_sgdkpjg.sgd and kp_sgdkpjg.kpjlh="+kpjlh+" and kjxds>yjxds";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (dlx.equals("3"))
		{
			ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
		}
		else{
			ls_sql+="  order by bb desc,bqpm";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getDouble(3);
			kjzds=rs.getDouble(4);
			kjxds=rs.getDouble(5);
			kjdzs=rs.getDouble(8);
			yjdzs=rs.getDouble(9);

			row++;

			xzsgdmc=xzsgdmc+"（可接单："+cf.formatDouble(kjdds)+"大"+cf.formatDouble(kjzds)+"中"+cf.formatDouble(kjxds)+"小）（可接总数："+cf.formatDouble(kjdzs)+"；已接总数："+cf.formatDouble(yjdzs)+"）";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}



	%>
		parent.main.chooseItem("<%=sgd%>");
	<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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

//-->
</SCRIPT>

