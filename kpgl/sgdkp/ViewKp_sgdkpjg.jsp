<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kp_sgdkpjg_kpjlh=null;
String sq_dwxx_dwmc=null;
String sq_sgdjbbm_sgdjbmc=null;
String kp_sgdkpjg_zbj=null;
String kp_sgdkpjg_bzs=null;
String kp_sgdkpjg_jcf=null;
String kp_sgdkpjg_kpgds=null;
String kp_sgdkpjg_zjyzldf=null;
String kp_sgdkpjg_xjyzldf=null;
String kp_sgdkpjg_cczldf=null;
String kp_sgdkpjg_zjyaqdf=null;
String kp_sgdkpjg_xjyaqdf=null;
String kp_sgdkpjg_ccaqdf=null;
String kp_sgdkpjg_zjygqdf=null;
String kp_sgdkpjg_zjygldf=null;
String kp_sgdkpjg_xjygldf=null;
String kp_sgdkpjg_ccgldf=null;
String kp_sgdkpjg_khpjdf=null;
String kp_sgdkpjg_tsdf=null;
String kp_sgdkpjg_wxdf=null;
String kp_sgdkpjg_ybjdf=null;
String kp_sgdkpjg_bqdf=null;
String kp_sgdkpjg_sqzf=null;
String kp_sgdkpjg_bqzf=null;
String kp_sgdkpjg_sqpm=null;
String kp_sgdkpjg_bqpm=null;
String kp_sgdkpjg_pmfd=null;
String kp_sgdkpjg_hjwbz=null;
String kp_sgdkpjg_qjwbz=null;
String kp_sgdkpjg_sjbz=null;
String kp_sgdkpjg_jjbz=null;
double ddbl=0;
double zdbl=0;
double xdbl=0;
String kp_sgdkpjg_ddbzs=null;
String kp_sgdkpjg_zdbzs=null;
String kp_sgdkpjg_xdbzs=null;
String kp_sgdkpjg_ddjls=null;
String kp_sgdkpjg_zdjls=null;
String kp_sgdkpjg_xdjls=null;
String kp_sgdkpjg_kdds=null;
String kp_sgdkpjg_kzds=null;
String kp_sgdkpjg_kxds=null;
String kp_sgdkpjg_tsjcdd=null;
String kp_sgdkpjg_tsjczd=null;
String kp_sgdkpjg_tsjcxd=null;
String kp_sgdkpjg_kjdds=null;
String kp_sgdkpjg_kjzds=null;
String kp_sgdkpjg_kjxds=null;
String kp_sgdkpjg_kjdzs=null;
String kp_sgdkpjg_kjdze=null;
String kp_sgdkpjg_yjdds=null;
String kp_sgdkpjg_yjddje=null;
String kp_sgdkpjg_yjzds=null;
String kp_sgdkpjg_yjzdje=null;
String kp_sgdkpjg_yjxds=null;
String kp_sgdkpjg_yjxdje=null;
String kp_sgdkpjg_ywgs=null;
String kp_sgdkpjg_zsgds=null;

String yztscs=null;
String tbyztscs=null;
String fcyztscs=null;


