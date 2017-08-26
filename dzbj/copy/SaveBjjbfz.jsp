<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");


String olddqbm=request.getParameter("olddqbm");
String oldbjbbh=cf.GB2Uni(request.getParameter("oldbjbbh"));
String oldbjjbbm=request.getParameter("oldbjjbbm");
String newdqbm=request.getParameter("newdqbm");
String newbjbbh=cf.GB2Uni(request.getParameter("newbjbbh"));
String newbjjbbm=request.getParameter("newbjjbbm");
String gcbj=request.getParameter("gcbj");
String tcjg=request.getParameter("tcjg");
String tcsj=request.getParameter("tcsj");
String tcbzgc=request.getParameter("tcbzgc");
String tcbzzc=request.getParameter("tcbzzc");
String tczcbj=request.getParameter("tczcbj");


String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	if (!gcbj.equals("null"))//工程报价
	{
		sql ="insert into bj_jzbjb (bjbbh         ,dqbm         ,bjjbbm         ,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr       ,lrsj   ,bz,gcjcbjxs,sgcbbjxs,khbjxs) ";
		sql+=" select               '"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,'"+yhmc+"',SYSDATE,bz,gcjcbjxs,sgcbbjxs,khbjxs";
		sql+=" from bj_jzbjb ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		sql ="insert into bj_glxmb (bjbbh         ,dqbm         ,bjjbbm         ,xmbh,glxmbh)";
		sql+=" select               '"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',xmbh,glxmbh ";
		sql+=" from bj_glxmb ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		int newglbxh=0;
		sql="select NVL(max(TO_NUMBER(glbxh)),0)";
		sql+=" from  bj_jzglfxb";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			newglbxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		sql ="insert into bj_jzglfxb (glbxh              ,bjbbh         ,dqbm         ,bjjbbm         ,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz )";
		sql+=" select                 "+newglbxh+"+rownum,'"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,'"+yhmc+"',SYSDATE,bz ";
		sql+=" from bj_jzglfxb ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcjg.equals("null"))//套餐－价格表
	{
		sql ="insert into bj_tcjgb (bjbbh         ,dqbm         ,bjjbbm         ,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj )";
		sql+=" select               '"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj";
		sql+=" from bj_tcjgb ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcsj.equals("null"))//套餐－升级差价表
	{
		sql ="insert into bj_tcsjcjb (bjbbh         ,dqbm         ,tcsjflbm,bjjbbm         ,bjjbbm1,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj )";
		sql+=" select                 '"+newbjbbh+"','"+newdqbm+"',tcsjflbm,'"+newbjjbbm+"',bjjbbm1,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj";
		sql+=" from bj_tcsjcjb ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcbzgc.equals("null"))//套餐－标准工程项目
	{
		sql ="insert into bj_tcbzgcxm (bjbbh         ,dqbm         ,bjjbbm         ,hxbm,xmbh,bzsl,sfxzsl,ccbfjj,lrr,lrsj ) ";
		sql+=" select                  '"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',hxbm,xmbh,bzsl,sfxzsl,ccbfjj,'"+yhmc+"',SYSDATE";
		sql+=" from bj_tcbzgcxm ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcbzzc.equals("null"))//套餐－标准主材项目
	{
	
		sql ="insert into bj_tcbzzcxm (bjbbh         ,dqbm         ,bjjbbm         ,hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,lrr,lrsj) ";
		sql+=" select                  '"+newbjbbh+"','"+newdqbm+"','"+newbjjbbm+"',hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,'"+yhmc+"',SYSDATE";
		sql+=" from bj_tcbzzcxm ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tczcbj.equals("null"))//套餐－主材报价
	{
		int count=0;
		sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
		sql+=" from  bj_tczcbj";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		String getcpbm=null;

		sql="select cpbm";
		sql+=" from bj_tczcbj ";
		sql+=" where dqbm='"+olddqbm+"' and bjbbh='"+oldbjbbh+"' and bjjbbm='"+oldbjjbbm+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getcpbm=cf.fillNull(rs.getString("cpbm"));

			count++;
			String cpbm=null;
			cpbm="TC"+cf.addZero(count,11);


			sql ="insert into bj_tczcbj (cpbm      ,dqbm         ,bjjbbm         ,tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj,tccldj,sfkgdj,jsj,sh,sfcscp,sku,xuhao,lrr,lrsj,bz,cllx)";
			sql+=" select                '"+cpbm+"','"+newdqbm+"','"+newbjjbbm+"',tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj,tccldj,sfkgdj,jsj,sh,sfcscp,sku,xuhao,'"+yhmc+"',SYSDATE,bz,cllx";
			sql+=" from bj_tczcbj ";
			sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();
	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("复制成功");
//		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
