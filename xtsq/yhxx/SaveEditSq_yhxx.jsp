<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010202")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>
<%

String ls=null;
String yhdlm=null;

String yhkl=null;
String yhjs=null;

String khdhbz=cf.GB2Uni(request.getParameter("khdhbz"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));

yhkl=cf.GB2Uni(request.getParameter("yhkl"));
yhjs=cf.GB2Uni(request.getParameter("yhjs"));



String ckjgbz=cf.GB2Uni(request.getParameter("ckjgbz"));
String zdyhbz=cf.GB2Uni(request.getParameter("zdyhbz"));
String kdlxtbz=cf.GB2Uni(request.getParameter("kdlxtbz"));
String zwbm=cf.GB2Uni(request.getParameter("zwbm"));

String kkbbz=cf.GB2Uni(request.getParameter("kkbbz"));
String[] bjjbbm=request.getParameterValues("bjjbbm");

String sjxzbz=cf.GB2Uni(request.getParameter("sjxzbz"));
String sbsj=cf.GB2Uni(request.getParameter("sbsj"));
String xbsj=cf.GB2Uni(request.getParameter("xbsj"));
String ipxzbz=cf.GB2Uni(request.getParameter("ipxzbz"));
String ipdz=cf.GB2Uni(request.getParameter("ipdz"));
String wkxzbz=cf.GB2Uni(request.getParameter("wkxzbz"));
String wkdz=cf.GB2Uni(request.getParameter("wkdz"));
String kkglfx=cf.GB2Uni(request.getParameter("kkglfx"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

int mmsyzq=0;
ls=request.getParameter("mmsyzq");
try{
	if (!(ls.equals("")))  mmsyzq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mmsyzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[密码使用周期]类型转换发生意外:"+e);
	return;
}
int yxdlsbcs=0;
ls=request.getParameter("yxdlsbcs");
try{
	if (!(ls.equals("")))  yxdlsbcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxdlsbcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许登陆失败次数]类型转换发生意外:"+e);
	return;
}
int bsxtsmmzq=0;
ls=request.getParameter("bsxtsmmzq");
try{
	if (!(ls.equals("")))  bsxtsmmzq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bsxtsmmzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[不上系统锁密码周期]类型转换发生意外:"+e);
	return;
}

String kfgssq=request.getParameter("kfgssq");
String[] sqxz1Value=request.getParameterValues("sqxz1Value");
String[] sqxz2Value=request.getParameterValues("sqxz2Value");
String[] sqxz3Value=request.getParameterValues("sqxz3Value");
String[] sqxz4Value=request.getParameterValues("sqxz4Value");
String[] sqxz5Value=request.getParameterValues("sqxz5Value");
String sfyxzhmm=cf.GB2Uni(request.getParameter("sfyxzhmm"));
String[] sfxmbm=request.getParameterValues("sfxmbm");
String sfkdybj=cf.GB2Uni(request.getParameter("sfkdybj"));

double zdsjf=0;
ls=request.getParameter("zdsjf");
try{
	if (!(ls.equals("")))  zdsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zdsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最低设计费]类型转换发生意外:"+e);
	return;
}
double zgsjf=0;
ls=request.getParameter("zgsjf");
try{
	if (!(ls.equals("")))  zgsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zgsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最高设计费]类型转换发生意外:"+e);
	return;
}
double mrsjf=0;
ls=request.getParameter("mrsjf");
try{
	if (!(ls.equals("")))  mrsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mrsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[默认设计费]类型转换发生意外:"+e);
	return;
}
String txfs=request.getParameter("txfs");

int txjg=0;
ls=request.getParameter("txjg");
try{
	if (!(ls.equals("")))  txjg=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[txjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提醒间隔]类型转换发生意外:"+e);
	return;
}

