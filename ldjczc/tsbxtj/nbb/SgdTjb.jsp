<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String lrsgd=request.getParameter("sgd");
	String wheresql="";
	String wheresql1="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.sgd in(select sgd from sq_sgd where ssdw='"+fgs+"'))";
		if (!(fgs.equals("")))	wheresql1+=" and  (sq_sgd.ssdw='"+fgs+"')";
	}
	if (lrsgd!=null)
	{
		if (!(lrsgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+lrsgd+"')";
		if (!(lrsgd.equals("")))	wheresql1+=" and  (sq_sgd.sgd='"+lrsgd+"')";
	}

	String px=request.getParameter("px");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>各施工队投诉/维修统计
  <BR>(<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="6%">名次</td>
          <td  width="15%">施工队</td>
          <td  width="8%">班组数</td>
          <td  width="10%">接单数</td>
          <td  width="19%">维修数量</td>
          <td  width="19%">投诉数量</td>
          <td  width="29%">合计</td>
        </tr>
<%
int all=0;
int maxbx=0;
String ssgs=null;
String cxbz=null;
String dwmc=null;
String sgd=null;

int alltssl=0;
int allbxsl=0;
int allgcsl=0;
int allbzsl=0;

int[] mark={3,3,1,2,4};//设置显示风格参数
//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();

	//获取最大值
	ls_sql="select NVL(max(count(distinct crm_tsjl.tsjlh)),0)";
	ls_sql+=" from crm_tsjl,crm_khxx,crm_tsbm";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
	ls_sql+=" and (crm_tsbm.tsxlbm='2101' or crm_tsbm.tslxbm='11')";//1：投诉；2：报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by sgd";

	all=Integer.parseInt(cf.executeQuery(ls_sql));
	if (all==0)
	{
		return;
	}


	int pm=0;
	int oldpm=0;
	int tssl=0;
	int bxsl=0;
	int gcsl=0;
	int bzsl=0;

	if (px.equals("hj"))//合计排序
	{
		ls_sql="select sgd,sgdmc,sum(sl)";
		ls_sql+=" from";
		ls_sql+=" (";

		ls_sql+=" select crm_khxx.sgd,sgdmc,count(distinct crm_tsjl.tsjlh) sl";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx,sq_sgd";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.sgd=sq_sgd.sgd";
		ls_sql+=" and (crm_tsbm.tsxlbm='2101' or crm_tsbm.tslxbm='11')";//1：投诉；2：报修
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_khxx.sgd,sgdmc";

		ls_sql+=" union";

		ls_sql+=" select sgd,sgdmc,0 sl";
		ls_sql+=" from sq_sgd";
		ls_sql+=" where (1=1)";
		ls_sql+=wheresql1;

		ls_sql+=" )";
		ls_sql+=" group by sgd,sgdmc";
		
		ls_sql+=" order by sum(sl) desc";
	}
	else if (px.equals("wx"))//维修数量排序
	{
		ls_sql="select sgd,sgdmc,sum(sl)";
		ls_sql+=" from";
		ls_sql+=" (";

		ls_sql+=" select crm_khxx.sgd,sgdmc,count(distinct crm_tsjl.tsjlh) sl";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx,sq_sgd";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.sgd=sq_sgd.sgd";
		ls_sql+=" and (crm_tsbm.tslxbm='11')";//2：报修
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_khxx.sgd,sgdmc";

		ls_sql+=" union";

		ls_sql+=" select sgd,sgdmc,0 sl";
		ls_sql+=" from sq_sgd";
		ls_sql+=" where (1=1)";
		ls_sql+=wheresql1;

		ls_sql+=" )";
		ls_sql+=" group by sgd,sgdmc";
		
		ls_sql+=" order by sum(sl) desc";
	}
	else
	{
		ls_sql="select sgd,sgdmc,sum(sl)";
		ls_sql+=" from";
		ls_sql+=" (";

		ls_sql+=" select crm_khxx.sgd,sgdmc,count(distinct crm_tsjl.tsjlh) sl";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx,sq_sgd";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.sgd=sq_sgd.sgd";
		ls_sql+=" and (crm_tsbm.tsxlbm='2101')";//1：投诉
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_khxx.sgd,sgdmc";

		ls_sql+=" union";

		ls_sql+=" select dwbh sgd,sgdmc,0 sl";
		ls_sql+=" from sq_sgd";
		ls_sql+=" where (1=1)";
		ls_sql+=wheresql1;

		ls_sql+=" )";
		ls_sql+=" group by sgd,sgdmc";
		
		ls_sql+=" order by sum(sl) desc";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		dwmc=rs.getString("sgdmc");

		//报修数量
		ls_sql="select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and (crm_tsbm.tslxbm='11')";//2：报修
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			bxsl=rs1.getInt(1);

			allbxsl+=bxsl;
		}
		ps1.close();
		rs1.close();

		//投诉数量
		ls_sql="select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and (crm_tsbm.tsxlbm='2101')";//1：投诉
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tssl=rs1.getInt(1);

			alltssl+=tssl;
		}
		ps1.close();
		rs1.close();

		//派单总数
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			gcsl=rs1.getInt(1);

			allgcsl+=gcsl;
		}
		ps1.close();
		rs1.close();

		//班组数
		ls_sql="select bzs,cxbz";
		ls_sql+=" from sq_sgd";
		ls_sql+=" where sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			bzsl=rs1.getInt(1);
			cxbz=rs1.getString(2);

			allbzsl+=bzsl;
		}
		ps1.close();
		rs1.close();

		if (cxbz.equals("Y"))
		{
			dwmc+="（离职）";
		}


		if (px.equals("hj"))//合计排序
		{
			if (oldpm!=(bxsl+tssl))
			{
				pm++;
				oldpm=bxsl+tssl;
			}
		}
		else if (px.equals("wx"))//维修数量排序
		{
			if (oldpm!=bxsl)
			{
				pm++;
				oldpm=bxsl;
			}
		}
		else{
			if (oldpm!=tssl)
			{
				pm++;
				oldpm=tssl;
			}
		}

		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

		%>
          <td><%=pm%></td>
          <td><%=dwmc%></td>
          <td><%=bzsl%></td>
          <td><%=gcsl%></td>
          <td align="left"><A HREF="Crm_wxjlCxList.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target='_blank'><img src="/images/ColuGif.gif" width="<%=bxsl*100/all%>" height="14">&nbsp;<%=bxsl%></A></td>
          <td align="left"><A HREF="Crm_tsjlCxList.jsp?sgd=<%=sgd%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target='_blank'><img src="/images/ColuGif.gif" width="<%=tssl*100/all%>" height="14">&nbsp;<%=tssl%></A></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=(bxsl+tssl)*100/all%>" height="14">&nbsp;<%=(bxsl+tssl)%></td>
        </tr>
	<%

	}
	ps.close();
	rs.close();


%>
        <tr align="center" >
          <td>合计</td>
          <td>&nbsp;</td>
          <td align="center"><%=allbzsl%></td>
          <td align="center"><%=allgcsl%></td>
          <td align="left"><%=allbxsl%></td>
          <td align="left"><%=alltssl%></td>
          <td align="left"><%=(allbxsl+alltssl)%></td>
        </tr>
<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL: " + ls_sql);
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
      </table>
    </td>
  </tr>
</table>
</body>
</html>
