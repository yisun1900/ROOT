<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String ysjlh=request.getParameter("ysjlh");
String gcysxmbm=request.getParameter("gcysxmbm");
String yszxslStr=request.getParameter("yszxsl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sjysjg="0";//0：合格；1：需整改

	String clbz=null;
	ls_sql="select clbz";
	ls_sql+=" from  crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!clbz.equals("9"))//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！录入已完成，不能再修改");
		return;
	}

	int yszxsl=Integer.parseInt(yszxslStr);//验收子项数量

	
	conn.setAutoCommit(false);

	ls_sql="delete from crm_heysmxb ";
	ls_sql+=" where ysjlh='"+ysjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into crm_heysmxb ( ysjlh,khbh,ys1,sm1,sgf1,ys2,sm2,sgf2,ys3,sm3,sgf3,ys4,sm4,sgf4,ys5,sm5,sgf5,ys6,sm6,sgf6,ys7,sm7,sgf7,ys8,sm8,sgf8,ys9,sm9,sgf9,ys10,sm10,sgf10,ys11,sm11,sgf11,ys12,sm12,sgf12,ys13,sm13,sgf13,ys14,sm14,sgf14,ys15,sm15,sgf15,ys16,sm16,sgf16,ys17,sm17,sgf17,ys18,sm18,sgf18,ys19,sm19,sgf19,ys20,sm20,sgf20,ys21,sm21,sgf21,ys22,sm22,sgf22,ys23,sm23,sgf23,ys24,sm24,sgf24,ys25,sm25,sgf25,ys26,sm26,sgf26,ys27,sm27,sgf27,ys28,sm28,sgf28,ys29,sm29,sgf29,ys30,sm30,sgf30,ys31,sm31,sgf31,ys32,sm32,sgf32,ys33,sm33,sgf33,ys34,sm34,sgf34,ys35,sm35,sgf35,ys36,sm36,sgf36,ys37,sm37,sgf37,ys38,sm38,sgf38,ys39,sm39,sgf39,ys40,sm40,sgf40,ys41,sm41,sgf41,ys42,sm42,sgf42,ys43,sm43,sgf43,ys44,sm44,sgf44,ys45,sm45,sgf45,ys46,sm46,sgf46,ys47,sm47,sgf47,ys48,sm48,sgf48,ys49,sm49,sgf49,ys50,sm50,sgf50 ) ";
	ls_sql+=" values (                ?    ,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysjlh);
	ps.setString(2,khbh);

	for (int i=0;i<50 ;i++ )
	{
		String ys=cf.GB2Uni(request.getParameter("ys"+(i+1)));
		String sm=cf.GB2Uni(request.getParameter("sm"+(i+1)));
		String sgf=cf.GB2Uni(request.getParameter("sgf"+(i+1)));

		if (ys.equals("不合格"))//Y：合格；N：不合格；M：未验收
		{
			sjysjg="1";//0：合格；1：需整改
		}
		else if (ys.equals(""))
		{
//			ys="空";
		}

		ps.setString(3+i*3,ys);
		ps.setString(4+i*3,sm);
		ps.setString(5+i*3,sgf);
	}

	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set sjysjg=?,xlrmx=?";
	ls_sql+=" where ysjlh='"+ysjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjysjg);
	ps.setString(2,"3");//1：不需录入；2：需录入；3：已录入
	ps.executeUpdate();
	ps.close();


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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>