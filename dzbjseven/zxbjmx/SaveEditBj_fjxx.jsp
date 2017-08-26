<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");
String[] oldjgwzbm=request.getParameterValues("oldjgwzbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] fjmj=request.getParameterValues("fjmj");
String[] fjg=request.getParameterValues("fjg");
String[] zdyxmmj=request.getParameterValues("zdyxmmj");
String[] zdybzmj=request.getParameterValues("zdybzmj");
String[] xuhao=request.getParameterValues("xuhao");
String[] bz=request.getParameterValues("bz");
String[] fjzcxq=request.getParameterValues("fjzcxq");
String[] fjlx=request.getParameterValues("fjlx");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String bjjb="";
	String ssfgs="";
	ls_sql="SELECT zxzt,bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjjb=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	String dqbm="";
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
	
	
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}



	conn.setAutoCommit(false);

	//清空序号
	ls_sql="update bj_fjxx set xuhao=-1 where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<oldjgwzbm.length ; i++)
	{
		try{
			Double.parseDouble(fjmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间面积["+cf.GB2Uni(fjmj[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(fjg[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间高["+cf.GB2Uni(fjg[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(zdyxmmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！自定义木作面积["+cf.GB2Uni(zdyxmmj[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(zdybzmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！自定义壁纸面积["+cf.GB2Uni(zdybzmj[i])+"]不是数字");
			return;
		}

		try{
			Integer.parseInt(xuhao[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间顺序号["+cf.GB2Uni(xuhao[i])+"]不是数字");
			return;
		}

		
		if (jgwzbm[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间名称["+cf.GB2Uni(oldjgwzbm[i])+"]被改为空值");
			return;
		}
		if (xuhao[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间顺序号不能为空值");
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm!='"+cf.GB2Uni(oldjgwzbm[i])+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
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
			conn.rollback();
			out.println("房间顺序号["+xuhao[i]+"]错误！房间名称["+cf.GB2Uni(jgwzbm[i])+"]已存在");
			return;
		}

		ls_sql="update bj_fjxx set fjlx='"+fjlx[i]+"',jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"',fjzcxq='"+cf.GB2Uni(fjzcxq[i])+"',bz='"+cf.GB2Uni(bz[i])+"',fjmj="+fjmj[i]+",fjg="+fjg[i]+",zdyxmmj="+zdyxmmj[i]+",zdybzmj="+zdybzmj[i]+",xuhao="+xuhao[i]+" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_gclmx set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM tc_csrjkhczjmj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);

			}
			rs.close();
			ps.close();

			if (fjlx[i].equals("1"))//1：厨房；2：卫生间
			{
				//客户橱柜减免价（tc_csrjkhcgjmj）
				//客户磁砖减免价（tc_csrjkhczjmj）
				//客户铝扣板减免价（tc_csrjkhlkbjmj）

				if (count>0)//原房间在套餐中存在
				{
					ls_sql="update tc_csrjkhcgjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhlkbjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhczjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{//原房间在套餐中不存在
					//增加:客户橱柜价格表（tc_csrjkhcgjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhcgjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzsl,zdsl,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                       ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzsl,bzsl,0   ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjcgjmj";
					ls_sql+=" where tc_csrjcgjmj.dqbm='"+dqbm+"' and tc_csrjcgjmj.bjjbbm='"+bjjb+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//增加:客户橱柜价格表（tc_csrjkhcgjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

					//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                       ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjczjmj";
					ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
					ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//大地砖/大地砖踢脚线
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

					//客户铝扣板价格表（tc_khlkbjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                        ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjlkbjmj";
					ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户铝扣板价格表（tc_khlkbjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
				}
			}
			else if (fjlx[i].equals("2"))//1：厨房；2：卫生间
			{
				//客户洁具减免价（tc_csrjkhjjjmj）
				//客户磁砖减免价（tc_csrjkhczjmj）
				//客户铝扣板减免价（tc_csrjkhlkbjmj）

				if (count>0)//原房间在套餐中存在
				{
					ls_sql="update tc_csrjkhlkbjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhczjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhjjjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{//原房间在套餐中不存在
					//客户洁具价格表（tc_khjjjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhjjjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                       ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjjjjmj";
					ls_sql+=" where tc_csrjjjjmj.dqbm='"+dqbm+"' and tc_csrjjjjmj.bjjbbm='"+bjjb+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户洁具价格表（tc_khjjjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


					//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                       ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjczjmj";
					ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
					ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//大地砖/大地砖踢脚线
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

					//客户铝扣板价格表（tc_khlkbjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                        ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjlkbjmj";
					ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户铝扣板价格表（tc_khlkbjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
				}

			}
			else if (fjlx[i].equals("4"))//1：厨房；2：卫生间；4+阳台
			{
				//客户洁具减免价（tc_csrjkhjjjmj）
				//客户磁砖减免价（tc_csrjkhczjmj）
				//客户铝扣板减免价（tc_csrjkhlkbjmj）

				if (count>0)//原房间在套餐中存在
				{
					ls_sql="update tc_csrjkhlkbjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhczjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update tc_csrjkhjjjmj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{//原房间在套餐中不存在

					//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
					ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm                    ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
					ls_sql+=" select                       ?,tccplbbm,'"+cf.GB2Uni(jgwzbm[i])+"',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
					ls_sql+=" from tc_csrjczjmj";
					ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
					ls_sql+=" and tc_csrjczjmj.tccplbbm in(22)";//22：地砖
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.executeUpdate();
					ps.close();
					//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

				}

			}


			ls_sql="update tc_csrjkhzcqd set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}



	}

	//调整序号
	int pxxh=0;
	String lsjgwzbm=null;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsjgwzbm=rs.getString(1);

		pxxh++;

		ls_sql="update bj_fjxx set xuhao="+pxxh+" where khbh='"+khbh+"' and jgwzbm='"+lsjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


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
	out.print("存盘失败,发生意外: " + e);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>