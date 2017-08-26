<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=request.getParameter("khbh");

int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxssk=0;

double zqgczjf=0;
double zhgczjf=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
double zkl=0;
double gckk=0;

double zqsuijin=0;
double suijin=0;
double zqzjxsuijin=0;
double zjxsuijin=0;
double suijinbfb=0;

double zqguanlif=0;
double guanlif=0;
double zqzjxguanlif=0;
double zjxguanlif=0;

double zqqtsf=0;
double zhqtsf=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm=null;

double zqqtsfzjx=0;
double zhqtsfzjx=0;
double zqwjrzjx=0;
double zhwjrzjx=0;

double zqljzjx=0;
double zhljzjx=0;

String sgbz=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double scfjk=0;
double jxglf=0;
double rzf=0;

double getsfke=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String zcmmbz="";//主材收款检查
String mmbz="";//木门收款检查
String cgjjbz="";//橱柜收款检查
String jjbz="";//家具收款检查

String fkxh="";
String jzwkqs="";

String qdbz="";

try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.bz,crm_khxx.jzwkqs,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,cxhdbmxq,cxhdbmzh,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq";
	ls_sql+=" ,wjrqyexmsm,zqljzjx,zhljzjx,DECODE(zjxwcbz,'1','未发生增减项','2','发生增减项','3','已完成增减项') zjxwcbz";

	ls_sql+=" ,zqgczjf,zhgczjf,zqsuijin,zqzjxsuijin,zqguanlif,zqzjxguanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,zqqtsfzjx,zhqtsfzjx,zqwjrzjx,zhwjrzjx";
	
	
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");



		qdbz=cf.fillNull(rs.getString("bz"));
		jzwkqs=cf.fillNull(rs.getString("jzwkqs"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();
	ps.close();

	if (jzwkqs.equals(""))
	{
		jzwkqs="N";//Y：全收；N：否
	}

	ls_sql=" select zcmmbz,mmbz,cgjjbz,jjbz ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//已收工程款
	}
	rs.close();
	ps.close();


	if (fgsbh.equals(""))
	{
		out.println("错误！所属分公司为空");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("错误！所属店面为空");
		return;
	}
	


	//市场返卷款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91：市场返卷款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scfjk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//减项管理费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";//94：减项管理费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//认证费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='95' and scbz='N'";//95：认证费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rzf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fkxh=khbh+cf.addZero(count+1,3);

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="7%">收款序号</td>
			<td  width="14%" colspan="2">收款类型</td>
			<td  width="9%" bgcolor="#CCCCCC">收款品牌</td>
			<td  width="7%" bgcolor="#CCCCCC">收款订单编号</td>
			<td  width="7%" bgcolor="#CCCCCC">收款增减项编号</td>
			<td  width="8%">实收款金额</td>
			<td  width="5%">审核</td>
			<td  width="6%">支付</td>
			<td  width="7%">转帐款项</td>
			<td  width="9%">转帐品牌</td>
			<td  width="7%">转帐订单编号</td>
			<td  width="7%">转帐增减项编号</td>
			<td  width="7%">收款时间</td>
		</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		String getddbh=null;
		String getzjxbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getzcddbh=null;
		String getzczjxbh=null;
		String getsksj=null;

		String getddlxmc="";

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','不需','2','需审核') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sksj";
		ls_sql+=" ,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材') ddlxmc";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs,jc_zcdd  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,jc_zcdd.ddlx,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getddlxmc=cf.fillHtml(rs.getString("ddlxmc"));
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getzcddbh=cf.fillHtml(rs.getString("zcddbh"));
			getzczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

			if (getfkcsmc.equals("&nbsp;"))
			{
				getfkcsmc=getddlxmc;
			}

			if (!oldfklxmc.equals(fklxmc))
			{
				if (!oldfklxmc.equals(""))
				{
					%>
					<tr bgcolor="#FFFFFF"  align="center">
						<td colspan='2'><B><<%=oldfklxmc%>>小计</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<%
				}

				oldfklxmc=fklxmc;
				xjfkje=0;
			}

			xjfkje+=getfkje;
			zjfkje+=getfkje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
				<td><%=fklxmc%></td>
				<td><%=getfkcsmc%></td>
				<td><%=getgysbh%></td>
				<td><%=getddbh%></td>
				<td><%=getzjxbh%></td>
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getzcddbh%></td>
				<td><%=getzczjxbh%></td>
				<td><%=getsksj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='2'><B><<%=fklxmc%>>小计</B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='5'><B>总 计</B></td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
			<td>&nbsp;</td>
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

<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%"> 
      <div align="center">[<%=khxm%>]付款记录（收款序号：<%=fkxh%>） 
<%
	if (getsfke!=sfke)
	{
		out.println("<B><font color='#FF0033'>警告！『已收工程款』与明细不符，已收工程款＝"+sfke+"；明细="+getsfke+"</font></B>");
	}
%>
	</div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="32%"><%=khbh%>（<%=ztmc%>）</td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"> 
                房屋地址              </td>
              <td width="32%"> <%=fwdz%></td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"> 
                签约店面              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#E8E8FF" align="right" width="19%">设计师</td>
              <td width="31%"> <%=sjs%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">施工队（班长）</td>
              <td><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%>）</td>
              <td align="right">质检</td>
              <td width="31%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"> 
                签约－－合同竣工              </td>
              <td width="32%">[<%=qyrq%>]－－[<%=jgrq%>]</td>
              <td width="19%" align="right"> 
                工程进度              </td>
              <td width="31%"><%=gcjdmc%> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">签单备注</td>
              <td colspan="3"><%=qdbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"  align="right"><font color="#FF0000">*</font>收款期数</td>
              <td width="32%" > 
                <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_getYfk(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cw_fkfamx.fkcs,cw_fkcs.fkcsmc||':'||cw_fkfamx.bqfkbl||'%' from cw_fkcs,cw_fkfamx,cw_khfkfa where cw_fkcs.fkcs=cw_fkfamx.fkcs and cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' order by cw_fkfamx.fkcs","");
%> 
                </select>              </td>
              <td width="19%"  align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>收款类型</td>
              <td width="31%" > 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='11'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"  align="right"><font color="#0000FF">本期应收款金额</font></td>
              <td width="32%" > 
                <input type="text" name="yfkje" value="" size="20" maxlength="20" readonly>              </td>
              <td width="19%"  bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font><font color="#0000FF">累计应收款比率</font></td>
              <td width="31%" > 
                <input type="text" name="yfkbl" value="" size="6" maxlength="20" readonly>
                % <font color="#FF0033">（如：尾款应100）</font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"  align="right"><font color="#FF0000">*</font>实收款金额</td>
              <td width="32%" > 
                <input type="text" name="fkje" value="" size="20" maxlength="17"  onchange="checkZkje(insertform)">              </td>
              <td width="19%"  bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>支付方式</td>
              <td width="31%" > 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td  align="right"><font color="#FF0000"><strong>是否发生增减项</strong></font></td>
              <td ><font color="#FF0000"><strong><%=zjxwcbz%></strong></font></td>
              <td  bgcolor="#FFFFFF" align="right">银行转帐帐号</td>
              <td ><input name="zzyhkh" type="text" value="" size="20" maxlength="40"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"  align="right">转帐款项</td>
              <td width="32%" > 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm!='11' order by fklxbm","");
%> 
                </select>              </td>
              <td width="19%"  bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>家装尾款全收</td>
              <td width="31%" >
<%
	cf.radioToken(out, "jzwkqs","Y+全收&N+否","");
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">转帐品牌</td>
              <td colspan="3"><select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:528PX"  onChange="checkZkje(insertform)">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>收款人              </td>
              <td width="32%"> 
                <input type="text" name="skr" value="<%=yhmc%>" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font>收款时间              </td>
              <td width="31%"> 
                <input type="text" name="sksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">收款单位</font></td>
              <td width="32%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
                </select>              </td>
              <td width="19%" align="right">收据编号</td>
              <td width="31%"> 
                <input type="text" name="sjbh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
              <textarea name="bz" cols="73" rows="2"></textarea></td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
                <input type="hidden" name="fkkhxm" value="<%=khxm%>" >
                <input type="hidden" name="fkfwdz" value="<%=fwdz%>" >
                <input type="hidden" name="sjs" value="<%=sjs%>" >
                <input type="hidden" name="sjsbh" value="<%=sjsbh%>" >
                <input type="hidden" name="dwbh" value="<%=dwbh%>" >
                <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
                <input type="hidden" name="fkxh" value="<%=fkxh%>" >
                <input type="hidden" name="lrr" value="<%=yhmc%>">
                <input type="hidden" name="lrsj" value="<%=cf.today()%>">
                <input type="hidden" name="lrdw" value="<%=lrdw%>">
                <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
                <input name="ks" type="button" onClick="f_new(insertform)"  value="录入下一笔" disabled>
                <input type="reset"  value="重输" name="reset">
                <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" >
                <input name="pr" type="button" value="打印收据" onClick="window.open('/cwgl/qyecx/PrintJzSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" disabled>
                <input name="pr2" type="button" value="选择打印" onClick="window.open('/cwgl/qyecx/PrintChooseJzSj.jsp?fkxh=<%=fkxh%>')" disabled>              </td>
            </tr>
        </table>


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">合同折扣</td>
              <td width="17%"><%=zkl%></td>
              <td width="15%" align="right">税金百分比</td>
              <td width="17%"><%=suijinbfb%>%</td>
              <td width="17%" align="right">家装收款期数</td>
              <td width="16%"><%=fkcsmc%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="center"><b>合同情况</b></td>
              <td colspan="2" bgcolor="#FFFFCC" align="center"><b>增减项情况</b></td>
              <td colspan="2" align="center"><b>实际发生额</b></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><strong>合同总额-折前</strong></td>
              <td ><strong><%=wdzgce%></strong></td>
              <td align="right" bgcolor="#FFFFCC"><strong>增减项总额-折前</strong></td>
              <td bgcolor="#FFFFCC"><strong><%=zqljzjx%></strong></td>
              <td align="right"><strong>总计-折前</strong></td>
              <td ><strong><%=cf.formatDouble(wdzgce+zqljzjx)%></strong></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><strong>合同总额-折后</strong></td>
              <td ><strong><%=qye%></strong></td>
              <td align="right" bgcolor="#FFFFCC"><strong>增减项总额-折后</strong></td>
              <td bgcolor="#FFFFCC"><strong><%=zhljzjx%></strong></td>
              <td align="right"><strong>总计-折后</strong></td>
              <td ><strong><%=cf.formatDouble(qye+zhljzjx)%></strong></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF">工程总额-折前</td>
              <td ><%=zqgczjf%></td>
              <td align="right" bgcolor="#FFFFCC">折前-增减项</td>
              <td bgcolor="#FFFFCC"><%=zjxje%></td>
              <td align="right">折前实际发生额</td>
              <td ><%=cf.formatDouble(zqgczjf+zjxje)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">工程总额-折后</td>
              <td ><%=zhgczjf%></td>
              <td align="right" bgcolor="#FFFFCC">折后增减项</td>
              <td bgcolor="#FFFFCC"><%=zhzjxje%> </td>
              <td align="right">折后实际发生额</td>
              <td ><%=cf.formatDouble(zhgczjf+zhzjxje)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">管理费-折前</td>
              <td ><%=zqguanlif%></td>
              <td align="right" bgcolor="#FFFFCC">折前-增减项</td>
              <td bgcolor="#FFFFCC"><%=zqzjxguanlif%></td>
              <td align="right">折前-总管理费</td>
              <td ><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">管理费-折后</td>
              <td ><%=guanlif%></td>
              <td align="right" bgcolor="#FFFFCC">折后增减项</td>
              <td bgcolor="#FFFFCC"><%=zjxguanlif%></td>
              <td align="right">折后-总管理费</td>
              <td ><%=cf.formatDouble(guanlif+zjxguanlif)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right"><font color="#0000CC">工程管理费合计-折前</font></td>
              <td ><font color="#0000CC"><%=cf.formatDouble(zqgczjf+zqguanlif)%></font></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#0000CC">折前-增减项</font></td>
              <td bgcolor="#FFFFCC"><font color="#0000CC"><%=cf.formatDouble(zjxje+zqzjxguanlif)%></font></td>
              <td align="right"><font color="#0000CC">折前-合同加增减项</font></td>
              <td ><font color="#0000CC"><%=cf.formatDouble(zqgczjf+zjxje+zqguanlif+zqzjxguanlif)%></font></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#0000CC">工程管理费合计-折后</font></td>
              <td ><font color="#0000CC"><%=cf.formatDouble(zhgczjf+guanlif)%></font></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#0000CC">折后增减项</font></td>
              <td bgcolor="#FFFFCC"><font color="#0000CC"><%=cf.formatDouble(zhzjxje+zjxguanlif)%></font></td>
              <td align="right"><font color="#0000CC">折后-合同加增减项</font></td>
              <td ><font color="#0000CC"><%=cf.formatDouble(zhgczjf+zhzjxje+guanlif+zjxguanlif)%></font></td>
            </tr>
             <tr bgcolor="#E8E8FF"> 
              <td align="right">税金-折前</td>
              <td ><%=zqsuijin%></td>
              <td align="right" bgcolor="#FFFFCC">折前-增减项</td>
              <td bgcolor="#FFFFCC"><%=zqzjxsuijin%></td>
              <td align="right">折前-总税金</td>
              <td ><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">税金-折后</td>
              <td ><%=suijin%></td>
              <td align="right" bgcolor="#FFFFCC">折后增减项</td>
              <td bgcolor="#FFFFCC"><%=zjxsuijin%></td>
              <td align="right">折后-总税金</td>
              <td ><%=cf.formatDouble(suijin+zjxsuijin)%></td>
            </tr>
           <tr bgcolor="#E8E8FF">
              <td align="right">其它收费-折前</td>
              <td ><%=cf.formatDouble(zqqtsf+zqwjrqyexm)%></td>
              <td align="right" bgcolor="#FFFFCC">折前-增减项</td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zqqtsfzjx+zqwjrzjx)%></td>
              <td align="right">折前-总其它收费</td>
              <td ><%=cf.formatDouble(zqqtsf+zqwjrqyexm+zqqtsfzjx+zqwjrzjx)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">其它收费-折后</td>
              <td ><%=cf.formatDouble(zhqtsf+zhwjrqyexm)%></td>
              <td align="right" bgcolor="#FFFFCC">折后增减项</td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zhqtsfzjx+zhwjrzjx)%></td>
              <td align="right">折后-总其它收费</td>
              <td ><%=cf.formatDouble(zhqtsf+zhwjrqyexm+zhqtsfzjx+zhwjrzjx)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">其它收费项目</td>
              <td colspan="5" ><%=wjrqyexmsm%></td>
            </tr>
            
            <tr bgcolor="#E8E8FF"> 
              <td align="right"  bgcolor="#E8E8FF">设计费</td>
              <td ><%=sjf%></td>
              <td align="right" bgcolor="#FFFFCC" >&nbsp;</td>
              <td bgcolor="#FFFFCC">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">服务费</td>
              <td ><%=glf%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">增减项实收款</font></td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zjxssk)%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"><font color="#0000FF">已收工程款</font></font></td>
              <td ><font color="#0000FF"><%=cf.formatDouble(sfke)%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">公司促销活动</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">小区促销活动</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">展会促销活动</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbmzh%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="center" colspan="6"><b><font color="#CC0000">！！收 款 特 
                别 提 醒！！</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">减项扣其它款</td>
              <td ><%=kqtk%></td>
              <td align="right" bgcolor="#E8E8FF">累计减项管理费</td>
              <td><%=kglf%></td>
              <td align="right"><b><font color="#990000">共收到减项管理费</font></b></td>
              <td ><%=cf.formatDouble(jxglf)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">返卷总金额</td>
              <td ><%=fjje%></td>
              <td align="right">公司承担返卷额</td>
              <td><%=gsfje%></td>
              <td align="right"><b><font color="#990000">共收到市场返卷款</font></b></td>
              <td ><%=cf.formatDouble(scfjk)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">工程扣款</td>
              <td ><%=gckk%></td>
              <td align="right">认证市场</td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
              <td align="right"><b><font color="#990000">共收到认证费</font></b></td>
              <td ><%=cf.formatDouble(rzf)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">优惠内容</td>
              <td colspan="5" ><%=yhyy%></td>
            </tr>
        </table>

