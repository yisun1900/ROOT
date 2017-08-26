<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String khbh=null;
String dqbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String yzxxbz=null;
String jzbz=null;

String sjs=null;
String khjl=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;

String jhjfsj=null;
String hdr=null;
String sjsbh=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String louhao=null;
String ssfgs=null;
String zxkhlrjc=null;
String qdkhbljc=null;
String dzbjjc=null;

String sfzdzbj=null;
String jhzbjsj=null;
String bjjb=null;
String sczbjsj=null;
String zjzbjsj=null;
String dzbjze=null;
String bjbbh=null;

String sqsm=null;
String lrr=null;
String lrsj=null;
String ysshbz=null;
String slr=null;
String slsj=null;
String slsm=null;
String ysshr=null;
String ysshsj=null;
String jygq=null;
String jykgsj=null;
String jyjgsj=null;
String shdf=null;
String jsy=null;
String bjdysq=null;
String cqhtbz=null;

String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sqsm,lrr,lrsj,ysshbz,slr,slsj,slsm,ysshr,ysshsj,ysshyj,jygq,jykgsj,jyjgsj,shdf,jsy ";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  (ysshjl='"+ysshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getString("slsj"));
		slsm=cf.fillNull(rs.getString("slsm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		jygq=cf.fillNull(rs.getString("jygq"));
		jykgsj=cf.fillNull(rs.getDate("jykgsj"));
		jyjgsj=cf.fillNull(rs.getDate("jyjgsj"));
		shdf=cf.fillNull(rs.getString("shdf"));
		jsy=cf.fillNull(rs.getString("jsy"));
	}
	rs.close();
	ps.close();

	String cxhdbm="";
	ls_sql="select cqhtbz,cxhdbm,bjbbh,khjl,ssfgs,bjdysq,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" ,sfzdzbj,jhzbjsj,bjjb,sczbjsj,zjzbjsj,dzbjze";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cqhtbz=cf.fillNull(rs.getString("cqhtbz"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));

		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();

	if (!cxhdbm.equals(""))
	{
		int duxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hdzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			duxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int dxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hddxzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if ((duxzs+dxzs)>0)
		{
			double xzsjsl=0;
			ls_sql="SELECT sum(sjsl) ";
			ls_sql+=" FROM crm_khzsxx  ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xzsjsl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (xzsjsl==0)
			{
				out.println("<B><font color='#FF0000' size='5'>提醒！未选择赠送项目</font></B>");
			}
		}
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select zxkhlrjc,qdkhbljc,dzbjjc,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	if (!bjbbh.equals(""))
	{
		String sfzybb="";
		ls_sql="select sfzybb";
		ls_sql+=" from  bj_dzbjbb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfzybb=rs.getString (1);
		}
		else{
			out.println("错误！版本不存在:"+bjbbh);
			return;
		}
		rs.close();
		ps.close();

		if (sfzybb.equals("4"))//1：未启用；2：当前版；3：可用版；4：已停用
		{
			String getbjbbh="";
			ls_sql="select bjbbh";
			ls_sql+=" from  crm_bjbbsqjl";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getbjbbh=rs.getString (1);
			}
			rs.close();
			ps.close();


			if (!getbjbbh.equals(bjbbh))
			{
				out.println("错误！版本已停用，若想继续使用请申请授权");
				return;
			}
		}
	}

	
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
	if (htjz<0)
	{
		out.println("错误！合同净值为负值："+htjz);
		return;
	}

	double sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	double mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	if (mle<0)
	{
		out.println("错误！毛利额为负值："+mle);
		return;
	}
	double mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值

	//判断目前毛利是否小于审批毛利＋＋＋＋＋＋＋＋＋＋＋开始
	double sptzhmll=-1;
	ls_sql="SELECT tzhmll";
	ls_sql+=" FROM crm_tzzkjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt in('2','4')";//1：未改折扣；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	ls_sql+=" order by lrsj desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sptzhmll=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (sptzhmll!=-1)
	{
		if (mll<sptzhmll)
		{
			out.println("错误！目前毛利小于审批毛利");
			return;
		}
	}
	//判断目前毛利是否小于审批毛利＝＝＝＝＝＝＝＝＝＝＝结束

	
	//检查
	String getxmbh=null;
	String getjgwzbm=null;
	double getsl=0;
	ls_sql="SELECT xmbh,jgwzbm,sl";
	ls_sql+=" FROM crm_yjdmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxmbh=rs.getString("xmbh");
		getjgwzbm=rs.getString("jgwzbm");
		getsl=rs.getDouble("sl");

		double bjsl=0;
		ls_sql="SELECT sl";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+getxmbh+"' and jgwzbm='"+getjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (bjsl!=getsl)
		{
			out.println("<BR>错误！项目编号【"+getxmbh+"】在【"+getjgwzbm+"】工程量与电子报价不一致，电子报价数量："+bjsl+"，预交底单数量："+getsl);
			return;
		}
	}
	rs.close();
	ps.close();
	
	if (!bjdysq.equals("1"))
	{
		bjdysq="disabled";
	}
	else{
		bjdysq="";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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

<html>
<head>
<title>预算审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
    <div align="center"><strong>预算审核（预算审核记录：<%=ysshjl%>）</strong></div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">客户姓名              </font></td>
              <td width="31%"><%=khxm%></td>
              <td width="19%" align="right"><font color="#0000FF">性别              </font></td>
              <td width="31%"> <%
	cf.radioToken(out,"M+男&W+女",xb,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">房屋地址</font> </td>
              <td><%=fwdz%></td>
              <td align="right"><font color="#0000FF">家装设计师</font></td>
              <td><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">业务员</font></td>
              <td><%=ywy%></td>
              <td align="right"><font color="#0000FF">客户经理</font></td>
              <td><%=khjl%></td>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">年龄区间</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF">职业</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%>            </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">月收入</font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF">房价（元/m）</font></td>
              <td width="31%"><%=fj%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              户型              </font></td>
              <td width="31%"> 
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF"> 
              套内建筑面积              </font></td>
              <td width="31%"><%=fwmj%></td>
            </tr><tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              回单标志              </font></td>
              <td width="31%"> 
                 <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%>              </td>
              <td width="19%" align="right"><font color="#0000FF"> 
              回单人              </font></td>
              <td width="31%"><%=hdr%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#0000FF">回单装修地址</font></td>
              <td colspan="3"><%=cgdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">是否需回访              </font></td>
              <td width="31%"> <%
	cf.radioToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%> </td>
              <td width="19%" align="right"> 
                <font color="#0000FF">回访日期              </font></td>
              <td width="31%"><%=hfrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">家装标志</font></td>
              <td width="31%"><%
	cf.selectToken(out,"1+家装&2+公装",jzbz,true);
%></td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF"> 
              备注              </font></td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF"> 
              <td colspan="4" height="24">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0000FF">是否做电子报价</font></td>
              <td><%
	cf.selectToken(out,"N+未做&Y+已做",sfzdzbj,true);
%></td>
              <td align="right"><font color="#0000FF">计划做电子报价时间</font></td>
              <td><%=jhzbjsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">报价级别</font></td>
              <td><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%>              </td>
              <td align="right"><font color="#0000FF">电子报价总额</font></td>
              <td><%=dzbjze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0000FF">首次做电子报价时间</font></td>
              <td><%=sczbjsj%></td>
              <td align="right"><font color="#0000FF">最近做电子报价时间</font></td>
              <td><%=zjzbjsj%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000FF">报价版本号</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bjbbh%></td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF">
              <td colspan="4" height="24">&nbsp;</td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC">申请说明</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=sqsm%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC">录入人</font></td>
              <td bgcolor="#FFFFFF"><%=lrr%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">录入时间</font></td>
              <td bgcolor="#FFFFFF"><%=lrsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">受理人</font></td>
              <td><%=slr%></td><td align="right"><font color="#0000CC">受理时间</font></td>
                <td><%=slsj%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">受理说明</font></td>
              <td colspan="3"><%=slsm%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>审核结论</td>
              <td><%
	cf.radioToken(out, "ysshbz","Y+审核通过&M+审核未通过",ysshbz);
%>              </td>
              <td align="right"><font color="#0000CC">价审员</font></td>
              <td><%=jsy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>草签合同标志</td>
              <td><%
	cf.radioToken(out, "cqhtbz","Y+草签合同&N+否",cqhtbz);
%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">审核人</font></td>
              <td><input type="text" name="ysshr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">审核时间</font></td>
              <td><input type="text" name="ysshsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
				<input type="hidden" name="ysshjl"  value="<%=ysshjl%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
				<input name="button4" type="button" onClick="f_do(editform)"  value="审核完成">
				<input type="button" value="录入不合格项目" onClick="f_lr(editform)">
			  <input type="button" onClick="window.open('/dhzx/yssh/InsertBj_ysshjl1.jsp?ysshjl=<%=ysshjl%>','')" value="审核意见">
             <BR> <BR>
			  <input name="button3" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')" value="修改活动赠送" >
			 <input name="button22" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="调整代金券">   
			 <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="查看电子报价">
			 <!--<input type="button" onClick="f_excel(editform)"  value="导出报价" <%=bjdysq%>>-->
              <input name="button" type="button" onClick="window.open('/dhzx/dhzx/ViewFjxx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="房间信息">
              <input name="button2" type="button" onClick="window.open('/dhzx/dhzx/ViewBjxm.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="报价项目"><input type="button" onClick="window.open('/zlkxt/EditLoadWj.jsp?khbh=<%=khbh%>')" value="查看图纸" ></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysshjl)=="") {
		alert("请输入[预算审核记录]！");
		FormName.ysshjl.focus();
		return false;
	}
	if(	!radioChecked(FormName.ysshbz)) {
		alert("请选择[审核结论]！");
		FormName.ysshbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cqhtbz)) {
		alert("请选择[草签合同标志]！");
		FormName.cqhtbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ysshr)=="") {
		alert("请输入[审核人]！");
		FormName.ysshr.focus();
		return false;
	}
	if(	javaTrim(FormName.ysshsj)=="") {
		alert("请输入[审核时间]！");
		FormName.ysshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ysshsj, "审核时间"))) {
		return false;
	}


	<%
	double shdf2=0;
	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  bj_ysshmx";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shdf2=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	%>

	if(confirm("该报价得分为<%=100-shdf2%>分,你确定要保存吗？"))
	{
		FormName.target="";
		FormName.action="SaveXgShBj_ysshjl.jsp";
		FormName.submit();
		return true;
	}

}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysshjl)=="") {
		alert("请输入[预算审核记录]！");
		FormName.ysshjl.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertBj_ysshmx.jsp";
	FormName.submit();
	return true;
}
function f_excel(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
