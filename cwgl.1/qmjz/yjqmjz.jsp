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

String dwbh=request.getParameter("dwbh");
String[] nian=request.getParameterValues("nian");
String[] yue=request.getParameterValues("yue");
String[] rq=request.getParameterValues("rq");
String[] sj=request.getParameterValues("sj");
if (rq==null)
{
	out.println("错误！不需要结转");
	return;
}


//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<rq.length ;i++ )
	{
		java.sql.Date jzrq=null;
		try{
			jzrq=java.sql.Date.valueOf(nian[i]+"-"+yue[i]+"-"+rq[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[结转时间]类型转换发生意外:"+e+nian[i]+"-"+yue[i]+"-"+rq[i]);
			return;
		}

		//判断本期是否已结转
		int count=0;
		ls_sql="select count(*) ";
		ls_sql+=" from cw_qmjz";  
		ls_sql+=" where jzrq=? and dwbh=? ";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,jzrq);
		ps.setString(2,dwbh);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		} 
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误！本期已结转："+jzrq);
			return;
		}

		//结转期数
		int jzqs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from cw_qmjz";  
		ls_sql+=" where dwbh=? ";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setString(1,dwbh);
		rs=ps.executeQuery();
		if (rs.next())
		{
			jzqs=rs.getInt(1);
		} 
		rs.close();
		ps.close();

		jzqs++;

		//上期结转日期
		java.sql.Date sqjzrq=null;
		ls_sql="select max(jzrq)";
		ls_sql+=" from cw_qmjz";  
		ls_sql+=" where dwbh=? ";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setString(1,dwbh);
		rs=ps.executeQuery();
		if (rs.next())
		{
			sqjzrq=rs.getDate(1);
		} 
		rs.close();
		ps.close();

		ls_sql="insert into cw_qmjz (jzrq,dwbh,jzr,czsj   ,sqjzrq,khzs,qyze,tdkhzs,tdqyze,jzqs,nian,yue,rq,sj) ";
		ls_sql+=" values(            ?   ,?   ,?  ,SYSDATE,?     ,0   ,0   ,0     ,0     ,?   ,?   ,?   ,? ,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jzrq);
		ps.setString(2,dwbh);
		ps.setString(3,yhmc);
		ps.setDate(4,sqjzrq);
		ps.setInt(5,jzqs);
		ps.setString(6,nian[i]);
		ps.setString(7,yue[i]);
		ps.setString(8,rq[i]);
		ps.setString(9,sj[i]);
		ps.executeUpdate();
		ps.close();

/*
		
		ls_sql="delete from cw_qmjzmx";
		ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and fgsbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		cwgl.Cwgl cwgl=new cwgl.Cwgl();

		String khbh=null;
		double cwsfke=0;
		double sfke=0;

		//家装签单客户结转＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql =" select khbh,cwsfke,sfke";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null ";//未结转的单，都计算在内
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and gcjdbm!='5'";//5：客户完结
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			khbh=rs1.getString("khbh"); 
			cwsfke=rs1.getDouble("cwsfke"); 
			sfke=rs1.getDouble("sfke"); 

			String fkcs="";
			ls_sql="select fkcs";
			ls_sql+=" from  cw_fkfamx,cw_khfkfa";
			ls_sql+=" where cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"'";
			ls_sql+=" order by fkcs";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				fkcs=cf.fillNull(rs.getString("fkcs"));
			}
			rs.close();
			ps.close();

			if (fkcs.equals(""))
			{
				continue;
			}

			double[] fkxx=cwgl.getFkje(khbh,fkcs);//取一期款

			double yfkbl=fkxx[1];//累计付款比例
			double yfkje=fkxx[2];//累计付款金额

			if (yfkbl==-1)
			{
				continue;
			}



			if (cwsfke>yfkje-1000)//表示已付首期款，进行结转
			{
				ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh )";
				ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh ";
				ls_sql+=" FROM crm_khxx";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_khxx";
				ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		} 
		rs1.close();
		ps1.close();
		//家装签单客户结转＝＝＝＝＝＝＝＝＝＝＝结束


//		out.println("<BR>"+ls_sql);

		//设计客户结转＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql =" select khbh,cwsfke,sfke";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='5'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null ";//未结转的单，都计算在内
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and gcjdbm!='5'";//5：客户完结
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			khbh=rs1.getString("khbh"); 
			cwsfke=rs1.getDouble("cwsfke"); 
			sfke=rs1.getDouble("sfke"); 


			ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh )";
			ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx";
			ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		} 
		rs1.close();
		ps1.close();
		//设计客户结转＝＝＝＝＝＝＝＝＝＝＝结束


		//退单客户先做签单结转＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql =" select khbh,cwsfke,sfke";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt in('3')";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=" and yjjzsj is null ";//未结转的单，都计算在内
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and gcjdbm!='5'";//5：客户完结
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			khbh=rs1.getString("khbh"); 
			cwsfke=rs1.getDouble("cwsfke"); 
			sfke=rs1.getDouble("sfke"); 


			ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt ,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh )";
			ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,'2',khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx";
			ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		} 
		rs1.close();
		ps1.close();
		//退单客户先做签单结转＝＝＝＝＝＝＝＝＝＝＝结束


		//退单客户做退单结转＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql =" select khbh,cwsfke,sfke";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='3'";
		ls_sql+=" and crm_khxx.yjjzsj is not null";//表示已计算过业绩
		ls_sql+=" and crm_khxx.tdyjjzsj is null";//表示未退单结转
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and gcjdbm!='5'";//5：客户完结
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			khbh=rs1.getString("khbh"); 
			cwsfke=rs1.getDouble("cwsfke"); 
			sfke=rs1.getDouble("sfke"); 


			ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh )";
			ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,khjl,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx";
			ls_sql+=" set tdyjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		} 
		rs1.close();
		ps1.close();
		//退单客户做退单结转＝＝＝＝＝＝＝＝＝＝＝结束


		//汇总结转结果＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int khzs=0;
		double qyze=0;
		ls_sql="select count(*),sum(qye)";
		ls_sql+=" from cw_qmjzmx ";  
		ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and fgsbh='"+dwbh+"'";
		ls_sql+=" and zt!='3'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			khzs=rs.getInt(1);
			qyze=rs.getDouble(2);
		} 
		rs.close();
		ps.close();

		int tdkhzs=0;
		double tdqyze=0;
		ls_sql="select count(*),sum(qye)";
		ls_sql+=" from cw_qmjzmx ";  
		ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and fgsbh='"+dwbh+"'";
		ls_sql+=" and zt='3'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			tdkhzs=rs.getInt(1);
			tdqyze=rs.getDouble(2);
		} 
		rs.close();
		ps.close();

		ls_sql="update cw_qmjz set khzs=?,qyze=?,tdkhzs=?,tdqyze=?";
		ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,khzs);
		ps.setDouble(2,qyze);
		ps.setInt(3,tdkhzs);
		ps.setDouble(4,tdqyze);
		ps.executeUpdate();
		ps.close();
		//汇总结转结果＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

*/
		//结转:客户付款记录:cw_khfkjl
		ls_sql=" update cw_khfkjl";
		ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
		ls_sql+=" where yjjzsj is null";
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}





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




