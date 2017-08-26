<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=request.getParameter("dwbh");
String[] clbm =request.getParameterValues("clbm");
String[] cj =request.getParameterValues("cj");
String[] cjjsj =request.getParameterValues("cjjsj");
String[] fgsdj =request.getParameterValues("fgsdj");
String[] gdj =request.getParameterValues("gdj");

String[] xjgsxsj =request.getParameterValues("xjgsxsj");
String[] cxkssj =request.getParameterValues("cxkssj");
String[] cxjzsj =request.getParameterValues("cxjzsj");
String[] cxcj =request.getParameterValues("cxcj");
String[] cxcjjsj =request.getParameterValues("cxcjjsj");
String[] cxfgsdj =request.getParameterValues("cxfgsdj");
String[] cxgdj =request.getParameterValues("cxgdj");

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
int tzsl=0;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		String sfycx =request.getParameter("sfycx"+(i+1));

		if (!xjgsxsj[i].equals(""))//新价格生效时间
		{
			tzsl++;

			if (sfycx.equals("Y"))//N：没促销；Y：有促销
			{
				if (cxkssj[i].equals(""))
				{
					conn.rollback();
					out.println("材料编码【"+clbm[i]+"】错误！有促销但无【促销开始时间】");
					return;
				}
				if (cxjzsj[i].equals(""))
				{
					conn.rollback();
					out.println("材料编码【"+clbm[i]+"】错误！有促销但无【促销结束时间】");
					return;
				}
				if (cxgdj[i].equals("") || cxgdj[i].equals("0.0") || cxgdj[i].equals("0"))
				{
					conn.rollback();
					out.println("材料编码【"+clbm[i]+"】错误！有促销但无【促销期工队价】");
					return;
				}
			}

			sql=" update cl_jgmx set tzr='"+yhmc+"',tzsj=SYSDATE";
			sql+=" ,xjgsxsj=TO_DATE('"+xjgsxsj[i]+"','YYYY-MM-DD'),xjgsfgx='1'";
			sql+=" ,xcj="+cj[i]+",xcjjsj="+cjjsj[i]+",xfgsdj="+fgsdj[i]+",xgdj="+gdj[i];
			sql+=" ,xsfycx='"+sfycx+"',xcxkssj=TO_DATE('"+cxkssj[i]+"','YYYY-MM-DD'),xcxjzsj=TO_DATE('"+cxjzsj[i]+"','YYYY-MM-DD')";
			sql+=" ,xcxcj="+cxcj[i]+",xcxcjjsj="+cxcjjsj[i]+",xcxfgsdj="+cxfgsdj[i]+",xcxgdj="+cxgdj[i];
			sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
//			out.println(sql);
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	sql=" update cl_jgmx set cj=xcj,cjjsj=xcjjsj,fgsdj=xfgsdj,gdj=xgdj,sfycx=xsfycx,cxkssj=xcxkssj,cxjzsj=xcxjzsj,cxcj=xcxcj,cxcjjsj=xcxcjjsj,cxfgsdj=xcxfgsdj,cxgdj=xcxgdj    ,xjgsfgx='2',xjgsxsj=null,xcj=null,xcjjsj=null,xfgsdj=null,xgdj=null,xsfycx=null,xcxkssj=null,xcxjzsj=null,xcxcj=null,xcxcjjsj=null,xcxfgsdj=null,xcxgdj=null";
	sql+=" where dwbh='"+dwbh+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("价格调整成功！共修改价格[<%=tzsl%>]条");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
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

