<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh=request.getParameterValues("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;
String khbh=null;
String sfydy=null;
double dysj=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yddbh.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_mmzjx";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("！删除失败，预订单["+yddbh[i]+"]已有增减项，如果要删除，请先删除增减项。");
			return;
		}

		ls_sql="select clzt,jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,khbh";
		ls_sql+=" from  jc_mmydd";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			oldclzt=rs.getString("clzt");
			sfydy=cf.fillNull(rs.getString("sfydy"));
			khbh=cf.fillNull(rs.getString("khbh"));
			dysj=rs.getDouble("dysj");
		}
		rs.close();
		ps.close();
		if (!oldclzt.equals("04"))
		{
			conn.rollback();
			out.println("！删除失败，预订单["+yddbh[i]+"]处理状态不正确。");
			return;
		}

		//判断是否能修改
		if (sfydy.equals("Y"))
		{
			if (dysj>3)
			{
				conn.rollback();
				out.println("错误！合同打印已超过3天:"+dysj+"，不能再删除，只能进行增减项："+yddbh[i]);
				return;
			}
		}

		//查询木门款
		double mmfkje=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='21' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			mmfkje=rs.getDouble(1);//已付木门款
		}
		rs.close();
		ps.close();

		if (mmfkje>0)//如果已付款，不能再修改
		{
			conn.rollback();
			out.println("错误！客户已付款:"+mmfkje+"元，不能再删除，只能进行增减项："+yddbh[i]);
			return;
		}

		ls_sql="update jc_mmydd set clzt='03',jhazsj=null,htrq=null,htqdr=null,htbz=null,kjxsj=null,wjsgsbz=null,fwf=0,mmzkl=10,dzyy=null";
		ls_sql+=" ,zqmmhtje=0 ,zqwjhtje=0 ,zqblhtje=0    ,mmhtje=0 ,wjhtje=0 ,blhtje=0   ,wdzje=0  ,htje=0";
		ls_sql+=" ,zqzjhmmje=0,zqzjhwjje=0,zqzjhblje=0   ,zjhmmje=0,zjhwjje=0,zjhblje=0  ,zqzjhze=0,zjhze=0";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from jc_mmdgdmx";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_wjjddmx";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_blddmx";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where ddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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