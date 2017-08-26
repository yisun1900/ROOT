<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=request.getParameter("ddbh");
    String jc_cgdd_khxm=null;
	String jc_cgdd_lxfs=null;
    String jc_cgdd_fwdz=null;
    String jc_cgdd_jhazrq=null;
	String jc_cgdd_cghtze=null;
	String jc_cgdd_dqhtze=null;
	String jc_cgdd_wjhtze=null;
	String jc_cgdd_htze=null;
    String jc_cgjgb_cgmc=null;
	String jc_cgyddmx_zj=null;

    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	     ls_sql="select khxm,fwdz,lxfs,jhazrq,cghtze,dqhtze,wjhtze,htze";
	    ls_sql+=" from  jc_cgdd";
		ls_sql+=" where ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgdd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_cgdd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_cgdd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_cgdd_jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		   jc_cgdd_cghtze=cf.fillNull(rs.getString("cghtze"));
		   jc_cgdd_dqhtze=cf.fillNull(rs.getString("dqhtze"));
		   jc_cgdd_wjhtze=cf.fillNull(rs.getString("wjhtze"));
		   jc_cgdd_htze=cf.fillNull(rs.getString("htze"));

		 }
	     rs.close();
	     ps.close();
        
		ls_sql="select jc_cgjgb.cgmc,jc_cgyddmx.cgbm";
	    ls_sql+=" from  jc_cgjgb,jc_cgyddmx";
		ls_sql+=" where jc_cgjgb.cgbm=jc_cgyddmx.cgbm and ddbh='"+ddbh+"' ";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgjgb_cgmc=cf.fillNull(rs.getString("cgmc"));

		 }
	     rs.close();
	     ps.close();

		ls_sql="select tmcd*tmdj";
	    ls_sql+=" from  jc_cgyddmx";
		ls_sql+=" where  ddbh='"+ddbh+"' ";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgyddmx_zj=cf.fillNull(rs.getString("tmcd*tmdj"));

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
<title>橱柜定购合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="3"> 
      <div align="center"> <strong>橱柜订购合同</strong> </div>
    </td>
  </tr>
  <tr align="right"> 
    <td colspan="3">合同编号：<%=ddbh%></td>
  </tr>
  <tr>

    <td width="62%">甲方（客户）：<%=jc_cgdd_khxm%></td>
    <td width="34%"> 乙方：北京松下亿达装饰有限责任公司 </td>
  </tr>
  <tr>

    <td width="62%">联系电话：<%=jc_cgdd_lxfs%></td>
    <td width="34%">安装时间：<%=jc_cgdd_jhazrq%></td>
  </tr>
  <tr> 
    <td colspan="3">安装地址：<%=jc_cgdd_fwdz%></td>
  </tr>
  <tr> 
    <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;为维护消费者、经营者合法权益，根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及有关规定，签订本合同并共同遵守。</td>
  </tr>
  <tr> 
    <td colspan="3">
      <table width="100%" border="0">
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%">一、产品名称、规格、数量、金额（见附件）： </td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"><strong>二、甲方权利和义务</strong> </td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"> 
            <table width="100%" border="0">
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">1、 


甲方有权要求所订购橱柜的用材、柜体结构、质量与乙方报价中的陈述保持一致（甲方特殊要求除外）。</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">2、 


甲方有权要求乙方的设计师按照厨房的布局合理地进行设计，并详细讲解给客户，经甲方签字确认后方可生产。</td>
              </tr>
              <tr> 
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3、 


甲方自购的电器、水槽等产品，必须在签订本合同之前向设计师提供自购产品实物或彩页及外形尺寸，需在合同中注明，并签字确认。</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">4、 


若因甲方自购的产品在安装时未及时到位，导致乙方二次上门安装，需向甲方收取100元/次的费用。</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><strong>三、<strong>乙方权利和义务</strong> </strong> </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><table width="100%" border="0">
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">1、 


乙方在与甲方确认方案后，即可按照双方签字确认的图纸生产、安装。现场若对安装高度或安放位置有改动，需甲方签字确认；若对柜子尺寸有改动，需先告知设计师，经双方讨论后，甲方签字认可，并将整改费交到乙方财务后下单生产方可安装。</td>
              </tr>
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">2、 


乙方需按照合同约定时间上门安装，橱柜的安装周期为1—5天。若因乙方原因，造成的延期安装，需支付甲方违约项合同款的0.2%的违约金。</td>
              </tr>
              <tr>
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3、 


由于橱柜为订制产品，因此若非严重产品质量问题，乙方不予退货。</td>
              </tr>
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">4、 


六环内免费送货安装，超出此范围需收费200元/户，北京市外的其他城市远程费另议。</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>5、


自安装完毕甲方签字确认之日起，甲方的橱柜即进入售后保修期，保修期为二年，终身维护。</td>
              </tr>
          </table></td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"> 四、解决纠纷按以下程序： <BR>
          &nbsp;&nbsp;&nbsp;&nbsp;1、 双方协商解决；<BR>&nbsp;&nbsp;&nbsp;&nbsp;2、 提交北京仲裁委员会仲裁。 </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="3"><div align="left"><strong>    <strong>特别说明：每套橱柜允许累计负公差台面10㎜，柜体15㎜。</strong> </strong></div></td>
  </tr>
  <tr> 
    <td colspan="3"> 此单为保修依据，请妥善保存，如有维修事项请拔打售后服务电话：84291188-项目管理部。</td>
  </tr>
  <tr> 
    <td colspan="3"><table width="757" border="0">
      <tr>
        <th width="26" scope="row">&nbsp;</th>
        <td width="721"><strong>橱柜应交款项如下（详细材料见附件）：</strong> </td>
      </tr>
    </table>
      <table width="87%" height="37" border="1" cellspacing="0" bordercolor="#000000">
        <tr>
          <td width="91" height="18"> 所订款式 </td>
          <td width="113"><div align="center"> 台面部分价格 </div></td>
          <td width="120"><div align="center"> 柜体部分价格 </div></td>
          <td width="96"><div align="center"> 配件部分价格 </div></td>
          <td width="115"> 电器、水槽价格 </td>
          <td width="125"><div align="center"> 总价 </div></td>
        </tr>
        <tr>
          <td height="17"><%=jc_cgjgb_cgmc%></td>
          <td><%=jc_cgyddmx_zj%></td>
          <td><%=jc_cgdd_cghtze%></td>
          <td><%=jc_cgdd_wjhtze%></td>
          <td><%=jc_cgdd_dqhtze%></td>
          <td><%=jc_cgdd_htze%></td>
        </tr>
      </table>
      <table width="660" border="0">
        <tr>
          <td width="32">&nbsp;</td>
          <td width="204">甲方签字：</td>
          <td width="70">&nbsp;</td>
          <td width="336">乙方：北京松下亿达装饰有限责任公司（盖章）</td>
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
      </table>      <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
