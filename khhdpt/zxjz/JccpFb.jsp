<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>



<LINK REL="stylesheet" HREF="../images/stype.css" TYPE="text/css">
<link href="../css/h-g.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0">

<%
String khbh=(String)session.getAttribute("khbh");

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String fgsbh=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String sjs=null;
String xmzy=null;
String gcjdmc=null;
String cxhdbm=null;

String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String ybysxmbm=null;
String sybgcrq=null;
String zqysxmbm=null;
String szqsj=null;

String tgbz=null;
String tgkssj=null;
String gjfgsj=null;
String tgyybm=null;
String tgsm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,lxfs,fwdz,hth,fgsbh,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,sjs,xmzy,gcjdmc,cxhdbm";
	ls_sql+=" ,kgrq,jgrq,sjkgrq,sjjgrq,a.gcyszxmmc ybysxmbm,sybgcrq,b.gcyszxmmc zqysxmbm,szqsj";
	ls_sql+=" ,tgbz,tgkssj,gjfgsj,tgyybm,tgsm";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tgbz=cf.fillHtml(rs.getString("tgbz"));
		tgkssj=cf.fillHtml(rs.getDate("tgkssj"));
		gjfgsj=cf.fillHtml(rs.getDate("gjfgsj"));
		tgyybm=cf.fillHtml(rs.getString("tgyybm"));
		tgsm=cf.fillHtml(rs.getString("tgsm"));

		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		ybysxmbm=cf.fillHtml(rs.getString("ybysxmbm"));
		sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
		zqysxmbm=cf.fillHtml(rs.getString("zqysxmbm"));
		szqsj=cf.fillHtml(rs.getDate("szqsj"));

		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();


%>


<TABLE WIDTH=1004 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD> <IMG SRC="../images/top1_1-1.jpg" WIDTH=297 HEIGHT=5 ALT=""></TD>
  </TR>
  <TR> 
    <TD><table width="1004" height="66" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23"><img src="../images/top01.jpg" width="23" height="66"></td>
          <td width="190"><img src="../images/top1_2-1.jpg" width="190" height="66"></td>
          <td width="615"><div align="center"></div></td>
          <td width="176" valign="top"> <table width="124" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="49"><a href="../index.asp"><img src="../images/top1_2-1_1.jpg" width="83" height="16" border="0"></a></td>
                <td width="65"><a href="../bbs/"><img src="../images/top1_2-1_2.jpg" width="86" height="16" border="0"></a></td>
              </tr>
            </table>
            <table width="174" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="17" valign="bottom"> <div align="center"><a href="english/html/jieshao.html">英文版 
                    <strong>（English）</strong></a></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="../images/top1_3.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="25" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23" background="../images/top01-1.jpg"><table width="23" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="817" background="../images/top1_4-2.jpg" class="css"> <TABLE align=right border=0 width=639>
              <TBODY>
                <TR> 
                  <TD width=640> <DIV align=center class=css><a href="/khhdpt/khxx/HhxxIndex.jsp">我的资料</a> 
                      | <a href="/khhdpt/zytx/ZytxIndex.jsp">重要提醒</a> | <a href="/khhdpt/klzx/KlzxIndex.jsp">快乐装修</a> 
                      | <a href="/khhdpt/zxjz/ZxjzIndex.jsp">我家装修进展</a> | <a href="/khhdpt/gmjccp/khhdpt.html">购买集成产品</a> 
                      | <a href="/khhdpt/yhys/khhdpt.html">有话要说 </a> | <a href="/khhdpt/wgpj/WgpjIndex.jsp">完工评价</a> | <a href="/khhdpt/yjdc/YjdcIndex.jsp">客户调查</a> 
                      | <a href="/khhdpt/xgmm/XgmmIndex.jsp">修改密码</a> </DIV></TD>
                </TR>
              </TBODY>
            </TABLE></td>
          <td width="164" bgcolor="#000000" class="css"> <table width="164" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td><div align="center"></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="116" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="22" background="../images/top01-1.jpg"><table width="23" height="116" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="982" bgcolor="2E2E2E"> <img src="../images/top1_5-1.jpg" width="981" height="116"></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="../images/top1_6.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
