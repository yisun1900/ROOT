<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>

<%
String khbh=(String)session.getAttribute("khbh");
String khlx=(String) session.getAttribute("khlx");// 客户类型：0001：咨询客户 0002：签约客户(2006-06-29)
khlx="0002";

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
String sfzhm=null;

String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String ybysxmbm=null;
String sybgcrq=null;
String zqysxmbm=null;
String szqsj=null;


String sjsdh="";
String bzdh="";
String zjdh="";
String xmzydh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	if(khlx.equals("0002")){// 客户类型：0001：咨询客户 0002：签约客户(2006-06-29)
		ls_sql="select khxm,lxfs,fwdz,hth,fgsbh,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,sjs,xmzy,gcjdmc,cxhdbm";
		ls_sql+=" ,kgrq,jgrq,sjkgrq,sjjgrq,a.gcyszxmmc ybysxmbm,sybgcrq,b.gcyszxmmc zqysxmbm,szqsj,sfzhm";
		ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
		ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
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
			sfzhm=cf.fillHtml(rs.getString("sfzhm"));
		}
		rs.close();
		ps.close();

		//设计师电话
		ls_sql=" select '（'||dh||'）' dh from sq_yhxx";
		ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sjsdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//班长电话
		ls_sql=" select '（'||dh||'）' dh from sq_bzxx";
		ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bzdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//质检电话
		ls_sql=" select '（'||dh||'）' dh ";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//项目专员电话
		ls_sql=" select '（'||dh||'）' dh ";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+xmzy+"' and zwbm='10'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmzydh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();
	}else if(khlx.equals("0001")){// 客户类型：0001：咨询客户 0002：签约客户(2006-06-29)

	}
	else
	{
	}


%>

<LINK REL="stylesheet" HREF="../images/stype.css" TYPE="text/css">
<link href="../css/h-g.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0">
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
          <td width="817" background="../images/top1_4-2.jpg" class="css"> <TABLE align=right border=0 width=714>
              <TBODY>
                <TR> 
                  <TD width=708> <DIV align=center class=css><a href="/khhdpt/khxx/HhxxIndex.jsp">我的资料</a> 
                      | <a href="/khhdpt/jzbj/JzbjIndex.jsp">家装报价</a> | <a href="/khhdpt/zytx/ZytxIndex.jsp">重要提醒</a> | <a href="/khhdpt/klzx/KlzxIndex.jsp">快乐装修</a> 
                      | <a href="/khhdpt/zxjz/ZxjzIndex.jsp">我家装修进展</a> | <a href="/khhdpt/gmjccp/khhdpt.html">购买集成产品</a> 
                      | <a href="/khhdpt/yhys/khhdpt.html">有话要说 </a>| <a href="/khhdpt/wgpj/WgpjIndex.jsp">完工评价</a> | <a href="/khhdpt/yjdc/YjdcIndex.jsp">客户调查</a> 
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
    <TD COLSPAN=3> 
      <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="16"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="652">
            <table width="817" height="27" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td bgcolor="#DFDFDF">&nbsp;</td>
              </tr>
            </table>
          </td>
          <td width="336" bgcolor="#9A9A9A">&nbsp;</td>
        </tr>
      </table>
    </TD>
  </TR>
  <TR> 
    <TD width="23" height="863" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
    <TD width="287" valign="top" background="../images/index_3-2.jpg"> 
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
                          <div align="center"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="258" height="172">
                              <param name="movie" value="../images/x-1.swf">
                              <param name="quality" value="high">
                              <embed src="../images/x-1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="258" height="172">
                              </embed>
                            </object> </div>
                        </td>
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
                              <td width="219"><a href="../khxx/HhxxIndex.jsp">我 的 资 料</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../zytx/ZytxIndex.jsp">重 要 提 醒</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="/khhdpt/klzx/KlzxIndex.jsp">快 乐 装 修 </a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="/khhdpt/zxjz/ZxjzIndex.jsp">我 家 装 修 进 展</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="/khhdpt/gmjccp/khhdpt.html"> 购 买 集 成 产 品</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../yhys/YhysIndex.jsp">有 话 要 说</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="../wgpj/WgpjIndex.jsp">完 工 评 价</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../yjdc/YjdcIndex.jsp">客 户 调 查</a></td>
                            </tr>
							 <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../xgmm/XgmmIndex.jsp">修 改 密 码 </a></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div align="left"></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div align="center"> </div>
    </TD>
    <TD width="694" valign="top"> 
      <table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> 
            <div align="left"><img src="../images/kl-zx.jpg" width="429" height="72"></div>
          </td>
        </tr>
        <tr> 
          <td valign="top"> <br>
