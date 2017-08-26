<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>期末结转</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 

String yhmc=(String)session.getAttribute("yhmc");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

String yjjzsj=cf.lastDay(nian,yue);

if (yjjzsj.compareTo(cf.today())>0)
{
	out.println("失败！[结转日期]不能大于[系统日期]!");
	return;
}

//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;

java.sql.Date lastDay=null;

try {
	conn=cf.getConnection();

	java.sql.Date sqjzrq=null;
	int count=0;

	//查询表cw_qmjz中[最大结转日期]与[输入日期]之间的月份差额，若无结转记录，则为-1
	ls_sql="select MONTHS_BETWEEN(  NVL(max(yjjzsj),ADD_MONTHS(TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),-1)),TO_DATE('"+yjjzsj+"','YYYY-MM-DD')),max(yjjzsj) ";
	ls_sql+="  from cw_qmjz";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);//最大结转日期与输入结转日期的差额 
		sqjzrq=rs.getDate(2);//从数据库中取最大结转日期 
	} 
	rs.close();
	ps.close();


	String sqstr=null;
	if (sqjzrq==null)
	{
		sqstr="";
	}
	else{
		sqstr=sqjzrq.toString();
	}


	if (yjjzsj.equals(sqstr))
	{
		out.println("失败！本期『"+yjjzsj+"』已结转！");
		return;
	}

	if (count>0)//最大日期大于输入的结转日期
	{
		out.println("失败！不能结转上月的记录！");
		return;
	}
	else if (count<-1)//最大日期小于输入的结转日期
	{
		out.println("失败！您上月还没有结转，不能跨月结转！");
		return;
	}



	conn.setAutoCommit(false);

	String sjfw=cf.firstDay(nian,yue);
	String sjfw2=cf.lastDay(nian,yue);

	ls_sql="insert into cw_qmjz ( yjjzsj,jzr,sqjzrq) ";
	ls_sql+=" values ( TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.setDate(2,sqjzrq);
	ps.executeUpdate();
	ps.close();

	double jryjbfb=0;
	String dwbh=null;
	ls_sql="select dwbh,jryjbfb";
	ls_sql+="  from sq_dwxx";  
	ls_sql+="  where dwlx='F0' ";  
	ls_sql+="  order by dwbh";  
	ps1=conn.prepareStatement(ls_sql);  
	rs1=ps1.executeQuery();
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh"); 
		jryjbfb=rs1.getDouble("jryjbfb");//计入业绩百分比 

		if (jryjbfb==0)
		{
			conn.rollback();
			out.println("<P>错误！分公司【"+dwbh+"】无【计入业绩百分比】，请在单位信息表中录入");
			return;
		}

		jryjbfb=(jryjbfb-0.5)/100;


		//签单
		ls_sql="insert into cw_qmjzmx (yjjzsj,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt in('2')";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null";//未结转的单，都计算在内
		ls_sql+=" and cwsfke>=qye*"+jryjbfb;
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	} 
	rs1.close();
	ps1.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt in('2') and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD') )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//退单
	ls_sql="insert into cw_qmjzmx (yjjzsj,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
	ls_sql+=" select TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where zt='3'";
	ls_sql+=" and crm_khxx.yjjzsj is not null";
	ls_sql+=" and crm_khxx.tdyjjzsj is null";//未结转的单，都计算在内
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='2' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='2' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='3' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='3' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" where yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("结转成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("数据库操作失败"+e);
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close();  
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("关闭连接发生以外,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>