</TABLE>
<TABLE WIDTH=1001 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		
    <TD COLSPAN=4> <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="16"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="652"><table width="817" height="27" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td bgcolor="#DFDFDF">&nbsp;</td>
              </tr>
            </table></td>
          <td width="336" bgcolor="#9A9A9A">&nbsp;</td>
        </tr>
      </table></TD>
	</TR>
	<TR>
		
    <TD width="23" height="863" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
		
    <TD width="282" valign="top" background="../images/index_3-2.jpg"> 
      <table width="282" height="50%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="153" valign="top">
<table width="282" height="61%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="589" valign="top"> 
                  <div align="center"> 
                    <table width="198" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="192">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="184" valign="top"> 
                          <div align="center">
                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="258" height="172">
                              <param name="movie" value="../images/x-1.swf">
                              <param name="quality" value="high">
                              <embed src="../images/x-1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="258" height="172"></embed></object>
                          </div></td>
                      </tr>
                      <tr> 
                        <td height="0"><img src="../images/xuxian.jpg" width="277" height="11"></td>
                      </tr>
                    </table>
                    <table width="269" height="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="10" height="399">&nbsp;</td>
                        <td width="259" valign="top">
<table width="137" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="10" height="32">&nbsp;</td>
                              <td width="117" valign="bottom"><img src="../images/x-3.jpg" width="101" height="23"></td>
                            </tr>
                          </table>
                          <table width="259" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="ZxjzIndex.jsp">工程信息发布</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="JccpFb.jsp">集成产品</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="GcysFb.jsp">工程验收情况</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="GchfFb.jsp">工程回访情况</a></td>
                            </tr>
                            <tr> 
                              <td height="26">&nbsp;</td>
                              <td height="30">&nbsp;</td>
                              <td height="30">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                  </div>
                  <div align="left"></div></td>
              </tr>
            </table> </td>
        </tr>
      </table>
      <div align="center"> </div></TD>
		
    <TD width="681" valign="top"><table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> 
            <div align="left"><img src="../images/xxfb-1.jpg" width="429" height="72"></div>
          </td>
        </tr>
        <tr> 
          <td valign="top"> <br>
            <table width="100%" border="0" height="834">
              <tr> 
                <td width="91%" valign="top"> 目前位置－->我家装修进展-->集成产品发布 
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="right" >姓名</td>
                      <td width="31%" ><%=khxm%>（<%=lxfs%>） </td>
                      <td width="19%" align="right" >合同号</td>
                      <td width="31%" ><%=hth%></td>
                    </tr>
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="right">房屋地址</td>
                      <td colspan="3"><%=fwdz%></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#F2F4E8"> 
                      <td height="10" colspan="8" align="center"><img src='../tubiao/iconShipBlue_16x16.gif'>集成家居部分</td>
                    </tr>
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>订货产品</b></td>
                      <td width="15%"><b>订货进度</b></td>
                      <td width="10%"><b>项目专员</b></td>
                      <td width="12%"><b>驻店顾问</b></td>
                      <td width="15%"><b>展厅家居顾问</b></td>
                      <td width="16%"><b>合同金额</b></td>
                      <td width="13%"><b>增减项金额</b></td>
                    </tr>
                    <%
	String yddbh=null;
	String clztmc=null;
	String clgw=null;
	String ztjjgw=null;
	double htje=0;
	double zjxje=0;
	double allhtze=0;
	double allzjxje=0;

	String lrr=null;
	String lrsj=null;
	String bz=null;
	String mmcljs=null;
	String sccsj=null;
	String ccsm=null;
	String htqdr=null;
	String htrq=null;
	String htbz=null;
	String jhazsj=null;
	String kjxsj=null;
	String wjqk=null;

	String skqrsj=null;
	String skqrr=null;
	String gcjslrsj=null;
	String gcjslrr=null;
	String srksj=null;
	String rkr=null;
	String rksm=null;
	String kazsj=null;
	String azsjbz=null;
	String aztzsj=null;
	String aztzr=null;

	String azkssj=null;
	String azjssj=null;
	String ycsm=null;
	String wjsj=null;
	String wjlrr=null;
	String tdsj=null;
	String tdlrr=null;

	ls_sql=" select yddbh,clztmc,clgw,ztjjgw,xmzy,htje,zjhze-htje zjxje";
	ls_sql+=" ,lrr,lrsj,bz,mmcljs,sccsj,ccsm,htqdr,htrq,htbz,jhazsj,kjxsj,DECODE(wjqk,'1','五金客户自购','2','五金松下亿达代购') wjqk";
	ls_sql+=" ,skqrsj,skqrr,gcjslrsj,gcjslrr,srksj,rkr,rksm,kazsj,azsjbz,aztzsj,aztzr";
	ls_sql+=" ,azkssj,azjssj,ycsm,wjsj,wjlrr,tdsj,tdlrr";
	ls_sql+=" from jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt";
	ls_sql+=" and jc_mmydd.khbh='"+khbh+"' ";
	ls_sql+=" order by  yddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		htje=rs.getDouble("htje");
		zjxje=rs.getDouble("zjxje");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		mmcljs=cf.fillNull(rs.getString("mmcljs"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccsm=cf.fillNull(rs.getString("ccsm"));
		htqdr=cf.fillNull(rs.getString("htqdr"));
		htrq=cf.fillNull(rs.getDate("htrq"));
		htbz=cf.fillNull(rs.getString("htbz"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		wjqk=cf.fillNull(rs.getString("wjqk"));

		skqrsj=cf.fillNull(rs.getDate("skqrsj"));
		skqrr=cf.fillNull(rs.getString("skqrr"));
		gcjslrsj=cf.fillNull(rs.getDate("gcjslrsj"));
		gcjslrr=cf.fillNull(rs.getString("gcjslrr"));
		srksj=cf.fillNull(rs.getDate("srksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));

		azkssj=cf.fillNull(rs.getDate("azkssj"));
		azjssj=cf.fillNull(rs.getDate("azjssj"));
		ycsm=cf.fillNull(rs.getString("ycsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdlrr=cf.fillNull(rs.getString("tdlrr"));

		allhtze+=htje;

		%> 
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td rowspan="16" width="19%"><b>松下亿达木门</b></td>
                      <td width="15%"><%=clztmc%></td>
                      <td width="10%"><%=xmzy%></td>
                      <td width="12%"><%=clgw%></td>
                      <td width="15%"><%=ztjjgw%></td>
                      <td width="16%"><%=htje%></td>
                      <td width="13%"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">预订单完成</td>
                      <td colspan="2">录入时间：<%=lrsj%></td>
                      <td width="15%">录入人：<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">木门初测</td>
                      <td colspan="2">初测时间：<%=sccsj%></td>
                      <td width="15%">测量师：<%=mmcljs%></td>
                      <td colspan="2"><%=ccsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td rowspan="3" align="center" width="15%">签订合同</td>
                      <td colspan="2">合同日期：<%=htrq%></td>
                      <td width="15%">签订人：<%=htqdr%></td>
                      <td colspan="2" rowspan="3"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">合同安装时间：<%=jhazsj%></td>
                      <td rowspan="2" align="center"><%=wjqk%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">减项截止时间：<%=kjxsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">交款确认</td>
                      <td colspan="2">交款确认时间：<%=skqrsj%></td>
                      <td width="15%">确认人：<%=skqrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td width="15%" align="center">工厂接收</td>
                      <td colspan="2">接收时间：<%=gcjslrsj%></td>
                      <td width="15%">接收人：<%=gcjslrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">木门入库</td>
                      <td colspan="2">入库时间：<%=srksj%></td>
                      <td width="15%">入库人：<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td rowspan="2" align="center">确定安装时间</td>
                      <td colspan="2">协商安装时间：<%=kazsj%></td>
                      <td width="15%">&nbsp;</td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">发通知时间：<%=aztzsj%></td>
                      <td width="15%">通知人：<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">木门安装</td>
                      <td colspan="2">开始安装时间：<%=azkssj%></td>
                      <td width="15%">&nbsp;</td>
                      <td colspan="2" rowspan="2"><%=ycsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">安装完成时间：<%=azjssj%></td>
                      <td width="15%">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td width="15%" align="center">木门完结</td>
                      <td colspan="2">完结时间：<%=wjsj%></td>
                      <td width="15%">录入人：<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">木门退单</td>
                      <td colspan="2">退单时间：<%=tdsj%></td>
                      <td width="15%">录入人：<%=tdlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>订货产品</b></td>
                      <td width="15%"><b>订货进度</b></td>
                      <td width="10%"><b>项目专员</b></td>
                      <td width="12%"><b>驻店顾问</b></td>
                      <td width="15%"><b>展厅家居顾问</b></td>
                      <td width="16%"><b>合同金额</b></td>
                      <td width="13%"><b>增减项金额</b></td>
                    </tr>
                    <%
	String ddbh=null;
	double htze=0;
	String pdsj=null;
	String cgsjs=null;
	String pdsm=null;
	String jhccsj=null;
	String jhccxgr=null;
	String jhccxgyy=null;
	String ccr=null;
	String ccbz=null;

	String jhfcsj=null;
	String jhfcxgr=null;
	String jhfcxgyy=null;
	String sfcsj=null;
	String fcr=null;
	String fcbz=null;
	String qhtsj=null;
	String jhazrq=null;
//	String kjxsj=null;
	String qhtr=null;
//	String htbz=null;
	
	String htqrsj=null;
	String htqrr=null;
	String htqrbz=null;
	String gcjssj=null;
	String gcjsr=null;
	String gcjsbz=null;
	String rksj=null;
//	String rkr=null;
//	String rksm=null;

//	String kazsj=null;
	String kazsjlrr=null;
//	String azsjbz=null;
//	String aztzsj=null;
//	String aztzr=null;
	String ksazsj=null;
	String sazrq=null;
	String azr=null;
	String azsm=null;
//	String wjsj=null;
//	String wjlrr=null;
//	String tdsj=null;
	String tdblr=null;
	
	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,lrr,lrsj,htze,zjhze-htze zjxje,bz";
	ls_sql+=" ,pdsj,cgsjs,pdsm,jhccsj,jhccxgr,jhccxgyy,sccsj,ccr,ccbz";
	ls_sql+=" ,jhfcsj,jhfcxgr,jhfcxgyy,sfcsj,fcr,fcbz,qhtsj,jhazrq,kjxsj,qhtr,htbz";
	ls_sql+=" ,htqrsj,htqrr,htqrbz,gcjssj,gcjsr,gcjsbz,rksj,rkr,rksm";
	ls_sql+=" ,kazsj,kazsjlrr,azsjbz,aztzsj,aztzr,ksazsj,sazrq,azr,azsm,wjsj,wjlrr,tdsj,tdblr";
	ls_sql+=" from jc_cgdd,jdm_cgddzt";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_cgdd.khbh='"+khbh+"' ";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");
		zjxje=rs.getDouble("zjxje");
		bz=cf.fillNull(rs.getString("bz"));

		pdsj=cf.fillNull(rs.getDate("pdsj"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccr=cf.fillNull(rs.getString("ccr"));
		ccbz=cf.fillNull(rs.getString("ccbz"));

		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		jhfcxgr=cf.fillNull(rs.getString("jhfcxgr"));
		jhfcxgyy=cf.fillNull(rs.getString("jhfcxgyy"));
		sfcsj=cf.fillNull(rs.getDate("sfcsj"));
		fcr=cf.fillNull(rs.getString("fcr"));
		fcbz=cf.fillNull(rs.getString("fcbz"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		htbz=cf.fillNull(rs.getString("htbz"));


		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));


		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azr=cf.fillNull(rs.getString("azr"));
		azsm=cf.fillNull(rs.getString("azsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=htze;

		%> 
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="19" width="19%" align="center"><b>松下亿达橱柜</b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=htze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">预订单完成</td>
                      <td colspan="2">录入时间：<%=lrsj%></td>
                      <td width="15%">录入人：<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">派设计师</td>
                      <td colspan="2">派设计师时间：<%=pdsj%></td>
                      <td width="15%">设计师：<%=cgsjs%></td>
                      <td colspan="2"><%=pdsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">确定初测时间</td>
                      <td colspan="2">计划初测时间：<%=jhccsj%></td>
                      <td width="15%">录入人：<%=jhccxgr%></td>
                      <td colspan="2"><%=jhccxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">橱柜初测</td>
                      <td colspan="2">实初测时间：<%=sccsj%></td>
                      <td width="15%">录入人：<%=ccr%></td>
                      <td colspan="2"><%=ccbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">确定复测时间</td>
                      <td colspan="2">计划复测时间：<%=jhfcsj%></td>
                      <td width="15%">录入人：<%=jhfcxgr%></td>
                      <td colspan="2"><%=jhfcxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">橱柜复测</td>
                      <td colspan="2">实复测时间：<%=sfcsj%></td>
                      <td width="15%">录入人：<%=fcr%></td>
                      <td colspan="2"><%=fcbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">签订合同</td>
                      <td colspan="2">签合同时间：<%=qhtsj%></td>
                      <td width="15%">签订人：<%=qhtr%></td>
                      <td colspan="2" rowspan="2"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">合同安装日期：<%=jhazrq%></td>
                      <td width="15%">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">交款确认</td>
                      <td colspan="2">交款确认时间：<%=htqrsj%></td>
                      <td width="15%">确认人：<%=htqrr%></td>
                      <td colspan="2"><%=htqrbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">工厂接收</td>
                      <td colspan="2">工厂接收时间：<%=gcjssj%></td>
                      <td width="15%">接收人：<%=gcjsr%></td>
                      <td colspan="2"><%=gcjsbz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">橱柜入库</td>
                      <td colspan="2">入库时间：<%=rksj%></td>
                      <td width="15%">入库人：<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">确定安装时间</td>
                      <td colspan="2">协商安装时间：<%=kazsj%></td>
                      <td width="15%">录入人：<%=kazsjlrr%></td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">发通知时间：<%=aztzsj%></td>
                      <td width="15%">通知人：<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" rowspan="2">橱柜安装</td>
                      <td colspan="2">开始安装时间：<%=ksazsj%></td>
                      <td rowspan="2">录入人：<%=azr%></td>
                      <td colspan="2" rowspan="2"><%=azsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">安装完成时间：<%=sazrq%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">橱柜完结</td>
                      <td colspan="2">完结时间：<%=wjsj%></td>
                      <td width="15%">录入人：<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">橱柜退单</td>
                      <td colspan="2">退单时间：<%=tdsj%></td>
                      <td width="15%">录入人：<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>订货产品</b></td>
                      <td width="15%"><b>订货进度</b></td>
                      <td width="10%"><b>项目专员</b></td>
                      <td width="12%"><b>驻店顾问</b></td>
                      <td width="15%"><b>展厅家居顾问</b></td>
                      <td width="16%"><b>合同金额</b></td>
                      <td width="13%"><b>增减项金额</b></td>
                    </tr>
                    <%
	String jjsjs=null;
	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,lrr,lrsj,htze,zjhze-htze zjxje,bz";
	ls_sql+=" ,pdsj,jjsjs,pdsm,jhccsj,jhccxgr,jhccxgyy,sccsj,ccr,ccbz";
	ls_sql+=" ,qhtsj,jhazrq,kjxsj,qhtr,htbz";
	ls_sql+=" ,htqrsj,htqrr,htqrbz,gcjssj,gcjsr,gcjsbz,rksj,rkr,rksm";
	ls_sql+=" ,kazsj,kazsjlrr,azsjbz,aztzsj,aztzr,ksazsj,sazrq,azr,azsm,wjsj,wjlrr,tdsj,tdblr";
	ls_sql+=" from jc_jjdd,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.clzt=jdm_jjddzt.clzt";
	ls_sql+=" and jc_jjdd.khbh='"+khbh+"' ";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");
		zjxje=rs.getDouble("zjxje");
		bz=cf.fillNull(rs.getString("bz"));

		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccr=cf.fillNull(rs.getString("ccr"));
		ccbz=cf.fillNull(rs.getString("ccbz"));

		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		htbz=cf.fillNull(rs.getString("htbz"));


		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));


		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azr=cf.fillNull(rs.getString("azr"));
		azsm=cf.fillNull(rs.getString("azsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=htze;

		%> 
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="17" width="19%" align="center"><b>松下亿达家具</b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=htze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">预订单完成</td>
                      <td colspan="2">录入时间：<%=lrsj%></td>
                      <td width="15%">录入人：<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">派设计师</td>
                      <td colspan="2">派设计师时间：<%=pdsj%></td>
                      <td width="15%">设计师：<%=jjsjs%></td>
                      <td colspan="2"><%=pdsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">确定初测时间</td>
                      <td colspan="2">计划初测时间：<%=jhccsj%></td>
                      <td width="15%">录入人：<%=jhccxgr%></td>
                      <td colspan="2"><%=jhccxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">家具初测</td>
                      <td colspan="2">实初测时间：<%=sccsj%></td>
                      <td width="15%">录入人：<%=ccr%></td>
                      <td colspan="2"><%=ccbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">签订合同</td>
                      <td colspan="2">签合同时间：<%=qhtsj%></td>
                      <td rowspan="2">签订人：<%=qhtr%></td>
                      <td colspan="2" rowspan="2"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">合同安装日期：<%=jhazrq%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">交款确认</td>
                      <td colspan="2">交款确认时间：<%=htqrsj%></td>
                      <td width="15%">确认人：<%=htqrr%></td>
                      <td colspan="2"><%=htqrbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">工厂接收</td>
                      <td colspan="2">工厂接收时间：<%=gcjssj%></td>
                      <td width="15%">接收人：<%=gcjsr%></td>
                      <td colspan="2"><%=gcjsbz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">家具入库</td>
                      <td colspan="2">入库时间：<%=rksj%></td>
                      <td width="15%">入库人：<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">确定安装时间</td>
                      <td colspan="2">协商安装时间：<%=kazsj%></td>
                      <td width="15%">录入人：<%=kazsjlrr%></td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">发通知时间：<%=aztzsj%></td>
                      <td width="15%">通知人：<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" rowspan="2">家具安装</td>
                      <td colspan="2">开始安装时间：<%=ksazsj%></td>
                      <td rowspan="2">录入人：<%=azr%></td>
                      <td colspan="2" rowspan="2"><%=azsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">安装完成时间：<%=sazrq%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">家具完结</td>
                      <td colspan="2">完结时间：<%=wjsj%></td>
                      <td width="15%">录入人：<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">家具退单</td>
                      <td colspan="2">退单时间：<%=tdsj%></td>
                      <td width="15%">录入人：<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <%
	double hkze=0;
	String ppbm=null;
	String htshsj=null;
	String ddqrr=null;
	String ddqrsj=null;
	String gysjslrr=null;
	String gysjslrsj=null;

	String jhshsj=null;
	String tzshsj=null;
	String tzshr=null;
	String shtzsm=null;
	String sshsj=null;
	String sshr=null;
	String shqk=null;

	String jhtbhsj=null;
	String tztbhr=null;
	String stbhsj=null;
	String stbhr=null;
	String tbhqk=null;

	wjsj="";
	wjlrr="";
	tdsj="";
	tdblr="";
	
	ls_sql=" select ddbh,ppbm,clztmc,clgw,ztjjgw,xmzy,hkze,zjhze";
	ls_sql+=" ,qhtsj,htshsj,lrr,bz,ddqrr,ddqrsj,gysjslrr,gysjslrsj";
	ls_sql+=" ,jhshsj,tzshsj,tzshr,shtzsm,sshsj,sshr,shqk";
	ls_sql+=" ,jhtbhsj,tztbhr,stbhsj,stbhr,tbhqk";
	ls_sql+=" ,wjsj,wjlrr,tdsj,tdblr";
	ls_sql+=" from jc_zcdd,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.clzt>'05'";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		hkze=rs.getDouble("hkze");
		zjxje=rs.getDouble("zjhze");

		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		bz=cf.fillNull(rs.getString("bz"));
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		gysjslrr=cf.fillNull(rs.getString("gysjslrr"));
		gysjslrsj=cf.fillNull(rs.getDate("gysjslrsj"));

		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		sshsj=cf.fillNull(rs.getDate("sshsj"));
		sshr=cf.fillNull(rs.getString("sshr"));
		shqk=cf.fillNull(rs.getString("shqk"));


		jhtbhsj=cf.fillNull(rs.getDate("jhtbhsj"));
		tztbhr=cf.fillNull(rs.getString("tztbhr"));
		stbhsj=cf.fillNull(rs.getDate("stbhsj"));
		stbhr=cf.fillNull(rs.getString("stbhr"));
		tbhqk=cf.fillNull(rs.getString("tbhqk"));

		
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=hkze;

		%> 
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="center"><b>订货产品</b></td>
                      <td width="15%" align="center"><b>订货进度</b></td>
                      <td width="10%" align="center"><b>项目专员</b></td>
                      <td width="12%" align="center"><b>驻店顾问</b></td>
                      <td width="15%" align="center"><b>展厅家居顾问</b></td>
                      <td width="16%" align="center"><b>合同金额</b></td>
                      <td width="13%" align="center"><b>增减项金额</b></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="13" align="center"><b><%=ppbm%></b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=hkze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">签合同</td>
                      <td colspan="2">签合同时间：<%=qhtsj%></td>
                      <td rowspan="2">签订人：<%=lrr%></td>
                      <td colspan="2" rowspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">合同送货时间：<%=htshsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">交款确认</td>
                      <td colspan="2">交款确认时间：<%=ddqrsj%></td>
                      <td width="15%">确认人：<%=ddqrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">工厂接收</td>
                      <td colspan="2">接收时间：<%=gysjslrsj%></td>
                      <td width="15%">接收人：<%=gysjslrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">确定送货时间</td>
                      <td colspan="2">计划送货时间：<%=jhshsj%></td>
                      <td rowspan="2">录入人：<%=tzshr%></td>
                      <td colspan="2" rowspan="2"><%=shtzsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">发送货通知：<%=tzshsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">送货</td>
                      <td colspan="2">实送货时间：<%=sshsj%></td>
                      <td width="15%">录入人：<%=sshr%></td>
                      <td colspan="2"><%=shqk%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">退补货</td>
                      <td colspan="2">约定退补货：<%=jhtbhsj%></td>
                      <td width="15%">录入人：<%=tztbhr%></td>
                      <td colspan="2" rowspan="2"><%=tbhqk%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">实退补货时间：<%=stbhsj%></td>
                      <td width="15%">录入人：<%=stbhr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">单项完结</td>
                      <td colspan="2">完结时间：<%=wjsj%></td>
                      <td width="15%">录入人：<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">退单</td>
                      <td colspan="2">退单时间：<%=tdsj%></td>
                      <td width="15%">录入人：<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <%
	}
	rs.close();
	ps.close();
%> </td>
              </tr>
              <tr> 
                <td width="87%" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="82%" valign="top">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table> </TD>
		
    <TD width="19" bgcolor="#E4E4E4"> 
      <table width="1" height="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="10" height="859" bgcolor="#E4E4E4">&nbsp;</td>
        </tr>
      </table> 
      
      <img src="../images/index_5-1.jpg" width="19" height="4"></TD>
	</TR>
</TABLE>
<table width="1004" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="23" height="27" background="../../images/top_6-1.jpg"><IMG SRC="../images/down_1.jpg" WIDTH=23 HEIGHT=23 ALT=""></td>
    <td width="981" bgcolor="#000000"><table width="981" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td><div align="center">
              <script language="JavaScript">
function dohome(){
this.home.style.behavior='url(#default#homepage)';this.home.setHomePage('http://www.yz-china.com/');}var focusok=false;

if (navigator.appName == "Netscape")
{focusok=true;}
vers=navigator.appVersion;

if (navigator.appName == "Microsoft Internet Explorer"){
 pos=vers.lastIndexOf('.'); 
 vers=vers.substring(pos-1,vers.length);}
proper_version=parseFloat(vers); 

if(proper_version>=5){
	focusok=true;}

function launchstock(){
if(focusok){
	stock.focus();}
 return true;}
</script>
              <a href="#" name="home" onclick="dohome();"><font color="#FFCC00">设为首页</font></a><font color="#FFCC00"> 
              |</font> <A href="javascript:window.external.AddFavorite('http://www.yz-china.com/',%20'松下亿达装饰网')" target=_self><font color="#FFCC00">加入收藏</font></A><font color="#FFCC00"> 
              |</font> <a href="../lxwm/index.asp"><font color="#FFCC00">联系我们</font></a> 
              <font color="#FFCC00">|</font> <a href="../link/index.asp" class="down-h-g"><font color="#FFCC00">友情链接</font></a> 
            </div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="73" background="../images/down_1.jpg">&nbsp;</td>
    <td><div align="center"> 
        <p class="down">Copyright @ 2005 yz-china.com, YuanZhou Decoration.All 
          Rights Reserved<br>
          版权所有 松下亿达网 友情链接/设计 QQ：5580751 装修信息互动QQ：28834204<br>
          <strong>E-mail:</strong> yuanzhouqihuabu@163.com 咨询电话：010-64200739<br>
          <a href="http://www.miibeian.gov.cn">京ICP备05021813号</a> </div></td>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_gcly(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfyqhf)) {
		alert("请选择[是否要求回复]！");
		FormName.sfyqhf[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="请您填写工程留言！不要超过300个汉字") {
		alert("请您填写留言！");
		FormName.lynr.value="请您填写工程留言！不要超过300个汉字";
		FormName.lynr.select();
		return false;
	}

	FormName.action="SaveKhly.jsp?lylx=1";//1：工程留言；2：集成留言；9：其它留言；
	FormName.submit();
	FormName.gcly.disabled=true;
	return true;
}

function f_jjly(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfyqhf)) {
		alert("请选择[是否要求回复]！");
		FormName.sfyqhf[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="请您填写集成家居留言！不要超过300个汉字") {
		alert("请您填写留言！");
		FormName.lynr.value="请您填写集成家居留言！不要超过300个汉字";
		FormName.lynr.select();
		return false;
	}

	FormName.action="SaveKhly.jsp?lylx=2";
	FormName.submit();
	FormName.jcly.disabled=true;
	return true;
}

//-->
</SCRIPT>
