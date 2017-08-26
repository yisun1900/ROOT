<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
String fkje=null;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String shr=null;
String shsj=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String khlx=null;
String zcgysbh=null;
String zcddbh=null;
String fgsbh=null;
String zzyhkh=null;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";
String sjfkzc=null;
String glxh=null;
String gljlbz=null;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";
double scfjk=0;
double jxglf=0;
double rzf=0;

double glf=0;
double kglf=0;
double kqtk=0;
double gckk=0;
double suijin=0;

String yjjzsj=null;

String zcmmbz="";//主材收款检查
String mmbz="";//木门收款检查
String cgjjbz="";//橱柜收款检查
String jjbz="";//家具收款检查

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zzyhkh,yjjzsj,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,zcgysbh,zcddbh,fgsbh,glxh,gljlbz ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzyhkh=cf.fillNull(rs.getString("zzyhkh"));
		yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkje=cf.fillNull(rs.getString("fkje"));
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		glxh=cf.fillNull(rs.getString("glxh"));
		gljlbz=cf.fillNull(rs.getString("gljlbz"));
	}
	else{
		rs.close();
		ps.close();

		out.println("不存在的收款记录");
		return;
	}
	rs.close();
	ps.close();

	if (!yjjzsj.equals(""))
	{
		out.println("提醒！收款记录已结转，结转时间："+yjjzsj);
//		return;
	}

	if (gljlbz.equals("Y"))//N：非关联记录；Y：关联记录
	{
		String glfkxh=null;
		ls_sql="select fkxh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfkxh=cf.fillNull(rs.getString("fkxh"));
		}
		rs.close();
		ps.close();

		out.println("错误！该条记录是关联记录，不能直接进行修改，请修改原始记录："+glfkxh);
		return;
	}

	ls_sql="select suijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy ,kqtk,kglf,gckk,glf ,khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,qyrq,zjxm,zt,sjfkzc";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckk=rs.getDouble("gckk");
		glf=rs.getDouble("glf");
		suijin=rs.getDouble("suijin");

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,fwdz,lxfs,sjs,zxdm,sjfkzc,cxhdbm";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
			sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		}
	}
	rs.close();
	ps.close();


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

	//市场返卷款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91：市场返卷款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
	rs =ps.executeQuery(ls_sql);
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


	%>
	<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">收款序号</td>
		<td  width="8%">收款类型</td>
		<td  width="6%">期数</td>
		<td  width="13%" bgcolor="#CCCCCC">收款品牌</td>
		<td  width="7%" bgcolor="#CCCCCC">收款订单编号</td>
		<td  width="9%">实收款金额</td>
		<td  width="5%">审核</td>
		<td  width="7%">支付</td>
		<td  width="8%">转帐款项</td>
		<td  width="13%">转帐品牌</td>
		<td  width="7%">转帐订单编号</td>
		<td  width="9%">收款时间</td>
	</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		String getddbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getzcddbh=null;
		String getsksj=null;

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,ddbh,cw_khfkjl.fkje,DECODE(skdd,'1','不需','2','需审核') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,cw_khfkjl.sksj";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getzcddbh=cf.fillHtml(rs.getString("zcddbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

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
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
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
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getzcddbh%></td>
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
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='5'><B>总 计</B></td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
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

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改客户收款记录（<font color="#0000CC">收款序号：<%=fkxh%></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_khfkjl.jsp" name="insertform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td align="right">客户编号</td>
              <td><%=khbh%></td>
              <td align="right">合同号</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> 客户姓名 </td>
              <td><%=khxm%> </td>
              <td align="right">设计师</td>
              <td><%=sjs%>（
                  <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%>
                ）</td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> 房屋地址 </td>
              <td colspan="3"><%=fwdz%> </td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>收款类型</td>
              <td width="33%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+fklxbm+"'",fklxbm);
%> 
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收款金额</td>
              <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" readonly></td>
              <td align="right"><font color="#FF0000">*</font>支付方式</td>
              <td><select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm where zffsbm='"+zffs+"'",zffs);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">转帐款项</td>
              <td><select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm!='"+fklxbm+"' order by fklxbm",zckx);
%>
              </select></td>
              <td align="right">银行转帐帐号</td>
              <td><input name="zzyhkh" type="text" value="<%=zzyhkh%>" size="20" maxlength="40"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">转帐品牌</td>
              <td colspan="3"> 
                <select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="checkZkje(insertform)">
                  <option value=""></option>
                  <%
	if (zckx.equals("21"))//木门款
	{
		if (mmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			zcgysbh=zcgysbh+"*"+zcddbh;

			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='21' ";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (mmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			ls_sql="SELECT gysbh c1,gysbh||'（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='21' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
	}
	else if (zckx.equals("22"))//橱柜款
	{
		if (cgjjbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			zcgysbh=zcgysbh+"*"+zcddbh;

			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='22' ";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (cgjjbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			ls_sql="SELECT gysbh c1,gysbh||'（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='22' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
	}
	else if (zckx.equals("23"))//主材款
	{
		if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			zcgysbh=zcgysbh+"*"+zcddbh;

		
			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			ls_sql="SELECT gysbh c1,gysbh||'（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";

			cf.selectItem(out,ls_sql,zcgysbh);
		}
		//收款品牌----------------------------
	}
	else if (zckx.equals("24"))//家具款
	{
		if (jjbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			zcgysbh=zcgysbh+"*"+zcddbh;

			
			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='24' ";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (jjbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			ls_sql="SELECT gysbh c1,gysbh||'（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='24' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
	}

%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>收款人              </td>
              <td width="33%"> 
                <input type="text" name="skr" size="20" maxlength="20"  value="<%=skr%>" >              </td>
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>收款时间              </td>
              <td width="33%"> 
                <input type="text" name="sksj" size="20" maxlength="10"  value="<%=sksj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">收款单位</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'",skdw);
%> 
                </select>              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">收据编号</td>
              <td width="33%"><input type="text" name="sjbh" size="20" maxlength="20"  value="<%=sjbh%>" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
					<input type="hidden" name="lrr" value="<%=yhmc%>">
					<input type="hidden" name="lrsj" value="<%=cf.today()%>">
					<input type="hidden" name="lrdw" value="<%=lrdw%>">
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") {
		alert("请选择[收款类型]！");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zffs)=="") {
		alert("请选择[支付方式]！");
		FormName.zffs.focus();
		return false;
	}

	if (FormName.zffs.value=="31")//31：转出
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
