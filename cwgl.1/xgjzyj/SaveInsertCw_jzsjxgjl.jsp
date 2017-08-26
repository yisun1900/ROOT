<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
java.sql.Date yqdjzsj=null;
java.sql.Date ytdjzsj=null;
double wdzgce=0;
double qye=0;
java.sql.Date xghqdjzsj=null;
java.sql.Date xghtdjzsj=null;
double xwdzgce=0;
double xqye=0;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
xgr=cf.GB2Uni(request.getParameter("xgr"));
zt=cf.GB2Uni(request.getParameter("zt"));
hth=cf.GB2Uni(request.getParameter("hth"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xglx=cf.GB2Uni(request.getParameter("xglx"));

String yqdjzsjStr=request.getParameter("yqdjzsj");
try{
	if (!(yqdjzsjStr.equals("")))  yqdjzsj=java.sql.Date.valueOf(yqdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原签单结转时间]类型转换发生意外:"+e);
	return;
}

String ytdjzsjStr=request.getParameter("ytdjzsj");
try{
	if (!(ytdjzsjStr.equals("")))  ytdjzsj=java.sql.Date.valueOf(ytdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ytdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原退单结转时间]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程签约额]类型转换发生意外:"+e);
	return;
}

String xghqdjzsjStr=request.getParameter("xghqdjzsj");
try{
	if (!(xghqdjzsjStr.equals("")))  xghqdjzsj=java.sql.Date.valueOf(xghqdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghqdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后签单结转时间]类型转换发生意外:"+e);
	return;
}

String xghtdjzsjStr=request.getParameter("xghtdjzsj");
try{
	if (!(xghtdjzsjStr.equals("")))  xghtdjzsj=java.sql.Date.valueOf(xghtdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghtdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后退单结转时间]类型转换发生意外:"+e);
	return;
}

String xgsm=cf.GB2Uni(request.getParameter("xgsm"));


//检查是否当月最后一天
if (!xghqdjzsjStr.equals(""))
{
	String nian=xghqdjzsjStr.substring(0,4);
	String yue=xghqdjzsjStr.substring(5,7);
	String lday=cf.lastDay(nian,yue);

	if (xghqdjzsjStr.compareTo(cf.today())>0)
	{
		out.println("失败！[修改后签单结转时间]不能大于[今天"+cf.today()+"]!");
		return;
	}
}

if (!xghtdjzsjStr.equals(""))
{
	String nian=xghtdjzsjStr.substring(0,4);
	String yue=xghtdjzsjStr.substring(5,7);
	String lday=cf.lastDay(nian,yue);

	if (xghtdjzsjStr.compareTo(cf.today())>0)
	{
		out.println("失败！[修改后退单结转时间]不能大于[今天"+cf.today()+"]!");
		return;
	}
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String mqyjjzsj=null;
	String mqtdyjjzsj=null;
	String mqzt=null;
	String fgsbh=null;
	ls_sql="select yjjzsj,tdyjjzsj,zt,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mqyjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		mqtdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		mqzt=cf.fillNull(rs.getString("zt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();
	if (!mqzt.equals(zt))
	{
		out.println("错误！[客户状态]已改变，不能修改");
		return;
	}

	if (!mqyjjzsj.equals(yqdjzsjStr))
	{
		out.println("错误！[签单结转时间]已改变，不能修改，可能您已经存盘了，客户接转时间["+mqyjjzsj+"]");
		return;
	}

	if (!mqtdyjjzsj.equals(ytdjzsjStr))
	{
		out.println("错误！[退单结转时间]已改变，不能修改，可能您已经存盘了");
		return;
	}

	int count=0;
	if (xghqdjzsj!=null)
	{
		ls_sql="select count(*)";
		ls_sql+="  from cw_qmjz";  
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,xghqdjzsj);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		} 
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("错误！『签单结转记录』不存在："+xghqdjzsj);
			return;
		}
	}
	if (xghtdjzsj!=null)
	{
		ls_sql="select count(*)";
		ls_sql+="  from cw_qmjz";  
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,xghtdjzsj);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		} 
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("错误！『退单结转时间』不存在："+xghtdjzsj);
			return;
		}
	}


	conn.setAutoCommit(false);

	ls_sql="insert into cw_jzsjxgjl ( khbh,xgsj,xgr,zt,hth,khxm,wdzgce,qye   ,xglx,yqdjzsj,ytdjzsj,xghqdjzsj,xghtdjzsj,xgsm ) ";
	ls_sql+=" values ( ?,SYSDATE,?,?,?,?,?,?   ,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,xgr);
	ps.setString(3,zt);
	ps.setString(4,hth);
	ps.setString(5,khxm);
	ps.setDouble(6,wdzgce);
	ps.setDouble(7,qye);

	ps.setString(8,xglx);
	ps.setDate(9,yqdjzsj);
	ps.setDate(10,ytdjzsj);
	ps.setDate(11,xghqdjzsj);
	ps.setDate(12,xghtdjzsj);
	ps.setString(13,xgsm);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=?,tdyjjzsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,xghqdjzsj);
	ps.setDate(2,xghtdjzsj);
	ps.executeUpdate();
	ps.close();


	//删除签单、退单接转信息
	ls_sql="delete from cw_qmjzmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (yqdjzsjStr.equals(ytdjzsjStr))//只需改一条
	{
		ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yqdjzsj);
		ps.setDate(2,yqdjzsj);
		ps.setDate(3,yqdjzsj);
		ps.setDate(4,yqdjzsj);
		ps.setDate(5,yqdjzsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yqdjzsj);
		ps.setDate(2,yqdjzsj);
		ps.setDate(3,yqdjzsj);
		ps.setDate(4,yqdjzsj);
		ps.setDate(5,yqdjzsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
		ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,ytdjzsj);
		ps.setDate(2,ytdjzsj);
		ps.setDate(3,ytdjzsj);
		ps.setDate(4,ytdjzsj);
		ps.setDate(5,ytdjzsj);
		ps.executeUpdate();
		ps.close();
	}


	//增加新的接转信息
	if (xghqdjzsj!=null)
	{
		ls_sql="insert into cw_qmjzmx (jzrq,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select ?,khbh,'2',khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,xghqdjzsj);
		ps.executeUpdate();
		ps.close();
	}

	if (xghtdjzsj!=null)
	{
		ls_sql="insert into cw_qmjzmx (jzrq,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select ?,khbh,'3',khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,xghtdjzsj);
		ps.executeUpdate();
		ps.close();
	}
	
	if (xghqdjzsj!=null || xghtdjzsj!=null)
	{
		if (xghqdjzsjStr.equals(xghtdjzsjStr))
		{
			ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
			ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xghqdjzsj);
			ps.setDate(2,xghqdjzsj);
			ps.setDate(3,xghqdjzsj);
			ps.setDate(4,xghqdjzsj);
			ps.setDate(5,xghqdjzsj);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
			ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xghqdjzsj);
			ps.setDate(2,xghqdjzsj);
			ps.setDate(3,xghqdjzsj);
			ps.setDate(4,xghqdjzsj);
			ps.setDate(5,xghqdjzsj);
			ps.executeUpdate();
			ps.close();

			ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"')";
			ls_sql+=" ,tdkhzs=NVL((select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
			ls_sql+=" ,tdqyze=NVL((select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=? and cw_qmjzmx.fgsbh='"+fgsbh+"'),0)";
		ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xghtdjzsj);
			ps.setDate(2,xghtdjzsj);
			ps.setDate(3,xghtdjzsj);
			ps.setDate(4,xghtdjzsj);
			ps.setDate(5,xghtdjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
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