</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

var lx;

function checkZkje(FormName) 
{
	if(FormName.fkje.value=="") 
	{
		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}


	if(FormName.zckx.value=="") 
	{
		return;
	}

	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}

	lx=2;


	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZckx(FormName) 
{

	if(FormName.fkje.value=="") 
	{

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}

	if(FormName.zckx.value=="") 
	{
		return;
	}



	FormName.zcgysbh.length=1;


	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="M" )
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else{
		lx=2;
		var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
	}

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	ajaxRetStr=ajaxRetStr.substring(14);

	if (lx==2)
	{
		if (ajaxRetStr!="")
		{
			alert(ajaxRetStr);
		}
	}
	else if (lx==3)
	{
		strToSelect(insertform.zcgysbh,ajaxRetStr);
	}
}

function f_getYfk(FormName)
{
	FormName.yfkje.value="";
	FormName.yfkbl.value="";

	var str="InsertCw_khfkjCx.jsp?khbh=<%=khbh%>&fkcs="+FormName.fkcs.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkxh)=="") {
		alert("请输入[收款序号]！");
		FormName.fkxh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") {
		alert("请选择[收款类型]！");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请选择[收款期数]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("请选择[应收款比率]！");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "应收款比率"))) {
		return false;
	}


	if(!(isFloat(FormName.yfkje, "应收款金额"))) {
		return false;
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "收款金额"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("错误！[收款金额]不能为0");
		FormName.fkje.select();
		return false;
	}


	if(	javaTrim(FormName.zffs)=="") {
		alert("请选择[支付方式]！");
		FormName.zffs.focus();
		return false;
	}

	if (FormName.zffs.value=="15")//15:银行转帐
	{
		if(	javaTrim(FormName.zzyhkh)=="") {
			alert("请选择[银行转帐帐号]！");
			FormName.zzyhkh.focus();
			return false;
		}
	}
	else if (FormName.zffs.value=="31")//31：转出
	{
		if(	javaTrim(FormName.zckx)=="") {
			alert("请选择[转帐款项]！");
			FormName.zckx.focus();
			return false;
		}
		if (FormName.zckx.value=="21" )//21:木门；
		{
			if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("转出木门款，必须选择[转帐品牌]！");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="22" )//22:橱柜；
		{
			if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("转出橱柜款，必须选择[转帐品牌]！");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="23" )//23:主材；
		{
			if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("转出主材款，必须选择[转帐品牌]！");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="24")//24：家具
		{
			if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("转出家具款，必须选择[转帐品牌]！");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else{
			
			if(	javaTrim(FormName.zcgysbh)!="") {
				alert("未选择【转出集成款】，不能选择[转帐品牌]！");
				FormName.zcgysbh.focus();
				return false;
			}
		}
	}
	else{
		FormName.zckx.value="";
		FormName.zcgysbh.value="";
	}


	if(	javaTrim(FormName.skr)=="") {
		alert("请输入[收款人]！");
		FormName.skr.focus();
		return false;
	}
	if(	javaTrim(FormName.sksj)=="") {
		alert("请输入[收款时间]！");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "收款时间"))) {
		return false;
	}
	if(	javaTrim(FormName.skdw)=="") {
		alert("请选择[收款单位]！");
		FormName.skdw.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}
	if(	!radioChecked(FormName.jzwkqs)) {
		alert("请选择[家装尾款全收]！");
		FormName.jzwkqs[0].focus();
		return false;
	}
	if (FormName.jzwkqs[0].checked)
	{
		if(	parseFloat(FormName.yfkbl.value)!=100) 
		{
			alert("[应收款累计比率]不是100%，不能选择[尾款全收]！");
			FormName.jzwkqs[1].focus();
			return false;
		}
	}

	FormName.target="_blank";
	FormName.action="SaveInsertCw_khfkjl.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.ks.disabled=false;
	FormName.pr.disabled=false;
	FormName.pr2.disabled=false;
	return true;
}

function f_new(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCw_khfkjl.jsp";
	FormName.target="";
	FormName.submit();

	FormName.bc.disabled=false;
	FormName.ks.disabled=true;
	return true;
}
//-->
</SCRIPT>
