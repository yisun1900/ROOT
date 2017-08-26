<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yhdlm=(String)session.getAttribute("yhdlm");
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String wheresql="";
	String[] rddqbms=request.getParameterValues("rddqbm");
	if (rddqbms!=null)
	{
		wheresql+=cf.arrayToSQL(rddqbms,"crm_khxx.rddqbm");
	}
	String[] hxwzbms=request.getParameterValues("hxwzbm");
	if (hxwzbms!=null)
	{
		wheresql+=cf.arrayToSQL(hxwzbms,"crm_khxx.hxwzbm");
	}
	String[] cqbms=request.getParameterValues("cqbm");
	if (cqbms!=null)
	{
		wheresql+=cf.arrayToSQL(cqbms,"crm_khxx.cqbm");
	}
	String[] ysrbm=request.getParameterValues("ysrbm");
	if (ysrbm!=null)
	{
		wheresql+=cf.arrayToSQL(ysrbm,"crm_khxx.ysrbm");
	}
	String[] nlqjbm=request.getParameterValues("nlqjbm");
	if (nlqjbm!=null)
	{
		wheresql+=cf.arrayToSQL(nlqjbm,"crm_khxx.nlqjbm");
	}
	String[] zybm=request.getParameterValues("zybm");
	if (zybm!=null)
	{
		wheresql+=cf.arrayToSQL(zybm,"crm_khxx.zybm");
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	PreparedStatement ps3=null;
	ResultSet rs3=null;
String ls_sql=null;


String rddqbm=null;
String rddq=null;
String deflbm=null;
String deflmc=null;
int dedy=0;
int dexy=0;

double bfb=0;

int allqys=0;
int allqye=0;
int allfwmj=0;
int allpjqye=0;
int allpmjj=0;
int alldmyj=0;

int qys=0;
int qye=0;
int fwmj=0;
int pjqye=0;
int pmjj=0;

int xjqys=0;
int xjqye=0;
int xjfwmj=0;
int xjpjqye=0;
int xjpmjj=0;

try {
	conn=cf.getConnection();
	
%>
	<CENTER >
	  <B>大小单所占百分比<BR>
	  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="10%">单额分类</td>
	  <td  width="10%">签约数</td>
	  <td  width="14%">店面签约业绩</td>
	  <td  width="10%">平均单额</td>
	  <td  width="10%">平米均价</td>
	  <td  width="35%">签约数百分比 </td>
	</tr>

<%
	//获取总数
	ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=wheresql;
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getInt(2);
		allfwmj=rs.getInt(3);

		if (allqys!=0)
		{
			allpjqye=allqye/allqys;
		}
		else{
			allpjqye=0;
		}
		if (fwmj!=0)
		{
			allpmjj=allqye/fwmj;
		}
		else{
			allpmjj=0;
		}
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		return;
	}
		
	ls_sql="SELECT deflbm,deflmc,dedy,dexy";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		deflbm=rs.getString("deflbm");
		deflmc=rs.getString("deflmc");
		dedy=rs.getInt("dedy");
		dexy=rs.getInt("dexy");
		//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				alldmyj+=dmyj;
			}
			
			rs2.close();
			ps2.close();
		//--------------------------
		ls_sql="SELECT count(*),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			qys=rs2.getInt(1);
			fwmj=rs2.getInt(2);

			if (qys!=0)
			{
				pjqye=dmyj/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=dmyj/fwmj;
			}
			else{
				pmjj=0;
			}
		}
		rs2.close();
		ps2.close();

		%>
		<tr align="center">
			<td ><%=deflmc%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=dmyj%></td>
			<td  align="right"><%=pjqye%></td>
			<td  align="right"><%=pmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(250*qys/allqys)%>" height="14"><%=(qys*100/allqys)%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr align="center">
		<td >合计</td>
		<td  align="right"><%=allqys%></td>
		<td  align="right"><%=alldmyj%></td>
		<td  align="right"><%=alldmyj/allqys%></td>
		<td  align="right"><%=alldmyj/allfwmj%></td>
		<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
	</tr>
</table>

<CENTER >
  <B>热点地区所占百分比<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">热点地区</td>
  <td  width="10%">签约数</td>
  <td  width="14%">店面签约业绩</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>

