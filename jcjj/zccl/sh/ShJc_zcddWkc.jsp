<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String ddbz=null;
double hkze=0;
double zjhze=0;
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String tzshr=null;
String tzshsj=null;
String jhshsj=null;
String tzry=null;
String shtzsm=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

double zcfk=0;
int row=0;

try {
	conn=cf.getConnection();

	ls_sql="select shtzsm,jhshsj,tzry,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj,tzshr,tzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzry=cf.fillNull(rs.getString("tzry"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		ddbz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
	}
	rs.close();
	ps.close();

//	if (tzshsj.equals(""))
//	{
//		out.println("提醒！未发送货通知");
////		return;
//	}



	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//已确认的该品牌合同＋增建项金额
	double qrhkze=0;
	double qrzjhze=0;
	ls_sql="select  sum(hkze),sum(zjhze)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
	ls_sql+=" and  jc_zcdd.clzt>='09' and clzt<='30'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qrhkze=rs.getDouble(1);
		qrzjhze=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if ( zcfk < (qrhkze+qrzjhze-11))
	{
		out.println("提醒！付款不足，不能送货！");
		out.println("<BR>实付款＝￥"+zcfk);
		out.println("<BR>该品牌累计订货＝￥"+(qrhkze+qrzjhze)+"，应补交货款＝￥"+(qrhkze+qrzjhze-zcfk));
//		return ;
	}

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
		qye="&nbsp;";
	}
%>

<html>
<head>
<title>送货</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF" align="center"> 
      <td width="8%">送货单编号</td>
      <td width="4%">&nbsp;</td>
      <td width="4%">&nbsp;</td>
      <td width="5%">送货人</td>
      <td width="7%">送货时间</td>
      <td width="18%">主材名称</td>
	  <td  width="14%" >型号</td>
	  <td  width="14%" >规格</td>
      <td width="7%">送货数量</td>
      <td width="158%">备注</td>
    </tr>

<%
	String getshdbh=null;
	String getshr=null;
	String getshsj=null;
	ls_sql="select  shdbh,shr,shsj";
	ls_sql+=" from  jc_zcshd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by shdbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getshdbh=cf.fillNull(rs.getString("shdbh"));
		getshr=cf.fillNull(rs.getString("shr"));
		getshsj=cf.fillNull(rs.getDate("shsj"));

		int hbsl=0;
		ls_sql="select  count(*)";
		ls_sql+=" from  jc_zcshmx";
		ls_sql+=" where shdbh='"+getshdbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			hbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		row=0;
		String getxh=null;
		String getzcbm=null;
		double getshsl=0;
		String getbz=null;
		ls_sql="select  xh,zcbm,shsl,bz";
		ls_sql+=" from  jc_zcshmx";
		ls_sql+=" where shdbh='"+getshdbh+"'";
		ls_sql+=" order by xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getxh=cf.fillNull(rs1.getString("xh"));
			getzcbm=cf.fillNull(rs1.getString("zcbm"));
			getshsl=rs1.getDouble("shsl");
			getbz=cf.fillHtml(rs1.getString("bz"));

			row++;


			String getppmc=null;
			String getzcmc=null;
			String getxinghao=null;
			String getgg=null;
			ls_sql =" select ppmc,zcmc,xinghao,gg";
			ls_sql+=" from  jc_zcddmx";
			ls_sql+=" where ddbh='"+ddbh+"' and  xh='"+getxh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				getppmc=cf.fillHtml(rs2.getString("ppmc"));
				getzcmc=cf.fillHtml(rs2.getString("zcmc"));
				getxinghao=cf.fillHtml(rs2.getString("xinghao"));
				getgg=cf.fillHtml(rs2.getString("gg"));
			}
			rs2.close();
			ps2.close();
			
			if (row==1)
			{
				%>
				<tr bgcolor="#FFFFFF" align="center"> 
				  <td rowspan="<%=hbsl%>"><%=getshdbh%></td>
				  <td rowspan="<%=hbsl%>"><A HREF="DeleteJc_zcshmx.jsp?shdbh=<%=getshdbh%>" target="_blank">删除</A></td>
				  <td rowspan="<%=hbsl%>"><A HREF="/jcjj/dygl/DyShd.jsp?shdbh=<%=getshdbh%>" target="_blank">打印</A></td>
				  <td rowspan="<%=hbsl%>"><%=getshr%></td>
				  <td rowspan="<%=hbsl%>"><%=getshsj%></td>
				  <td><%=getzcmc%></td>
				  <td><%=getxinghao%></td>
				  <td><%=getgg%></td>
				  <td><%=getshsl%></td>
				  <td><%=getbz%></td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center"> 
				  <td><%=getzcmc%></td>
				  <td><%=getxinghao%></td>
				  <td><%=getgg%></td>
				  <td><%=getshsl%></td>
				  <td><%=getbz%></td>
				</tr>
				<%
			}
			
		}
		rs1.close();
		ps1.close();
		
		
	}
	rs.close();
	ps.close();




