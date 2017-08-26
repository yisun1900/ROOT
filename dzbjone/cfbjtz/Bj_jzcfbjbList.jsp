<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
String dqbm=null;//这里写入你要修改的地区编码
String bjjbbm=null;//电子报价级别A：中级 B：中高级 C：峰翼 D：标准 E：高级
dqbm=request.getParameter("bj_jzbjb_dqbm");
bjjbbm=request.getParameter("bjjbbm");

double xsjxbj=0;//拆分报价机械报价
double xsrgbj=0;//拆分报价人工报价
double xsclbj=0;//拆分报价材料报价
double xscfdzbj=0;//拆分报价中的总价
double xsdzbj=0;//电子报价中的报价
double tzjxbj=0;//调整后拆分报价机械报价
double tzcfbj=0;//调整后拆分报价中项目报价，客户报价=材料报价＋人工报价＋机械报价

String dqmc=null;
String bjjbmc=null;
String xsfxmbh=null;
String xsxmbh=null;
//String xsdzbj=null;
int i=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


    //查询地区名称
    ls_sql=" select dqmc ";
	ls_sql+=" from dm_dqbm ";
	ls_sql+=" where dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if (rs1.next())
	{
		dqmc=rs1.getString("dqmc");
	}
	rs1.close();
	ps1.close();

	//查询报价级别名称
    ls_sql=" select bjjbmc ";
	ls_sql+=" from bdm_bjjbbm ";
	ls_sql+=" where bjjbbm='"+bjjbbm+"'";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if (rs1.next())
	{
		bjjbmc=rs1.getString("bjjbmc");
	}
	rs1.close();
	ps1.close();


	conn.setAutoCommit(false);

	//在拆分报价同一父项目编号中找出最大的项目编号，父项目编号
	String bjbbh=null;
	String dqbm=null;
	String bjjbbm=null;
	String fxmbh=null;
	String fxmmc=null;
	double clbj=0;
	double rgbj=0;
	double jxbj=0;
	double bj=0;
	ls_sql =" select bjbbh,dqbm,bjjbbm,xmbh,xmmc,clbj,rgbj,jxbj,bj";
	ls_sql+=" from bj_jzbjb";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' group by fxmbh ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xsfxmbh=rs.getString(1);
		xsxmbh=rs.getString(2);

		i++;
//      out.println(xsfxmbh);
//      out.println(xsxmbh);
		
		//查询电子报价表中的报价
		ls_sql=" select bj ";
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsfxmbh+"' ";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsdzbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//查询拆分报价表中的机械报价，人工报价，材料报价
	    ls_sql=" select jxbj,rgbj,clbj ";
		ls_sql+=" from bj_jzbjcfb   ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsxmbh+"' ";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsjxbj=rs1.getDouble("jxbj");
			xsrgbj=rs1.getDouble("rgbj");
			xsclbj=rs1.getDouble("clbj");
		}
		rs1.close();
		ps1.close();

		//查询拆分报价表中的父项目编号的总价格
		ls_sql=" select sum(jxbj+rgbj+clbj) ";
		ls_sql+=" from bj_jzbjcfb   ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and fxmbh='"+xsfxmbh+"' ";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xscfdzbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
        
    	String s=cf.formatDouble(xsdzbj+xsjxbj-xscfdzbj);//调整后的机械报价=父客户报价＋本项机械报价－子项3项合计

        String y=cf.formatDouble(xsdzbj+xsjxbj-xscfdzbj+xsrgbj+xsclbj); //调整后的客户报价，客户报价=材料报价＋人工报价＋机械报价

//      tzjxbj=cf.formatDouble(s);
//		tzcfbj=cf.formatDouble(y);
//      tzjxbj=(xsdzbj+xsjxbj-xscfdzbj);//调整后的机械报价
//		tzcfbj=(xsdzbj+xsjxbj-xscfdzbj+xsrgbj+xsclbj); //调整后的客户报价，客户报价=材料报价＋人工报价＋机械报价
//      out.println(s);
//    	out.println(y);
//	    out.println(tzjxbj);
//      out.println(tzcfbj);

		//更新拆分电子报价中机械报价和同一父项目?嗪胖械奶囟ǖ囊幌畋??
		ls_sql=" update bj_jzbjcfb set jxbj="+s+",bj="+y+" ";
		ls_sql+=" where  dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xsxmbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		
		
		//更新拆分电子报价中项目报价（客户报价=材料报价＋人工报价＋机械报价）
		ls_sql=" update bj_jzbjcfb set bj=(jxbj+clbj+rgbj) ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		out.print("<font color=blue>序号：["+i+"]地区：["+dqmc+"]报价级别：["+bjjbmc+"]["+xsxmbh+"]&nbsp; 拆分电子报价更新成功！&nbsp;&nbsp;原机械报价="+xsjxbj+"&nbsp;&nbsp;现机械报价="+s+"&nbsp;</font><br>");
	}
	rs.close();
	ps.close();


	out.print("<P>更新完成");

	conn.commit();
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
 

