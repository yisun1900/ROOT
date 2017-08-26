<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>回单统计
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="6%">名次</td>
          <td  width="12%">回单人</td>
          <td  width="10%">回单总数</td>
          <td  width="15%">回单总金额</td>
          <td  width="15%">平均单额</td>
          <td  width="38%">回单总金额</td>
        </tr>
<%
int maxsl=0;
double maxje=0;
String dwmc=null;
String sgd=null;

int allsl=0;
int allje=0;
int allbzsl=0;

		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();


	//获取最大值
	ls_sql="select NVL(max(count(*)),0)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='3' and zt='2'";//1：非回单； 2：设计师回单；3：施工队回单
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by hdr";
   //out.println(ls_sql);
	maxsl=Integer.parseInt(cf.executeQuery(ls_sql));
	if (maxsl==0)
	{
		return;
	}

	ls_sql="select max(sum(qye))";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='3' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by hdr";
   // out.println(ls_sql);

	maxje=Double.parseDouble(cf.executeQuery(ls_sql));


	int pm=0;
	int oldpm=0;
	int sl=0;
	int je=0;
	int bzsl=0;
	int pjje=0;

	ls_sql=" select hdr,count(*) sl,sum(qye) je";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='3' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	ls_sql+=" group by hdr";


	ls_sql+=" order by sum(qye) desc";
	//out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dwmc=rs.getString("hdr");
		sl=rs.getInt(2);
		je=rs.getInt(3);

		allsl+=sl;
		allje+=je;

		if (sl!=0)
		{
			pjje=je/sl;
		}
		else{
			pjje=0;
		}


		if (oldpm!=je)
		{
			pm++;
			oldpm=je;
		}

		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=dwmc%></td>
          <td align="right"><%=sl%></td>
          <td align="right"><%=cf.formatDouble(je)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="left"><A HREF="ViewHdtj.jsp?hdr=<%=dwmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=je*200/maxje%>" height="14"></A></td>
        </tr>
<%

	}
	ps.close();
	rs.close();


	if (allsl!=0)
	{
		pjje=allje/allsl;
	}
	else{
		pjje=0;
	}

%>
        <tr align="center" >
          <td>合计</td>
          <td>&nbsp;</td>
          <td align="right"><%=allsl%></td>
          <td align="right"><%=cf.formatDouble(allje)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="left">&nbsp;</td>
        </tr>
<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
