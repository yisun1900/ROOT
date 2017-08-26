<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.getParameter(request,"bjbbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT xmmc,dqmc,xmdlmc,xmxlmc,clcb,rgcb,jxcb,cbenj";
	ls_sql+=" FROM bj_jzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_jzbjb.bjbbh='"+bjbbh+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzbjb.dqbm=dm_dqbm.dqbm and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>工程项目工料分析</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE6 {color: #990000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">工程项目工料分析</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr>
        <td width="18%" align="right"><span class="STYLE1">地区</span></td>
        <td width="32%"><%=dqmc%></td>
        <td width="18%" align="right"><span class="STYLE1">报价版本号</span></td>
        <td width="32%"><%=bjbbh%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目编号</span></td>
        <td><%=xmbh%></td>
        <td align="right"><span class="STYLE1">报价级别</span></td>
        <td><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目名称</span></td>
        <td colspan="3"><%=xmmc%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目大类</span></td>
        <td><%=xmdlbm%></td>
        <td align="right"><span class="STYLE1">项目小类</span></td>
        <td><%=xmxlbm%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">材料成本</span></td>
        <td><span class="STYLE6"><%=clcb%></span></td>
        <td align="right"><span class="STYLE6">人工成本</span></td>
        <td><span class="STYLE6"><%=rgcb%></span></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">成本价</span></td>
        <td><span class="STYLE6"><%=cbenj%>          <br>
        </span></td>
        <td align="right"><span class="STYLE6">机械成本</span></td>
        <td><span class="STYLE6"><%=jxcb%></span></td>
      </tr>
  </table>




  <table border="1" cellspacing="0" cellpadding="1" width="160%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="2%">序号</td>
      <td width="3%">工料分类</td>
      <td width="5%">材料编码</td>
      <td width="8%">材料名称</td>
      <td width="7%">品牌</td>
      <td width="6%">型号</td>
      <td width="8%">规格</td>
      <td width="3%">计量单位</td>
      <td width="4%">单价</td>
      <td width="4%">消耗量</td>
      <td width="5%">金额</td>
	  <td width="3%">需物流领料</td>
	  <td width="3%">类型</td>
      <td width="4%">甲醛释放量</td>
      <td width="4%">苯释放量</td>
      <td width="4%">TVOC释放量</td>
      <td width="24%" align="left">备注</td>
    </tr>
    <%
	String bgcolor=null;
	String glbxh=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String gg=null;
	String xl=null;
	String jldwbm=null;
	String bjjb=null;
	String glfxclbm="";
	double xhl=0;
	double dj=0;
	double je=0;
	double xjje=0;
	String lx=null;
	String wlllbz="";
	String bz=null;
	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	int row=0;
	ls_sql="select glbxh,dqmc,bj_jzglfxb.glfxclbm,bj_jzglfxb.glfxclmc,glflmc,dj,bj_jzglfxb.jldwbm,xhl,jqsfl,bsfl,tvocsfl,DECODE(lx,'1','打印','2','不打印') lx,DECODE(wlllbz,'Y','需要','N','否') wlllbz,bj_jzglfxb.bz ";
	ls_sql+=" ,ppmc,xh,gg ";
	ls_sql+=" FROM bj_jzglfxb,dm_dqbm,bdm_glflbm,jxc_clbm ";
	ls_sql+=" where bj_jzglfxb.bjbbh='"+bjbbh+"' and bj_jzglfxb.dqbm='"+dqbm+"' and bj_jzglfxb.xmbh='"+xmbh+"' and bj_jzglfxb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzglfxb.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and trim(bj_jzglfxb.glfxclbm)=jxc_clbm.nbbm(+)  ";
	ls_sql+=" order by bj_jzglfxb.glflbm,glbxh";
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		glbxh=rs.getString("glbxh");
		dqmc=rs.getString("dqmc");

		glfxclmc=rs.getString("glfxclmc");
		glfxclbm=cf.fillHtml(rs.getString("glfxclbm"));
		glflbm=rs.getString("glflmc");
		pp=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");
		lx=cf.fillNull(rs.getString("lx"));
		wlllbz=cf.fillHtml(rs.getString("wlllbz"));
		bz=cf.fillHtml(rs.getString("bz"));

		je=cf.round(dj*xhl,2);
		xjje+=je;

		xjje=cf.round(xjje,2);


		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td><%=(row+1)%> </td>
      <td><%=glflbm%>      </td>
      <td> <%=glfxclbm%>      </td>
      <td> <%=glfxclmc%>      </td>
      <td><%=pp%></td>
      <td><%=xh%></td>
      <td><%=gg%></td>
      <td><%=jldwbm%></td>
      <td> <%=dj%>      </td>
      <td> <%=xhl%>      </td>
      <td><%=je%></td>
		<td><%=wlllbz%>		</td>
		<td><%=lx%>		</td>
      <td> <%=jqsfl%>      </td>
      <td> <%=bsfl%>      </td>
      <td> <%=tvocsfl%>      </td>
      <td> <%=bz%>      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td colspan="2">小计</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=xjje%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


