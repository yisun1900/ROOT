<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>优铂利家装管理信息系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='/js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>
<%
String kkbbz=(String)session.getAttribute("kkbbz");
String yhdlm=(String)session.getAttribute("yhdlm");
//out.println(yhdlm);
%>

<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5 >
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
else{
	%>
	<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5 oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>

<SCRIPT SRC="/js/menu.js"></SCRIPT>
<SCRIPT SRC="/js/menu_functions.js"></SCRIPT>

<script>
foldersTree = gFld('<img src=\'/images/iLocalMachine.gif\' alt="点击进行重新登陆" onclick=parent.location=\'index.html\'> <A HREF=\"#\" onclick=parent.location=\'index.html\'>家装管理信息系统</A>|iGeneric', '');
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接
	int count=0;
	sql="select cdbh,cdxsmc,glurl,fcdbh,sfmjcd,cdsm,cdxh";
	sql+=" from v_sqxx";
	sql+=" where  yhdlm='"+yhdlm+"'";
	sql+="  order by cdbh,cdxh";
//	out.println(sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	String cdbh=null;
	String cdxsmc=null;
	String glurl=null;
	String fcdbh=null;
	String sfmjcd=null;
	String cdsm=null;
	int cdxh=0;
	String fatherName=null;
	String thisName=null;
	while (rs.next())
	{
		cdbh=rs.getString("cdbh");
		cdxsmc=rs.getString("cdxsmc");
		glurl=rs.getString("glurl");
		fcdbh=rs.getString("fcdbh").trim();
		sfmjcd=rs.getString("sfmjcd");
		cdsm=rs.getString("cdsm");
		cdxh=rs.getInt("cdxh");

		count++;

		thisName="cdbh"+cdbh;
		if (fcdbh.equals("0"))
		{
			fatherName="foldersTree";
		}
		else{
			fatherName="cdbh"+fcdbh;
		}
		if (sfmjcd.equals("Y"))
		{
			out.println("insDoc("+fatherName+", gLnk(2, \""
								 +cdxsmc+"\", \""
								 +glurl+"?www.youboli.com="+cf.makejm(cdbh,yhdlm)+"\"));");
		}
		else{
			out.println(thisName+" = insFld("+fatherName
			                    +", gFld(\"<B>"+cdxsmc+"</B>\", \"\"));");
		}
	}

	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("alert('错误！您没有任何授权，请联系【系统管理员】进行授权')");
	}
}
catch(Exception e){
	out.println("Exception:"+e);
	return;
}
finally{
	if (rs!=null) rs.close();
	if (ps!=null) ps.close();
	if (conn != null) cf.close(conn); 
}
%>			
</SCRIPT>

<script language="JavaScript">
	parent.main.location="content.jsp";
	initializeDocument()
</SCRIPT>
<br><br>
</body>
</html>