%>
</table>

<form method="post" action="" name="editform">
<div align="center"><strong>填写送货明细（订单编号：<%=ddbh%>） </strong></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        计划送货时间      </td>
      <td width="32%"> <%=jhshsj%> </td>
      <td width="18%" align="right"> 
        合同送货时间      </td>
      <td width="32%"><%=htshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">送货通知说明</td>
      <td colspan="3"><%=shtzsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        发送货通知人      </td>
      <td width="32%"> <%=tzshr%> </td>
      <td width="18%" align="right"> 
        发送货通知时间      </td>
      <td width="32%"> <%=tzshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">通知人员</td>
      <td width="32%"> <%=tzry%> </td>
      <td width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>送货人</td>
      <td><input type="text" name="sshr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right"><span class="STYLE1">*</span>送货时间</td>
      <td><input type="text" name="sshsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">送货情况</td>
      <td colspan="3"><textarea name="shqk" rows="3" cols="72"></textarea>
      </td>
    </tr>
</table>


<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="140%" style='FONT-SIZE: 12px'>
<TR bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%" >主材名称</td>
	<td  width="4%" >型号</td>
	<td  width="4%" >规格</td>
	<td  width="3%">颜色</td>
	<td  width="3%" >铺装位置</td>
	<td  width="2%" >计量单位</td>
	<td  width="2%" >订货数量</td>
	<td  width="2%" >已送货数量</td>
	<td  width="3%" bgcolor="#CC99FF" >送货数量</td>
	<td  width="2%" >是否赠品</td>
	<td  width="19%" >备注</td>
	<td  width="3%" >主材编码</td>
</tr>


