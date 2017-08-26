<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
    String jc_mmydd_khxm=null;
	String jc_mmydd_lxfs=null;
    String jc_mmydd_fwdz=null;
	String jc_mmydd_jhtzshsj=null;
	String jc_mmydd_htrq=null;
    String jc_mmydd_jhazsj=null;
	String jc_mmydd_mmhtje=null;
	String jc_mmydd_wjhtje=null;
	String jc_mmydd_blhtje=null;
    double htje=0;  
    String jc_mmydd_azjssj=null;
    String htrq=null;
	String xhs=null;
	String jhsj=null;
	String hth=null;
	String jhq=null;
	String sfydy=null;
	String clzt=null;
	double dysj=0;
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	    ls_sql="select jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,jc_mmydd.clzt,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj,htrq,htrq+25 jhsj,htrq+28 xhs";
	    ls_sql+=" from  jc_mmydd,crm_khxx";
		ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   sfydy=cf.fillNull(rs.getString("sfydy"));
		   clzt=cf.fillNull(rs.getString("clzt"));
		   dysj=rs.getDouble("dysj");
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_mmydd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_mmydd_htrq=cf.fillNull(rs.getDate("htrq"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_mmhtje=cf.fillNull(rs.getString("mmhtje"));
		   jc_mmydd_wjhtje=cf.fillNull(rs.getString("wjhtje"));
		   jc_mmydd_blhtje=cf.fillNull(rs.getString("blhtje"));
		   hth=cf.fillNull(rs.getString("hth"));
		   htje=rs.getDouble("htje");
		   jc_mmydd_azjssj=cf.fillNull(rs.getDate("azjssj"));
		   htrq=cf.fillNull(rs.getDate("htrq"));
		   xhs=cf.fillNull(rs.getDate("xhs"));
		   jhsj=cf.fillNull(rs.getDate("jhsj"));
		 }
	     rs.close();
	     ps.close();

		 if (clzt.compareTo("04")<0)
		 {
			out.println("错误！未签订合同，不能打印");
			return;
		 }
		 if (sfydy.equals("Y"))
		 {
		 }
		 else{
			ls_sql="update jc_mmydd set sfydy='Y',dysj=SYSDATE";
			ls_sql+=" where  yddbh='"+yddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		 }


	     ls_sql=" select jhazsj-htrq from jc_mmydd";
	     ps= conn.prepareStatement(ls_sql);
	     rs =ps.executeQuery(ls_sql);
	     if (rs.next())
	     {
		     jhq=cf.fillNull(rs.getString("jhazsj-htrq"));
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
<title>木门合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><font size="4"><b>元 洲 木 门 订 购 合 同</b></font></td>
    <td width="27%">家装合同号：<%=hth%></td>
  </tr>
  <tr> 
    <td colspan="2">甲方（客户）：<%=jc_mmydd_khxm%></td>
    <td colspan="2">乙 方：松下亿达装饰工程（大连）有限公司</td>
  </tr>
  <tr> 
    <td colspan="2">联系电话：<%=jc_mmydd_lxfs%></td>
    <td colspan="2">合同附件编号：<%=yddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">施工地址：<%=jc_mmydd_fwdz%></td>
    <td colspan="2">乙方联系电话:010-84291188-客户服务部</td>
  </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;为维护消费者、经营者合法权益，根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及其他相关法律、法规，签订本合同并共同遵守。 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;一、产品名称、规格、数量、金额（见木门合同附件）： <br>
      &nbsp;&nbsp;&nbsp;&nbsp;二、付款方式：本合同总金额人民币：<u><%=cf.NumToRMBStr(cf.doubleTrim(htje,0))%></u>（￥<u><%=cf.doubleTrim(htje)+"0"%></u>），甲方应于合同签订当日付清全部货款。 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;三、双方责任及义务： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"> 
      <table width="100%" border="0" style='FONT-SIZE: 14px'>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%"> 1、本合同项下实木复合门产品虽为工厂标准化生产，但因板材进货批次不同，制成品如与展厅样品有微小色差，属正常误差范围，乙方确保交付给甲方的产品用材与展厅样品一致，最终交付以制成品为准。 
          </td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">2、本合同项下的木门是乙方专为甲方制作的订制式产品，除非型号、尺寸与本合同约定不符，否则一律不予退货。若甲方坚持退货，因此所造成的一切费用由甲方承担。</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">3、乙方测量单经甲方签字后，即视为对木门方案的确认，测量单与本合同具有同等效力，为双方履行本合同的依据。测量单一经确认后，单方不得擅自更改。如需更改，必须经双方签字认可，因改动所造成的经济损失及延迟交货等责任由提出更改方承担。甲方应确保实际选用的地材种类（地板厚度）与测量单中共同约定的相吻合，否则因此造成安装后门扇的扇地缝过大或过小的后果由甲方自负。</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">4、乙方如未按期送货安装，每延迟一天按违约项合同款的2‰支付违约金，违约金最高不超过违约项的总金额的20%。</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">5、乙方在与甲方确认方案、签订合同后，即可生产、安装。在本合同签订后3日内，甲方若对木门的材质、尺寸、颜色、安装位置有改动，需告知销售人员，经双方协商签订补充协议。如甲方改动方案在本合同签订三日后提出，而产品已下单生产但未全部生产完毕的，需由提出方对所造成的材料等费用损失及延迟交货等承担责任。若木门已经制作完毕再行更改的，需由提出方承担相应更改费用。</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="4"> &nbsp;&nbsp;&nbsp;&nbsp;四、乙方生产周期为25-35天，计划交货日期为：<u><%=jhsj%></u>，最迟交付日为：<u><%=xhs%></u>。 
      木门交货后即可进行安装，安装周期为1-5天，具体日期由甲方根据装修进度合理确定并通知乙方。 <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;五、送货：六环内免费送货，超出此范围按200元/次计收运输费用，北京市外的其他城市远程运费另议。 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;六、交货地点：为本合同约定的安装地址。如因甲方现场不具备安装条件，经双方同意可以延期送货安装，安装时间超出合同交付期三个月以上的，需支付100元/樘/月的保管费用。安装时现场需具备的条件：地板、地砖铺装完毕；墙砖铺完；过门石铺完；木制踢脚留到洞口一段（由木门安装工完成）、理石踢脚留到洞口一段（由做大理石工人完成）。 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;七、安装：乙方接到甲方通知后5日内派员到场进行安装。安装日期确定后双方不得变更，如有变更应另行商定安装日期。如因甲方的原因导致乙方人员无法进行安装的，人工费损失由甲方承担，每次以100元人民币计。 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;八、保修期：木门安装后甲方应当天对乙方制作的木门进行验收并签字确认，木门经甲方签字确认后即视为质量合格。自甲方签字验收之日起，即进入两年保修期，其他五金配件以其产品包装箱内的保修卡时间为准。安装完毕当天甲方没有到场签字确认，经乙方通知三日内仍未签字确认的，保修期自安装完毕之日起计算。 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;九、因履行本合同所发生的一切争议双方应友好协商解决，协商不成的，任何一方均可向被告所在地法院提起诉讼。 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;十、本合同一式四份，甲方持一份，乙方持三份。各份具有相同法律效力。 <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;十一、其他约定 <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、木门实木木皮饰面属天然材质，纹理、颜色存在差异，但同址门用材应为同一色号、相近纹理饰面； 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;十二、本合同自双方签字、盖章且甲方支付全部货款后生效。 </td>
  </tr>
  <tr> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2">甲方签字：</td>
    <td colspan="2">乙方：松下亿达装饰工程（大连）有限公司（盖章）</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td colspan="2">经办人：</td>
  </tr>
  <tr> 
    <td colspan="2">签订日期：<%=htrq%></td>
    <td colspan="2">签订日期：<%=htrq%></td>
  </tr>
</table>
</body>
</html>

