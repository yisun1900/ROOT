<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170222'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[日报(分公司)]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[日报(分公司)]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
	String[] days=cf.getDays(sjfw,sjfw2);
	int day=Integer.parseInt(days[0]);

	String[][] dataStr=new String[500][day+4];;


	int[] rdkhszj=new int[day+4];//店面[客流]总计
	int[] djszj=new int[day+4];//店面[订金数]总计
	int[] sjfkhszj=new int[day+4];//店面[设计合同数]总计
	double[] sjfzj=new double[day+4];//店面[设计费]总计
	int[] gxhkhszj=new int[day+4];//店面[个性化合同数]总计
	double[] gxhjezj=new double[day+4];//店面[个性化金额]总计
	int[] tckhszj=new int[day+4];//店面[套餐合同数]总计
	double[] tcjezj=new double[day+4];//店面[套餐金额]总计
	double[] zcjezj=new double[day+4];//店面[集成家居]总计
	double[] dmyjzj=new double[day+4];//店面[业绩]总计
	
	
	int row=-1;

	String getdwbh=null;
	String dmmc=null;

	ls_sql =" SELECT sq_dwxx.dwbh,sq_dwxx.dwmc ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and sq_dwxx.cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
	ls_sql+=" order by sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");

		double[] dmyjhj=new double[day+4];

		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="客流";

		//按天循环
		int hjrdkhs=0;
		for (int i=1;i<=day ;i++ )
		{
			//客流
			int rdkhs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.ssfgs='"+getdwbh+"'";
			ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				rdkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			
			dataStr[row][3+i]=""+rdkhs;
			rdkhszj[3+i]+=rdkhs;

			hjrdkhs+=rdkhs;

		}

		dataStr[row][3]=""+hjrdkhs;//每天合计


		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="订金数";

		//按天循环
		int hjdjs=0;
		for (int i=1;i<=day ;i++ )
		{
			//订金数
			int djs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.ssfgs='"+getdwbh+"'";

			ls_sql+=" and (  ";
			ls_sql+=" (  ";
			ls_sql+="     crm_zxkhxx.lfdjbz='Y'";//N：未交订金；Y：已交订金；T：退订金
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.lfdj>0";
			ls_sql+=" )  ";

			ls_sql+=" OR  ";

			ls_sql+=" (  ";
			ls_sql+="     crm_zxkhxx.hddjbz='Y'";//N：未交订金；Y：已交订金；T：退订金
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.hddj>0";
			ls_sql+=" )  ";

			ls_sql+=" )  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				djs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			
			dataStr[row][3+i]=""+djs;
			djszj[3+i]+=djs;

			hjdjs+=djs;

		}

		dataStr[row][3]=""+hjdjs;



		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="设计合同数";

		dataStr[row+1][0]="";
		dataStr[row+1][1]=dmmc;
		dataStr[row+1][2]="设计费";

		//按天循环
		int hjsjfkhs=0;
		double hjsjf=0;
		for (int i=1;i<=day ;i++ )
		{
			//实收设计费
			int sjfkhs=0;
			double sjf=0;
			double sjhtje=0;
			long fwmj=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjfkhs=rs1.getInt("khsl");
				sjf=rs1.getDouble("sjf");
				sjhtje=rs1.getDouble("sjhtje");
				fwmj=rs1.getLong("fwmj");
			}
			rs1.close();
			ps1.close();
			
			dataStr[row][3+i]=""+sjfkhs;
			dataStr[row+1][3+i]=""+sjf;

			sjfkhszj[3+i]+=sjfkhs;
			sjfzj[3+i]+=sjf;

			//店面业绩合计
			dmyjhj[3+i]+=sjf;
			dmyjzj[3+i]+=sjf;
			
			hjsjfkhs+=sjfkhs;
			hjsjf+=sjf;
			hjsjf=cf.round(hjsjf,2);

		}


		dataStr[row][3]=""+hjsjfkhs;
		dataStr[row+1][3]=""+hjsjf;

		row++;


		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="个性化合同数";

		dataStr[row+1][0]="";
		dataStr[row+1][1]=dmmc;
		dataStr[row+1][2]="个性化金额";

		//按天循环
		int hjgxhkhs=0;
		double hjgxhje=0;
		for (int i=1;i<=day ;i++ )
		{
			//个性化
			int gxhkhs=0;
			double gxhje=0;
			ls_sql =" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.fgsbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='1' ";
			ls_sql+=" and crm_khxx.zt in('2','3','5')";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gxhkhs=rs1.getInt(1);
				gxhje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
			
			//个性化退单
			int tdgxhkhs=0;
			double tdgxhje=0;
			ls_sql=" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='1' ";
			ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
			ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
			ls_sql+=" and crm_khxx.yjjzsj is not null ";//首次付家装款时间
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tdgxhkhs=rs1.getInt(1);
				tdgxhje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			gxhje=gxhje-tdgxhje;

			dataStr[row][3+i]=""+gxhkhs;
			dataStr[row+1][3+i]=""+gxhje;

			gxhkhszj[3+i]+=gxhkhs;
			gxhjezj[3+i]+=gxhje;


			hjgxhkhs+=gxhkhs;
			hjgxhje+=gxhje;
			hjgxhje=cf.round(hjgxhje,2);


			//店面业绩合计
			dmyjhj[3+i]+=gxhje;
			dmyjzj[3+i]+=gxhje;
		}

		dataStr[row][3]=""+hjgxhkhs;
		dataStr[row+1][3]=""+hjgxhje;

		row++;




		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="套餐合同数";

		dataStr[row+1][0]="";
		dataStr[row+1][1]=dmmc;
		dataStr[row+1][2]="套餐金额";

		//按天循环
		int hjtckhs=0;
		double hjtcje=0;
		for (int i=1;i<=day ;i++ )
		{
			//套餐
			int tckhs=0;
			double tcje=0;
			ls_sql =" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.fgsbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='2' ";
			ls_sql+=" and crm_khxx.zt in('2','3','5')";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tckhs=rs1.getInt(1);
				tcje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
			
			//套餐退单
			int tdtckhs=0;
			double tdtcje=0;
			ls_sql=" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='2' ";
			ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
			ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
			ls_sql+=" and crm_khxx.yjjzsj is not null ";//首次付家装款时间
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tdtckhs=rs1.getInt(1);
				tdtcje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			tcje=tcje-tdtcje;

			dataStr[row][3+i]=""+tckhs;
			dataStr[row+1][3+i]=""+tcje;

			tckhszj[3+i]+=tckhs;
			tcjezj[3+i]+=tcje;

			hjtckhs+=tckhs;
			hjtcje+=tcje;
			hjtcje=cf.round(hjtcje,2);


			//店面业绩合计
			dmyjhj[3+i]+=tcje;
			dmyjzj[3+i]+=tcje;
		}

		dataStr[row][3]=""+hjtckhs;
		dataStr[row+1][3]=""+hjtcje;

		row++;



		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="集成家居";


		//按天循环
		double hjzcje=0;
		for (int i=1;i<=day ;i++ )
		{
		
			//集成家居
			double zcje=0;
			ls_sql =" SELECT sum(cw_khfkjl.fkje) yjje";
			ls_sql+=" FROM cw_khfkjl";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.fgsbh='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+days[i]+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+days[i]+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcje=rs1.getDouble("yjje");
			}
			rs1.close();
			ps1.close();

			dataStr[row][3+i]=""+zcje;

			zcjezj[3+i]+=zcje;

			hjzcje+=zcje;
			hjzcje=cf.round(hjzcje,2);

			//店面业绩合计
			dmyjhj[3+i]+=zcje;
			dmyjzj[3+i]+=zcje;

		}

		dataStr[row][3]=""+hjzcje;

		//处理店面合计行中合计列
		//所有天数合计
		for (int i=1;i<=day ;i++ )
		{
			//店面业绩合计
			dmyjhj[3]+=dmyjhj[3+i];
			dmyjhj[3]=cf.round(dmyjhj[3],2);
		}

		//处理店面合计行
		row++;
		dataStr[row][0]="";
		dataStr[row][1]=dmmc;
		dataStr[row][2]="业绩合计";
		dataStr[row][3]=""+cf.formatDouble(dmyjhj[3]);
		for (int i=1;i<=day ;i++ )
		{
			dataStr[row][3+i]=""+cf.formatDouble(dmyjhj[3+i]);
		}

	}
	rs.close();
	ps.close();
	
	//所有天数合计
	for (int i=1;i<=day ;i++ )
	{
		//店面业绩合计
		rdkhszj[3]+=rdkhszj[3+i];
		djszj[3]+=djszj[3+i];
		sjfkhszj[3]+=sjfkhszj[3+i];
		sjfzj[3]+=sjfzj[3+i];
		gxhkhszj[3]+=gxhkhszj[3+i];
		gxhjezj[3]+=gxhjezj[3+i];
		tckhszj[3]+=tckhszj[3+i];

		tcjezj[3]+=tcjezj[3+i];
		tcjezj[3]=cf.round(tcjezj[3],2);

		zcjezj[3]+=zcjezj[3+i];

		dmyjzj[3]+=dmyjzj[3+i];
		dmyjzj[3]=cf.round(dmyjzj[3],2);
	}

	//处理总计
	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="客流";
	dataStr[row][3]=""+rdkhszj[3];
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+rdkhszj[3+i];
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="订金数";
	dataStr[row][3]=""+djszj[3];
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+djszj[3+i];
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="设计合同数";
	dataStr[row][3]=""+sjfkhszj[3];
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+sjfkhszj[3+i];
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="设计费";
	dataStr[row][3]=""+cf.formatDouble(sjfzj[3]);
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+cf.formatDouble(sjfzj[3+i]);
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="个性化合同数";
	dataStr[row][3]=""+gxhkhszj[3];
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+gxhkhszj[3+i];
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="个性化金额";
	dataStr[row][3]=""+cf.formatDouble(gxhjezj[3]);
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+cf.formatDouble(gxhjezj[3+i]);
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="套餐合同数";
	dataStr[row][3]=""+tckhszj[3];
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+tckhszj[3+i];
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="套餐金额";
	dataStr[row][3]=""+cf.formatDouble(tcjezj[3]);
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+cf.formatDouble(tcjezj[3+i]);
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="集成家居";
	dataStr[row][3]=""+cf.formatDouble(zcjezj[3]);
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+cf.formatDouble(zcjezj[3+i]);
	}

	row++;
	dataStr[row][0]="";
	dataStr[row][1]="总计";
	dataStr[row][2]="业绩合计";
	dataStr[row][3]=""+cf.formatDouble(dmyjzj[3]);
	for (int i=1;i<=day ;i++ )
	{
		dataStr[row][3+i]=""+cf.formatDouble(dmyjzj[3+i]);
	}

	row++;
%>	

<CENTER >
  <B>分公司业绩统计－日报</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="330%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >分公司</td>

  <td  width="3%" >&nbsp;</td>
  <td  width="3%" >合计</td>
<%
	for (int i=1;i<=day ;i++ )
	{
		%>
		  <td  width="2%" ><%=days[i]%></td>
		<%
	}
%>
  </tr>

<%
	for (int i=0;i<row ;i++ )
	{
		if (i%10==0)
		{
			%>
			<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center" rowspan="10"><%=dataStr[i][1]%></td>
				<td align="center"><%=dataStr[i][2]%></td>
				<td><%=dataStr[i][3]%></td>
			<%
		}
		else{
			%>
			<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center"><%=dataStr[i][2]%></td>
				<td><%=dataStr[i][3]%></td>
			<%
		}
		%>

			<%
			for (int j=1;j<=day ;j++ )
			{
				%>
				  <td><%=dataStr[i][j+3]%>
				<%
			}
			%>
		</tr>
		<%
	}

%>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 