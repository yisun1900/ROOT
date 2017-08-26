<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String khbh=(String)session.getAttribute("khbh");
String flag=(String)session.getAttribute("flag");
if((!flag.equals("N")) || flag==null)
{

	out.print("<br><br><div align=center><font color=\"red\" >出错了！您输入的信息有误或表单被重复提交了！</font></div>");
	out.print("<br><div align=center><input type=button onclick=\"window.close()\" value=\"关闭窗口\"></div>");
	return;
}

String ls=null;
String hflxbm=null;

String sjfa=null;
String hqfw=null;
String jdqk=null;
String zjyfw=null;
String zjydw=null;
String zjyjz=null;
String fwsz=null;
String sgzl=null;
String grsz=null;
String sjshfnr=null;
String zjyhfnr=null;
String sgdhfnr=null;
String sfjxhf=null;
String xchflxbm=null;

String bz=cf.GB2Uni(request.getParameter("bz"));
String hfjlh=request.getParameter("hfjlh");
String jglxbm=request.getParameter("jglxbm");
String hfbm=request.getParameter("hfbm");
String gcjdbm=null;
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
//khbh=cf.GB2Uni(request.getParameter("khbh"));
sjfa=cf.GB2Uni(request.getParameter("sjfa"));
hqfw=cf.GB2Uni(request.getParameter("hqfw"));
jdqk=cf.GB2Uni(request.getParameter("jdqk"));
zjyfw=cf.GB2Uni(request.getParameter("zjyfw"));
zjydw=cf.GB2Uni(request.getParameter("zjydw"));
zjyjz=cf.GB2Uni(request.getParameter("zjyjz"));
fwsz=cf.GB2Uni(request.getParameter("fwsz"));
sgzl=cf.GB2Uni(request.getParameter("sgzl"));
grsz=cf.GB2Uni(request.getParameter("grsz"));
sjshfnr=cf.GB2Uni(request.getParameter("sjshfnr"));
zjyhfnr=cf.GB2Uni(request.getParameter("zjyhfnr"));
sgdhfnr=cf.GB2Uni(request.getParameter("sgdhfnr"));
sfjxhf=cf.GB2Uni(request.getParameter("sfjxhf"));

String jcjjsjs=request.getParameter("jcjjsjs");
String jsjjgw=request.getParameter("jsjjgw");
String jcxmzy=request.getParameter("jcxmzy");
String jcshaz=request.getParameter("jcshaz");
String jccpzl=request.getParameter("jccpzl");
String jchfnr=cf.GB2Uni(request.getParameter("jchfnr"));

java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String xgjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  kp_khpjb ";
	ps= conn.prepareStatement(ls_sql);
	
	rs =ps.executeQuery(ls_sql);
	
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xgjlh=khbh+cf.addZero(count+1,2);
	conn.setAutoCommit(false);

	ls_sql="insert into kp_khpjb ( xgjlh,khbh,sjfa,hqfw,jdqk,sjshfnr,zjyfw,zjydw,zjyjz,zjyhfnr,fwsz,sgzl,grsz,sgdhfnr,bz,jcjjsjs,jsjjgw,jcxmzy,jcshaz,jccpzl,jchfnr,lrsj,lrr) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,sjfa);
	ps.setString(4,hqfw);
	ps.setString(5,jdqk);
	ps.setString(6,sjshfnr);
	ps.setString(7,zjyfw);
	ps.setString(8,zjydw);
	ps.setString(9,zjyjz);
	ps.setString(10,zjyhfnr);
	ps.setString(11,fwsz);
	ps.setString(12,sgzl);
	ps.setString(13,grsz);
	ps.setString(14,sgdhfnr);
	ps.setString(15,bz);
	ps.setString(16,jcjjsjs);
	ps.setString(17,jsjjgw);
	ps.setString(18,jcxmzy);
	ps.setString(19,jcshaz);
	ps.setString(20,jccpzl);
	ps.setString(21,jchfnr);
	ps.setDate(22,lrsj);
	ps.setString(23,yhmc);
	//out.print(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
	session.setAttribute("flag","");
	%>
		<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385">
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            
          <TD width="100%" height="27" bgcolor="#CCCCCC"><font size="2"><strong>[系统提示]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">操作成功！</div></TD>
          </TR>
		  <TR>
            
          <TD width="100%" height="16" bgcolor="#CCCCCC">
<div align="center">
                 <input type="button"  value="确定" onClick="window.close()"> 
               <!--  <input type="button"  value="返回" onClick="window.history.back()"> -->
            </div></TD>
          </TR>
		  </TABLE>
		  </TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>
	<%
}
catch (Exception e) {
	conn.rollback();
	
	//out.print(e);
	
	%>
		<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385">
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            
          <TD width="100%" height="27" bgcolor="#CCCCCC"><font size="2"><strong>[系统提示]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">对不起，操作失败！</div></TD>
          </TR>
		  <TR>
            
          <TD width="100%" height="16" bgcolor="#CCCCCC">
<div align="center">
               <input type="button"  value="确定" onClick="window.open('../khxx/zhuanym.jsp',target='KhhdptFrame')">
              <!--  <input type="button"  value="返回" onClick="window.history.back()"> -->
            </div></TD>
          </TR>
		  </TABLE>
		 </TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>
	<%
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