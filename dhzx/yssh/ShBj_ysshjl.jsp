<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
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
String ysshyj=null;
String jygq=null;
String jykgsj=null;
String jyjgsj=null;
String shdf=null;
String jsy=null;

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
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slsm=cf.fillNull(rs.getString("slsm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		jygq=cf.fillNull(rs.getString("jygq"));
		jykgsj=cf.fillNull(rs.getDate("jykgsj"));
		jyjgsj=cf.fillNull(rs.getDate("jyjgsj"));
		shdf=cf.fillNull(rs.getString("shdf"));
		jsy=cf.fillNull(rs.getString("jsy"));
	}
	rs.close();
	ps.close();

	String cxhdbm="";
	ls_sql="select cxhdbm,bjbbh,khjl,ssfgs,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" ,sfzdzbj,jhzbjsj,bjjb,sczbjsj,zjzbjsj,dzbjze";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
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

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();

	double htjz=dzbjje.getHtjz(conn,khbh,"csrj");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
	if (htjz<0)
	{
		conn.rollback();
		out.println("错误！合同净值为负值："+htjz);
		return;
	}

	double  sgcbj=dzbjje.getSgcbj(conn,khbh,"csrj");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）

	
	double  mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价

	if (mle<0)
	{
		out.println("错误！毛利额为负值："+mle);
		return;
	}

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
		double mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值
		if (mll<sptzhmll)
		{
			if (yhjs.equals("A0"))
			{
				out.println("错误！目前毛利小于调折扣时的毛利，请重新调折扣，客户目前毛利："+mll+"，调折扣时的毛利："+sptzhmll);
			}
			else{
				out.println("错误！目前毛利小于调折扣时的毛利，请重新调折扣");
			}
			return;
		}
	}
	else{
		String getkzdzfs="";
		double getzdmll=0;
		double getzdzkl=0;
		ls_sql="SELECT kzdzfs,zkl,zdmll";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkzdzfs=cf.fillNull(rs.getString("kzdzfs"));
			getzdzkl=rs.getDouble("zkl");//最低折扣
			getzdmll=rs.getDouble("zdmll");//签单最低毛利率
		}
		rs.close();
		ps.close();

		double mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值

		if (getkzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
		{
			if (mll<getzdmll || mll>100)
			{
				if (yhjs.equals("A0"))
				{
					out.println("错误！目前毛利小于您的权限，客户目前毛利："+mll+"，您的权限："+sptzhmll);
				}
				else{
					out.println("错误！目前毛利小于您的权限");
				}
				return;
			}
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
              <td align="right">审核意见</td>
              <td colspan="3"><textarea name="ysshyj" cols="71" rows="3"><%=ysshyj%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">建议开工时间</td>
              <td><input type="text" name="jykgsj" size="20" maxlength="10"  value="<%=jykgsj%>" onDblClick="JSCalendar(this)">              </td>
              <td align="right">建议竣工时间</td>
              <td><input type="text" name="jyjgsj" size="20" maxlength="10"  value="<%=jyjgsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>建议工期</td>
              <td><input type="text" name="jygq" size="20" maxlength="8"  value="<%=jygq%>" ></td>
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
              <input type="button"  value="审核完成" onClick="f_do(editform)">
              <input type="button" value="录入不合格项目" onClick="f_lr(editform)">
              <input type="button" onClick="window.open('/dhzx/sjszxseven/ylbj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="查看电子报价">
              <input name="button" type="button" onClick="window.open('/dhzx/dhzx/ViewFjxx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="房间信息">
              <input name="button2" type="button" onClick="window.open('/dhzx/dhzx/ViewBjxm.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="审核标准项目">
			   <input name="button2" type="button" onClick="window.open('/dhzx/dhzx/ViewBjzdyxm.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="审核自定义项目">
			  <input name="button2" type="button" onClick="window.open('/dhzx/yssh/Crm_zsxx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="赠送信息"></td>
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

	if (FormName.ysshbz[1].checked)
	{
		if(	javaTrim(FormName.ysshyj)=="") {
			alert("审核未通过，请输入[审核意见]！");
			FormName.ysshyj.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.jygq)=="") {
			alert("请输入[建议工期]！");
			FormName.jygq.focus();
			return false;
		}
		if(!(isNumber(FormName.jygq, "建议工期"))) {
			return false;
		}
		if(!(isDatetime(FormName.jykgsj, "建议开工时间"))) {
			return false;
		}
		if(!(isDatetime(FormName.jyjgsj, "建议竣工时间"))) {
			return false;
		}
	}


	FormName.target="";
	FormName.action="SaveShBj_ysshjl.jsp";
	FormName.submit();
	return true;
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
//-->
</SCRIPT>
 

