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
  <B>修改－店面月运营统计</B><BR>
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
        <td width="17%"> 
          <input type="text" name="khcz" size="15" maxlength="17"  value="<%=khcz%>" >
        </td>
        <td width="16%" align="right">市场部产值</td>
        <td width="17%"> 
          <input type="text" name="scbcz" size="15" maxlength="17"  value="<%=scbcz%>" >
        </td>
        <td width="17%" align="right">店面总人数</td>
        <td width="16%"> 
          <input type="text" name="dmzrs" size="15" maxlength="8"  value="<%=dmzrs%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月目标产值</td>
        <td width="17%"> 
          <input type="text" name="mbcz" size="15" maxlength="17"  value="<%=mbcz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占店面产值比例</font></td>
        <td width="17%"> 
          <input type="text" name="zdmczbl" size="15" maxlength="9"  value="<%=zdmczbl%>" >
        </td>
        <td width="17%" align="right">标准人员数量</td>
        <td width="16%"> 
          <input type="text" name="bzrysl" size="15" maxlength="8"  value="<%=bzrysl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月完成产值</td>
        <td width="17%"> 
          <input type="text" name="wccz" size="15" maxlength="17"  value="<%=wccz%>" >
        </td>
        <td width="16%" align="right">市场部供单个数</td>
        <td width="17%"> 
          <input type="text" name="scbgds" size="15" maxlength="8"  value="<%=scbgds%>" >
        </td>
        <td width="17%" align="right">小组数量</td>
        <td width="16%"> 
          <input type="text" name="xzsl" size="15" maxlength="8"  value="<%=xzsl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">考核产值达成率</font></td>
        <td width="17%"> 
          <input type="text" name="yczdcl" size="15" maxlength="9"  value="<%=yczdcl%>" >
        </td>
        <td width="16%" align="right">成单个数</td>
        <td width="17%"> 
          <input type="text" name="scbcds" size="15" maxlength="8"  value="<%=scbcds%>" >
        </td>
        <td width="17%" align="right">设计人员数量</td>
        <td width="16%"> 
          <input type="text" name="sjrysl" size="15" maxlength="8"  value="<%=sjrysl%>" >
        </td>
      </tr>
      <tr>
        <td align="right" width="17%"><font color="#0000CC">目标产值达成率</font></td>
        <td width="17%">
          <input type="text" name="mbczdcl" size="15" maxlength="9"  value="<%=mbczdcl%>" >
        </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">平均单额</font></td>
        <td width="17%"> 
          <input type="text" name="pjde" size="15" maxlength="8"  value="<%=pjde%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">成单比例</font></td>
        <td width="17%"> 
          <input type="text" name="scbcdbl" size="15" maxlength="9"  value="<%=scbcdbl%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">设计师人均产值</font></td>
        <td width="16%"> 
          <input type="text" name="sjsrjcz" size="15" maxlength="8"  value="<%=sjsrjcz%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">签单个数</td>
        <td width="17%"> 
          <input type="text" name="qdgs" size="15" maxlength="8"  value="<%=qdgs%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">市场部平均单额</font></td>
        <td width="17%"> 
          <input type="text" name="scbpjde" size="15" maxlength="8"  value="<%=scbpjde%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>完成达标人数</td>
        <td width="16%"> 
          <input type="text" name="wcdbrs" size="15" maxlength="8"  value="<%=wcdbrs%>"  onChange="js(insertform)">
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月收取定金</td>
        <td width="17%"> 
          <input type="text" name="sqdj" size="15" maxlength="17"  value="<%=sqdj%>" >
        </td>
        <td width="16%" align="right">客流量总数</td>
        <td width="17%"> 
          <input type="text" name="kllzs" size="15" maxlength="8"  value="<%=kllzs%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">达成率</font></td>
        <td width="16%"> 
          <input type="text" name="sjsdcl" size="15" maxlength="9"  value="<%=sjsdcl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">当月累计定金</td>
        <td width="17%"> 
          <input type="text" name="ljdj" size="15" maxlength="17"  value="<%=ljdj%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">市场部占总流量比</font></td>
        <td width="17%"> 
          <input type="text" name="scbkllb" size="15" maxlength="9"  value="<%=scbkllb%>" >
        </td>
        <td width="17%" align="right">零产值人员数</td>
        <td width="16%"> 
          <input type="text" name="lczrs" size="15" maxlength="8"  value="<%=lczrs%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">未交定金签单数</td>
        <td width="17%"> 
          <input type="text" name="wjdjqds" size="15" maxlength="8"  value="<%=wjdjqds%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比</font></td>
        <td width="17%"> 
          <input type="text" name="scbqdsb" size="15" maxlength="9"  value="<%=scbqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">零产值人员比例</font></td>
        <td width="16%"> 
          <input type="text" name="lczrrbl" size="15" maxlength="9"  value="<%=lczrrbl%>" >
        </td>
      </tr>
      <tr  align="center"> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>主任及主任级以上设计师分析统计</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师产值</td>
        <td width="17%"> 
          <input type="text" name="zrsjscz" size="15" maxlength="17"  value="<%=zrsjscz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占店面产值比率</font></td>
        <td width="17%"> 
          <input type="text" name="zdmczb" size="15" maxlength="9"  value="<%=zdmczb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">平均单额</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjspjde" size="15" maxlength="8"  value="<%=zrsjspjde%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任市场部产值</td>
        <td width="17%"> 
          <input type="text" name="zrscbcz" size="15" maxlength="17"  value="<%=zrscbcz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占市场部产值比率</font></td>
        <td width="17%"> 
          <input type="text" name="zscbczb" size="15" maxlength="9"  value="<%=zscbczb%>" >
        </td>
        <td width="17%" align="right">当月设计费收入</td>
        <td width="16%"> 
          <input type="text" name="zsjfzsrb" size="15" maxlength="9"  value="<%=zsjfzsrb%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师收取定金</td>
        <td width="17%"> 
          <input type="text" name="zrsjsdj" size="15" maxlength="17"  value="<%=zrsjsdj%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占店面定金比率</font></td>
        <td width="17%"> 
          <input type="text" name="zdmdjb" size="15" maxlength="9"  value="<%=zdmdjb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">占设计费总收入比</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjsmj" size="15" maxlength="8"  value="<%=zrsjsmj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师人数</td>
        <td width="17%"> 
          <input type="text" name="zrsjsrs" size="15" maxlength="8"  value="<%=zrsjsrs%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占总人数比率</font></td>
        <td width="17%"> 
          <input type="text" name="zzrsb" size="15" maxlength="9"  value="<%=zzrsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">平均每平米设计费</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjspmsjf" size="15" maxlength="8"  value="<%=zrsjspmsjf%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">主任设计师签单数</td>
        <td width="17%"> 
          <input type="text" name="zrsjsqds" size="15" maxlength="8"  value="<%=zrsjsqds%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比率</font></td>
        <td width="17%"> 
          <input type="text" name="zzqdsb" size="15" maxlength="9"  value="<%=zzqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">主任设计师人均产值</font></td>
        <td width="16%"> 
          <input type="text" name="zrrjcz" size="15" maxlength="8"  value="<%=zrrjcz%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">收设计费面积</td>
        <td width="17%"> 
          <input type="text" name="zrsjssjf" size="15" maxlength="17"  value="<%=zrsjssjf%>" >
        </td>
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
        <td width="17%"> 
          <input type="text" name="sjfsr" size="15" maxlength="17"  value="<%=sjfsr%>" >
        </td>
        <td width="16%" align="right">收取设计费单数</td>
        <td width="17%"> 
          <input type="text" name="sqsjfds" size="15" maxlength="8"  value="<%=sqsjfds%>" >
        </td>
        <td width="17%" align="right">共收取设计费面积</td>
        <td width="16%"> 
          <input type="text" name="sqsjfmj" size="15" maxlength="8"  value="<%=sqsjfmj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">平均每户设计费</font></td>
        <td width="17%"> 
          <input type="text" name="pjmhsjf" size="15" maxlength="8"  value="<%=pjmhsjf%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">占总签单数比率</font></td>
        <td width="17%"> 
          <input type="text" name="sjfzqdsb" size="15" maxlength="9"  value="<%=sjfzqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">平均每平米设计费</font></td>
        <td width="16%"> 
          <input type="text" name="pjpmsjf" size="15" maxlength="8"  value="<%=pjpmsjf%>" >
        </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>5S商品及自有产品销售</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>5S商品销售金额</td>
        <td width="17%"> 
          <input type="text" name="spxse" size="15" maxlength="17"  value="<%=spxse%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>自有产品销售金额</td>
        <td width="17%"> 
          <input type="text" name="zycpxse" size="15" maxlength="17"  value="<%=zycpxse%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>完成考核人员数量</td>
        <td width="16%"> 
          <input type="text" name="wckhrysl" size="15" maxlength="8"  value="<%=wckhrysl%>" >
        </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>汇总分析</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>完成总产值</td>
        <td width="17%"> 
          <input type="text" name="wczcz" size="15" maxlength="8"  value="<%=wczcz%>" >
        </td>
        <td width="16%" align="right">完成总面积</td>
        <td width="17%"> 
          <input type="text" name="wczmj" size="15" maxlength="8"  value="<%=wczmj%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">平方米合同造价</font></td>
        <td width="16%"> 
          <input type="text" name="pfmhtzj" size="15" maxlength="8"  value="<%=pfmhtzj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>月同比</td>
        <td width="17%"> 
          <input type="text" name="ytb" size="15" maxlength="9"  value="<%=ytb%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>月环比</td>
        <td width="17%"> 
          <input type="text" name="yhb" size="15" maxlength="9"  value="<%=yhb%>" >
        </td>
        <td width="17%" align="center">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>下月预估情况</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>次月产值预估</td>
        <td width="17%"> 
          <input type="text" name="cyczyg" size="15" maxlength="17"  value="<%=cyczyg%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>次月定金预估</td>
        <td width="17%"> 
          <input type="text" name="cydjyg" size="15" maxlength="17"  value="<%=cydjyg%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>市场部次月产值预估</td>
        <td width="16%"> 
          <input type="text" name="scbcyczyg" size="15" maxlength="17"  value="<%=scbcyczyg%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>店面经理本月产值说明</td>
        <td colspan="5"> 
          <textarea name="byczsm" cols="73" rows="3"><%=byczsm%></textarea>
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>店面经理次月产值说明</td>
        <td colspan="5"> 
          <textarea name="cyczsm" cols="73" rows="3"><%=cyczsm%></textarea>
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>分总意见</td>
        <td colspan="5"> 
          <textarea name="fzyj" cols="73" rows="3"><%=fzyj%></textarea>
        </td>
      </tr>
      <tr align="center" bgcolor="#CCCCCC"> 
        <td colspan="6" height="38"> 
          <input type="hidden" name="dwbh" value="<%=dwbh%>" >
          <input type="hidden" name="nian" value="<%=nian%>" >
          <input type="hidden" name="yue" value="<%=yue%>" >
          <input type="button"  value="保存" onClick="f_do(insertform)" name="button">
        </td>
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function js(FormName)
{  
	var sjsdcl=FormName.wcdbrs.value*100.0/FormName.dmzrs.value;
	sjsdcl=round(sjsdcl,2);

	FormName.sjsdcl.value=sjsdcl;
}    


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(!(isFloat(FormName.khcz, "考核产值"))) {
		return false;
	}
	if(!(isFloat(FormName.mbcz, "目标产值"))) {
		return false;
	}
	if(!(isFloat(FormName.wccz, "完成产值"))) {
		return false;
	}
	if(!(isNumber(FormName.qdgs, "签单个数"))) {
		return false;
	}
	if(!(isFloat(FormName.yczdcl, "考核产值达成率"))) {
		return false;
	}
	if(!(isFloat(FormName.mbczdcl, "目标产值达成率"))) {
		return false;
	}
	if(!(isNumber(FormName.pjde, "平均单额"))) {
		return false;
	}
	if(!(isFloat(FormName.sqdj, "收取定金"))) {
		return false;
	}
	if(!(isFloat(FormName.ljdj, "累计定金"))) {
		return false;
	}
	if(!(isNumber(FormName.wjdjqds, "未交定金签单数"))) {
		return false;
	}
	if(!(isFloat(FormName.scbcz, "市场部产值"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmczbl, "占店面产值比例"))) {
		return false;
	}
	if(!(isNumber(FormName.scbgds, "市场部供单数"))) {
		return false;
	}
	if(!(isNumber(FormName.scbcds, "市场部成单数"))) {
		return false;
	}
	if(!(isFloat(FormName.scbcdbl, "市场部成单比例"))) {
		return false;
	}
	if(!(isNumber(FormName.scbpjde, "市场部平均单额"))) {
		return false;
	}
	if(!(isNumber(FormName.kllzs, "客流量总数"))) {
		return false;
	}
	if(!(isFloat(FormName.scbkllb, "市场部占总流量比"))) {
		return false;
	}
	if(!(isFloat(FormName.scbqdsb, "占总签单数比"))) {
		return false;
	}
	if(!(isNumber(FormName.dmzrs, "店面总人数"))) {
		return false;
	}
	if(!(isNumber(FormName.bzrysl, "标准人员数量"))) {
		return false;
	}
	if(!(isNumber(FormName.xzsl, "小组数量"))) {
		return false;
	}
	if(!(isNumber(FormName.sjrysl, "设计人员数量"))) {
		return false;
	}
	if(!(isNumber(FormName.sjsrjcz, "设计师人均产值"))) {
		return false;
	}
	if(!(isNumber(FormName.wcdbrs, "完成达标人数"))) {
		return false;
	}
	if(!(isFloat(FormName.sjsdcl, "设计师达成率"))) {
		return false;
	}
	if(!(isNumber(FormName.lczrs, "零产值人员数"))) {
		return false;
	}
	if(!(isFloat(FormName.lczrrbl, "零产值人员比例"))) {
		return false;
	}
	if(!(isFloat(FormName.zrsjscz, "主任设计师产值"))) {
		return false;
	}
	if(!(isFloat(FormName.zrscbcz, "主任市场部产值"))) {
		return false;
	}
	if(!(isFloat(FormName.zrsjsdj, "主任设计师收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.zrsjsrs, "主任设计师人数"))) {
		return false;
	}
	if(!(isNumber(FormName.zrsjsqds, "主任设计师签单数"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmczb, "占店面产值比率"))) {
		return false;
	}
	if(!(isFloat(FormName.zscbczb, "占市场部产值比率"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmdjb, "占店面定金比率"))) {
		return false;
	}
	if(!(isFloat(FormName.zzrsb, "占总人数比率"))) {
		return false;
	}
	if(!(isFloat(FormName.zzqdsb, "占总签单数比率"))) {
		return false;
	}
	if(!(isNumber(FormName.zrsjspjde, "主任设计师平均单额"))) {
		return false;
	}
	if(!(isFloat(FormName.zrsjssjf, "主任设计师收设计费"))) {
		return false;
	}
	if(!(isNumber(FormName.zrsjsmj, "主任设计师设计费面积"))) {
		return false;
	}
	if(!(isFloat(FormName.zsjfzsrb, "占设计费总收入比"))) {
		return false;
	}
	if(!(isNumber(FormName.zrsjspmsjf, "主任设计师平米设计费"))) {
		return false;
	}
	if(!(isNumber(FormName.zrrjcz, "主任设计师人均产值"))) {
		return false;
	}
	if(!(isFloat(FormName.sjfsr, "设计费收入"))) {
		return false;
	}
	if(!(isNumber(FormName.sqsjfds, "收取设计费单数"))) {
		return false;
	}
	if(!(isNumber(FormName.sqsjfmj, "收取设计费面积"))) {
		return false;
	}
	if(!(isNumber(FormName.pjmhsjf, "平均每户设计费"))) {
		return false;
	}
	if(!(isFloat(FormName.sjfzqdsb, "设计费占总签单数比率"))) {
		return false;
	}
	if(!(isNumber(FormName.pjpmsjf, "平均每平米设计费"))) {
		return false;
	}
	if(!(isFloat(FormName.spxse, "5S商品销售金额"))) {
		return false;
	}
	if(!(isFloat(FormName.zycpxse, "自有产品销售金额"))) {
		return false;
	}
	if(!(isNumber(FormName.wckhrysl, "完成考核人员数量"))) {
		return false;
	}
	if(!(isNumber(FormName.wczcz, "完成总产值"))) {
		return false;
	}
	if(!(isNumber(FormName.wczmj, "完成总面积"))) {
		return false;
	}
	if(!(isFloat(FormName.ytb, "月同比"))) {
		return false;
	}
	if(!(isFloat(FormName.yhb, "月环比"))) {
		return false;
	}
	if(!(isNumber(FormName.pfmhtzj, "平方米合同造价"))) {
		return false;
	}
	if(!(isFloat(FormName.cyczyg, "次月产值预估"))) {
		return false;
	}
	if(!(isFloat(FormName.cydjyg, "次月定金预估"))) {
		return false;
	}
	if(!(isFloat(FormName.scbcyczyg, "市场部次月产值预估"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
