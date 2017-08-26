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

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String skdw=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
int count=0;

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

String sjsbh=null;
String fgsbh=null;
String sjfkzc=null;
String dsksjbz="";
double glf=0;
double sjf=0;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";

String zcmmbz="";//主材收款检查
String mmbz="";//木门收款检查
String cgjjbz="";//橱柜收款检查
String jjbz="";//家具收款检查


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String fkxh="";
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,sjs,zxdm,ssfgs,sjsbh,sjfkzc,cxhdbm,DECODE(zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zt";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt="咨询客户（"+cf.fillNull(rs.getString("zt"))+"）";
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();


	if (fgsbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">错误！所属分公司为空</font>");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">错误！所属店面为空</font>");
		return;
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
	out.print("<BR>SQL: " + ls_sql);
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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">客户间转帐</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td height="47" colspan="4" align="center">转出客户信息</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">客户编号</td>
              <td width="31%"><%=khbh%></td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="19%" align="right">设计师</td>
              <td width="31%"><%=sjs%>（<%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%>）</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                房屋地址              </td>
              <td width="31%"><%=fwdz%> </td>
              <td width="19%" align="right"> 
                客户类型              </td>
              <td width="31%"><%=zt%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="45" colspan="4" align="center">转入客户信息</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>分公司</td>
              <td>
				<select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
			  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
				</select>
				</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>转入客户编号</td>
              <td width="31%"> 
                <input type="text" name="khbh" value="" size="20" maxlength="7" >              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>转入客户姓名 </td>
              <td width="31%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"><input type="hidden" name="khbh2"  value="<%=khbh%>" >
              <input type="button" name="bc" value="开始转帐" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')"  ></td>
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


function f_do(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要继续吗?") )	
	{
		if(	javaTrim(FormName.fgsbh)=="") {
			alert("请输入[分公司]！");
			FormName.fgsbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khbh)=="") {
			alert("请输入[转入客户编号]！");
			FormName.khbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khxm)=="") {
			alert("请输入[转入客户姓名]！");
			FormName.khxm.focus();
			return false;
		}
		if(	FormName.khbh.value==FormName.khbh2.value) {
			alert("错误！转入、转出客户不能相同");
			FormName.khbh.focus();
			return false;
		}

		FormName.action="SaveZzCw_khfkjl.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
