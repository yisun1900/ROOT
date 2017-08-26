<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


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
String ls_sql=null;

String dwmc=null;
String dwdz=null;
String dwfzr=null;
String kdsj=null;
String ssfwmc=null;
String dwjbmc=null;
String dmxsmc=null;
String dwdh=null;


String khcz=null;
String mbcz=null;
String wccz=null;
String qdgs=null;
String yczdcl=null;
String mbczdcl=null;
String pjde=null;
String sqdj=null;
String ljdj=null;
String wjdjqds=null;
String scbcz=null;
String zdmczbl=null;
String scbgds=null;
String scbcds=null;
String scbcdbl=null;
String scbpjde=null;
String kllzs=null;
String scbkllb=null;
String scbqdsb=null;
String dmzrs=null;
String bzrysl=null;
String xzsl=null;
String sjrysl=null;
String sjsrjcz=null;
String wcdbrs=null;
String sjsdcl=null;
String lczrs=null;
String lczrrbl=null;
String zrsjscz=null;
String zrscbcz=null;
String zrsjsdj=null;
String zrsjsrs=null;
String zrsjsqds=null;
String zdmczb=null;
String zscbczb=null;
String zdmdjb=null;
String zzrsb=null;
String zzqdsb=null;
String zrsjspjde=null;
String zrsjssjf=null;
String zrsjsmj=null;
String zsjfzsrb=null;
String zrsjspmsjf=null;
String zrrjcz=null;
String sjfsr=null;
String sqsjfds=null;
String sqsjfmj=null;
String pjmhsjf=null;
String sjfzqdsb=null;
String pjpmsjf=null;
String spxse=null;
String zycpxse=null;
String wckhrysl=null;
String wczcz=null;
String wczmj=null;
String ytb=null;
String yhb=null;
String pfmhtzj=null;
String cyczyg=null;
String cydjyg=null;
String scbcyczyg=null;
String byczsm=null;
String cyczsm=null;
String fzyj=null;
String lrr=null;
String lrsj=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc,dwdz,dwfzr,kdsj,ssfwmc,dwjbmc,dmxsmc,dwdh";
	ls_sql+=" FROM sq_dwxx,dm_ssfw,dm_dwjb,dm_dmxs  ";
	ls_sql+=" where sq_dwxx.dwbh='"+dwbh+"'";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		dwdz=cf.fillHtml(rs.getString("dwdz"));
		dwfzr=cf.fillHtml(rs.getString("dwfzr"));
		kdsj=cf.fillHtml(rs.getDate("kdsj"));
		ssfwmc=cf.fillHtml(rs.getString("ssfwmc"));
		dwjbmc=cf.fillHtml(rs.getString("dwjbmc"));
		dmxsmc=cf.fillHtml(rs.getString("dmxsmc"));
		dwdh=cf.fillHtml(rs.getString("dwdh"));
	}
	rs.close();
	ps.close();


	ls_sql="select khcz,mbcz,wccz,qdgs,yczdcl,mbczdcl,pjde,sqdj,ljdj,wjdjqds,scbcz,zdmczbl,scbgds,scbcds,scbcdbl,scbpjde,kllzs,scbkllb,scbqdsb,dmzrs,bzrysl,xzsl,sjrysl,sjsrjcz,wcdbrs,sjsdcl,lczrs,lczrrbl,zrsjscz,zrscbcz,zrsjsdj,zrsjsrs,zrsjsqds,zdmczb,zscbczb,zdmdjb,zzrsb,zzqdsb,zrsjspjde,zrsjssjf,zrsjsmj,zsjfzsrb,zrsjspmsjf,zrrjcz,sjfsr,sqsjfds,sqsjfmj,pjmhsjf,sjfzqdsb,pjpmsjf,spxse,zycpxse,wckhrysl,wczcz,wczmj,ytb,yhb,pfmhtzj,cyczyg,cydjyg,scbcyczyg,byczsm,cyczsm,fzyj,lrr,lrsj ";
	ls_sql+=" from  cw_dmkhjl";
	ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='"+yue+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khcz=cf.fillNull(rs.getString("khcz"));
		mbcz=cf.fillNull(rs.getString("mbcz"));
		wccz=cf.fillNull(rs.getString("wccz"));
		qdgs=cf.fillNull(rs.getString("qdgs"));
		yczdcl=cf.fillNull(rs.getString("yczdcl"));
		mbczdcl=cf.fillNull(rs.getString("mbczdcl"));
		pjde=cf.fillNull(rs.getString("pjde"));
		sqdj=cf.fillNull(rs.getString("sqdj"));
		ljdj=cf.fillNull(rs.getString("ljdj"));
		wjdjqds=cf.fillNull(rs.getString("wjdjqds"));
		scbcz=cf.fillNull(rs.getString("scbcz"));
		zdmczbl=cf.fillNull(rs.getString("zdmczbl"));
		scbgds=cf.fillNull(rs.getString("scbgds"));
		scbcds=cf.fillNull(rs.getString("scbcds"));
		scbcdbl=cf.fillNull(rs.getString("scbcdbl"));
		scbpjde=cf.fillNull(rs.getString("scbpjde"));
		kllzs=cf.fillNull(rs.getString("kllzs"));
		scbkllb=cf.fillNull(rs.getString("scbkllb"));
		scbqdsb=cf.fillNull(rs.getString("scbqdsb"));
		dmzrs=cf.fillNull(rs.getString("dmzrs"));
		bzrysl=cf.fillNull(rs.getString("bzrysl"));
		xzsl=cf.fillNull(rs.getString("xzsl"));
		sjrysl=cf.fillNull(rs.getString("sjrysl"));
		sjsrjcz=cf.fillNull(rs.getString("sjsrjcz"));
		wcdbrs=cf.fillNull(rs.getString("wcdbrs"));
		sjsdcl=cf.fillNull(rs.getString("sjsdcl"));
		lczrs=cf.fillNull(rs.getString("lczrs"));
		lczrrbl=cf.fillNull(rs.getString("lczrrbl"));
		zrsjscz=cf.fillNull(rs.getString("zrsjscz"));
		zrscbcz=cf.fillNull(rs.getString("zrscbcz"));
		zrsjsdj=cf.fillNull(rs.getString("zrsjsdj"));
		zrsjsrs=cf.fillNull(rs.getString("zrsjsrs"));
		zrsjsqds=cf.fillNull(rs.getString("zrsjsqds"));
		zdmczb=cf.fillNull(rs.getString("zdmczb"));
		zscbczb=cf.fillNull(rs.getString("zscbczb"));
		zdmdjb=cf.fillNull(rs.getString("zdmdjb"));
		zzrsb=cf.fillNull(rs.getString("zzrsb"));
		zzqdsb=cf.fillNull(rs.getString("zzqdsb"));
		zrsjspjde=cf.fillNull(rs.getString("zrsjspjde"));
		zrsjssjf=cf.fillNull(rs.getString("zrsjssjf"));
		zrsjsmj=cf.fillNull(rs.getString("zrsjsmj"));
		zsjfzsrb=cf.fillNull(rs.getString("zsjfzsrb"));
		zrsjspmsjf=cf.fillNull(rs.getString("zrsjspmsjf"));
		zrrjcz=cf.fillNull(rs.getString("zrrjcz"));
		sjfsr=cf.fillNull(rs.getString("sjfsr"));
		sqsjfds=cf.fillNull(rs.getString("sqsjfds"));
		sqsjfmj=cf.fillNull(rs.getString("sqsjfmj"));
		pjmhsjf=cf.fillNull(rs.getString("pjmhsjf"));
		sjfzqdsb=cf.fillNull(rs.getString("sjfzqdsb"));
		pjpmsjf=cf.fillNull(rs.getString("pjpmsjf"));
		spxse=cf.fillNull(rs.getString("spxse"));
		zycpxse=cf.fillNull(rs.getString("zycpxse"));
		wckhrysl=cf.fillNull(rs.getString("wckhrysl"));
		wczcz=cf.fillNull(rs.getString("wczcz"));
		wczmj=cf.fillNull(rs.getString("wczmj"));
		ytb=cf.fillNull(rs.getString("ytb"));
		yhb=cf.fillNull(rs.getString("yhb"));
		pfmhtzj=cf.fillNull(rs.getString("pfmhtzj"));
		cyczyg=cf.fillNull(rs.getString("cyczyg"));
		cydjyg=cf.fillNull(rs.getString("cydjyg"));
		scbcyczyg=cf.fillNull(rs.getString("scbcyczyg"));
		byczsm=cf.fillNull(rs.getString("byczsm"));
		cyczsm=cf.fillNull(rs.getString("cyczsm"));
		fzyj=cf.fillNull(rs.getString("fzyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="SaveEditCw_dmkhjl.jsp" name="insertform" >


<CENTER >
  <B>店面月运营统计</B><BR>
    <b>(统计时间：<%=nian%>年<%=yue%>月)</b>
    <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
      <tr  align="center"> 
        <td colspan="6" bgcolor="#CCCCCC">基本情况</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>店面名称</b></td>
        <td width="17%"><%=dwmc%></td>
        <td width="16%" align="right"><b>店面地址</b></td>
        <td colspan="3"><%=dwdz%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>店面级别</b></td>
        <td width="17%"><%=dwjbmc%></td>
        <td width="16%" align="right"><b>店面负责人</b></td>
        <td width="17%"><%=dwfzr%></td>
        <td width="17%" align="right"><b>店面电话</b></td>
        <td width="16%"><%=dwdh%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>店面形式</b></td>
        <td width="17%"><%=dmxsmc%></td>
        <td width="16%" align="right"><b>建店时间</b></td>
        <td width="17%"><%=kdsj%></td>
        <td width="17%" align="right"><b>所属方位</b></td>
        <td width="16%"><%=ssfwmc%></td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>数据分析统计</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月考核产值</td>
        <td width="17%"><%=khcz%></td>
        <td width="16%" align="right">市场部产值</td>
        <td width="17%"> <%=scbcz%> </td>
        <td width="17%" align="right">店面总人数</td>
        <td width="16%"> <%=dmzrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月目标产值</td>
        <td width="17%"><%=mbcz%> </td>
        <td width="16%" align="right"><font color="#0000CC">占店面产值比例</font></td>
        <td width="17%"> <%=zdmczbl%> </td>
        <td width="17%" align="right">标准人员数量</td>
        <td width="16%"> <%=bzrysl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月完成产值</td>
        <td width="17%"> <%=wccz%> </td>
        <td width="16%" align="right">市场部供单个数</td>
        <td width="17%"> <%=scbgds%> </td>
        <td width="17%" align="right">小组数量</td>
        <td width="16%"> <%=xzsl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">月产值达成率</font></td>
        <td width="17%"> <%=yczdcl%> </td>
        <td width="16%" align="right">成单个数</td>
        <td width="17%"> <%=scbcds%> </td>
        <td width="17%" align="right">设计人员数量</td>
        <td width="16%"> <%=sjrysl%> </td>
      </tr>
      <tr>
        <td align="right" width="17%"><font color="#0000CC">目标产值达成率</font></td>
        <td width="17%"><%=mbczdcl%> </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">平均单额</font></td>
        <td width="17%"> <%=pjde%> </td>
        <td width="16%" align="right"><font color="#0000CC">成单比例</font></td>
        <td width="17%"> <%=scbcdbl%> </td>
        <td width="17%" align="right"><font color="#0000CC">设计师人均产值</font></td>
        <td width="16%"> <%=sjsrjcz%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">签单个数</td>
        <td width="17%"> <%=qdgs%> </td>
        <td width="16%" align="right"><font color="#0000CC">市场部平均单额</font></td>
        <td width="17%"> <%=scbpjde%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>完成达标人数</td>
        <td width="16%"> <%=wcdbrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月收取定金</td>
        <td width="17%"> <%=sqdj%> </td>
        <td width="16%" align="right">客流量总数</td>
        <td width="17%"> <%=kllzs%> </td>
        <td width="17%" align="right"><font color="#0000CC">达成率</font></td>
        <td width="16%"> <%=sjsdcl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月累计定金</td>
        <td width="17%"> <%=ljdj%> </td>
        <td width="16%" align="right"><font color="#0000CC">市场部占总流量比</font></td>
        <td width="17%"> <%=scbkllb%> </td>
        <td width="17%" align="right">零产值人员数</td>
        <td width="16%"> <%=lczrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">未交定金签单数</td>
        <td width="17%"> <%=wjdjqds%> </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比</font></td>
        <td width="17%"> <%=scbqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">零产值人员比例</font></td>
        <td width="16%"> <%=lczrrbl%> </td>
      </tr>
      <tr  align="center"> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>主任及主任级以上设计师分析统计</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师产值</td>
        <td width="17%"> <%=zrsjscz%> </td>
        <td width="16%" align="right"><font color="#0000CC">占店面产值比率</font></td>
        <td width="17%"> <%=zdmczb%> </td>
        <td width="17%" align="right"><font color="#0000CC">平均单额</font></td>
        <td width="16%"> <%=zrsjspjde%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任市场部产值</td>
        <td width="17%"> <%=zrscbcz%> </td>
        <td width="16%" align="right"><font color="#0000CC">占市场部产值比率</font></td>
        <td width="17%"> <%=zscbczb%> </td>
        <td width="17%" align="right">当月设计费收入</td>
        <td width="16%"> <%=zsjfzsrb%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师收取定金</td>
        <td width="17%"> <%=zrsjsdj%> </td>
        <td width="16%" align="right"><font color="#0000CC">占店面定金比率</font></td>
        <td width="17%"> <%=zdmdjb%> </td>
        <td width="17%" align="right"><font color="#0000CC">占设计费总收入比</font></td>
        <td width="16%"> <%=zrsjsmj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师人数</td>
        <td width="17%"> <%=zrsjsrs%> </td>
        <td width="16%" align="right"><font color="#0000CC">占总人数比率</font></td>
        <td width="17%"> <%=zzrsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">平均每平米设计费</font></td>
        <td width="16%"> <%=zrsjspmsjf%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师签单数</td>
        <td width="17%"> <%=zrsjsqds%> </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比率</font></td>
        <td width="17%"> <%=zzqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">主任设计师人均产值</font></td>
        <td width="16%"> <%=zrrjcz%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">收设计费面积</td>
        <td width="17%"> <%=zrsjssjf%> </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp; </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>设计费分析统计</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月设计费收入</td>
        <td width="17%"> <%=sjfsr%> </td>
        <td width="16%" align="right">收取设计费单数</td>
        <td width="17%"> <%=sqsjfds%> </td>
        <td width="17%" align="right">共收取设计费面积</td>
        <td width="16%"> <%=sqsjfmj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">平均每户设计费</font></td>
        <td width="17%"> <%=pjmhsjf%> </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比率</font></td>
        <td width="17%"> <%=sjfzqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">平均每平米设计费</font></td>
        <td width="16%"> <%=pjpmsjf%> </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>5S商品及自有产品销售</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>5S商品销售金额</td>
        <td width="17%"> <%=spxse%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>自有产品销售金额</td>
        <td width="17%"> <%=zycpxse%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>完成考核人员数量</td>
        <td width="16%"> <%=wckhrysl%> </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>汇总分析</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>完成总产值</td>
        <td width="17%"> <%=wczcz%> </td>
        <td width="16%" align="right">完成总面积</td>
        <td width="17%"> <%=wczmj%> </td>
        <td width="17%" align="right"><font color="#0000CC">平方米合同造价</font></td>
        <td width="16%"> <%=pfmhtzj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>月同比</td>
        <td width="17%"> <%=ytb%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>月环比</td>
        <td width="17%"> <%=yhb%> </td>
        <td width="17%" align="center">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>下月预估情况</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>次月产值预估</td>
        <td width="17%"> <%=cyczyg%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>次月定金预估</td>
        <td width="17%"> <%=cydjyg%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>市场部次月产值预估</td>
        <td width="16%"> <%=scbcyczyg%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>店面经理本月产值说明</td>
        <td colspan="5"><%=byczsm%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>店面经理次月产值说明</td>
        <td colspan="5"><%=cyczsm%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>分总意见</td>
        <td colspan="5"><%=fzyj%> </td>
      </tr>
    </table>
</CENTER >
</form>
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