String wherekp_sgdkpjg_kpjlh=null;
String wherekp_sgdkpjg_sgd=null;
wherekp_sgdkpjg_kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
wherekp_sgdkpjg_sgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yztscs,tbyztscs,fcyztscs,kp_sgdkpjg.kpjlh as kp_sgdkpjg_kpjlh,sgdmc as sq_dwxx_dwmc,sq_sgdjbbm.sgdjbmc as sq_sgdjbbm_sgdjbmc,kp_sgdkpjg.zbj as kp_sgdkpjg_zbj,kp_sgdkpjg.bzs as kp_sgdkpjg_bzs,kp_sgdkpjg.jcf as kp_sgdkpjg_jcf,kp_sgdkpjg.kpgds as kp_sgdkpjg_kpgds,kp_sgdkpjg.zjyzldf as kp_sgdkpjg_zjyzldf,kp_sgdkpjg.xjyzldf as kp_sgdkpjg_xjyzldf,kp_sgdkpjg.cczldf as kp_sgdkpjg_cczldf,kp_sgdkpjg.zjyaqdf as kp_sgdkpjg_zjyaqdf,kp_sgdkpjg.xjyaqdf as kp_sgdkpjg_xjyaqdf,kp_sgdkpjg.ccaqdf as kp_sgdkpjg_ccaqdf,kp_sgdkpjg.zjygqdf as kp_sgdkpjg_zjygqdf,kp_sgdkpjg.zjygldf as kp_sgdkpjg_zjygldf,kp_sgdkpjg.xjygldf as kp_sgdkpjg_xjygldf,kp_sgdkpjg.ccgldf as kp_sgdkpjg_ccgldf,kp_sgdkpjg.khpjdf as kp_sgdkpjg_khpjdf,kp_sgdkpjg.tsdf as kp_sgdkpjg_tsdf,kp_sgdkpjg.wxdf as kp_sgdkpjg_wxdf,kp_sgdkpjg.ybjdf as kp_sgdkpjg_ybjdf,kp_sgdkpjg.bqdf as kp_sgdkpjg_bqdf,kp_sgdkpjg.sqzf as kp_sgdkpjg_sqzf,kp_sgdkpjg.bqzf as kp_sgdkpjg_bqzf,kp_sgdkpjg.sqpm as kp_sgdkpjg_sqpm,kp_sgdkpjg.bqpm as kp_sgdkpjg_bqpm,kp_sgdkpjg.pmfd as kp_sgdkpjg_pmfd,kp_sgdkpjg.hjwbz as kp_sgdkpjg_hjwbz,kp_sgdkpjg.qjwbz as kp_sgdkpjg_qjwbz,kp_sgdkpjg.sjbz as kp_sgdkpjg_sjbz,kp_sgdkpjg.jjbz as kp_sgdkpjg_jjbz,kp_sgdkpjg.ddbl*100 as kp_sgdkpjg_ddbl,kp_sgdkpjg.zdbl*100 as kp_sgdkpjg_zdbl,kp_sgdkpjg.xdbl*100 as kp_sgdkpjg_xdbl,kp_sgdkpjg.ddbzs as kp_sgdkpjg_ddbzs,kp_sgdkpjg.zdbzs as kp_sgdkpjg_zdbzs,kp_sgdkpjg.xdbzs as kp_sgdkpjg_xdbzs,kp_sgdkpjg.ddjls as kp_sgdkpjg_ddjls,kp_sgdkpjg.zdjls as kp_sgdkpjg_zdjls,kp_sgdkpjg.xdjls as kp_sgdkpjg_xdjls,kp_sgdkpjg.kdds as kp_sgdkpjg_kdds,kp_sgdkpjg.kzds as kp_sgdkpjg_kzds,kp_sgdkpjg.kxds as kp_sgdkpjg_kxds,kp_sgdkpjg.tsjcdd as kp_sgdkpjg_tsjcdd,kp_sgdkpjg.tsjczd as kp_sgdkpjg_tsjczd,kp_sgdkpjg.tsjcxd as kp_sgdkpjg_tsjcxd,kp_sgdkpjg.kjdds as kp_sgdkpjg_kjdds,kp_sgdkpjg.kjzds as kp_sgdkpjg_kjzds,kp_sgdkpjg.kjxds as kp_sgdkpjg_kjxds,kp_sgdkpjg.kjdzs as kp_sgdkpjg_kjdzs,kp_sgdkpjg.kjdze as kp_sgdkpjg_kjdze,kp_sgdkpjg.yjdds as kp_sgdkpjg_yjdds,kp_sgdkpjg.yjddje as kp_sgdkpjg_yjddje,kp_sgdkpjg.yjzds as kp_sgdkpjg_yjzds,kp_sgdkpjg.yjzdje as kp_sgdkpjg_yjzdje,kp_sgdkpjg.yjxds as kp_sgdkpjg_yjxds,kp_sgdkpjg.yjxdje as kp_sgdkpjg_yjxdje,kp_sgdkpjg.ywgs as kp_sgdkpjg_ywgs,kp_sgdkpjg.zsgds as kp_sgdkpjg_zsgds ";
	ls_sql+=" from  kp_sgdkpjg,sq_sgd,sq_sgdjbbm";
	ls_sql+=" where kp_sgdkpjg.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) and kp_sgdkpjg.sgd=sq_sgd.sgd and  (kp_sgdkpjg.kpjlh="+wherekp_sgdkpjg_kpjlh+") and  (kp_sgdkpjg.sgd='"+wherekp_sgdkpjg_sgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yztscs=cf.fillNull(rs.getString("yztscs"));
		tbyztscs=cf.fillNull(rs.getString("tbyztscs"));
		fcyztscs=cf.fillNull(rs.getString("fcyztscs"));

		kp_sgdkpjg_kpjlh=cf.fillNull(rs.getString("kp_sgdkpjg_kpjlh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		sq_sgdjbbm_sgdjbmc=cf.fillNull(rs.getString("sq_sgdjbbm_sgdjbmc"));
		kp_sgdkpjg_zbj=cf.fillNull(rs.getString("kp_sgdkpjg_zbj"));
		kp_sgdkpjg_bzs=cf.fillNull(rs.getString("kp_sgdkpjg_bzs"));
		kp_sgdkpjg_jcf=cf.fillNull(rs.getString("kp_sgdkpjg_jcf"));
		kp_sgdkpjg_kpgds=cf.fillNull(rs.getString("kp_sgdkpjg_kpgds"));
		kp_sgdkpjg_zjyzldf=cf.fillNull(rs.getString("kp_sgdkpjg_zjyzldf"));
		kp_sgdkpjg_xjyzldf=cf.fillNull(rs.getString("kp_sgdkpjg_xjyzldf"));
		kp_sgdkpjg_cczldf=cf.fillNull(rs.getString("kp_sgdkpjg_cczldf"));
		kp_sgdkpjg_zjyaqdf=cf.fillNull(rs.getString("kp_sgdkpjg_zjyaqdf"));
		kp_sgdkpjg_xjyaqdf=cf.fillNull(rs.getString("kp_sgdkpjg_xjyaqdf"));
		kp_sgdkpjg_ccaqdf=cf.fillNull(rs.getString("kp_sgdkpjg_ccaqdf"));
		kp_sgdkpjg_zjygqdf=cf.fillNull(rs.getString("kp_sgdkpjg_zjygqdf"));
		kp_sgdkpjg_zjygldf=cf.fillNull(rs.getString("kp_sgdkpjg_zjygldf"));
		kp_sgdkpjg_xjygldf=cf.fillNull(rs.getString("kp_sgdkpjg_xjygldf"));
		kp_sgdkpjg_ccgldf=cf.fillNull(rs.getString("kp_sgdkpjg_ccgldf"));
		kp_sgdkpjg_khpjdf=cf.fillNull(rs.getString("kp_sgdkpjg_khpjdf"));
		kp_sgdkpjg_tsdf=cf.fillNull(rs.getString("kp_sgdkpjg_tsdf"));
		kp_sgdkpjg_wxdf=cf.fillNull(rs.getString("kp_sgdkpjg_wxdf"));
		kp_sgdkpjg_ybjdf=cf.fillNull(rs.getString("kp_sgdkpjg_ybjdf"));
		kp_sgdkpjg_bqdf=cf.fillNull(rs.getString("kp_sgdkpjg_bqdf"));
		kp_sgdkpjg_sqzf=cf.fillNull(rs.getString("kp_sgdkpjg_sqzf"));
		kp_sgdkpjg_bqzf=cf.fillNull(rs.getString("kp_sgdkpjg_bqzf"));
		kp_sgdkpjg_sqpm=cf.fillNull(rs.getString("kp_sgdkpjg_sqpm"));
		kp_sgdkpjg_bqpm=cf.fillNull(rs.getString("kp_sgdkpjg_bqpm"));
		kp_sgdkpjg_pmfd=cf.fillNull(rs.getString("kp_sgdkpjg_pmfd"));
		kp_sgdkpjg_hjwbz=cf.fillNull(rs.getString("kp_sgdkpjg_hjwbz"));
		kp_sgdkpjg_qjwbz=cf.fillNull(rs.getString("kp_sgdkpjg_qjwbz"));
		kp_sgdkpjg_sjbz=cf.fillNull(rs.getString("kp_sgdkpjg_sjbz"));
		kp_sgdkpjg_jjbz=cf.fillNull(rs.getString("kp_sgdkpjg_jjbz"));
		ddbl=rs.getDouble("kp_sgdkpjg_ddbl");
		zdbl=rs.getDouble("kp_sgdkpjg_zdbl");
		xdbl=rs.getDouble("kp_sgdkpjg_xdbl");
		kp_sgdkpjg_ddbzs=cf.fillNull(rs.getString("kp_sgdkpjg_ddbzs"));
		kp_sgdkpjg_zdbzs=cf.fillNull(rs.getString("kp_sgdkpjg_zdbzs"));
		kp_sgdkpjg_xdbzs=cf.fillNull(rs.getString("kp_sgdkpjg_xdbzs"));
		kp_sgdkpjg_ddjls=cf.fillNull(rs.getString("kp_sgdkpjg_ddjls"));
		kp_sgdkpjg_zdjls=cf.fillNull(rs.getString("kp_sgdkpjg_zdjls"));
		kp_sgdkpjg_xdjls=cf.fillNull(rs.getString("kp_sgdkpjg_xdjls"));
		kp_sgdkpjg_kdds=cf.fillNull(rs.getString("kp_sgdkpjg_kdds"));
		kp_sgdkpjg_kzds=cf.fillNull(rs.getString("kp_sgdkpjg_kzds"));
		kp_sgdkpjg_kxds=cf.fillNull(rs.getString("kp_sgdkpjg_kxds"));
		kp_sgdkpjg_tsjcdd=cf.fillNull(rs.getString("kp_sgdkpjg_tsjcdd"));
		kp_sgdkpjg_tsjczd=cf.fillNull(rs.getString("kp_sgdkpjg_tsjczd"));
		kp_sgdkpjg_tsjcxd=cf.fillNull(rs.getString("kp_sgdkpjg_tsjcxd"));
		kp_sgdkpjg_kjdds=cf.fillNull(rs.getString("kp_sgdkpjg_kjdds"));
		kp_sgdkpjg_kjzds=cf.fillNull(rs.getString("kp_sgdkpjg_kjzds"));
		kp_sgdkpjg_kjxds=cf.fillNull(rs.getString("kp_sgdkpjg_kjxds"));
		kp_sgdkpjg_kjdzs=cf.fillNull(rs.getString("kp_sgdkpjg_kjdzs"));
		kp_sgdkpjg_kjdze=cf.fillNull(rs.getString("kp_sgdkpjg_kjdze"));
		kp_sgdkpjg_yjdds=cf.fillNull(rs.getString("kp_sgdkpjg_yjdds"));
		kp_sgdkpjg_yjddje=cf.fillNull(rs.getString("kp_sgdkpjg_yjddje"));
		kp_sgdkpjg_yjzds=cf.fillNull(rs.getString("kp_sgdkpjg_yjzds"));
		kp_sgdkpjg_yjzdje=cf.fillNull(rs.getString("kp_sgdkpjg_yjzdje"));
		kp_sgdkpjg_yjxds=cf.fillNull(rs.getString("kp_sgdkpjg_yjxds"));
		kp_sgdkpjg_yjxdje=cf.fillNull(rs.getString("kp_sgdkpjg_yjxdje"));
		kp_sgdkpjg_ywgs=cf.fillNull(rs.getString("kp_sgdkpjg_ywgs"));
		kp_sgdkpjg_zsgds=cf.fillNull(rs.getString("kp_sgdkpjg_zsgds"));
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 查看信息（考评记录号：<%=kp_sgdkpjg_kpjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">施工队</div>
            </td>
            <td width="28%"><%=sq_dwxx_dwmc%> </td>
            <td width="23%"> 
              <div align="right">施工队级别</div>
            </td>
            <td width="27%"><%=sq_sgdjbbm_sgdjbmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">质保金</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_zbj%> </td>
            <td width="23%"> 
              <div align="right">班组数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_bzs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">基础分</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_jcf%> </td>
            <td width="23%"> 
              <div align="right">考评工地数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_kpgds%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">下周期可接大单总数</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_kjdds%> </td>
            <td width="23%"> 
              <div align="right">下周期可接中单总数</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_kjzds%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">下周期可接小单总数</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_kjxds%> </td>
            <td width="23%"> 
              <div align="right"></div>
            </td>
            <td width="27%">&nbsp; </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%" align="right">下周期可接单总数</td>
            <td width="28%"><%=kp_sgdkpjg_kjdzs%></td>
            <td width="23%" align="right">下周期可接单总额</td>
            <td width="27%"><%=kp_sgdkpjg_kjdze%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">质检员质量得分</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_zjyzldf%> </td>
            <td width="23%"> 
              <div align="right">巡检员质量得分</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_xjyzldf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%" bgcolor="#FFFFCC"> 
              <div align="right">公司抽查质量得分</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_cczldf%> </td>
            <td width="23%"> 
              <div align="right"></div>
            </td>
            <td width="27%">&nbsp; </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">质检员安全文明施工得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_zjyaqdf%> </td>
            <td width="23%"> 
              <div align="right">巡检员安全文明施工得分</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_xjyaqdf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">公司抽查安全文明施工得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_ccaqdf%> </td>
            <td width="23%"> 
              <div align="right">质检员工期得分</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_zjygqdf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">质检员管理得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_zjygldf%> </td>
            <td width="23%"> 
              <div align="right">巡检员管理得分</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_xjygldf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">公司抽查管理得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_ccgldf%> </td>
            <td width="23%"> 
              <div align="right">客户评价得分</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_khpjdf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">投诉项得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_tsdf%> </td>
            <td width="23%"> 
              <div align="right">维修项得分</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_wxdf%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="22%"> 
              <div align="right">样板间项得分</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_ybjdf%> </td>
            <td width="23%"> 
              <div align="right"></div>
            </td>
            <td width="27%">&nbsp; </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="22%" align="right">本期得分</td>
            <td width="28%"><%=kp_sgdkpjg_bqdf%></td>
            <td width="23%" align="right">历史总得分</td>
            <td width="27%"><%=kp_sgdkpjg_sqzf%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="22%"> 
              <div align="right">本期总分</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_bqzf%> </td>
            <td width="23%"> 
              <div align="right">本期排名</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_bqpm%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="22%"> 
              <div align="right">上期排名</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_sqpm%> </td>
            <td width="23%"> 
              <div align="right">本期排名分段</div>
            </td>
            <td width="27%"><%
	cf.selectToken(out,"1+1到15位&2+16到45位&3+46位以后",kp_sgdkpjg_pmfd,true);
%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="22%"> 
              <div align="right">最后3位标志</div>
            </td>
            <td width="28%"><%
	cf.selectToken(out,"Y+是&N+否",kp_sgdkpjg_hjwbz,true);
%> </td>
            <td width="23%"> 
              <div align="right">前5位标志</div>
            </td>
            <td width="27%"><%
	cf.selectToken(out,"Y+是&N+否",kp_sgdkpjg_qjwbz,true);
%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="22%"> 
              <div align="right">升级标志</div>
            </td>
            <td width="28%"><%
	cf.selectToken(out,"Y+是&N+否",kp_sgdkpjg_sjbz,true);
%> </td>
            <td width="23%"> 
              <div align="right">降级标志</div>
            </td>
            <td width="27%"><%
	cf.selectToken(out,"Y+是&N+否",kp_sgdkpjg_jjbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">大单比率</div>
            </td>
            <td width="28%"><%=ddbl%>% </td>
            <td width="23%"> 
              <div align="right">可接大单标准数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_ddbzs%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">中单比率</div>
            </td>
            <td width="28%"> <%=zdbl%>% </td>
            <td width="23%"> 
              <div align="right">可接中单标准数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_zdbzs%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">小单比率</div>
            </td>
            <td width="28%"><%=xdbl%>% </td>
            <td width="23%"> 
              <div align="right">可接小单标准数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_xdbzs%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">大单回单奖励数</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_ddjls%> </td>
            <td width="23%"> 
              <div align="right">中单回单奖励数</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_zdjls%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">小单回单奖励数</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_xdjls%> </td>
            <td width="23%"> 
              <div align="right">特殊奖励或处罚大单</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_tsjcdd%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">特殊奖励或处罚中单</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_tsjczd%> </td>
            <td width="23%"> 
              <div align="right">特殊奖励或处罚小单</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_tsjcxd%> </td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%" align="right">非常严重投诉次数</td>
            <td width="28%"><%=fcyztscs%></td>
            <td width="23%" align="right">重大投诉扣大单</td>
            <td width="27%"><%=kp_sgdkpjg_kdds%></td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%" align="right">特别严重投诉次数</td>
            <td width="28%"><%=tbyztscs%></td>
            <td width="23%" align="right">重大投诉扣中单</td>
            <td width="27%"><%=kp_sgdkpjg_kzds%></td>
          </tr>
          <tr bgcolor="#FFCCFF"> 
            <td width="22%"> 
              <div align="right">严重投诉次数</div>
            </td>
            <td width="28%"><%=yztscs%> </td>
            <td width="23%"> 
              <div align="right">重大投诉扣小单</div>
            </td>
            <td width="27%"><%=kp_sgdkpjg_kxds%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">已接大单数</div>
            </td>
            <td width="28%"><%=kp_sgdkpjg_yjdds%> </td>
            <td width="23%"> 
              <div align="right"></div>
            </td>
            <td width="27%">&nbsp; </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">已接大单金额</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_yjddje%> </td>
            <td width="23%"> 
              <div align="right">已接中单数</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_yjzds%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">已接中单金额</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_yjzdje%> </td>
            <td width="23%"> 
              <div align="right">已接小单数</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_yjxds%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">已接小单金额</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_yjxdje%> </td>
            <td width="23%"> 
              <div align="right">已完工数</div>
            </td>
            <td width="27%"> <%=kp_sgdkpjg_ywgs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="22%"> 
              <div align="right">在施工地数</div>
            </td>
            <td width="28%"> <%=kp_sgdkpjg_zsgds%> </td>
            <td width="23%"> 
              <div align="right">&nbsp;</div>
            </td>
            <td width="27%">&nbsp; </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
