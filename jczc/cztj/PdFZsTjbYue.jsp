<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");

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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
String sgdmc=null;
String sgd=null;
String sgdlx=null;


int pm=0;
double oldje=0;
int sl=0;
int je=0;
int zsl=0;
int zje=0;
int bzsl=0;
String nian=null;
String yue=null;


int allsl=0;
double allje=0;
int allbzsl=0;

String bgcolor=null;
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();

	ls_sql=" delete from cw_tjlsb51";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb50";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="insert into cw_tjlsb51 (yhdlm,sgd,nian,yue,sz12,sz1)";

	ls_sql+=" select '"+yhdlm+"',sgd,nian,yue,sum(sl),sum(je)";
	ls_sql+=" from";
	ls_sql+=" (";

	ls_sql+=" select crm_khxx.sgd,to_char(pdsj,'YYYY') nian,to_char(pdsj,'MM') yue,count(*) sl,sum(qye) je";
	ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  and sq_sgd.sgdlx='S0'";
	ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by crm_khxx.sgd,to_char(pdsj,'YYYY'),to_char(pdsj,'MM')";

	ls_sql+=" union all ";

	ls_sql+=" select sgd,'0','0',0 sl,0 je";
	ls_sql+=" from sq_sgd";
	ls_sql+=" where cxbz='N' and sq_sgd.sgdlx='S0'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  ssfgs='"+fgs+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by sgd,nian,yue";
	
	ls_sql+=" order by sgd,nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	
	ls_sql="insert into cw_tjlsb51 (yhdlm,sgd,nian,yue,sz12,sz1)";
	ls_sql+=" select distinct yhdlm,sgd,'0','0',0,0";
	ls_sql+=" from cw_tjlsb51 ";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
	ls_sql+=" and sgd not in(select sgd from cw_tjlsb51 where yhdlm='"+yhdlm+"' and nian='0' and yue='0')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" update cw_tjlsb51 a set sz12=(select sum(sz12) from cw_tjlsb51 b where b.sgd=a.sgd)";
	ls_sql+=" ,sz1=(select sum(sz1) from cw_tjlsb51 b where b.sgd=a.sgd)";
	ls_sql+=" where yhdlm='"+yhdlm+"' and nian='0' and yue='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

	ls_sql="insert into cw_tjlsb50 (yhdlm,nian,yue)";
	ls_sql+=" select distinct '"+yhdlm+"',nian,yue";
	ls_sql+=" FROM cw_tjlsb51";
	ls_sql+=" where cw_tjlsb51.yhdlm='"+yhdlm+"' and nian!='0' and yue!='0'";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" select sgd,sz1";
	ls_sql+=" FROM cw_tjlsb51";
	ls_sql+=" where yhdlm='"+yhdlm+"' and nian='0' and yue='0'";
	ls_sql+=" order by sz1 desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		je=rs.getInt("sz1");

		if (oldje!=je)
		{
			pm++;
			oldje=je;
		}

		ls_sql="update cw_tjlsb51 set sz11="+pm;
		ls_sql+=" where yhdlm='"+yhdlm+"' and sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

	
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" FROM cw_tjlsb50";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<CENTER >
  <B>施工队接单统计－非直属
  <BR>(派单时间及回单签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="<%=(30+310+count*160)%>px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td rowspan="2" width="30px">名次</td>
          <td rowspan="2"  width="80px">施工队</td>
          <td rowspan="2"  width="70px">班组数</td>
          <td rowspan="2"  width="70px">派单总数</td>
          <td rowspan="2"  width="90px">派单总金额</td>
<%

		
		ls_sql=" select nian,yue";
		ls_sql+=" FROM cw_tjlsb50";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ls_sql+=" order by nian,yue";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			nian=rs.getString("nian");
			yue=rs.getString("yue");

			%>
			  <td colspan="2"><%=nian%>年<%=yue%>月</td>
			<%
		}
		rs.close();
		ps.close();
	
%>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center"> 
<%
		
		ls_sql=" select nian,yue";
		ls_sql+=" FROM cw_tjlsb50";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ls_sql+=" order by nian,yue";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			nian=rs.getString("nian");
			yue=rs.getString("yue");

			%>
			  <td width="70px">数量</td>
			  <td width="90px">金额</td>
			<%
		}
		rs.close();
		ps.close();
	
%>
        </tr>

<%

	String oldsgd="";
	int sz11=0;

	ls_sql=" select sz11,sgd,sgdmc,bzs,nian,yue,sum(sz12) sl,sum(sz1) je";
	ls_sql+=" FROM (";

	ls_sql+=" select cw_tjlsb51.sz11,cw_tjlsb51.sgd,sgdmc,bzs,nian,yue,sz12,sz1";
	ls_sql+=" FROM cw_tjlsb51,sq_sgd";
	ls_sql+=" where cw_tjlsb51.yhdlm='"+yhdlm+"' and cw_tjlsb51.sgd=sq_sgd.sgd";

	ls_sql+=" UNION ALL";

	ls_sql+=" select cw_tjlsb51.sz11,cw_tjlsb51.sgd,sgdmc,bzs,cw_tjlsb50.nian,cw_tjlsb50.yue,0,0";
	ls_sql+=" FROM cw_tjlsb51,sq_sgd,cw_tjlsb50 ";
	ls_sql+=" where cw_tjlsb51.yhdlm='"+yhdlm+"' and cw_tjlsb51.sgd=sq_sgd.sgd and cw_tjlsb51.nian='0' and cw_tjlsb51.yue='0' and cw_tjlsb50.yhdlm='"+yhdlm+"' ";

	ls_sql+=" )";

	ls_sql+=" group by sz11,sgd,sgdmc,bzs,nian,yue";
	ls_sql+=" order by sz11,sgd,sgdmc,bzs,nian,yue";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sz11=rs.getInt("sz11");
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		bzsl=rs.getInt("bzs");
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		sl=rs.getInt("sl");
		je=rs.getInt("je");

		if (nian.trim().equals("0") && yue.trim().equals("0"))
		{
			%>
			<tr align="center" bgcolor="#FFFFFF">
			  <td><%=sz11%></td>
			  <td><%=sgdmc%></td>
			  <td><%=bzsl%></td>
			  <td align="right"><%=sl%></td>
			  <td align="right"><%=cf.formatDouble(je)%></td>
			<%
		}
		else{
			%>
			  <td align="right"><%=sl%></td>
			  <td align="right"><%=cf.formatDouble(je)%></td>
			<%
		}

		if (pm%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

	}
	rs.close();
	ps.close();

	ls_sql=" delete from cw_tjlsb51";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb50";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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
