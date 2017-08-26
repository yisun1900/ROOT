<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=request.getParameter("ddbh");
    String khxm="";
	String lxfs="";
    String fwdz="";
	String jc_jjdd_htze="";
	String jc_jjdd_jhazrq="";
	String jc_jjdd_qhtsj="";
    String jhq=null;
    String jdm_jjlbbm_jjlbmc="&nbsp;";
	String jdm_jjbjmcbm_jjlbmc="";
	String sgbz="";
	String sgd="";
	String bzdh="";
	String jhq1="";
	String jhq2="";

	
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();

	    ls_sql="select khxm,fwdz,lxfs,sgd,sgbz,jhazrq,htze,qhtsj,jhazrq-qhtsj,qhtsj+10 jhq1,qhtsj+20 jhq2";
	    ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+ddbh+"'";
		ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery();
	    if (rs.next())
	    {
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			jc_jjdd_htze=cf.fillNull(rs.getString("htze"));
			jc_jjdd_qhtsj=cf.fillNull(rs.getDate("qhtsj"));
			jc_jjdd_jhazrq=cf.fillNull(rs.getDate("jhazrq"));
			jhq=cf.fillNull(rs.getString("jhazrq-qhtsj"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			sgd=cf.fillNull(rs.getString("sgd"));
			jhq1=cf.fillNull(rs.getDate("jhq1"));
			jhq2=cf.fillNull(rs.getDate("jhq2"));
		
		 }
	     rs.close();
	     ps.close();

		ls_sql="select jjlbmc";
	    ls_sql+=" from  jdm_jjlbbm,jc_jjyddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and jdm_jjlbbm.jjlbbm=jc_jjyddmx.jjlbbm";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jdm_jjlbbm_jjlbmc=cf.fillNull(rs.getString("jjlbmc"));
		 }
	     rs.close();
	     ps.close();
         
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

		ls_sql="select bcpp";
	    ls_sql+=" from  jc_jjgtmx";
		ls_sql+=" where ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jdm_jjbjmcbm_jjlbmc=cf.fillNull(rs.getString("bcpp"));
		   
		
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
<title>松下亿达家具/壁柜门订购合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr> 
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><font size="4"><b>松下亿达家具/壁柜门订购合同</b></font></td>
    <td width="27%">家装合同号：<%=ddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">甲方（客户）：<%=khxm%></td>
    <td colspan="2">乙 方：松下亿达</td>
  </tr>
  <tr> 
    <td colspan="2">联系电话：<%=lxfs%></td>
    <td colspan="2">合同附件编号：<%=ddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">安装地址：<%=fwdz%></td>
    <td colspan="2">乙方联系电话:010-84291188-客户服务部</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;为维护消费者、经营者合法权益，根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及其他相关法律、法规，签订本合同并共同遵守。</td>
  </tr>
  <tr> 
    <td colspan="2">一、产品名称、规格、数量、金额（见家具/壁柜门合同附件）：</td>
  </tr>
  <tr> 
    <td colspan="2">二、付款和付款方式：</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1、本合同总金额人民币：<u><%=cf.NumToRMBStr(cf.doubleTrim(jc_jjdd_htze,0))%></u>（￥<u><%=jc_jjdd_htze%></u>），甲方应于合同签订当日付清全部货款。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2、因合同发生变更导致总价提高，在双方签订补充条款的当日甲方即应将加价款给付乙方。</td>
  </tr>
  <tr> 
    <td colspan="2">三、双方的权利、义务</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1、乙方设计师有责任与甲方就设计方案及报价等进行充分沟通，明确甲方所订产品的一些重要特征，包括但不限于功能性、材质、颜色等。在甲方理解、认可相关内容后，双方签字确认，以作为履行本合同的依据。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2、乙方在与甲方确认方案、签订合同后，即可按照图纸生产、安装。在本合同签订后3日内，甲方若需对家具/壁柜门的材质、尺寸、颜色、安装高度、安放位置等有改动，需告知家居设计师，经双方协商签订补充协议。如提出期限超过3日，而本合同项下产品已下单生产但未全部生产完毕的，需由提出方对所造成的材料等费用损失及延迟交货等问题承担责任。若家具/壁柜门已经制作完毕再行更改的，需由提出方承担相应更改费用。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">3、因乙方原因未按期送货安装，每延迟一日，按违约项产品2‰向甲方支付违约金，违约金最高不得超过合同总金额的20%。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">4、由于家具/壁柜门产品是专为乙方设计、制作的产品，因此，除非乙方交付的产品与双方的约定明显不符合或者该产品存在质量问题无法正常使用，否则乙方不予退换。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">5、本合同项下家具产品虽为工厂标准化生产，但因板材进货批次不同，制成品如与展厅样品有微小色差，属正常误差范围，最终交付以制成品为准。</td>
  </tr>
  <tr> 
    <td colspan="2">四、送货：六环内免费送货安装，超出此范围按200元/户收取运输费用，北京市以外的其他城市远程运费另议。</td>
  </tr>
  <tr> 
    <td colspan="2">五、交货期：乙方生产周期为10-20天，计划交货期为：<u><%=jhq1%></u> 到 
      <u><%=jhq2%></u>。</td>
  </tr>
  <tr> 
    <td colspan="2">六、安装： </td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1、本合同项下的产品制作完毕后，在现场具备安装条件后，甲方即可通知乙方上门安装。乙方接到甲方通知后5日内派员到场进行安装。安装日期确定后双方不得变更，如有变更应另行商定安装日期。如因甲方的原因导致乙方人员无法进行安装的，人工费损失由甲方承担，每次以100元人民币计。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2、安装时甲方现场需具备的条件：涂料、壁纸铺贴完毕；地板、地砖施工完毕；吊顶处理完毕；踢脚线部位安装完毕。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">3、安装周期为1-3天，但一次性订购数量较多的另议。</td>
  </tr>
  <tr> 
    <td colspan="2">七、付款方式：确定方案后，需在合同及合同附件上签字，并交清全部货款。</td>
  </tr>
  <tr> 
    <td colspan="2">八、保修期：本合同项下产品安装完毕后，甲方应当天进行验收并签字确认，本合同项下的产品经甲方签字确认后即视为质量合格。自甲方签字验收之日起，即进入两年保修期，其他五金配件以其产品包装箱内的保修卡时间为准。安装完毕当天甲方没有到场签字确认，经乙方通知三日内仍未签字确认的，保修期自安装完毕之日起计算。</td>
  </tr>
  <tr> 
    <td colspan="2">九、纠纷解决方式</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1、因履行本合同所发生的任何争议双方应友好协商解决，协议不成的，任何一方均可向被告所在地人民法院起诉。</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2、甲乙双方可在不违背本合同的原则下签署补充协议，若补充协议与本合同有关条款相悖，按补充协议执行。</td>
  </tr>
  <tr> 
    <td colspan="2">十、其它约定</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1、因家具为非精细加工产品，若是入墙式家具侧板距离墙壁每侧需留2-3公分的工艺缝，以方便板件连接。</td>
  </tr>
  <tr> 
    <td colspan="2">十一、本合同自双方签字、盖章且甲方支付全部货款后生效。</td>
  </tr>
  <tr> 
    <td colspan="2">十二、本合同一式四份，甲方持有一份，乙方持有三份，各份具有相同的法律效力。</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr> 
    <td width="60">&nbsp;</td>
    <td colspan="2">附件一：家具合同附件（此表应由客户签字确认）</td>
    <td width="410">附件二：家具设计图（此图应由客户签字确认）</td>
  </tr>
  <tr>
    <td width="60">&nbsp;</td>
    <td width="300">&nbsp;</td>
    <td width="164">&nbsp;</td>
    <td width="410">&nbsp;</td>
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="300">甲方签字：</td>
    <td width="164">&nbsp;</td>
    <td width="410">乙方：松下亿达</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>签订日期：<%=cf.today()%></td>
    <td>&nbsp;</td>
    <td>经办人：</td>
  </tr>
</table>
</body>
</html>
