<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
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
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>业绩增长分析<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">年</td>
  <td  width="6%">月</td>
  <td  width="7%">签约数</td>
  <td  width="14%">店面签约业绩</td>
  <td  width="8%">单额平均</td>
  <td  width="8%">平米均价</td>
  <td  width="9%">设计费</td>
  <td  width="7%">折扣率</td>
  <td  width="23%">总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;

	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	
		{
			ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
	}
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}
	
	String oldnian="";
	String nian=null;
	String yue=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	double sjf=0;
	long fwmj=0;

	int xjqys=0;
	double xjzqye=0;
	double xjwdzgce=0;
	double xjsjf=0;
	long xjfwmj=0;

	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	double allsjf=0;
	long allfwmj=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	int row=0;

	String bgcolor="#FFFFFF";


	ls_sql="SELECT TO_CHAR(qyrq,'YYYY') nian,TO_CHAR(qyrq,'MM') yue,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ls_sql+=" order by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		String wheresql="";
		if (fgs!=null)
	{
		if (!(fgs.equals("")))	
		{
			//ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
			wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))
		{
			//ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
			wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
	}
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		qys=rs.getInt("qys");
		//zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");
		wheresql+=" and TO_CHAR(qyrq,'YYYY')='"+nian+"' and TO_CHAR(qyrq,'MM')='"+yue+"'";
		wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		//----------------------------
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
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') "+wheresql;
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

			double dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getDouble("dmjlyj");
			
			}
			
			rs2.close();
			ps2.close();

		//--------------------------------

		if (nian.equals(oldnian))
		{
		}
		else if (row!=0){
			if (xjqys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(xjzqye/xjqys);
			}
			if (xjfwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(xjzqye/xjfwmj);
			}
			if (xjwdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=xjzqye*100/xjwdzgce;
			}

			%>
			<tr align="center"  height="25" bgcolor="#E8E8FF">
				<td colspan="2"><font color="#0000FF" size="3"><B><%=oldnian%>年小计</B></font></td>
				<td  align="right"><%=xjqys%></td>
				<td  align="right"><%=cf.formatDouble(xjzqye)%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(xjsjf)%></td>
				<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
				<td  align="left">&nbsp;</td>
			</tr>
			<%
			oldnian=nian;
			xjqys=0;
			xjzqye=0;
			xjwdzgce=0;
			xjfwmj=0;
			xjsjf=0;
		}
		else{
			oldnian=nian;
			xjqys=0;
			xjzqye=0;
			xjwdzgce=0;
			xjfwmj=0;
			xjsjf=0;
		}

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(dmyj/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(dmyj/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=dmyj*100/wdzgce;
		}


		xjqys+=qys;
		xjzqye+=dmyj;
		xjwdzgce+=wdzgce;
		xjfwmj+=fwmj;
		xjsjf+=sjf;

		allqys+=qys;
		allzqye+=dmyj;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		row++;



		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=nian%></td>
			<td ><%=yue%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble(dmyj)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left"><A HREF="ViewGscz.jsp?nian=<%=nian%>&yue=<%=yue%>&fgs=<%=fgs%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=dmyj*150/maxqye%>" height="14"></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (xjqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(xjzqye/xjqys);
	}
	if (xjfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(xjzqye/xjfwmj);
	}
	if (xjwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=xjzqye*100/xjwdzgce;
	}

	%>
	<tr align="center"  height="25" bgcolor="#E8E8FF">
		<td colspan="2"><font color="#0000FF" size="3"><B><%=oldnian%>年小计</B></font></td>
		<td  align="right"><%=xjqys%></td>
		<td  align="right"><%=cf.formatDouble(xjzqye)%></td>
		<td  align="right"><%=cf.formatDouble(pjde)%></td>
		<td  align="right"><%=cf.formatDouble(pmjj)%></td>
		<td  align="right"><%=cf.formatDouble(xjsjf)%></td>
		<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
		<td  align="left">&nbsp;</td>
	</tr>


<%
	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*100/allwdzgce;
	}

%>
<tr align="center"  height="33" bgcolor="#E8E8FF">
	<td colspan="2"><font color="#0000FF" size="4"><B>总&nbsp;&nbsp;&nbsp;计</B></font></td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
	<td  align="left">&nbsp;</td>
</tr>
</table>


<P><b><font color="#0000CC">注意：此统计表以[签约日期]为准、而非[首付款日期]</font></b>
</body>
</html>

<%
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