String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	if (kfgssq.equals("1") && sqxz1Value.length!=1)//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("错误！您选择了『授权单个分公司』，可实际授权了["+sqxz1Value.length+"]个");
		return;
	}
	else if (kfgssq.equals("2") && sqxz2Value.length<=1)
	{
		out.println("错误！您选择了『授权多个分公司』，可实际只授权了["+sqxz2Value.length+"]个");
		return;
	}


	if (kfgssq.equals("1"))//1：授权单个分公司
	{
		String yhssfgs=null;
		ls_sql="select ssfgs";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+whereygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhssfgs=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (!sqxz1Value[0].equals(yhssfgs))
		{
			out.println("错误！您选择了『授权单个分公司』，确没有选择该用户所属分公司："+yhssfgs);
			return;
		}
	}
	else if (kfgssq.equals("3"))//3：授权单个店面
	{
		if (sqxz3Value.length>1)
		{
			out.println("错误！您选择了『授权单个店面』，可实际授权了["+sqxz3Value.length+"]个");
			return;
		}

		String yhdwbh=null;
		String yhdwlx=null;
		String yhdwmc=null;
		ls_sql="select sq_yhxx.dwbh,sq_dwxx.dwlx,sq_dwxx.dwmc";
		ls_sql+=" from  sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ygbh='"+whereygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdwbh=rs.getString(1);
			yhdwlx=rs.getString(2);
			yhdwmc=rs.getString(3);
		}
		rs.close();
		ps.close();

		if (!sqxz3Value[0].equals(yhdwbh) && yhdwlx.equals("F2"))
		{
			out.println("错误！您选择了『授权单个店面』，确没有选择该用户所属部门："+yhdwmc);
			return;
		}
	}
	
	
	String oldyhdlm=null;
	String yhmc=null;
	ls_sql="select yhdlm,yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+whereygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldyhdlm=cf.fillNull(rs.getString(1));
		yhmc=cf.fillNull(rs.getString(2));
	}
	rs.close();
	ps.close();

	if (!oldyhdlm.equals(yhdlm))
	{
		ls_sql=" update sq_yhxx set yhdlm=''";
		ls_sql+=" where yhdlm='"+yhdlm+"' and sfzszg in('D','S','T')";//M: 实习生；Y：转正；N：试用期；D：待岗；S：辞职；T：辞退；C：特权
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
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
			out.println("错误！[用户登录名]已存在");
			return;
		}
		else{
			ls_sql="select count(*)";
			ls_sql+=" from  jxc_ppgysdzb";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
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
				out.println("错误！[用户登录名]已被供应商占用");
				return;
			}
		}
	}

	String bjjb="";
	if (bjjbbm!=null)
	{
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			String bjjbmc=null;
			ls_sql="select bjjbmc";
			ls_sql+=" from  bdm_bjjbbm";
			ls_sql+=" where bjjbbm='"+bjjbbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				bjjbmc=rs.getString(1);

				bjjb+="、"+bjjbmc;
			}
			rs.close();
			ps.close();
		}
		if (!bjjb.equals(""))
		{
			bjjb=bjjb.substring(1);
		}
	}


	conn.setAutoCommit(false);

	ls_sql="delete from sq_sjsbjjb ";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (bjjbbm!=null)
	{
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			if (bjjbbm[i].equals(""))
			{
				continue;
			}

			ls_sql="insert into sq_sjsbjjb(ygbh,bjjbbm) values("+whereygbh+",'"+bjjbbm[i]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update sq_yhxx set yhdlm=?,yhkl=?,yhjs=?,ckjgbz=?,zwbm=?,zdyhbz=?,kdlxtbz=?,bjjb=?,kkbbz=?,sjxzbz=?,sbsj=?,xbsj=?,ipxzbz=?,ipdz=?,wkxzbz=?,wkdz=?,khdhbz=?,kkglfx=?,lxdlsbcs=0,sccgdlsj=SYSDATE,mmsyzq=?,yxdlsbcs=?,bsxtsmmzq=?,sfyxzhmm=?,sfkdybj=?,dwbh=?,zdsjf=?,zgsjf=?,mrsjf=?,txfs=?,txjg=?";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhdlm);
	ps.setString(2,yhkl);
	ps.setString(3,yhjs);
	ps.setString(4,ckjgbz);
	ps.setString(5,zwbm);
	ps.setString(6,zdyhbz);
	ps.setString(7,kdlxtbz);
	ps.setString(8,bjjb);
	ps.setString(9,kkbbz);

	ps.setString(10,sjxzbz);
	ps.setString(11,sbsj);
	ps.setString(12,xbsj);
	ps.setString(13,ipxzbz);
	ps.setString(14,ipdz);
	ps.setString(15,wkxzbz);
	ps.setString(16,wkdz);
	ps.setString(17,khdhbz);
	ps.setString(18,kkglfx);
	ps.setInt(19,mmsyzq);
	ps.setInt(20,yxdlsbcs);
	ps.setInt(21,bsxtsmmzq);
	ps.setString(22,sfyxzhmm);
	ps.setString(23,sfkdybj);
	ps.setString(24,dwbh);
	ps.setDouble(25,zdsjf);
	ps.setDouble(26,zgsjf);
	ps.setDouble(27,mrsjf);
	ps.setString(28,txfs);
	ps.setDouble(29,txjg);
	
	ps.executeUpdate();
	ps.close();


	if (!oldyhdlm.equals(yhdlm))
	{
		//取消用户权限
		if (yhdlm.equals(""))
		{
			ls_sql="delete from sq_yhssz where yhdlm='"+oldyhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from sq_yhewqx where yhdlm='"+oldyhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//用户授权日志
			String ip=request.getRemoteHost();
			String lrrdlm=(String)session.getAttribute("yhdlm");
			String lrrxm=(String)session.getAttribute("yhmc");
			ls_sql="insert into sq_yhsqrz (xh,ip,lrrdlm,lrrxm,lrsj,yhdlm,yhmc,yhzbh,czlx,bz) ";
			ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_yhsqrz),?,?,?,SYSDATE,?,?,'all','2','用户信息维护:取消用户登陆名') ";//1：插入；2：删除；3：修改
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ip);
			ps.setString(2,lrrdlm);
			ps.setString(3,lrrxm);
			ps.setString(4,oldyhdlm);
			ps.setString(5,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			if (!oldyhdlm.equals(""))
			{
				ls_sql="update sq_yhssz set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update sq_yhewqx set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				//用户授权日志
				String ip=request.getRemoteHost();
				String lrrdlm=(String)session.getAttribute("yhdlm");
				String lrrxm=(String)session.getAttribute("yhmc");
				ls_sql="insert into sq_yhsqrz (xh,ip,lrrdlm,lrrxm,lrsj,yhdlm,yhmc,yhzbh,czlx,bz) ";
				ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_yhsqrz),'"+ip+"','"+lrrdlm+"','"+lrrxm+"',SYSDATE,'"+oldyhdlm+"','"+yhmc+"','all','3','用户信息维护:修改用户登陆名，原："+oldyhdlm+"；新："+yhdlm+"') ";//1：插入；2：删除；3：修改
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

	ls_sql="delete from sq_sqfgs";
	ls_sql+=" where ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from sq_sqbm";
	ls_sql+=" where ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_yhxx set kfgssq='"+kfgssq+"'";
	ls_sql+=" where ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	if (kfgssq.equals("1") )//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		if (sqxz1Value==null)
		{
			conn.rollback();
			out.println("错误！授权分公司为空");
			return;
		}


		for (int i=0;i<sqxz1Value.length ;i++ )
		{
			ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sqxz1Value[i]);
			ps.setString(2,whereygbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	else if (  kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		if (sqxz2Value==null)
		{
			conn.rollback();
			out.println("错误！授权分公司为空");
			return;
		}


		for (int i=0;i<sqxz2Value.length ;i++ )
		{
			ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sqxz2Value[i]);
			ps.setString(2,whereygbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	else if (kfgssq.equals("3") )
	{
		if (sqxz3Value==null)
		{
			conn.rollback();
			out.println("错误！授权部门为空");
			return;
		}

		for (int i=0;i<sqxz3Value.length ;i++ )
		{
			ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
			ls_sql+=" select dwbh,?,ssfgs";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwbh='"+sqxz3Value[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,whereygbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	else if ( kfgssq.equals("4") )
	{
		if (sqxz4Value==null)
		{
			conn.rollback();
			out.println("错误！授权部门为空");
			return;
		}

		for (int i=0;i<sqxz4Value.length ;i++ )
		{
			ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
			ls_sql+=" select dwbh,?,ssfgs";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwbh='"+sqxz4Value[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,whereygbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	else if ( kfgssq.equals("5"))
	{
		if (sqxz5Value==null)
		{
			conn.rollback();
			out.println("错误！授权部门为空");
			return;
		}

		for (int i=0;i<sqxz5Value.length ;i++ )
		{
			ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
			ls_sql+=" select dwbh,?,ssfgs";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwbh='"+sqxz5Value[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,whereygbh);
			ps.executeUpdate();
			ps.close();
		}

	}

	//设计师其它收费项目授权
	ls_sql="delete from sq_sfxmsq ";
	ls_sql+=" where ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (sfxmbm!=null)
	{
		for (int i=0;i<sfxmbm.length ;i++ )
		{
			if (sfxmbm[i].equals(""))
			{
				continue;
			}
			ls_sql="insert into sq_sfxmsq (ygbh,sfxmbm ) ";
			ls_sql+=" values('"+whereygbh+"','"+sfxmbm[i]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	int fgssl=0;
	int dmsl=0;
	ls_sql="select count(distinct ssfgs),count(dwbh)";
	ls_sql+=" from  sq_sqbm";
	ls_sql+=" where ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgssl=rs.getInt(1);
		dmsl=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("4") && fgssl>1)//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		conn.rollback();
		out.println("错误！您选择了『授权某一分公司多个店面』，可实际授权了["+fgssl+"]个分公司的店面");
		return;
	}
	else if (kfgssq.equals("4") && dmsl==1)
	{
		conn.rollback();
		out.println("错误！您选择了『授权某一分公司多个店面』，可实际只授权了1个店面");
		return;
	}
	else if (kfgssq.equals("5") && fgssl==1)
	{
		conn.rollback();
		out.println("错误！您选择了『授权多个分公司多个店面』，可实际只授权了1个分公司的店面");
		return;
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
	out.print("<BR>ls_sql=" + ls_sql);
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