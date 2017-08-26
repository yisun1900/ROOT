<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>



<body bgcolor="#FFFFFF">

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String xxshyj=null;
String hxbm=null;
String fwmj=null;


double sjhtje=0;

double wdzgce=0;
double qye=0;
double zhgczjf=0;
double suijin=0;
double zkl=0;
double zhzjxje=0;
double glftd=0;
double guanlif=0;
double zhqtsf=0;
double zhwjrqyexm=0;



int gqts=0;
String zqkrq=null;
String email=null;
String qtfy="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_khxx.email,kgrq+gqts/2 zqkrq,gqts,zhqtsf,zhwjrqyexm,zhgczjf,xxshyj,guanlif,fgsbh,glftd,zhzjxje,zkl,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.sgd,sgdmc,crm_khxx.sgbz,crm_khxx.dwbh,dwmc,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.zjxm,qyrq,kgrq,jyjdrq,jgrq,wdzgce,qye,suijin,DECODE(crm_khxx.bjjb,'A','普通','B','精品','C','乐华梅兰') bjjb,crm_khxx.fwmj,crm_khxx.hxbm";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		email=cf.fillHtml(rs.getString("email"));
		zqkrq=cf.fillNull(rs.getDate("zqkrq"));
		gqts=rs.getInt("gqts");
		zhqtsf=rs.getDouble("zhqtsf");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		zhgczjf=rs.getDouble("zhgczjf");
		xxshyj=cf.fillHtml(rs.getString("xxshyj"));
		guanlif=rs.getDouble("guanlif");
		glftd=rs.getDouble("glftd");
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillHtml(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillHtml(rs.getString("cxhdbmzh"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		fgsbh=cf.fillHtml(rs.getString("fgsbh"));
		fwmj=cf.fillHtml(rs.getString("fwmj"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));

		//sjhtje=rs.getDouble("sjhtje");

		if (!zqkrq.equals(""))
		{
			zqkrq=zqkrq.substring(0,4)+"年"+zqkrq.substring(5,7)+"月"+zqkrq.substring(8,10)+"日前";
		}
	}
	rs.close();
	ps.close();


	String getsfxmmc="";
	String getsfje="";

	ls_sql=" select sfxmmc,sfje ";
	ls_sql+=" from bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx not in('5','6')";
	ls_sql+=" order by sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		getsfje=cf.fillNull(rs.getString("sfje"));

		qtfy+=getsfxmmc+":"+getsfje+"&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	rs.close();
	ps.close();

	if (qtfy.equals(""))
	{
		qtfy="其它费：0";
	}


	

	
	
	//提量房订金收据编号
	String lfsjbh="&nbsp;";	
	String jlfdjsj="&nbsp;";
	double lfdj=0;
	ls_sql=" select sjbh,fkje,sksj ";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='52' and khbh='"+khbh+"' and scbz='N' and fkje>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lfsjbh=cf.fillNull(rs.getString("sjbh"));
		lfdj=rs.getDouble("fkje");
		jlfdjsj=cf.fillNull(rs.getDate("sksj"));
	}
	rs.close();
	ps.close();

	double alllfdj=0;
	ls_sql=" select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='52' and khbh='"+khbh+"' and scbz='N'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		alllfdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (alllfdj==0)
	{
		lfsjbh="&nbsp;";	
		jlfdjsj="&nbsp;";
		lfdj=0;
	}

	//提取实收设计费金额
	String sjsjbh="&nbsp;";	
	double sjf=0;
	String jsjfsj="&nbsp;";	
	ls_sql=" select sjbh,fkje,sksj ";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='53' and khbh='"+khbh+"' and scbz='N' and fkje>0 ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsjbh=cf.fillNull(rs.getString("sjbh"));
		sjf=rs.getDouble("fkje");
		jsjfsj=cf.fillNull(rs.getDate("sksj"));
	}
	rs.close();
	ps.close();

	double allsjf=0;
	ls_sql=" select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='53' and khbh='"+khbh+"' and scbz='N'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allsjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (allsjf==0)
	{
		sjsjbh="&nbsp;";	
		sjf=0;
		jsjfsj="&nbsp;";	
	}


	ls_sql="update crm_khxx set dybz='Y',dysj=SYSDATE ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

