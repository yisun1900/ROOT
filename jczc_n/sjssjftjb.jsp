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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");
String jzbz=request.getParameter("jzbz");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String dwbh_c=dwbh;
if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
String rzsj="";
String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
String sjsfgs="";
int qys=0;
double zqye=0;
double sjf=0;
long fwmj=0;
int allqys=0;
double allzqye=0;
double allsjf=0;
long allfwmj=0;

int pjde=0;
int pmjj=0;
int sjfnum=0;
int allsjfnum=0;

double sjsbfb=0;//设计数百分比
double sjebfb=0;//设计额百分比

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：设计师家装业绩："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师设计费统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%" >排名</td>
  <td  width="5%" >设计师</td>
  <td  width="6%" >入职时间</td>
  <td  width="7%" >分公司</td>
  <td  width="7%" >店面</td>
  <td  width="5%" >签约数</td>
  <td  width="9%" >签约额</td>
  <td  width="8%" >收取设计费客户数量</td>
  <td  width="7%" >设计费</td>
  <td  width="8%" >设计费单额</td>
  <td  width="6%" >设计费平米均价</td>
  <td  width="6%" >设计费/签单额</td>
  <td  width="9%" >设计费数量/签单数量</td>
  <td  width="12%" >总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;

	if (px.equals("qye"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zqye desc";

//		out.println(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");

//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(sjf) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;


			if (rzsj==null)
			{rzsj="未录入";}
			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}


			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
			row++;

			sjsbfb=sjfnum*100.0/qys;
			sjebfb=sjf*100.0/zqye;

			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}
			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%></td>
				<td ><%=getsjs%></td>
				<td ><%=rzsj%></td>
				<td ><%=sjsfgs%></td>
				<td ><%=dm%></td>
				<td ><%=qys%></td>
				<td ><%=cf.formatDouble((int)zqye)%></td>
				<td ><%=sjfnum%>
				<td ><%=cf.formatDouble((int)sjf)%></td>
				<td ><%=cf.formatDouble((int)pjde)%></td>
				<td ><%=cf.formatDouble((int)pmjj)%></td>
				<td ><%=cf.round(sjebfb,1)%>%</td>
				<td ><%=cf.round(sjsbfb,1)%>%</td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("qys"))
	{
		ls_sql="SELECT max(count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by qys desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");



//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(sjf) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;


			if (rzsj==null)
			{rzsj="未录入";}

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
			row++;

			sjsbfb=sjfnum*100.0/qys;
			sjebfb=sjf*100.0/zqye;

			
			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%></td>
				<td ><%=getsjs%></td>
				<td ><%=rzsj%></td>
				<td ><%=sjsfgs%></td>
				<td ><%=dm%></td>
				<td ><%=qys%></td>
				<td ><%=cf.formatDouble((int)zqye)%></td>
				<td ><%=sjfnum%>
				<td ><%=cf.formatDouble((int)sjf)%></td>
				<td ><%=cf.formatDouble((int)pjde)%></td>
				<td ><%=cf.formatDouble((int)pmjj)%></td>
				<td ><%=cf.round(sjebfb,1)%>%</td>
				<td ><%=cf.round(sjsbfb,1)%>%</td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qys*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("pjde"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)/count(*)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,DECODE(sum(qys),0,0,sum(zqye)/sum(qys)) pjde";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by pjde desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			pjde=rs.getInt("pjde");


//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(sjf) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;


			if (rzsj==null)
			{rzsj="未录入";}

			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
			row++;

			sjsbfb=sjfnum*100.0/qys;
			sjebfb=sjf*100.0/zqye;

			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%></td>
				<td ><%=getsjs%></td>
				<td ><%=rzsj%></td>
				<td ><%=sjsfgs%></td>
				<td ><%=dm%></td>
				<td ><%=qys%></td>
				<td ><%=cf.formatDouble((int)zqye)%></td>
				<td ><%=sjfnum%>
				<td ><%=cf.formatDouble((int)sjf)%></td>
				<td ><%=cf.formatDouble((int)pjde)%></td>
				<td ><%=cf.formatDouble((int)pmjj)%></td>
				<td ><%=cf.round(sjebfb,1)%>%</td>
				<td ><%=cf.round(sjsbfb,1)%>%</td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pjde*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("pmjj"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)/sum(fwmj)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
		ls_sql+=" having sum(fwmj)!=0";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,DECODE(sum(fwmj),0,0,sum(zqye)/sum(fwmj)) pmjj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(fwmj)!=0";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by pmjj desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			pmjj=rs.getInt("pmjj");


//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(sjf) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;


			if (rzsj==null)
			{rzsj="未录入";}

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}


			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
			row++;

			sjsbfb=sjfnum*100.0/qys;
			sjebfb=sjf*100.0/zqye;

			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%></td>
				<td ><%=getsjs%></td>
				<td ><%=rzsj%></td>
				<td ><%=sjsfgs%></td>
				<td ><%=dm%></td>
				<td ><%=qys%></td>
				<td ><%=cf.formatDouble((int)zqye)%></td>
				<td ><%=sjfnum%>
				<td ><%=cf.formatDouble((int)sjf)%></td>
				<td ><%=cf.formatDouble((int)pjde)%></td>
				<td ><%=cf.formatDouble((int)pmjj)%></td>
				<td ><%=cf.round(sjebfb,1)%>%</td>
				<td ><%=cf.round(sjsbfb,1)%>%</td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pmjj*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("sjf"))
	{
		ls_sql="SELECT TRUNC(max(sum(sjf)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(NVL(sjf,0)) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by sjf desc,zqye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");

//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(sjf) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;


			if (rzsj==null)
			{rzsj="未录入";}

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
			row++;

			sjsbfb=sjfnum*100.0/qys;
			sjebfb=sjf*100.0/zqye;

			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%></td>
				<td ><%=getsjs%></td>
				<td ><%=rzsj%></td>
				<td ><%=sjsfgs%></td>
				<td ><%=dm%></td>
				<td ><%=qys%></td>
				<td ><%=cf.formatDouble((int)zqye)%></td>
				<td ><%=sjfnum%>
				<td ><%=cf.formatDouble((int)sjf)%></td>
				<td ><%=cf.formatDouble((int)pjde)%></td>
				<td ><%=cf.formatDouble((int)pmjj)%></td>
				<td ><%=cf.round(sjebfb,1)%>%</td>
				<td ><%=cf.round(sjsbfb,1)%>%</td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=sjf*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

	}

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

%>
<tr align="center">
	<td colspan="4" >合计
	</td>
	<td>&nbsp;</td>
	<td ><%=allqys%></td>
	<td ><%=cf.formatDouble((long)allzqye)%></td>
	<td ><%=allsjfnum%>
	<td ><%=cf.formatDouble((long)allsjf)%></td>
	<td ><%=cf.formatDouble((long)pjde)%></td>
	<td ><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="left" >&nbsp;</td>
	<td  align="left" >&nbsp;</td>
	<td  align="left" >&nbsp;</td>

</tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs!= null) rs1.close(); 
		if (ps!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

