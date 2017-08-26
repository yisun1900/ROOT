<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgph=cf.GB2Uni(request.getParameter("sgph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
//总部
String dwbh="&nbsp;";//单位编号
String dwmc="&nbsp;";//单位名称
String dh="&nbsp;";//电话
String cz="&nbsp;";//传真
String jbr="&nbsp;";//经办人
String jbrsj="&nbsp;";//经办人手机
String shr="&nbsp;";//收货人
String shrsj="&nbsp;";//收货人手机
String fzr="&nbsp;";//负责人
String fzrsj="&nbsp;";//负责人手机
String dz="&nbsp;";//地址
String khyh="&nbsp;";//开户银行
String zh="&nbsp;";//账号
String khrxm="&nbsp;";//开户人姓名
String sm1="&nbsp;";//说明1
String sm2="&nbsp;";//说明2
String khyh1="&nbsp;";//开户银行
String zh1="&nbsp;";//账号
String khrxm1="&nbsp;";//开户人姓名
String khyh2="&nbsp;";//开户银行
String zh2="&nbsp;";//账号
String khrxm2="&nbsp;";//开户人姓名
//分公司
String fgsdwbh="&nbsp;";//单位编号
String fgsdwmc="&nbsp;";//单位名称
String fgsdh="&nbsp;";//电话
String fgscz="&nbsp;";//传真
String fgsjbr="&nbsp;";//经办人
String fgsjbrsj="&nbsp;";//经办人手机
String fgsshr="&nbsp;";//收货人
String fgsshrsj="&nbsp;";//收货人手机
String fgsfzr="&nbsp;";//负责人
String fgsfzrsj="&nbsp;";//负责人手机
String fgsdz="&nbsp;";//地址
String fgskhyh="&nbsp;";//开户银行
String fgszh="&nbsp;";//账号
String fgskhrxm="&nbsp;";//开户人姓名
String fgssm1="&nbsp;";//说明1
String fgssm2="&nbsp;";//说明2
//材料申购单备注
String bz="&nbsp;";
String dqbm=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	//查询总部打印数据
	ls_sql="select jxc_fgslxr.dwmc dwmc,dh,cz,jbr,jbrsj,jxc_fgslxr.shr shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2,dqbm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2 ";
	ls_sql+=" from  jxc_fgslxr,sq_dwxx ";
	ls_sql+=" where jxc_fgslxr.dwbh='99999' and jxc_fgslxr.dwbh=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		jbr=cf.fillNull(rs.getString("jbr"));
		jbrsj=cf.fillNull(rs.getString("jbrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		fzr=cf.fillNull(rs.getString("fzr"));
		fzrsj=cf.fillNull(rs.getString("fzrsj"));
		dz=cf.fillNull(rs.getString("dz"));
		khyh=cf.fillNull(rs.getString("khyh"));
		zh=cf.fillNull(rs.getString("zh"));
		khrxm=cf.fillNull(rs.getString("khrxm"));
		sm1=cf.fillNull(rs.getString("sm1"));
		sm2=cf.fillNull(rs.getString("sm2"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		khyh1=cf.fillNull(rs.getString("khyh1"));
		zh1=cf.fillNull(rs.getString("zh1"));
		khrxm1=cf.fillNull(rs.getString("khrxm1"));
		khyh2=cf.fillNull(rs.getString("khyh2"));
		zh2=cf.fillNull(rs.getString("zh2"));
		khrxm2=cf.fillNull(rs.getString("khrxm2"));
	}
	rs.close();
	ps.close();

	//查询分公司打印数据
	ls_sql="select dwmc,dh,cz,jbr,jbrsj,jxc_fgslxr.shr shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2,bz ";
	ls_sql+=" from  jxc_fgslxr,jxc_clsgd ";
	ls_sql+=" where jxc_fgslxr.dwbh=jxc_clsgd.ssfgs and  (sgph='"+sgph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsdwmc=cf.fillNull(rs.getString("dwmc"));
		fgsdh=cf.fillNull(rs.getString("dh"));
		fgscz=cf.fillNull(rs.getString("cz"));
		fgsjbr=cf.fillNull(rs.getString("jbr"));
		fgsjbrsj=cf.fillNull(rs.getString("jbrsj"));
		fgsshr=cf.fillNull(rs.getString("shr"));
		fgsshrsj=cf.fillNull(rs.getString("shrsj"));
		fgsfzr=cf.fillNull(rs.getString("fzr"));
		fgsfzrsj=cf.fillNull(rs.getString("fzrsj"));
		fgsdz=cf.fillNull(rs.getString("dz"));
		fgskhyh=cf.fillNull(rs.getString("khyh"));
		fgszh=cf.fillNull(rs.getString("zh"));
		fgskhrxm=cf.fillNull(rs.getString("khrxm"));
		fgssm1=cf.fillNull(rs.getString("sm1"));
		fgssm2=cf.fillNull(rs.getString("sm2"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	else
	{
//		out.print("<font color=red>您没有录入分公司联系人！</font>");return;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
try{
	if (ps!= null) ps.close(); 
	if (conn != null) cf.close(conn); 
	}
catch (Exception e){
	if (conn != null) cf.close(conn); 
	}
}
%>
<body  style='FONT-SIZE: 14px'>
<table width="100%" border="1" cellspacing="0" style="border-color: #000000 #000000 #FFFFFF #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
  <tr width="25%" align="center" bgcolor="#FFFFFF"> 
    <td width="20%" rowspan="6"><img width="260px" src="/images/tubiao.jpg"></td>
    <td colspan="3"><strong>商品订单</strong></td>
	<td width="10%" align="right"><strong>订单号：</strong> </td>
  <td colspan="2" align="left"> <strong><%=sgph%>&nbsp;</strong> </td>   </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">发货方：</td>
	<td colspan="2" align="left"><%=dwmc%>&nbsp;</td>
    <td width="10%" align="right">收货方：</td>
    <td colspan="2" align="left"><%=fgsdwmc%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">经办人：</td>
	<td colspan="2" align="left"><%=jbr%>&nbsp;</td>
    <td width="10%" align="right">收货人： </td>
    <td colspan="2" align="left"><%=fgsshr%>&nbsp;</td>
  </tr>
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">电话：</td>
	<td colspan="2" align="left"><%=dh%>&nbsp;</td>
    <td width="10%" align="right">电话：</td>
    <td colspan="2" align="left"><%=fgsdh%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">传真：</td>
	<td colspan="2" align="left"><%=cz%>&nbsp;</td>
    <td width="10%" align="right">传真：</td>
    <td colspan="2" align="left"><%=fgscz%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">地址：</td>
	<td colspan="2" align="left"><%=dz%>&nbsp;</td>
    <td width="10%" align="right">地址：</td>
    <td colspan="2" align="left"><%=fgsdz%>&nbsp;</td>
  </tr>
</table>
<table width="100%" bgcolor="#000000"   border="1" cellspacing="0" style="border-color: #FFFFFF #000000 #000000 #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%"><b>商品名称</b></td>
    <td width="23%"><b>规格及型号</b></td>
	<td width="10%"><b>单位</b></td>
    <td width="9%"><b>数量</b></td>
    <td width="12%"><b>单价（元）</b></td>
	<td width="13%"><b>总价（元）</b></td>
 </tr>
 <%
 String clmc=null;
 String xh=null;
 String gg=null;
 String jldwbm=null;
 String xszl=null;
 double shsl=0;
 double dfgsjg=0;
 double zjg=0;
 double zzl=0;
 double sumzsl=0;
 double sumzzl=0;
 double sumzjg=0;
 try {
	conn=cf.getConnection();
	//查询商品详细信息
	ls_sql="select clmc,xh,gg,jldwbm,shsl,shjg,shje";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where jxc_clsgmx.sgph='"+sgph+"'";
	ls_sql+=" order by sgxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		shsl=rs.getDouble("shsl");
		dfgsjg=rs.getDouble("shjg");
		zjg=rs.getDouble("shje");

		sumzsl+=shsl;
		sumzjg+=zjg;
		sumzzl+=zzl;
		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td ><%=clmc%>&nbsp;</td>
			<td><%=gg%>/<%=xh%>&nbsp;</td>
			<td ><%=jldwbm%>&nbsp;</td>
			<td ><%=shsl%>&nbsp;</td>
			<td ><%=dfgsjg%>&nbsp; </td>
			<td ><%=zjg%>&nbsp;</td>
		 </tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
try{
	if (ps!= null) ps.close(); 
	if (conn != null) cf.close(conn); 
	}
catch (Exception e){
	if (conn != null) cf.close(conn); 
	}
}
%>
   
   <tr align="center" bgcolor="#FFFFFF"> 
    <td align="right">小 计:</td>
    <td >&nbsp;</td>
    <td >&nbsp; </td>
    <td ><%=cf.formatDouble(sumzsl)%>&nbsp;</td>
    <td >&nbsp; </td>
	<td  ><%=cf.formatDouble(sumzjg)%>&nbsp; </td>
 </tr>
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%" align="right">金额合计（大写）</td>
    <td colspan="6" align="left"><%=cf.NumToRMBStr(sumzjg)%>&nbsp;   </td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%" align="right">备注：</td>
    <td colspan="6" align="left"><%=bz%>&nbsp;</td>
  </tr>
</table>
<table width="100%" bgcolor="#000000"   border="1" cellspacing="0" style="border-color: #FFFFFF #000000 #000000 #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left"><p>外埠公司采购经理签字：</p>
    <p>签字日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p></td>
    <td colspan="3" align="left"><p>外埠公司总经理签字：</p>
    <p>签字日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><strong>货款支付方式：请尽快将款项汇入以下账号，款到后发货。</strong></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">账号：</td>
    <td width="28%" align="left"><%=zh%>&nbsp;</td>
    <td width="10%" align="right">开户行：</td>
    <td width="23%" align="left"><%=khyh%>&nbsp;</td>
    <td width="7%" align="right">户名：</td>
    <td width="19%" align="left"><%=khrxm%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">账号：</td>
    <td width="28%" align="left"><%=zh1%>&nbsp;</td>
    <td width="10%" align="right">开户行：</td>
    <td width="23%" align="left"><%=khyh1%>&nbsp;</td>
    <td width="7%" align="right">户名：</td>
    <td width="19%" align="left"><%=khrxm1%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">账号：</td>
    <td width="28%" align="left"><%=zh2%>&nbsp;</td>
    <td width="10%" align="right">开户行：</td>
    <td width="23%" align="left"><%=khyh2%>&nbsp;</td>
    <td width="7%" align="right">户名：</td>
    <td width="19%" align="left"><%=khrxm2%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="2" align="left"><strong>运费支付方式：货到付款</strong></td>
    <td colspan="2" align="left"><strong>运费金额：</strong></td>
    <td colspan="2" align="left">预计到货日期：
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日以前</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="center">以下由采购部填写</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left">货款是否收到：&nbsp;&nbsp;<input name="1" type="checkbox" value="1" />是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="12" type="checkbox" value="1" />否 </td>
    <td colspan="3" rowspan="2" align="left"><p>采购部经理签字：</p>
    <p>签字日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left"><p>采购部销售人员签字：</p>
    <p>签字日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><%=sm1%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><%=sm2%>&nbsp;</td>
  </tr>
</table>
</body>