<%
	//获取总数
	if (allqys==0)
	{
		return;
	}

	ls_sql="SELECT rddq,count(*),sum(qye),sum(fwmj)";
	ls_sql+=" FROM crm_khxx,dm_rddqbm";
	ls_sql+=" where crm_khxx.rddqbm=dm_rddqbm.rddqbm";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by rddq";
	ls_sql+=" order by count(*) desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		rddq=rs.getString(1);
		qys=rs.getInt(2);
		qye=rs.getInt(3);
		fwmj=rs.getInt(4);
		//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx,dm_rddqbm";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
			ls_sql+=" and dm_rddqbm.rddq='"+rddq+"'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//System.out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				//alldmyj+=dmyj;
			}
			
			rs2.close();
			ps2.close();
			//---------------------
		if (qys!=0)
		{
			pjqye=dmyj/qys;
		}
		else{
			pjqye=0;
		}
		if (fwmj!=0)
		{
			pmjj=dmyj/fwmj;
		}
		else{
			pmjj=0;
		}

		if (qys==0)
		{
			continue;
		}

		bfb=qys*100.0/allqys;

		%>
		<tr align="center">
			<td ><%=rddq%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=dmyj%></td>
			<td  align="right"><%=pjqye%></td>
			<td  align="right"><%=pmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr align="center">
		<td >合计</td>
		<td  align="right"><%=allqys%></td>
		<td  align="right"><%=alldmyj%></td>
		<td  align="right"><%=alldmyj/allqys%></td>
		<td  align="right"><%=alldmyj/allfwmj%></td>
		<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
	</tr>
</table>

<P>
<CENTER >
	<B>热点地区大小单统计<BR>
	(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="15%">热点地区</td>
  <td  width="10%">签约数</td>
  <td  width="14%">店面签约业绩</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
	//热点地区大小单统计
	ls_sql="SELECT deflbm,deflmc,dedy,dexy";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		deflbm=rs3.getString("deflbm");
		deflmc=rs3.getString("deflmc");
		dedy=rs3.getInt("dedy");
		dexy=rs3.getInt("dexy");
		
		
		//分类小计
		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjqys=rs.getInt(1);
			xjqye=rs.getInt(2);
			xjfwmj=rs.getInt(3);

			//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//System.out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				//alldmyj+=dmyj;
			}
			
			rs2.close();
			ps2.close();
			//---------------------
			xjqye=dmyj;
			if (xjqys!=0)
			{
				xjpjqye=dmyj/xjqys;
			}
			else{
				xjpjqye=0;
			}
			if (xjfwmj!=0)
			{
				xjpmjj=dmyj/xjfwmj;
			}
			else{
				xjpmjj=0;
			}
		}
		rs.close();
		ps.close();
		

		//分类明细
		ls_sql="SELECT rddq,count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx,dm_rddqbm";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by dm_rddqbm.rddqbm,rddq";
		ls_sql+=" order by count(*) desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			rddq=rs.getString(1);
			qys=rs.getInt(2);
			qye=rs.getInt(3);
			fwmj=rs.getInt(4);

			//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx,dm_rddqbm";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
			ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
			ls_sql+=" and dm_rddqbm.rddq='"+rddq+"'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//System.out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				//alldmyj+=dmyj;
			}
			
			rs2.close();
			ps2.close();
			//---------------------
			
			if (qys!=0)
			{
				pjqye=dmyj/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=dmyj/fwmj;
			}
			else{
				pmjj=0;
			}

			bfb=qys*100.0/xjqys;

			%>
			<tr align="center">
				<td ><%=rddq%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=dmyj%></td>
				<td  align="right"><%=pjqye%></td>
				<td  align="right"><%=pmjj%></td>
				<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();


		%>
		<tr align="center">
			<td ><%=deflmc%>小计</td>
			<td  align="right"><%=xjqys%></td>
			<td  align="right"><%=xjqye%></td>
			<td  align="right"><%=xjpjqye%></td>
			<td  align="right"><%=xjpmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
		</tr>
		<tr align="center" height="30">
			<td colspan="6">&nbsp;</td>
		</tr>
		<%
	}
	rs3.close();
	ps3.close();
%>
</table>

