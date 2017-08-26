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

	
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,fwdz,lxfs,sgd,sgbz,jhazrq,htze,qhtsj,jhazrq-qhtsj";
	    ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+ddbh+"'";
		ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="2"> <div align="center"> <strong>松下亿达家具订购合同</strong></div></td>
  </tr>
  <tr align="right"> 
    <td colspan="2"><div align="left"></div></td>
  </tr>
  <tr> 
    <td width="99%"><table width="965" border="0">
        <tr> 
          <th scope="row"></th>
          <td>合同编号：<%=ddbh%></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <th width="34" scope="row"></th>
          <td width="477"> 甲方（客户）：<%=khxm%> </td>
          <td width="440"> 乙 方：松下亿达装饰工程（大连）有限公司</td>
        </tr>
        <tr> 
          <th scope="row"></th>
          <td>联系电话：<%=lxfs%> </td>
          <td> 现场班长/电话：<u><%=sgbz%><%=bzdh%></u> </td>
        </tr>
        <tr> 
          <th scope="row"></th>
          <td>安装地址：<%=fwdz%> </td>
          <td> 安装时间：<%=jc_jjdd_jhazrq%></td>
        </tr>
      </table>
      <div align="center"></div></td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2"> <table width="100%" border="0">
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2"> &nbsp;&nbsp;&nbsp;为维护消费者、经营者合法权益，根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及其他相关法律、法规，签订本合同并共同遵守。</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2">一、产品名称、规格、数量、金额（见家具合同附件）：。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">二、付款和付款方式：</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td>1、本合同总金额人民币<u>&nbsp;&nbsp;&nbsp;<%=cf.NumToRMBStr(cf.doubleTrim(jc_jjdd_htze,0))%>&nbsp;&nbsp;&nbsp;</u>（￥<%=jc_jjdd_htze%>）甲方应于合同签订当日付清全部货款。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>2、因合同发生变更导致总价提高，在双方签订补充条款的当日甲方即应将加价款给付乙方。</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2">三、双方的权利、义务</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2"> <table width="100%" border="0">
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">1、乙方设计师有责任与甲方就设计方案及报价等进行充分沟通，明确甲方所订产品的一些重要特征，如功能性、材质、颜色等。在甲方理解、认可相关内容后，双方签字确认，作为履行合同的依据。</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">2、设计方案一经双方签字确认，无论哪一方需要更改，必须在签定合同后3日内提出。如提出期限超过3日，产品已下单生产但未全部生产完毕的，需由提出方对所造成的材料等费用损失及延迟交货等问题承担责任。若家具已经制作完毕再行更改的，需由提出方承担材料款、人工费。材料款、人工费按合同总价款的60%计。</td>
              </tr>
              <tr> 
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3、乙方已按交货日期生产完毕，但甲方现场不具备安装条件需延迟安装，此种情况不视为乙方违约。</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>4、因乙方原因未按期送货安装，需支付甲方违约项产品2‰的违约金，违约金最高不得超过合同总金额的20%。</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>5、因本合同中提供的家具产品属订制式产品，货物到场后非严重质量问题一般不予退换。</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>6、家具产品虽为工厂标准化生产，但因板材进货批次不同，会与展厅样品有微小色差，属正常误差范围，以实物为准。</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">7、 乙方对北京市五环内的客户免费送货，对于超出此范围的酌情收取远程费。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">四、送货：六环内免费送货安装，超出此范围需收费200元/户，北京市外的其他城市远程费另议。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">五、交货期: 乙方生产周期为<%=jhq%>天,于（<%=jc_jjdd_jhazrq%>）。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">六、安装：乙方需按照合同约定时间上门安装。安装时甲方现场需具备的条件：涂料、壁纸铺贴完毕；<br>
            地板、地砖施工完毕；吊顶处理完毕；踢脚线部位安装完毕。乙方将家具运抵安装现场后即可当日安装，安装周期为1—3天。订购数量较多的除外<br></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">七、保修期：自家具安装完毕，甲方签字验收之日起，即进入两年保修期。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">八、纠纷解决方式</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>1、因履行本合同所发生的任何争议双方应友好协商解决，协议不成的，任何一方均可向被告所在地人民法院起诉。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>2、甲乙双方可在不违背本合同的原则下签署补充协议，若补充协议与本合同有关条款相悖，按补充协议执行。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">九、共同说明</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>因家具为非精细加工产品，若是入墙式家具侧板距离墙壁每侧需留2—3公分的工艺缝，方便板件连接。</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">十、本合同自双方签字、盖章且甲方支付全部货款后生效。本合同一式四份，甲方持有一份，乙方持有三份，各份具有相同的法律效</td>
        </tr>
        <tr> 
          <td width="4%" rowspan="3">&nbsp;</td>
          <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;力。<BR> &nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">附件一：家具合同附件（此表应由客户签字确认）</td>
        </tr>
        <tr> 
          <td colspan="2">附件二：家具设计图（此图应由客户签字确认）</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="2"><strong> </strong></td>
  </tr>
  <tr> 
    <td colspan="2"><div align="left"><strong> </strong></div></td>
  </tr>
  <tr> 
    <td colspan="2"><table width="757" border="0">
        <tr> 
          <th width="26" scope="row">&nbsp;</th>
          <td width="721">&nbsp; </td>
        </tr>
      </table>
      <table width="952" border="0">
        <tr> 
          <td width="60">&nbsp;</td>
          <td width="300">甲方签字：</td>
          <td width="164">&nbsp;</td>
          <td width="410">乙方：松下亿达装饰工程（大连）有限公司</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>经办人：</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>签订日期：<%=cf.today()%></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
