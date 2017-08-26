<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String wtkxda[]=request.getParameterValues("kxda");
String wtkxda1[]=request.getParameterValues("kxda1");
String kxdax[]=request.getParameterValues("kxdax");
String jgsmx[]=request.getParameterValues("jgsmx");
String ls=null;
String wtbh=null;
String dcqs=null;
String wtmc=null;
String sfkdx=null;
String wtsfgq=null;
String wtfl=null;
String xwtsm=null;
String sfyxsm=null;
boolean flag=false;


wtbh=cf.GB2Uni(request.getParameter("wtbh"));
dcqs=cf.GB2Uni(request.getParameter("dcqs"));
wtmc=cf.GB2Uni(request.getParameter("wtmc"));
sfkdx=cf.GB2Uni(request.getParameter("sfkdx"));
wtsfgq=cf.GB2Uni(request.getParameter("wtsfgq"));
wtfl=cf.GB2Uni(request.getParameter("wtfl"));
xwtsm=cf.GB2Uni(request.getParameter("xwtsm"));
sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm"));
String wherewtbh=null;
wherewtbh=cf.GB2Uni(request.getParameter("wherewtbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	String ls11="";
	conn=cf.getConnection();

	//判断所填的答案不能为空
	for(int i=0;i<wtkxda.length;i++)
	{
		ls11=ls11+(wtkxda[i].trim());
	}
	for(int i=0;i<kxdax.length;i++)
	{
		ls11=ls11+(kxdax[i].trim());

	}
	//如果答案为空;
	if(ls11.equals(""))
	{
		out.print("<font color=\"red\">系统提示,您所修改的可选答案为空!请重新添写! ");
		return ;
	}
	conn.setAutoCommit(false);
	ls_sql="update hd_scdcwt set wtbh=?,dcqs=?,wtmc=?,sfkdx=?,wtsfgq=?,wtfl=?,xwtsm=? ";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wtbh);
	ps.setString(2,dcqs);
	ps.setString(3,wtmc);
	ps.setString(4,sfkdx);
	ps.setString(5,wtsfgq);
	ps.setString(6,wtfl);
	ps.setString(7,xwtsm);
	ps.executeUpdate();
	ps.close();
	 //修改更新的过程
	for(int i=0;i<wtkxda.length;i++)
	{
		
		String ls1=cf.GB2Uni(request.getParameter("jgsm"+(i+1)));
		if((wtkxda[i]!=null)&& (!wtkxda[i].equals(""))&&(wtkxda1[i]!=null)&& (!wtkxda1[i].equals("")))
		{
			ls_sql=" update  hd_dcwtkxda set wtkxda=?,jgsm=?,sfyxsm=? ";
			ls_sql+=" where  (wtbh='"+wherewtbh+"' and wtkxda='"+cf.GB2Uni(wtkxda1[i])+"')";
			ps=conn.prepareStatement(ls_sql);
			ps.setString(1,cf.GB2Uni(wtkxda[i]));
			ps.setString(2,ls1);
			ps.setString(3,sfyxsm);
			ps.executeUpdate();
			ps.close();
		}else if(((wtkxda[i]==null)||(wtkxda[i].equals("")))&&(wtkxda1[i]!=null))
		{
			ls_sql=" delete from hd_dcwtkxda where  wtkxda='"+cf.GB2Uni(wtkxda1[i])+"'";
			ps=conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
		}
	}

	ps.close();
	//添加新内容

	for(int i=0;i<kxdax.length;i++)
	{
		if((kxdax[i]!=null)&&(!kxdax[i].equals("")))
		{
				
			ls_sql="insert into hd_dcwtkxda(wtbh,wtkxda,jgsm,sfyxsm)values(?,?,?,?)";
			ps=conn.prepareStatement(ls_sql);
			ps.setString(1,wtbh);
			ps.setString(2,cf.GB2Uni(kxdax[i]));
			ps.setString(3,cf.GB2Uni(jgsmx[i]));
			ps.setString(4,sfyxsm);
			ps.executeUpdate();
			ps.close();
				
		}
	}
	conn.commit();

	%>
	<script language="javascript" >
	<!--
	alert("存盘成功!");
	window.close();
	//-->
	</script>
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>