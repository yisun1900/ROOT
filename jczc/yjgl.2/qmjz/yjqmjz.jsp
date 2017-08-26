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
int count=0;

count=cf.checkYjQmjz("cw_qmjz");
//返回： -1:出错;0:已全部结转；1:只是最近一月未结转;2:至少最近两月未结转
if (count==0)
{
	out.println("错误！全部已结转，未到新的结转时间！");
	return;
}
else if (count==-1)
{
	out.println("系统错误！");
	return;
}

String yhmc=(String)session.getAttribute("yhmc");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

String jzrq=cf.lastDay(nian,yue);


//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;


try {
	conn=cf.getConnection();

	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转;3:结转时间不能超过今天  
	count=cf.checkQmjz("cw_qmjz",jzrq);

	if (count==0)//已结转
	{
		out.println("失败！本期『"+jzrq+"』已结转！");
		return;
	}
	else if (count==2)//上月没结转
	{
		out.println("失败！您上月还没有结转，不能跨月结转！");
		return;
	}
	else if (count==3)//结转时间不能超过今天
	{
		out.println("失败！结转时间不能超过今天！");
		return;
	}
	else if (count==-1)
	{
		out.println("系统错误！");
		return;
	}



	conn.setAutoCommit(false);


	ls_sql="insert into cw_qmjz ( jzrq,jzr,czsj,sqjzrq) ";
	ls_sql+=" values ( TO_DATE('"+jzrq+"','YYYY-MM-DD'),?,SYSDATE,TRUNC(LAST_DAY(ADD_MONTHS(TO_DATE('"+jzrq+"','YYYY-MM-DD'),-1)))) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.executeUpdate();
	ps.close();

	int yjjzrq=0;
	String qyrqstr=null;
	ls_sql="select yjjzrq";
	ls_sql+="  from sq_dwxx";  
	ls_sql+="  where dwlx='A0' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		yjjzrq=rs.getInt("yjjzrq");//计算业绩的截至日期 
	} 
	rs.close();
	ps.close();

	if (yjjzrq==0)//0表示每月的最后一天
	{
		qyrqstr=cf.lastDay(nian,yue);
	}
	else{
		qyrqstr=nian+"-"+yue+"-"+cf.addZero(yjjzrq,2);
	}


	//取签单客户
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
		jryjbfb=rs1.getDouble("jryjbfb");//家装客户计入业绩收款比例 

		if (jryjbfb<0)
		{
			conn.rollback();
			out.println("<P>错误！分公司【"+dwbh+"】无【家装客户计入业绩收款比例】，请在单位信息表中录入");
			return;
		}

		jryjbfb=(jryjbfb-0.5)/100;

		//家装客户签单
		ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null";//未结转的单，都计算在内
		ls_sql+=" and cwsfke>=qye*"+jryjbfb;
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//设计客户签单
		ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='5'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null";//未结转的单，都计算在内
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//退单客户先做签单结转
		ls_sql="insert into cw_qmjzmx (jzrq               ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,'2',khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt in('3')";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null";//未结转的单，都计算在内
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	} 
	rs1.close();
	ps1.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//退单
		ls_sql="insert into cw_qmjzmx (jzrq          ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
	ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where zt='3'";
	ls_sql+=" and crm_khxx.yjjzsj is not null";//表示已计算过业绩
	ls_sql+=" and crm_khxx.tdyjjzsj is null";//表示未退单结转
	ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
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