<%
	String xh=null;
	String zcbm=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double sl=0;
	double zjhsl=0;
	double shsl=0;
	double zqje=0;
	double je=0;
	double ycf=0;
	String zcpzwzbm=null;
	String zcysbm=null;
	String cxhdbz=null;
	String bz=null;
	String jldwbm=null;
	String qtfy=null;
	String xzjg=null;
	String zcmc=null;
	String zclbbm=null;
	String xinghao=null;
	String gg=null;
	String sfbhpj=null;
	String pjts=null;
	String lsj=null;
	String yhj=null;
	String sfycx=null;
	String cxj=null;
	String cxkssj=null;
	String cxjzsj=null;
	String bjbz=null;
	double qtfyje=0;
	String cxhdbl=null;
	String cxhdje=null;
	String gys=null;
	String ppmc=null;
	double cbj=0;
	double bzcbj=0;
	double bzcxhdbl=0;
	double cxcbj=0;
	double lscxhdbl=0;
	String sftjcp=null;
	String sxbz=null;
	String sxbzmc=null;
	String sxhtyy=null;
	String sfzp=null;
	double zsdj=0;

	row=0;
	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zjhsl,shsl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','非手写','2','手写') sxbzmc,sxhtyy,sfzp,zsdj ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and lx='1'";//1：合同项；2：增项 
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zjhsl=rs.getDouble("zjhsl");
		shsl=rs.getDouble("shsl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillHtml(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillHtml(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));

		String slStr="";
		if (sl!=0)
		{
			slStr=sl+"";
		}
		String ycfStr="";
		if (ycf!=0)
		{
			ycfStr=ycf+"";
		}
		String qtfyjeStr="";
		if (qtfyje!=0)
		{
			qtfyjeStr=qtfyje+"";
		}

		if (sl==shsl)
		{
			%>
			<tr bgcolor="#FFFFFF"  align="center" height="25">
				<td >
					<%=zcmc%>			</td>
				<td >
					<%=xinghao%>			</td>
				<td >
					<%=gg%>			</td>
				<td><%=zcysbm%></td>
				<td><%=zcpzwzbm%></td>
				<td><%=jldwbm%></td>
				<td><%=sl%></td>
				<td><%=shsl%></td>
				<td align="left"><span class="STYLE2">已送货</span></td>
				<td >
					  <%
						cf.selectToken(out,"Y+赠品&N+否",sfzp,true);
					  %>			</td>
				<td ><%=bz%></td>
				<td ><%=zcbm%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="#FFFFFF"  align="center" height="25">
				<td >
					<%=zcmc%>			</td>
				<td >
					<%=xinghao%>			</td>
				<td >
					<%=gg%>			</td>
				<td><%=zcysbm%></td>
				<td><%=zcpzwzbm%></td>
				<td><%=jldwbm%></td>
				<td><%=sl%></td>
				<td><%=shsl%></td>
				<td >
					<input type="hidden" name="yshsl" value="<%=cf.round(sl-shsl,2)%>" >
					<input type="text" name="shsl" size="7" maxlength="16"  value="<%=cf.round(sl-shsl,2)%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					  <%
						cf.selectToken(out,"Y+赠品&N+否",sfzp,true);
					  %>			</td>
				<td >
					<input name="bz" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					<%=zcbm%>
					<input type="hidden" name="xh" value="<%=xh%>">
					<input type="hidden" name="zcbm" value="<%=zcbm%>">			</td>
			</tr>
			<%

			row++;
		}

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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>	
	
	<tr> 
      <td colspan="10" align="center"  >
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="存盘" onClick="f_do(editform)" >
          <input type="reset"  value="重输" name="reset">
		  <input type="button"  value="打印空白送货单" onClick="f_do1(editform)" >      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">客户姓名</td>
    <td ><%=khxm%>（
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
）</td>
    <td align="right">质检</td>
    <td ><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      施工队    </td>
    <td > <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 
      班长    </td>
    <td ><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      家装签约日期    </td>
    <td > <%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">合同开工日期</td>
    <td ><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td ><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td bgcolor="#FFFFFF" align="right">主材大类</td>
    <td > <%=zcdlbm%> </td>
    <td align="right">品牌</td>
    <td > <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">客户交款性质</td>
    <td ><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td align="right">交款地点</td>
    <td ><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      驻店家居顾问    </td>
    <td > <%=clgw%> </td>
    <td align="right"> 
      展厅家居顾问    </td>
    <td ><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">项目专员</td>
    <td ><%=xmzy%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">需测量标志</td>
    <td ><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td align="right">计划测量时间</td>
    <td ><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      等待送货通知    </td>
    <td ><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td align="right"> 
      合同送货时间    </td>
    <td ><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      签合同时间    </td>
    <td ><%=qhtsj%> </td>
    <td align="right"> 
      可减项截止时间    </td>
    <td ><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">订单确认人</td>
    <td ><%=ddqrr%></td>
    <td align="right">订单确认时间</td>
    <td ><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCFFCC"> 
      测量通知录入人    </td>
    <td > <%=cltzr%></td>
    <td align="right"> 
      发测量通知时间    </td>
    <td ><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">备注</td>
    <td colspan="3"><%=ddbz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">类型</td>
	<td  width="12%">主材名称</td>
	<td  width="13%">系列</td>
	<td  width="10%">型号</td>
	<td  width="10%">规格</td>
	<td  width="6%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="6%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%">单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">合同数量</td>
	<td  width="6%" bgcolor="#CC99FF">送货数量</td>
	<td  width="5%">配件数</td>
	<td  width="11%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,jc_zcddmx.jldwbm,TO_CHAR(jc_zcddmx.dj),jc_zcddmx.sl,jc_zcddmx.shsl";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' and jc_zcddmx.lx='1'";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	spanColHash.put("zcmc","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","1");//列参数对象加入Hash表
	spanColHash.put("zclbbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_shmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJc_zcshmx.jsp";
	FormName.submit();
	return true;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.sshr)=="") {
		alert("请选择[送货人]！");
		FormName.sshr.focus();
		return false;
	}
	if(	javaTrim(FormName.sshsj)=="") {
		alert("请选择[送货时间]！");
		FormName.sshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sshsj, "送货时间"))) {
		return false;
	}


	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.shsl)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[送货数量]！");
			FormName.shsl.focus();
			return false;
		}
		if(!(isFloat(FormName.shsl, "送货数量"))) {
			return false;
		}
		if (parseFloat(FormName.shsl.value)<0)
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[送货数量]不能<0！");
			FormName.shsl.select();
			return false;
		}

		if (parseFloat(FormName.shsl.value)>parseFloat(FormName.yshsl.value))
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[送货数量]不能大于[订货数量]！");
			FormName.shsl.select();
			return false;
		}

	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			if(	javaTrim(FormName.shsl[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[送货数量]！");
				FormName.shsl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.shsl[i], "送货数量"))) {
				return false;
			}
			if (parseFloat(FormName.shsl[i].value)<0)
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！[送货数量]不能<0！");
				FormName.shsl[i].select();
				return false;
			}

			if (parseFloat(FormName.shsl[i].value)>parseFloat(FormName.yshsl[i].value))
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！[送货数量]不能大于[订货数量]！");
				FormName.shsl[i].select();
				return false;
			}

		}
	}

	FormName.target="";
	FormName.action="SaveShJc_zcddWkc.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="/jcjj/dygl/shdy/gyszcfj.jsp";
	FormName.submit();
	return true;
}

function f_dy(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="/jcjj/dygl/DyShd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