<P>
<CENTER >
	<B>热点地区大小单统计<BR>
	(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="15%">大小单</td>
  <td  width="10%">签约数</td>
  <td  width="14%">店面签约业绩</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
	//热点地区大小单统计
	ls_sql="SELECT rddqbm,rddq";
	ls_sql+=" FROM dm_rddqbm";
	ls_sql+=" order by rddqbm ";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		rddqbm=rs3.getString("rddqbm");
		rddq=rs3.getString("rddq");

		//分类小计
		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.rddqbm='"+rddqbm+"'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjqys=rs.getInt(1);
			xjqye=rs.getInt(2);
			xjfwmj=rs.getInt(3);
			
			//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx,dm_rddqbm";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
			ls_sql+=" and dm_rddqbm.rddq='"+rddq+"'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//System.out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				//alldmyj+=dmyj;
			}
			
			rs2.close();
			ps2.close();
			//---------------------
			xjqye=dmyj;

			if (xjqys!=0)
			{
				xjpjqye=xjqye/xjqys;
			}
			else{
				xjpjqye=0;
			}
			if (xjfwmj!=0)
			{
				xjpmjj=xjqye/xjfwmj;
			}
			else{
				xjpmjj=0;
			}
		}
		rs.close();
		ps.close();
		if (xjqys==0)
		{
			continue;
		}

		//分类明细
		ls_sql="SELECT deflmc,count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx,kp_deflbm";
		ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
		ls_sql+=" and crm_khxx.rddqbm='"+rddqbm+"'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by deflbm,deflmc";
		ls_sql+=" order by deflbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			deflmc=rs.getString(1);
			qys=rs.getInt(2);
			qye=rs.getInt(3);
			fwmj=rs.getInt(4);

			int dedy2=0;
			int dexy2=0;
			ls_sql="SELECT deflbm,deflmc,dedy,dexy";
			ls_sql+=" FROM kp_deflbm";
			ls_sql+=" where deflmc='"+deflmc+"' ";
			ls_sql+=" order by deflbm ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dedy2=rs2.getInt(3);
				dexy2=rs2.getInt(4);
			}
			rs2.close();
			ps2.close();
			//--------------------------
			//清除临时表
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
			//sz6:增减项
			//sz7:增减项项目管理费
			//sz8:增减项税金
			//sz9:减项违约金
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
			//sz10:设计费
			//sz11:实收款
			//sz12:返卷总额
			//sz13:公司承担返卷
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

			//sz19:平均签单周期
			//sz20:房屋面积
			ls_sql+=" ,sz19,sz20,ywy ";//其它
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
			ls_sql+=" FROM crm_khxx,crm_zxkhxx,dm_rddqbm";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
			ls_sql+=" and crm_khxx.qye>='"+dedy2+"' and crm_khxx.qye<'"+dexy2+"'";
			ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
			ls_sql+=" and dm_rddqbm.rddq='"+rddq+"'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			}
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//System.out.print(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02：店面签约业绩系数
				double yjxs12=10;//04：家装设计师业绩系数
				double yjxs13=10;//06：业务员系数
				double yjxs14=10;//07：市场部经理系数

				if (!cxhdmc.equals(""))//公司活动
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("错误！找不到活动参数："+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02：店面签约业绩系数
				double yjxs2=10;//04：家装设计师业绩系数
				double yjxs3=10;//06：业务员系数
				double yjxs4=10;//07：市场部经理系数

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02：店面签约业绩系数
				//yjxs12 04：家装设计师业绩系数
				//yjxs13 06：业务员系数
				//yjxs14 07：市场部经理系数
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//业绩

			//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
			//sz15:家装设计师业绩＝
			//sz16:业务员业绩＝
			//sz17:市场部经理业绩＝
			//sz18:市场部经理签约数＝

			//sz1:签约数
			//sz2:签约额－折前
			//sz3:签约额－折后
			//sz4:合同管理费
			//sz5:合同税金

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			int dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getInt("dmjlyj");
				//alldmyj+=dmyj;
			}
			qye=dmyj;
			rs2.close();
			ps2.close();
			
			//---------------------
			
			if (qys!=0)
			{
				pjqye=qye/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=qye/fwmj;
			}
			else{
				pmjj=0;
			}

			bfb=qys*100.0/xjqys;

			%>
			<tr align="center">
				<td ><%=deflmc%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=qye%></td>
				<td  align="right"><%=pjqye%></td>
				<td  align="right"><%=pmjj%></td>
				<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();


		%>
		<tr align="center">
			<td ><%=rddq%>小计</td>
			<td  align="right"><%=xjqys%></td>
			<td  align="right"><%=xjqye%></td>
			<td  align="right"><%=xjpjqye%></td>
			<td  align="right"><%=xjpmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
		</tr>
		<tr align="center" height="20">
			<td colspan="6">&nbsp;</td>
		</tr>
		<%
	}
	rs3.close();
	ps3.close();
%>
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</body>
</html>