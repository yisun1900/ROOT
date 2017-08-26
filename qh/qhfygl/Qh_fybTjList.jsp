<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ls_sql2=null;
String dwmc=null;
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='A0' ";

	}
	else if  (yhjs.equals("F0")||yhjs.equals("F1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='F0' and ssdw='"+ssfgs+"'";
	}
	dwmc=cf.executeQuery(ls_sql2);
%>
<body bgcolor="#FFFFFF">
<center><B><%=dwmc%>企划费用表</B></center><BR>
<center><%=request.getParameter("qh_fyb_sbrq")%>至<%=request.getParameter("qh_fyb_sbrq2")%></center>

<%
	String wheresql="";
	String qh_fyb_sbxh=null;
	String qh_fyb_dwbh=null;
	String qh_fyb_sbrq=null;
	String qh_fyb_xxlybm=null;
	String qh_fyb_zl=null;
	String qh_fyb_sfjhn=null;
	String qh_fyb_htsfsp=null;
	qh_fyb_sbxh=request.getParameter("qh_fyb_sbxh");
	if (qh_fyb_sbxh!=null)
	{
		qh_fyb_sbxh=cf.GB2Uni(qh_fyb_sbxh);
		if (!(qh_fyb_sbxh.equals("")))	wheresql+="  and (qh_fyb.sbxh='"+qh_fyb_sbxh+"')";
	}
	qh_fyb_dwbh=request.getParameter("qh_fyb_dwbh");
	if (qh_fyb_dwbh!=null)
	{
		qh_fyb_dwbh=cf.GB2Uni(qh_fyb_dwbh);
		if (!(qh_fyb_dwbh.equals("")))	wheresql+="  and (qh_fyb.dwbh='"+qh_fyb_dwbh+"')";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq>=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq2");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq<=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_xxlybm=request.getParameter("qh_fyb_xxlybm");
	if (qh_fyb_xxlybm!=null)
	{
		qh_fyb_xxlybm=cf.GB2Uni(qh_fyb_xxlybm);
		if (!(qh_fyb_xxlybm.equals("")))	wheresql+="  and (qh_fyb.xxlybm='"+qh_fyb_xxlybm+"')";
	}
	qh_fyb_zl=request.getParameter("qh_fyb_zl");
	if (qh_fyb_zl!=null)
	{
		qh_fyb_zl=cf.GB2Uni(qh_fyb_zl);
		if (!(qh_fyb_zl.equals("")))	wheresql+="  and (qh_fyb.zl='"+qh_fyb_zl+"')";
	}
	qh_fyb_sfjhn=request.getParameter("qh_fyb_sfjhn");
	if (qh_fyb_sfjhn!=null)
	{
		qh_fyb_sfjhn=cf.GB2Uni(qh_fyb_sfjhn);
		if (!(qh_fyb_sfjhn.equals("")))	wheresql+="  and (qh_fyb.sfjhn='"+qh_fyb_sfjhn+"')";
	}
	qh_fyb_htsfsp=request.getParameter("qh_fyb_htsfsp");
	if (qh_fyb_htsfsp!=null)
	{
		qh_fyb_htsfsp=cf.GB2Uni(qh_fyb_htsfsp);
		if (!(qh_fyb_htsfsp.equals("")))	wheresql+="  and (qh_fyb.htsfsp='"+qh_fyb_htsfsp+"')";
	}
		if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and (1=1)";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"') ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">费用媒体</td>
	<td  width="9%">种类</td>
	<td  width="9%">是否计划内</td>
	<td  width="9%">合同是否审批</td>
	<td  width="12%">备注</td>
	<td  width="8%">投放时间</td>
	<td  width="9%">合同费用</td>
	<td  width="9%">实际费用</td>
</tr>
<%
int xxlyzs=0;//信息来源总数
String ls_sql="";
String all=null;
ls_sql=null;
	//获取总数
	ls_sql="select count(*)from dm_xxlybm ";
	all=cf.executeQuery(ls_sql);
	xxlyzs=Integer.parseInt(all);


//************************************
//将各种信息来源取出，赋值给数组，以便以后使用
//**********************************
String[] xxlymc;
String[] xxlybh;//定义数组
xxlymc=new String[xxlyzs];
xxlybh=new String[xxlyzs];//占用空间申请
String hjzs;
int jlzs=0;
int xh=0;
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
    rs =stmt.executeQuery(ls_sql);
	
	while (rs.next())
	{
		 
		
		xxlybh[xh]=cf.fillNull(rs.getString("xxlybm"));
		xxlymc[xh]=cf.fillNull(rs.getString("xxlymc"));
		//out.println(xxlymc[xh]);
		//out.println(',');
		xh++;
	
	}
	
}
catch (Exception e) {
	out.print("意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
//out.print(xh);
%>

<%
	int[] mark={1,1,1,1,1,2,2,2};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
      ls_sql="";
	  for (int j=0 ;j<xxlyzs;j++)
       {
			ls_sql+="SELECT dm_xxlybm.xxlymc, qh_qhfyzlb.fyzlmc as qh_fyb_zl, DECODE(qh_fyb.sfjhn,'Y','是','N','否'), DECODE(qh_fyb.htsfsp,'Y','是','N','否'),qh_fyb.bz,sum(qh_fyb.tfsj),sum(qh_fyb.htfy),sum(qh_fyb.sjfy) "; 
			ls_sql+=" FROM qh_fyb,sq_dwxx,dm_xxlybm,qh_qhfyzlb   ";
			ls_sql+=" where qh_qhfyzlb.fyzldm=qh_fyb.zl and qh_fyb.dwbh=sq_dwxx.dwbh and qh_fyb.xxlybm=dm_xxlybm.xxlybm  and dm_xxlybm.xxlybm='"+xxlybh[j]+"'";
			ls_sql+=wheresql;
			ls_sql+=" group by dm_xxlybm.xxlymc,qh_qhfyzlb.fyzlmc,qh_fyb.sfjhn,qh_fyb.htsfsp,qh_fyb.bz";
			if (j<xxlyzs-1)
			   {
				ls_sql+=" union ";
			   }
       }
//out.print(ls_sql);
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%>
</table>
</body>
</html>
