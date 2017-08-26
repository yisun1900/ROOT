<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yscsjlh=request.getParameter("yscsjlh");
String khbh=request.getParameter("khbh");
String[] gcysxmbm=request.getParameterValues("gcysxmbm");

java.sql.Date yssj=null;
String ysr=null;
String lrbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收时间]类型转换发生意外:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));

String zpml=cf.today("YYYYMM");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<gcysxmbm.length ;i++ )
	{
		//获取客户回访和工程进度信息
		String nowgcjdbm=null;
		java.sql.Date nowhfrq=null;
		String nowhflxbm=null;
		String nowsfxhf=null;
		String nowysjlh=null;
		String nowzqysxmbm=null;
		String hfszjlh=null;
		java.sql.Date nowszqsj=null;
		double fwmj = 0;
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			nowhflxbm=cf.fillNull(rs.getString("hflxbm"));
			nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
			nowhfrq=rs.getDate("hfrq");
			nowysjlh=cf.fillNull(rs.getString("ysjlh"));
			nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
			nowszqsj=rs.getDate("sgyssj");
			fwmj=rs.getDouble("fwmj");
		}
		rs.close();
		ps.close();

		//获取验收项目信息
		String gcysxmmc=null;
		String xmlx=null;
		int yszxsl=0;//验收子项数量
		ls_sql="SELECT gcysxmmc,xmlx,yszxsl";
		ls_sql+=" FROM dm_heysxm ";
		ls_sql+=" where  gcysxmbm='"+gcysxmbm[i]+"' ";
		ls_sql+=" and  gcysbbh='"+gcysbbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
			xmlx=cf.fillNull(rs.getString("xmlx"));
			yszxsl=rs.getInt("yszxsl");
		}
		rs.close();
		ps.close();

		String xlrmx = "1";//需录入明细  1：不需录入；2：需录入
		if (yszxsl>0)
		{
			xlrmx="2";
		}

		int isxm=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from crm_heysjl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ls_sql+=" and gcysxmbm='"+gcysxmbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			isxm=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (isxm>0)
		{
			conn.rollback();
			out.println("错误！验收项目已录入："+isxm);
			return;
		}

		String ysjlh = null;
		int count=0;
		ls_sql=" select substr(max(ysjlh),8,3) ";
		ls_sql+=" from crm_heysjl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ysjlh=khbh.trim()+cf.addZero(count+1,3);

		ls_sql="insert into crm_heysjl ( ysjlh,yscsjlh,khbh,gcysxmbm,gcysxmmc,yssj,ysr,sjs,sgd,zjxm    ,sfszhf,hfszjlh,gcjdbm,sfsgjdb,jdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm,yysjlh,   ygcysxmbm,yyssj,lrbm,lrr,lrsj,bz,xlrmx   ,sjysjg,clbz,zpsl,fdxbz,gcysbbh,yszxsl,padlrbz,xmlx,zpml ) ";
		ls_sql+=" values (             ?,?,?,?,?,?,?,?,?,?                                           ,?,?,?,?,?,?,?,?,?,?                                                         ,?,?,?,? ,SYSDATE,?,?                    ,0     ,'9' ,0   ,'1',?,?,'0',?,?) ";//9：录入未完成；0：没问题；1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysjlh);
		ps.setString(2,yscsjlh);
		ps.setString(3,khbh);
		ps.setString(4,gcysxmbm[i]);
		ps.setString(5,gcysxmmc);
		ps.setDate(6,yssj);
		ps.setString(7,ysr);
		ps.setString(8,sjs);
		ps.setString(9,sgd);
		ps.setString(10,zjxm);

		ps.setString(11,"N");//Y：是；N：否
		ps.setString(12,"");
		ps.setString(13,"");
		ps.setString(14,"N");//Y：关联；N：不关联
		ps.setString(15,"");
		ps.setString(16,"");
		ps.setString(17,"");
		ps.setDate(18,null);
		ps.setString(19,"");
		ps.setString(20,nowysjlh);

		ps.setString(21,nowzqysxmbm);
		ps.setDate(22,nowszqsj);
		ps.setString(23,lrbm);
		ps.setString(24,lrr);
		ps.setString(25,bz);
		ps.setString(26,xlrmx);
		ps.setString(27,gcysbbh);
		ps.setInt(28,yszxsl);
		ps.setString(29,xmlx);
		ps.setString(30,zpml);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set ysjlh=?,sgyssj=?,zqysxmbm=?";//zqysxmbm最近验收项目
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysjlh);
		ps.setDate(2,yssj);
		ps.setString(3,gcysxmbm[i]);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

/*
	//发送短信
	ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
	String retStr=dxxt.gcysKhFs(conn,yscsjlh,lrr);//调用发送短信函数
	if (retStr.equals(""))
	{
		System.out.println("短信发送成功");
	}
	else{
		System.out.println(retStr);//将发送结果显示到页面上
	}
*/
	response.sendRedirect("EditCrm_heysjl.jsp?yscsjlh="+yscsjlh);
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
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>