<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gysmc=null;
String dqbm=null;
String gyslb=null;
String zclb=null;

String bz=null;
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gyslb=cf.GB2Uni(request.getParameter("gyslb"));
zclb=cf.GB2Uni(request.getParameter("zclb"));

bz=cf.GB2Uni(request.getParameter("bz"));
int mrazhs=0;
ls=request.getParameter("mrazhs");
try{
	if (!(ls.equals("")))  mrazhs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mrazhs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每日安装户数限制]类型转换发生意外:"+e);
	return;
}

String ppbm=request.getParameter("ppbm");
String gysbm=request.getParameter("gysbm");

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠截至时间]类型转换发生意外:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
String[] ssfgs=request.getParameterValues("ssfgs");
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));

String wheregysbh=cf.GB2Uni(request.getParameter("wheregysbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	ls_sql="select ppmc";
	ls_sql+=" from  sq_ppxx";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppmc=rs.getString(1);
	}
	rs.close();
	ps.close();

	String gys=null;
	ls_sql="select gys";
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where gysbm='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gys=rs.getString(1);
	}
	rs.close();
	ps.close();


	//对所属分公司进行检查，『品牌供应商授权分公司』要不超过『供应商授权分公司』＋＋＋＋＋＋＋＋＋＋＋开始
	int mark=0;
	for (int i=0;i<ssfgs.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_gyssqfgs";
		ls_sql+=" where gysbm='"+gysbm+"' and ssfgs='"+ssfgs[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			String dwmc=null;
			ls_sql="select dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+ssfgs[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dwmc=rs.getString(1);
			}
			rs.close();
			ps.close();

			mark++;

			out.println("<P>错误！『"+dwmc+"』不在供应商『"+gys+"』的服务范围内");
		}
	}

	if (mark>0)
	{
		String dwmc="";
		ls_sql="select dwmc";
		ls_sql+=" from  sq_gyssqfgs,sq_dwxx";
		ls_sql+=" where sq_gyssqfgs.ssfgs=sq_dwxx.dwbh and sq_gyssqfgs.gysbm='"+gysbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			dwmc+=rs.getString(1)+"；";
		}
		rs.close();
		ps.close();

		if (dwmc.equals(""))
		{
			out.println("<P>提醒！供应商『"+gys+"』未录入服务范围，<A HREF='/xtsq/gys/EditSq_gysbm.jsp?gysbm="+gysbm+"'>点击修改供应商服务范围</A>，然后重新修改");
		}
		else{
			out.println("<P>提醒！供应商『"+gys+"』的服务范围『"+dwmc+"』，<A HREF='/xtsq/gys/EditSq_gysbm.jsp?gysbm="+gysbm+"'>点击修改供应商服务范围</A>，然后重新修改");
		}

		return;

	}
	//对所属分公司进行检查，『品牌供应商授权分公司』要不大于『供应商授权分公司』========================结束


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where gysbh!='"+wheregysbh+"' and gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！品牌供应商名称已存在");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update sq_gysxx set gysmc=?,dqbm=?,gyslb=?,zclb=?,bz=?,mrazhs=?,ppbm=?,ppmc=?,gysbm=?,gys=?,sfyyh=?,yhkssj=?,yhjzsj=?,yhnr=?,cwdm=? ";
	ls_sql+=" where gysbh='"+wheregysbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysmc);
	ps.setString(2,dqbm);
	ps.setString(3,gyslb);
	ps.setString(4,zclb);
	ps.setString(5,bz);
	ps.setInt(6,mrazhs);
	ps.setString(7,ppbm);
	ps.setString(8,ppmc);
	ps.setString(9,gysbm);
	ps.setString(10,gys);
	ps.setString(11,sfyyh);
	ps.setDate(12,yhkssj);
	ps.setDate(13,yhjzsj);
	ps.setString(14,yhnr);
	ps.setString(15,cwdm);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from sq_ppgyssqfgs";
	ls_sql+=" where gysbh='"+wheregysbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into sq_ppgyssqfgs (gysbh,ssfgs ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wheregysbh);
		ps.setString(2,ssfgs[i]);
		ps.executeUpdate();
		ps.close();
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>