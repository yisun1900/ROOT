<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double qtycf=0;
String gys=null;
String ppbm=null;
String ssfgs=request.getParameter("ssfgs");

try {
	conn=cf.getConnection();

	int ddgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddgyssl>1)
	{
		out.println("错误！不是同一供应商订单");
		return;
	}

	int ddppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddppsl>1)
	{
		out.println("错误！不是同一品牌");
		return;
	}



	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gys=rs1.getString(1);
		ppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();


	int zjxgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (zjxgyssl>1)
	{
		out.println("错误！不是同一供应商订单");
		return;
	}

	int zjxppsl=0;
	zjxppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (zjxppsl>1)
	{
		out.println("错误！不是同一品牌");
		return;
	}

	String zjxgys="";
	String zjxppbm="";
	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxgys=rs1.getString(1);
		zjxppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();


	if (ddgyssl>0 && zjxgyssl>0)
	{
		if (!zjxgys.equals("") && !gys.equals("") && !zjxgys.equals(gys) )
		{
			out.println("错误！不是同一供应商订单");
			return;
		}

		if (!zjxppbm.equals("") && !ppbm.equals("") &&  !zjxppbm.equals(ppbm))
		{
			out.println("错误！不是同一品牌");
			return;
		}
	}

	if (ddgyssl==0)
	{
		gys=zjxgys;
		ppbm=zjxppbm;
	}
	



	
	ls_sql =" select sum(cbze),sum(ycf),sum(qtf),sum(qtycf)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj=rs1.getDouble(1);
		ycfzj=rs1.getDouble(2);
		qtfzj=rs1.getDouble(3);
		qtycf=rs1.getDouble(4);
	}
	rs1.close();
	ps1.close();

	ls_sql =" select sum(zjxcbze),sum(zjxycf),sum(zjxqtf)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj+=rs1.getDouble(1);//增减项成本总额
		ycfzj+=rs1.getDouble(2);//增减远程费
		qtfzj+=rs1.getDouble(3);//增减其它费
	}
	rs1.close();
	ps1.close();

	cbzj=cf.round(cbzj,2);
	ycfzj=cf.round(ycfzj,2);
	qtfzj=cf.round(qtfzj,2);




%>


<CENTER >
  <B><font size="3">松下亿达商户结算单</font></B>
</CENTER>

<form method="post" action="" name="editform" >
<div align="center">厂商结算（供应商：<%=gys%>、品牌：<%=ppbm%>）</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">所属公司</font></td>
      <td width="32%" bgcolor="#FFFFFF">
		
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select></td>
      <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td width="32%" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">材料成本</font></td>
      <td><input type="text" name="cbzj" value="<%=cbzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">其它费</font></td>
      <td><input type="text" name="qtfzj" value="<%=qtfzj%>" size="20" maxlength="20" readonly/></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">远程费</font></td>
      <td colspan="3"><input type="text" name="ycfzj" value="<%=ycfzj%>" size="20" maxlength="20" readonly/>
        <font color="#990000" size="2"><strong>远程费＝套餐分解远程费（<%=qtycf%>）＋订单明细远程费(<%=cf.round(ycfzj-qtycf,2)%>)</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算金额</font></td>
      <td><input type="text" name="jsje" value="<%=cf.round(cbzj+ycfzj+qtfzj,2)%>" size="20" maxlength="20" readonly/></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

<table border="1" width="113%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">客户姓名</td>
    <td  width="12%">地址</td>
    <td  width="7%">订单号</td>
    <td  width="6%">订货时间</td>
    <td  width="6%">完结时间</td>
    <td  width="10%">材料名称</td>
    <td  width="8%">规格</td>
    <td  width="8%">型号</td>
    <td  width="4%">单位</td>
    <td  width="5%">订货数量</td>
    <td  width="5%">单价</td>
    <td  width="7%">材料总价</td>
    <td  width="5%">远程其它费</td>
    <td  width="13%">备注</td>
  </tr>
  <%

	String khbh=null;
	String khxm=null;
	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;

    ls_sql=" select * ";
    ls_sql+=" FROM ( ";
	ls_sql+=" select distinct jc_zcdd.khbh,khxm";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");

    ls_sql+=" UNION ";

	ls_sql+=" select distinct jc_zczjx.khbh,khxm";
	ls_sql+=" from jc_zczjx,crm_khxx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");

    ls_sql+=" ) ";
    ls_sql+=" order by khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));

		ls_sql =" select sum(qtycf)";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtycf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		String qtycfStr="&nbsp;";
		if (qtycf!=0)
		{
			qtycfStr="(<font color=\"#990000\">套餐分解远程费:"+qtycf+"</font>)";
		}

		
		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zcdd,jc_zczjx,jc_zczjxmx,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zczjxmx.zjxbh=jc_zczjx.zjxbh ";

		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String dwbh=null;
		String fwdz=null;
		String lx=null;
		String zcpzwzbm=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
		double cbj=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;
		String qhtsj=null;
		String sshsj=null;
		String wjsj=null;
		String getddbh=null;


		ls_sql=" SELECT dwbh,ddbh,qhtsj,sshsj,wjsj,khxm,fwdz,zcmc,gg,xinghao,jldwbm,sl,cbj,je,ycf,qtfy,cxhdbl,cxhdje,bz";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,jc_zcdd.wjsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,jc_zczjx.wjsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zcdd,jc_zczjx,jc_zczjxmx,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" and jc_zczjxmx.zjxbh=jc_zczjx.zjxbh ";

		ls_sql+=" ) ";

		ls_sql+=" order by ddbh,dwbh,xinghao";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
			sshsj=cf.fillHtml(rs.getDate("sshsj"));
			wjsj=cf.fillHtml(rs.getDate("wjsj"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));


			xjsl+=sl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;


			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td rowspan="<%=count%>"><%=khxm%></td>
				<td  rowspan="<%=count%>"><%=fwdz%></td>
				<td><%=getddbh%></td>
				<td><%=qhtsj%></td>
				<td><%=wjsj%></td>
				<td><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}

		while (rs.next())//显示同一客户名下订单
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
			sshsj=cf.fillHtml(rs.getDate("sshsj"));
			wjsj=cf.fillHtml(rs.getDate("wjsj"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td><%=getddbh%></td>
				<td ><%=qhtsj%></td>
				<td ><%=wjsj%></td>
				<td ><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();
		

		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;

		zjsl=cf.round(zjsl,2);
		zjje=cf.round(zjje,2);
		zjycf=cf.round(zjycf,2);
		zjqtfy=cf.round(zjqtfy,2);
		zjcxhdje=cf.round(zjcxhdje,2);
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="9"><font size="2"><b>[<%=khxm%>]小计<%=qtycfStr%></b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
			<td ><%=cf.round(xjycf+xjqtfy,2)%></td>
			<td>&nbsp;</td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="8"><font size="3"><b>总计</b></font></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
		<td ><%=cf.round(zjycf+zjqtfy,2)%></td>
		<td>&nbsp;</td>
	  </tr>
	  <%

	if ((int)cbzj!=(int)zjje)
	{
		out.println("<B><font color=\"#FF0000\">错误！明细["+zjje+"]与汇总金额["+cbzj+"]不一致</B></font>");
		return;
	}

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var jsje=<%=cf.round(cbzj+ycfzj+qtfzj,2)%>-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;

}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("请选择[结算人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请选择[结算时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("请选择[扣除费用]！");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "扣除费用"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请选择[结算金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算金额"))) {
		return false;
	}

	FormName.action="SaveInsertJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_szbz(FormName)//参数FormName:Form的名称
{
	FormName.action="chooseJs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
