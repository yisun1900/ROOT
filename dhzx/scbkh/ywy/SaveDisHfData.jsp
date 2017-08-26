<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] scbkhbh =request.getParameterValues("scbkhbh");
String[] sfxhf =request.getParameterValues("sfxhf");
String[] xchfsjStr =request.getParameterValues("xchfsj");
String[] sckhyxbm =request.getParameterValues("sckhyxbm");
String[] yyddsjStr =request.getParameterValues("yyddsj");
String[] gzsm =request.getParameterValues("gzsm");

java.sql.Date xchfsj=null;
java.sql.Date yyddsj=null;

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接

 
	conn.setAutoCommit(false);

	int row=0;
	for (int i=0;i<scbkhbh.length ;i++ )
	{
		row++;
		//生成『记录号』＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int count=0;
		ls_sql="select NVL(max(substr(jlh,8,3)),0)";
		ls_sql+=" from  crm_scbkhgzjl";
		ls_sql+=" where scbkhbh='"+scbkhbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String jlh=scbkhbh[i]+cf.addZero(count+1,3);

		//生成『记录号』＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成


		//检查『回访日期』是否正确
		if (xchfsjStr[i]==null || xchfsjStr[i].equals(""))
		{
			xchfsj=null;
		}
		else{
			try{
				xchfsj=java.sql.Date.valueOf(xchfsjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>客户编号『"+scbkhbh[i]+"』错误！回访日期『"+xchfsjStr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『预约到店时间』是否正确
		if (yyddsjStr[i]==null || yyddsjStr[i].equals(""))
		{
			yyddsj=null;
		}
		else{
			try{
				yyddsj=java.sql.Date.valueOf(yyddsjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>客户编号『"+scbkhbh[i]+"』错误！预约到店时间『"+yyddsjStr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}


		String zt=null;
		ls_sql="select zt";
		ls_sql+=" from  dm_sckhyxbm";
		ls_sql+=" where sckhyxbm='"+sckhyxbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=cf.fillNull(rs.getString("zt"));
		}
		rs.close();
		ps.close();

		ls_sql="insert into crm_scbkhgzjl ( jlh,scbkhbh,gzsm,sckhyxbm,yyddsj,sfxhf,xchfsj,zt,lrr,lrsj,lrbm ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jlh);
		ps.setString(2,scbkhbh[i]);
		ps.setString(3,cf.GB2Uni(gzsm[i]));
		ps.setString(4,sckhyxbm[i]);
		ps.setDate(5,yyddsj);
		ps.setString(6,sfxhf[i]);
		ps.setDate(7,xchfsj);
		ps.setString(8,zt);
		ps.setString(9,lrr);
		ps.setString(10,lrbm);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_scbkhxx set sfxhf=?,xchfsj=?,zt=?,zjgzsj=TRUNC(SYSDATE),sckhyxbm=?,yyddsj=? ";
		ls_sql+=" where scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfxhf[i]);
		ps.setDate(2,xchfsj);
		ps.setString(3,zt);
		ps.setString(4,sckhyxbm[i]);
		ps.setDate(5,yyddsj);
		ps.executeUpdate();
		ps.close();
		

	}
		

	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+row);

 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
