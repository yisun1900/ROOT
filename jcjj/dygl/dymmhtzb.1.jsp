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
	    ls_sql="select jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,jc_mmydd.clzt,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj,htrq,htrq+25 xhs";
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
		   jc_mmydd_htrq=cf.fillNull(rs.getString("htrq"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_mmhtje=cf.fillNull(rs.getString("mmhtje"));
		   jc_mmydd_wjhtje=cf.fillNull(rs.getString("wjhtje"));
		   jc_mmydd_blhtje=cf.fillNull(rs.getString("blhtje"));
		   hth=cf.fillNull(rs.getString("hth"));
		   htje=rs.getDouble("htje");
		   jc_mmydd_azjssj=cf.fillNull(rs.getDate("azjssj"));
		   htrq=cf.fillNull(rs.getDate("htrq"));
		   xhs=cf.fillNull(rs.getDate("xhs"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="2"> 
      <div align="center"><font size="4"><b>木门订购合同</b></font></div>
    </td>
  </tr>
  <tr align="right"> 
    <td colspan="2"> 
      <div align="left">合同编号：<%=hth%></div>
    </td>
  </tr>
  <tr> 
    <td width="50%">甲方（客户）：<%=jc_mmydd_khxm%></td>
    <td width="50%"> 乙方：松下亿达 </td>
  </tr>
  <tr> 
    <td width="50%">联系电话：<%=jc_mmydd_lxfs%></td>
    <td width="50%">合同附件编号：<%=yddbh%></td>
  </tr>
  <tr> 
    <td  width="50％">安装地址：<%=jc_mmydd_fwdz%></td>
    <td width="50%">乙方联系电话：010－84291188转项目管理部</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;为维护消费者、经营者合法权益，根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及有关规定，签订本合同并共同遵守。</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;一、 产品名称、规格、数量、金额（见附件）：<br>
      &nbsp;&nbsp;&nbsp;&nbsp;二、 付款方式：本合同总金额人民币:<u><%=cf.NumToRMBStr(cf.doubleTrim(htje,0))%>元整（￥<%=cf.doubleTrim(htje)+"0"%>）</u><br>
      甲方应于合同签订当日付清全部货款。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;三、 双方责任及义务：<br>
      &nbsp;&nbsp;&nbsp;&nbsp;1、乙方提供的木门为实木复合门。因实木木皮为天然产品，安装到甲方现场的木门若与乙方展厅样品在纹理、颜色上有微小差异，属合理范围。乙方确保交付给甲方的产品用材与展厅样品一致。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;2、本合同所签定的木门是乙方专为甲方制作的订制式产品，除非型号、尺寸与本合同约定不符，否则一律不予退货。若甲方坚持退货，因此所造成的一切费用由甲方承担。 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;3、乙方测量单经甲方签字后，即视为对木门方案的确认，测量单与本合同具有同等效力，为双方履行本合同的依据。测量单一经确认后，单方不得擅自更改。如需更改，必须经双方签字认可，因改动所造成的经济损失及延迟交货等责任由提出更改方承担。甲方应确保实际选用的地材种类（地板厚度）与测量单中共同约定的相吻合，否则会造成安装后门扇的扇地缝过大或过小。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;4、乙方如未按期送货安装，每延迟一天按违约项合同款的2‰支付违约金。违约金最高不超过违约项的总金额。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;四、交货期<u>25</u>天，自本合同签订之日起计算。最后交货日期为<u><%=xhs%></u>。木门交货后即可进行安装，实际安装日期由甲方根据装修进度合理确定。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;五、送货：六环内免费送货，六环以外运费由甲方承担。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;六、交货地点：为本合同约定的安装地址。如因甲方现场不具备安装条件，经双方同意可以延期送货安装。安装时现场需具备的条件：地板、地砖铺装完毕；墙砖铺完；过门石铺完；木制踢脚留到洞口一段（由木门安装工完成）、理石踢脚留到洞口一段（由做大理石工人完成）。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;七、安装：乙方接到甲方通知后5日内派员到场进行安装。安装日期确定后双方不得变更，如有变更应另行商定安装日期。如因甲方的原因导致乙方人员无法进行安装的，人工费损失由甲方承担，每次以100元人民币计。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;八、保修期：木门安装后甲方应对乙方制作的木门进行验收并签字确认，木门经甲方签字确认后即视为质量合格。自甲方签字验收之日起，即进入两年保修期。无甲方签字确认，保修期自安装完毕之日起计算。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;九、因履行本合同所发生的一切争议双方应友好协商解决，协商不成的，任何一方均可向被告所在地法院提起诉讼。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;十、本合同一式四份，甲方持一份，乙方持三份。各份具有相同法律效力。本合同经双方签字、盖章后生效。</td>
  </tr>
  <tr>
    <td  width="50％">&nbsp;</td>
    <td width="50％">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="50％">甲方签字：</td>
    <td width="50％">乙方：松下亿达（盖章）</td>
  </tr>
  <tr> 
    <td  width="50％">&nbsp;&nbsp;</td>
    <td width="50％">经办人：</td>
  </tr>
  <tr> 
    <td  width="50％">签订日期：<%=htrq%></td>
    <td width="50％">签订日期：<%=htrq%></td>
</table>

        <tr> 
          
  <td width="121">&nbsp; </td>
</tr>
<p>&nbsp;</p>
      </body>
</html>

