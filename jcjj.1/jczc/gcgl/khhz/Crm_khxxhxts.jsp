<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>

<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数

	String ls_sql=null;
	String tjrq=null;
	String tjrq2=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}

	tjrq=request.getParameter("tjrq");
	tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}

	int all=0;
	int zjyfwall=0;
	int zjyfw21=0;
	double zjyfw21b=0;
	int zjyfw22=0;
	double zjyfw22b=0;
	int zjyfw23=0;
	double zjyfw23b=0;
	int zjydwall=0;
	int zjydw21=0;
	double zjydw21b=0;
	int zjydw22=0;
	double zjydw22b=0;
	int zjydw23=0;
	double zjydw23b=0;
	int zjyjzall=0;
	int zjyjz21=0;
	double zjyjz21b=0;
	int zjyjz22=0;
	double zjyjz22b=0;
	int zjyjz23=0;
	double zjyjz23b=0;

	double	b21=0;
	double	b22=0;
	double	b23=0;

	String ls=null;

	//有效回访总数，不包括：6：未联系上、7：未开工
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	all=Integer.parseInt(ls);
	if (all==0)
	{
		out.println("无回访数据");
		return;
	}

//=============================质检员服务==================================================
	//质检员服务有结果，回访总数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.zjyfw=dm_hfjgbm.hfjgbm ";//质检员服务
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjyfwall=Integer.parseInt(ls);
	
	//质检员服务，21：满意
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.zjyfw='21' ";//质检员服务，21：满意
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjyfw21=Integer.parseInt(ls);

	//质检员服务，22：较满意
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjyfw='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	zjyfw22=Integer.parseInt(ls);

	//质检员服务，23：不满意
	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjyfw='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	zjyfw23=Integer.parseInt(ls);

//=============================质检员尽责==================================================

	//质检员尽责有结果，回访总数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.zjyjz=dm_hfjgbm.hfjgbm ";//质检员尽责
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjyjzall=Integer.parseInt(ls);
	
	//质检员尽责，21：满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjyjz='21' ";//质检员尽责，21：满意
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	zjyjz21=Integer.parseInt(ls);


	//质检员尽责，22：较满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjyjz='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	zjyjz22=Integer.parseInt(ls);

	//质检员尽责，23：不满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjyjz='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);

	zjyjz23=Integer.parseInt(ls);


//=============================质检员到位==================================================

	//质检员到位有结果，回访总数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.zjydw=dm_hfjgbm.hfjgbm ";//质检员到位
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjydwall=Integer.parseInt(ls);



	//质检员到位，21：满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjydw='21' ";//质检员到位，21：满意
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjydw21=Integer.parseInt(ls);

	//质检员到位，22：较满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjydw='22' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjydw22=Integer.parseInt(ls);


	//质检员到位，23：不满意
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.zjydw='23' ";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ls=cf.executeQuery(ls_sql);
	zjydw23=Integer.parseInt(ls);