%>



<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">家装合同重要信息确认表</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
    <tr height="29"> 
    
    <td colspan="8" align="center"><b>合同基础信息</b></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>客户姓名</b></td>
    <td colspan="2"><%=khxm%></td>
    <td width="12%" align="center"><b>电 话</b></td>
	 <td colspan="2" ><%=lxfs%></td>
    <td width="11%" align="center"><b>合 同 号</b></td>
    <td width="15%" ><%=hth%></td>
  </tr>
  <tr height="29"> 
  <td align="center"><b>设计师</b></td>
    <td colspan="2"><%=sjs%></td>
    <td align="center"><b>客户邮箱</b></td>
	 <td colspan="4" ><%=email%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>房屋地址</b></td>
    <td colspan="7"><%=fwdz%></td>
  </tr>
    <tr height="29"> 
  <td align="center"><b>合同订金</b></td>
    <td colspan="2"><%=lfdj%></td>
    <td align="center"><b>交款时间</b></td>
	 <td colspan="2" ><%=jlfdjsj%></td>
      <td width="11%" align="center"><b>收据编号</b></td>
    <td ><%=lfsjbh%></td>
  </tr>
  <tr height="29"> 
  <td width="14%" align="center"><b>设计费</b></td>
    <td colspan="2"><%=sjf%></td>
    <td align="center"><b>交款时间</b></td>
	 <td colspan="2" ><%=jsjfsj%></td>
    <td width="11%" align="center"><b>收据编号</b></td>
    <td ><%=sjsjbh%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>工程装修面积</b></td>
    <td colspan="2"><%=fwmj%></td>
    <td align="center"><b>工程户型</b></td>
    <td colspan="4"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>签约日期</b></td>
    <td colspan="2"><%=qyrq%></td>
    <td align="center"><b>合同工期</b></td>
    <td colspan="4"><%=kgrq%>---<%=jgrq%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工期：<%=gqts%>天</td>
  </tr>
 
  <tr height="29"> 
    <td colspan="8" align="center" height="27"><b>工程款和报价项目</b></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>合同签约额</b></td>
    <td width="12%" align="center"><strong>小写金额</strong></td>
    <td colspan="2"><%=cf.formatDouble(qye)%></td>
    <td width="12%" align="center"><b>大写金额</b></td>
    <td colspan="3"><%=cf.NumToRMBStr(qye)%></td>
  </tr>
 <tr height="29"> 
    <td align="center"><b>工程相关费</b></td>
    <td colspan="7"><b><%=qtfy%></b></td>
  </tr>
  <tr height="29"> 
    <td  align="center"><b>工程签约额</b></td>
    <td colspan="2"><%=zhgczjf%></td>
    <td align="center"><b>税　　金</b></td>
    <td><b><%=suijin%></b></td>
    <td colspan="2" align="center"><b>项目管理费</b></td>
    <td><%=guanlif%></td>
  </tr>
   <tr height="29"> 
    <td colspan="3" align="center"><b>有<input type="checkbox" name="checkbox" value="checkbox">无<input type="checkbox" name="checkbox" value="checkbox">促销活动</b></td>
    <td  align="center" colspan="2"><b>促销活动名称</b></td>
	 <td colspan="3"><%=cxhdbm%><%=cxhdbmxq%><%=cxhdbmzh%></td>
  </tr>
   
  
  <tr height="29"> 
    <td colspan="8" ><b>&nbsp;&nbsp;合同签字生效后，客户按下列表中的约定支付工程款：</b></td>
  </tr>

  <tr height="29"> 
    <td align="center"><b>支付次数</b></td>
	   <td colspan="3" align="center"><b>支付时间</b></td>
	   <td  colspan="2" align="center"><b>工程款支付比率</b></td>
    <td colspan="2" align="center"><b>应支付金额</b></td>
  </tr>

