<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String dqbm=null;

String jc_mmydd_khxm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sqdj=null;
String sgd="";
String bzdh="";
String lxfs=null;
String sgbz=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String htrq=null;
String dwmc=null;
String sjs=null;
String hth=null;
String cxhdbm=null;
String pdgc=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String htbz=null;
double fwf=0;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double htje=0;
double zqmmhtje=0;
double zqwjhtje=0;
double zqblhtje=0;
double wdzje=0;
double mmzkl=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sq_dwxx.dqbm,crm_khxx.fgsbh,jc_mmydd.xmzy,crm_khxx.khxm,jhazsj,sqdj,htrq";
	ls_sql+=" ,sgd,sgbz,dwmc,sjs,hth,cxhdbm,pdgc,lxfs,fwdz,jc_mmydd.htbz";
	ls_sql+=" ,fwf,mmhtje,wjhtje,blhtje,htje,zqmmhtje,zqwjhtje,zqblhtje,wdzje ,mmzkl";
	ls_sql+=" from  jc_mmydd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)  and yddbh='"+yddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("sqdj"));
		htrq=cf.fillNull(rs.getDate("htrq"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		htbz=cf.fillNull(rs.getString("htbz"));

		fwf=rs.getDouble("fwf");
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		htje=rs.getDouble("htje");

		zqmmhtje=rs.getDouble("zqmmhtje");
		zqwjhtje=rs.getDouble("zqwjhtje");
		zqblhtje=rs.getDouble("zqblhtje");
		wdzje=rs.getDouble("wdzje");
		mmzkl=rs.getDouble("mmzkl");
	}
	rs.close();
	ps.close();

	wdzje=cf.round(wdzje,0);

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>松下亿达木门确认表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="100%" > 
        <table width="100%" border="0" style='FONT-SIZE: 20px'>
          <tr> 
            <td width="40%"><strong>附件号：<%=yddbh%></strong></td>
            <td width="60%"><strong>元 洲 木 门 合 同 附 件</strong></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="391" scope="row">客户姓名：<%=jc_mmydd_khxm%></td>
          <td  scope="row">家装合同号：<%=hth%> </td>
          <td width="293" scope="row">计划成品出库日期：<%=jc_mmydd_jhazsj%></td>
        </tr>
        <tr>
          <td width="308" scope="row"> 
            <div align="left">联系方式：<%=lxfs%> </div>
          </td>
          <td width="284">施工班长：<%=sgbz%><%=bzdh%></td>
          <td width="284">签约店面/家装设计师：<%=dwmc%>/<%=sjs%></td>
        </tr>
        <tr> 
          <td width="391" scope="row">地址：<%=fwdz%></td>
          <td width="308" scope="row"> 
            <div align="left">传真工厂(<%=pdgc%>)记录：</div>
          </td>
          <td width="284">参加促销活动：<%=cxhdbm%></td>
        </tr>
        <tr>
          <td width="391" scope="row">项目专员：<%=xmzy%></td>
          <td width="308" scope="row">项目专员电话：<%=xmzydh%></td>
          <td width="284">&nbsp;</td>
        </tr>
      </table>
      <b style='FONT-SIZE: 14px'>木制品部分</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="2%">&nbsp;</td>
          <td  width="5%">款式</td>
          <td  width="7%">开启方向</td>
          <td  width="6%">安装位置</td>
          <td  width="4%">单双口</td>
          <td  width="22%">油色<材质></td>
          <td  width="7%">地材种类</td>
          <td  width="10%">门洞(宽*高*厚)（mm）</td>
          <td  width="4%">门扇宽mm</td>
          <td  width="7%">价格(元)</td>
          <td  width="8%">玻璃种类</td>
          <td  width="18%">备注</td>
        </tr>

<%
	String mmdglxbm=null;
	String mmdglxmc=null;
	String mmxh=null;
	String azwzmc=null;
	String kqfxmc=null;
	String dsk=null;
	String czmc=null;
	String dczlmc=null;
	String md=null;
	String mdk=null;
	String mdg=null;
	String qh=null;
	String ms=null;
	String bzdj=null;
	String dj=null;
	double zqzj=0;
	double zj=0;
	double allzqzj=0;
	double allzj=0;
	String sfsmjcc=null;
	String blxh=null;
	String ysbm=null;
	String mmczmc=null;
	String sfydc=null;
	String ctbs=null;
	String tjx=null;
	String zp=null;
	String bz=null;
	String mtxmc=null;
	String mxxmc=null;
	String sl=null;

	int row=0;
	ls_sql="SELECT jc_mmdgdmx.mmdglxbm,mmdglxmc,jc_mmdgdmx.ysbm,mmczmc,jc_mmdgdmx.mmxh,azwzmc,kqfxmc,mtxmc,mxxmc,DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口') dsk,czmc";
	ls_sql+=" ,dczlmc||'('||jc_mmdgdmx.dbh||')' dczlmc,jc_mmdgdmx.mdk,jc_mmdgdmx.mdg,jc_mmdgdmx.qh,jc_mmdgdmx.sl";
	ls_sql+=" ,TO_CHAR(jc_mmdgdmx.mdk-95) ms,jc_mmdgdmx.sl*jc_mmdgdmx.bzdj zqzj,jc_mmdgdmx.sl*jc_mmdgdmx.dj zj,jc_mmdgdmx.bzdj,jc_mmdgdmx.dj,blxh,jc_mmdgdmx.bz ";
	ls_sql+=" ,DECODE(jc_mmdgdmx.sfsmjcc,'Y','松木集成材;','N','') sfsmjcc,jc_mmxhb.zp,jc_mmdgdmx.sfydc,jc_mmdgdmx.ctbs,jc_mmdgdmx.tjx";
	ls_sql+=" FROM dm_czbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm,jdm_mmczbm,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.yddbh='"+yddbh+"'  and jc_mmdgdmx.lx='1'";
    ls_sql+=" and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mmdglxmc=cf.fillNull(rs.getString("mmdglxmc"));
		mmxh=cf.fillHtml(rs.getString("mmxh"));
		azwzmc=cf.fillHtml(rs.getString("azwzmc"));
		kqfxmc=cf.fillHtml(rs.getString("kqfxmc"));
		mtxmc=cf.fillNull(rs.getString("mtxmc"));
		mxxmc=cf.fillNull(rs.getString("mxxmc"));
		dsk=cf.fillHtml(rs.getString("dsk"));
		czmc=cf.fillHtml(rs.getString("czmc"));
		dczlmc=cf.fillHtml(rs.getString("dczlmc"));
		mdk=cf.fillHtml(rs.getString("mdk"));
		mdg=cf.fillHtml(rs.getString("mdg"));
		qh=cf.fillHtml(rs.getString("qh"));
		ms=cf.fillHtml(rs.getString("ms"));
		bzdj=cf.fillHtml(rs.getString("bzdj"));
		dj=cf.fillHtml(rs.getString("dj"));
		zqzj=rs.getDouble("zqzj");
		zj=rs.getDouble("zj");
		sfsmjcc=cf.fillHtml(rs.getString("sfsmjcc"));
		blxh=cf.fillHtml(rs.getString("blxh"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		mmczmc=cf.fillNull(rs.getString("mmczmc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		zp=cf.fillHtml(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		sl=cf.fillNull(rs.getString("sl"));

		allzj+=zj;
		allzqzj+=zqzj;



		if (sfydc.equals("Y"))//Y：有顶窗；N：无顶窗
		{
			bz="有顶窗;"+bz;
		}
		if (ctbs.equals("3"))//3：三边；4：四边
		{
			bz="门套/窗套三边;"+bz;
		}
		else if (ctbs.equals("4"))//3：三边；4：四边
		{
			bz="门套/窗套四边;"+bz;
		}
		if (ysbm.equals("14") || ysbm.equals("15"))//14:白混门套＋清油门扇;15:清油门套＋白混门扇
		{
			bz=mmczmc+";"+bz;
		}

		if (!mtxmc.equals(""))
		{
			bz=mtxmc+";"+bz;
		}
		if (!mxxmc.equals(""))
		{
			bz=mxxmc+";"+bz;
		}
		if (bz.equals(""))
		{
			bz="&nbsp;";
		}

//		bz="<font size='2'>"+bz+"</font>";

		row++;

		
		if (mmdglxbm.equals("01"))//01:整樘门
		{
			md=mdk+"*"+mdg+"*"+qh;
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td><%=mmxh%></td>
			  <td><%=kqfxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%>樘</td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("41"))//41:踢脚线
		{
			md="长："+tjx;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%>延米</td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>/延米</td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("51"))//51:护角（扣角、边条）
		{
			md="宽:"+mdk+"；长:"+mdg;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("42"))//42:外飘窗的平台上口
		{
			md="宽:"+mdk+"；厚:"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("15") || mmdglxbm.equals("16"))//15:双口外飘窗的立口;//16:单口外飘窗的立口
		{
			md="高:"+mdg+"；厚:"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else{
			md=mdk+"*"+mdg+"*"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	if (cf.round(allzj,0)!=cf.round(mmhtje,0))
	{
		out.println("<BR><font color=\"#FF0000\">【木门合同金额-折后】错误！主合同与明细不一致，主合同["+cf.round(mmhtje,0)+"]，明细["+cf.round(allzj,0)+"]</font>");
		return;
	}

	if (cf.round(allzqzj,0)!=cf.round(zqmmhtje,0))
	{
		out.println("<BR><font color=\"#FF0000\">【木门合同金额-折前】错误！主合同与明细不一致，主合同["+cf.round(zqmmhtje,0)+"]，明细["+cf.round(allzqzj,0)+"]</font>");
		return;
	}
%> 
		<tr align="center"> 
		  <td colspan="6"><木制品部分>金额总计：<%=cf.formatDouble(allzqzj)%>元</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
      </table>
		
      <%
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
%> <b style='FONT-SIZE: 14px'>五金类部分</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="4%">序号</td>
          <td  width="20%">种类</td>
          <td  width="12%">品牌</td>
          <td  width="12%">型号</td>
          <td  width="8%">单位</td>
          <td  width="8%">单价</td>
          <td  width="8%">数量</td>
          <td  width="10%">金 额</td>
          <td  width="20%">备注</td>
        </tr>
        <%

	ls_sql="SELECT rownum,wjmc,wjjmc,jc_wjjddmx.xinghao,jldw,TO_CHAR(jc_wjjddmx.bzdj),jc_wjjddmx.sl,jc_wjjddmx.sl*jc_wjjddmx.bzdj,jc_wjjddmx.bz";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm ";
    ls_sql+=" where  jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
	ls_sql+=" and jc_wjjddmx.lx='1'";
    ls_sql+=" order by rownum";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();

%> 
      </table>
      <b style='FONT-SIZE: 14px'>玻璃部分</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="5%">序号</td>
          <td  width="25%">玻璃型号</td>
          <td  width="10%">玻璃用途</td>
          <td  width="10%">单价</td>
          <td  width="10%">订购数量</td>
          <td  width="10%">金额</td>
          <td  width="32%">备注</td>
        </tr>
        <%

	ls_sql="SELECT rownum,blxh,blyt,TO_CHAR(jc_blddmx.bzdj) as jc_blddmx_dj,jc_blddmx.sl as jc_blddmx_sl,jc_blddmx.bzdj*jc_blddmx.sl je,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jdm_blytbm  ";
    ls_sql+=" where jc_blddmx.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' and jc_blddmx.lx='1'";
    ls_sql+=" order by rownum";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();

%> 
      </table>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr valign="top"> 
    <td height="42">备注：<%=htbz%></td>
  </tr>
  <tr> 
    <td height="3">特殊提示：如您订购的是复合木地板，1.5m范围内地面落差超过2--3mm，必须对地面进行找平处理。</td>
  </tr>
</table>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
<%
if (mmzkl!=10)
{
	%>
	  <tr> 
		<td width="36%" height="2">累计金额(折前)：<%=cf.formatDouble(wdzje)%>元（小写）</td>
		<td width="35%" height="2">累计金额(折后)：<%=cf.formatDouble(htje)%>元（小写）</td>
		<td width="29%" height="2">实交款额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元（小写）</td>
	  </tr>
	  <tr> 
		<td>（大写）：<%=cf.NumToRMBStr(wdzje)%></td>
		<td>（大写）：<%=cf.NumToRMBStr(htje)%></td>
		<td>&nbsp;</td>
	  </tr>
	<%
}
else{
	%>
	  <tr> 
		
    <td width="36%" height="2">累计金额：<%=cf.formatDouble(htje)%>元（小写）</td>
    <td width="35%" height="2">实交款额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元（小写）</td>
    <td width="29%" height="2">&nbsp;</td>
	  </tr>
	  <tr> 
		
    <td>（大写）：<%=cf.NumToRMBStr(htje)%></td>
    <td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	<%
}
%>
  <tr> 
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="36%" >客户签字：</td>
          <td width="64%" >经办人：</td>
        </tr>
        <tr> 
          <td >签订日期：<%=htrq%></td>
          <td >签订日期：<%=htrq%></td>
        </tr>
      </table>    </td>
  </tr>
</table>
</body>
</html>