//	zjyfwall=0;
//	zjydwall=0;
//	zjyjzall=0;

	if (zjyfwall==0)
	{
		zjyfw21b=0;
		zjyfw22b=0;
		zjyfw23b=0;
	}
	else{
		zjyfw21b=cf.doubleTrim(100.0*zjyfw21/zjyfwall,2);
		zjyfw22b=cf.doubleTrim(100.0*zjyfw22/zjyfwall,2);
		zjyfw23b=cf.doubleTrim(100.0*zjyfw23/zjyfwall,2);
	}

	if (zjyjzall==0)
	{
		zjyjz21b=0;
		zjyjz22b=0;
		zjyjz23b=0;
	}
	else{
		zjyjz21b=cf.doubleTrim(100.0*zjyjz21/zjyjzall,2);
		zjyjz22b=cf.doubleTrim(100.0*zjyjz22/zjyjzall,2);
		zjyjz23b=cf.doubleTrim(100.0*zjyjz23/zjyjzall,2);
	}

	if (zjydwall==0)
	{
		zjydw21b=0;
		zjydw22b=0;
		zjydw23b=0;
	}
	else{
		zjydw21b=cf.doubleTrim(100.0*zjydw21/zjydwall,2);
		zjydw22b=cf.doubleTrim(100.0*zjydw22/zjydwall,2);
		zjydw23b=cf.doubleTrim(100.0*zjydw23/zjydwall,2);
	}

	if ((zjyfwall+zjyjzall+zjydwall)==0)
	{
		b21=0;
		b22=0;
		b23=0;
	}
	else{
		b21=cf.doubleTrim(100.0*(zjyfw21+zjyjz21+zjydw21)/(zjyfwall+zjyjzall+zjydwall),2);
		b22=cf.doubleTrim(100.0*(zjyfw22+zjyjz22+zjydw22)/(zjyfwall+zjyjzall+zjydwall),2);
		b23=cf.doubleTrim(100.0*(zjyfw23+zjyjz23+zjydw23)/(zjyfwall+zjyjzall+zjydwall),2);
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>质检员<<%=hflxmc%>>回访统计（有效回访次数：<%=all%>）<BR>
  (<%=tjrq%>--<%=tjrq2%>)</B> 
</CENTER>
      
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="20%">服务项目</td>
    <td  width="20%">回访结果</td>
    <td  width="15%">数量</td>
    <td  width="30%">百分比 </td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">质检员服务</td>
    <td >满意</td>
    <td  align="right"><%=zjyfw21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyfw21b%>" height="14">&nbsp;<%=zjyfw21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >较满意</td>
    <td  align="right"><%=zjyfw22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyfw22b%>" height="14">&nbsp;<%=zjyfw22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >不满意</td>
    <td  align="right"><%=zjyfw23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyfw23b%>" height="14">&nbsp;<%=zjyfw23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>小 计</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=zjyfwall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  rowspan="4">质检员到位</td>
    <td >满意</td>
    <td  align="right"><%=zjydw21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjydw21b%>" height="14">&nbsp;<%=zjydw21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >较满意</td>
    <td  align="right"><%=zjydw22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjydw22b%>" height="14">&nbsp;<%=zjydw22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >不满意</td>
    <td  align="right"><%=zjydw23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjydw23b%>" height="14">&nbsp;<%=zjydw23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>小 计</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=zjydwall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td rowspan="4" >质检员尽责</td>
    <td >满意</td>
    <td  align="right"><%=zjyjz21%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyjz21b%>" height="14">&nbsp;<%=zjyjz21b%>%</td>
  </tr>
  <tr align="center"> 
    <td >较满意</td>
    <td  align="right"><%=zjyjz22%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyjz22b%>" height="14">&nbsp;<%=zjyjz22b%>%</td>
  </tr>
  <tr align="center"> 
    <td >不满意</td>
    <td  align="right"><%=zjyjz23%></td>
    <td  align="left"><img src="/images/ColuGif.gif" width="<%=2*zjyjz23b%>" height="14">&nbsp;<%=zjyjz23b%>%</td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>小 计</b></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=zjyjzall%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b>&nbsp;</b></td>
  </tr>
  <tr align="center"> 
    <td  bgcolor="#E8E8FF" colspan="2" style='FONT-SIZE:17px'><B>总 计</B></td>
    <td  align="right" bgcolor="#E8E8FF" style='FONT-SIZE:17px'><b><%=(zjyfwall+zjyjzall+zjydwall)%></b></td>
    <td  bgcolor="#E8E8FF" style='FONT-SIZE:17px'><B>&nbsp;</B></td>
  </tr>
</table>

<P>
<div align="center">质检员总满意度统计表</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr height="40"> 
    <td width="35%" align="right">满意</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b21%>" height="20">&nbsp;<%=b21%>%</td>
  </tr>
  <tr height="40"> 
    <td width="35%" align="right">较满意</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b22%>" height="20">&nbsp;<%=b22%>%</td>
  </tr>
  <tr height="40"> 
    <td width="35%" align="right">不满意</td>
    <td width="65%"><img src="/images/ColuGif.gif" width="<%=4*b23%>" height="20">&nbsp;<%=b23%>%</td>
  </tr>
</table>

</body>
</html>