<%
	int fkqs=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkfa,cw_fkfamx,cw_fkcs";
	ls_sql+=" where  cw_khfkfa.fkfabm=cw_fkfamx.fkfabm";
	ls_sql+=" and  cw_fkfamx.fkcs=cw_fkcs.fkcs";
	ls_sql+=" and cw_khfkfa.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkqs=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String fkcsmc="";
	int fkcs=0;
	double bqfkbl=0;
	ls_sql="select cw_fkfamx.fkcs,fkcsmc,bqfkbl";
	ls_sql+=" from  cw_khfkfa,cw_fkfamx,cw_fkcs";
	ls_sql+=" where  cw_khfkfa.fkfabm=cw_fkfamx.fkfabm";
	ls_sql+=" and  cw_fkfamx.fkcs=cw_fkcs.fkcs";
	ls_sql+=" and cw_khfkfa.khbh='"+khbh+"'";
	ls_sql+=" order by cw_fkfamx.fkcs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkcs=rs.getInt("fkcs");
		fkcsmc=rs.getString("fkcsmc");
		bqfkbl=rs.getDouble("bqfkbl");

		String fksjStr="";

		if (fkqs==2)
		{
			if (fkcs==1)
			{
				fksjStr="开工三日前";
			}
			else if (fkcs==2)
			{
				fksjStr="竣工验收合格2日内";
			}
		}
		else if (fkqs==3)
		{
			if (fkcs==1)
			{
				fksjStr="开工三日前";
			}
			else if (fkcs==2)
			{
				fksjStr=zqkrq;
			}
			else if (fkcs==3)
			{
				fksjStr="竣工验收合格2日内";
			}
		}
		else if (fkqs==4)
		{
			if (fkcs==1)
			{
				fksjStr="开工三日前";
			}
			else if (fkcs==2)
			{
				fksjStr="水电等隐蔽工程验收后";
			}
			else if (fkcs==3)
			{
				fksjStr="中期验收后";
			}
			else if (fkcs==4)
			{
				fksjStr="竣工验收合格5日内";
			}
		}

		if (fksjStr.equals(""))
		{
			fksjStr="&nbsp;";
		}

		%>
		<tr height="29"> 
			<td align="center"><b><%=fkcsmc%></b></td>
			<td colspan="3" align="center"><b><%=fksjStr%></b></td>
			<td colspan="2" align="center"><b><%=cf.formatDouble(bqfkbl,"###")%>%</b></td>
			<td colspan="2" align="center"><%=cf.formatDouble(qye*bqfkbl/100)%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


%>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"style='FONT-SIZE: 14px'>
 <tr height="29"> 
  
    <td ></td>
  </tr> 
  <tr height="29"> 
  
    <td >备注：1、本表为家装合同重要附件，客户必须签字确认。</td>
  </tr>
   <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、本表中的合同金额为预算金额，净增项款须在中期缴纳，合同决算金额待工程完工后</td>
  </tr>
   <tr height="29">
     <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以实际发生为准。</td>
   </tr>
   <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、定金收据上客户名称应与合同上客户名称相符，定金冲抵工程尾款，须出示收据原件。</td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、工程相关费不包含在“合同签约额”中，须在合同签订时一次全额交纳。 </td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、请将款项交给我公司指定的收款人员，同时妥善保管盖有我公司收款专用章的收据。</td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6、请客户留下有效的电话号码和邮箱地址，以保证公司能够正常联络到客户本人。</td>
  </tr>
  <tr height="29"> 
  
    <td ></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"style='FONT-SIZE: 14px'>
  <tr height="100"> 
  
    <td width="31%" >&nbsp;</td>
	<td width="23%" >客户签字：</td>
	<td width="46%" >日期：</td>
  </tr>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
 