<%//***************************************************************************************************
	if(khlx.equals("0001")){// 客户类型：0001：咨询客户 0002：签约客户(2006-06-29)
		out.print("<br><BR><CENTER><B>系统提示:对不起!您还没有签约,不能进行此操作!</CENTER>");
		return;
	}
//*******************************************************************************************************
%>
            <table width="100%" border="0" height="834">
              <tr> 
                <td width="82%" valign="top"> 
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12;BORDER-COLLAPSE: collapse" >
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE" >姓名</td>
                      <td width="31%" ><%=khxm%>（<%=lxfs%>） </td>
                      <td align="right" width="19%" >合同号</td>
                      <td width="31%" ><%=hth%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE" >身份证号码</td>
                      <td width="31%" ><%=sfzhm%></td>
                      <td align="right" width="19%" >参加促销活动</td>
                      <td width="31%" ><%=cxhdbm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE">房屋地址</td>
                      <td colspan="3"><%=fwdz%></td>
                    </tr>
                  </table>
                  <br>
                  <table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="26" colspan="4"><b>请记住如下电话，这是为您服务的人员、部门及电话</b></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>签约店面</b></td>
                      <td colspan="3"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
	%><%cf.selectItem(out,"select dwbh,dwmc||'（'||dwdh||'）' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%>
                        <HR>
                        各店面负责对设计师进行统一管理，提供详细的家装咨询，并负责协调解决客户所遇到的问题。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>设计师</b></td>
                      <td colspan="3"><%=sjs%><%=sjsdh%> 
                        <HR>
                        负责与客户沟通家装、家居的全程设计方案；巡查工地看施工现场与原设计方案的吻合度；协助客户办理中期的增减项工作；协助完工后的验收工作。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>施工队</b></td>
                      <td colspan="3"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
                        <HR>
                        施工队主要由水工、木工、油工、瓦工、电工组成，负责按照设计师图纸完成各工种的现场施工作业。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>现场班长</b></td>
                      <td colspan="3"><%=sgbz%><%=bzdh%> 
                        <HR>
                        施工班长的主要职责是协调各工种，控制工程按期完工，在施工中与设计师进行沟通，充分理解设计师的设计意图，协助统筹安排家居产品的进场时间及现场协调，并帮助客户了解施工流程，从而更好地顺利完成施工作业。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>工程监理</b></td>
                      <td colspan="3"><%=zjxm%><%=zjdh%> 
                        <HR>
                        负责定期检查工地情况，监督工程质量及工期进度。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>项目专员</b></td>
                      <td colspan="3"><%=xmzy%><%=xmzydh%> 
                        <HR>
                        负责建立客户在松下亿达公司订购的集成家居产品档案；及时了解掌握工地的施工进度，根据工地现场进度协调相关部门、相关厂商，安排集成家居产品的测量、设计、生产、配送、安装等统筹工作；受理客户关于集成家居产品的投诉、报修，并及时协调相关部门、相关厂商，督促解决；与客户核对集成家居消费产品的金额，及退补货情况。</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>公司总机</b></td>
                      <td colspan="3">010-84291188</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>投诉电话</b></td>
                      <td colspan="3">010-64201085、010-64200585 
                        <HR>
                        客服人员负责在施工过程中对客户进行回访，如实记录客户反映的问题，并及时反馈给相关部门，督促解决；受理客户的投诉、报修，并及时反馈给相关部门，督促解决，监控解决的速度及力度。</td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="2" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="21" colspan="4"><strong>交款流程介绍</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>交款流程介绍</b></td>
                      <td colspan="3">
					  <BR>
					  <b>首期款（55％）</b>： 
					  <BR><BR>
                        &nbsp;&nbsp;&nbsp;&nbsp;国家规定家庭装饰工程的首期款为工程总款的55%，请您在签署合同的同时交纳首期款，钱款可以交到签合同所在的运营部或者公司财务部，同时索要盖有公司财务章的收据。	
                        <P><b>中期款（40％）</b>： 
						<BR><BR>
                          &nbsp;&nbsp;&nbsp;&nbsp;在办理完工程增减项手续、中期工程验收完后，质检员、施工队、客户三方填写《客户服务工作表》中的《中期预结算单》，并签字确认。客户根据《中期预结算单》中的金额交纳中期款。中期款=合同总造价*40％+增减项金额，请您将中期款交到您签合同所在的运营部或者公司财务部，并索要盖有公司财务章的收据。
                        <P><b>尾款（5％）</b>： 
						<BR><BR>
                          &nbsp;&nbsp;&nbsp;&nbsp;工程竣工验收合格后，客户将工程尾款交纳到您签合同所在的运营部或者公司财务部，并索要盖有公司财务章的收据。尾款金额=5％*合同总造价+增减项款。请客户尽量将尾款交到公司总部财务部，这样可以同时办理《保修单》及核对集成家居消费金额。在交纳尾款时请您携带您的家装合同以及《客户服务工作表》中客户联的《工程增减项协议书及增减项目明细》，公司会很快核算出您的尾款金额并为您办理相关的手续。	
					  <BR>&nbsp;
                      </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="21" colspan="4"><strong>购买集成产品指南</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" align="right" bgcolor="#F1FCFE"><b>订购集成产品指南</b></td>
                      <td colspan="3"> 
					  <BR>
                        集成产品分为两大类：定制式产品（木门、橱柜、家居）、非定制式产品（地板、瓷砖等主材）</p>
                        <p>松下亿达集成产品四大优势：</p>
                        <p><b>以个性化设计为龙头：</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;传统家装设计往往与诸多后续工作脱节，很难完全达到设计方案的预期效果。而松下亿达集成家居设计师能够为客户提供装修的细化设计及家具、材料的整体风格设计和建议，不仅专业而且整体风格统一。</p>
                        <p><b>让客户省心：</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;松下亿达负责协调统一设计、施工、选材和配饰等繁琐工作，为客户省去了众多麻烦。松下亿达集成产品整合众多家具、材料厂商，提供了整体家装设计、施工、家具产品研发、生产材料整合配套、提供成一体的全方位家具服务模式。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;松下亿达对所有集成产品承诺先行赔付,一方面由工厂进行加工，减少在客户家中的施工量，降低粉尘、噪音、油漆等对人及环境的污染。另一方面，设立专职机构，坚决执行国家统一环保标准，保证环保性。</p>
                        <p><b>让客户省时：</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;集成装修采用立体化施工，装修和家具产品生产同时进行，交叉作业，缩短工期。在材料配购上整合了众多材料厂商，客户不用东奔西走，节省大量时间。</p>
                        <p><b>让客户省钱：</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;松下亿达公司在发展中不断整合上下游产业链，通过全球化采购最大限度的降低采购成本，通过ERP信息管理系统的精准服务降低人员成本，通过2020软件的高效标准化生产降低生产成本，通过区域化管理模式降低物流成本和管理成本，并由此产生更多的利润空间回馈给广大消费者。
					  <BR>&nbsp;
                      </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" colspan="4" align="center"><strong>工程施工流程</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="4" ><img src="工程施工流程.jpg" ></td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" align="center" colspan="2"><strong>松下亿达在哪里</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="69%" align="center" ><img src="总部地图.jpg"></td>
                      <td width="31%" >
					  松下亿达家居馆
					  <P>地址：北京市朝阳区西坝河西里23号红
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;都阳光商务会馆2层
					  <P>乘车：城铁[光熙门]站；公交300、302
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等三环主路车[西坝河]站。 
                      <P>开车：北三环主路自东向西，请于和平
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东桥下调头； 
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北三环主路自西向东，太阳宫桥
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一个出口上辅路即到。 </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" colspan="4" align="center"><strong>松下亿达各部门位置图</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="4" ><img src="dd" ></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </TD>
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
	out.print("Exception: " + e+ls_sql);
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
