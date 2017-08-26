<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">人工调整库存</font></B>
</CENTER>

<%
String	dqbm=request.getParameter("dqbm");
String	ckbh=request.getParameter("ckbh");
String	clbm=request.getParameter("clbm");
String	nbbm=request.getParameter("nbbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clmc=null;
String ppmc=null;
String xh=null;
String gg=null;
String jldwbm=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;

String lsh=null;
double kcsl=0;
double kcje=0;
String zljb=null;
String rkph=null;
String rksj=null;
String ztbz=null;
try {
	conn=cf.getConnection();

	if (!clbm.equals(""))
	{
		ls_sql="select clmc,ppmc,xh,gg,jldwbm ";
		ls_sql+=" from  jxc_clbm";
		ls_sql+=" where clbm='"+clbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clmc=cf.fillNull(rs.getString("clmc"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
		}
		else{
			rs.close();
			ps.close();
			out.println("错误！材料编码不存在:"+clbm);
			return;
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select clbm,clmc,ppmc,xh,gg,jldwbm ";
		ls_sql+=" from  jxc_clbm";
		ls_sql+=" where nbbm='"+nbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clmc=cf.fillNull(rs.getString("clmc"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			clbm=cf.fillNull(rs.getString("clbm"));
		}
		else{
			rs.close();
			ps.close();
			out.println("错误！内部编码不存在:"+nbbm);
			return;
		}
		rs.close();
		ps.close();
	}

	ls_sql="select zcpzsl,ccpzsl,bfpzsl ";
	ls_sql+=" from  jxc_cljgb";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcpzsl=rs.getDouble("zcpzsl");
		ccpzsl=rs.getDouble("ccpzsl");
		bfpzsl=rs.getDouble("bfpzsl");
	}
	rs.close();
	ps.close();


%>



<form method="post" action="" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="50%" height="42" align="right"><span class="STYLE1">*</span>地区</td>
    <td width="50%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right"><span class="STYLE1">*</span>仓库</td>
    <td><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where ckbh='"+ckbh+"'  order by ckmc","");
%>
    </select></td>
  </tr>
      <tr bgcolor="#FFFFFF">
        <td height="20" align="right">材料编码</td>
        <td><input type="text" name="clbm" size="20" maxlength="13" value="<%=clbm%>" readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="20" align="right">内部编码</td>
        <td><input type="text" name="nbbm" size="20" maxlength="100" value="<%=nbbm%>" readonly ></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">材料名称</td>
        <td><%=clmc%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">品牌</td>
        <td><%=ppmc%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">型号</td>
        <td><%=xh%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">规格</td>
        <td><%=gg%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">计量单位</td>
        <td><%=jldwbm%></td>
      </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr align="center" bgcolor="#FFFFFF">
        <td width="25%">正常品总数量：<%=zcpzsl%></td>
        <td width="25%">残次品总数量：<%=ccpzsl%></td>
        <td width="25%">报废品总数量：<%=bfpzsl%></td>
        <td width="25%">总数量：<%=cf.formatDouble(zcpzsl+ccpzsl+bfpzsl)%></td>
      </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<%
	
	ls_sql="select lsh,kcsl,kcje,DECODE(zljb,'1','正常品','2','残次品','3','报废品') zljb,rkph,rksj,DECODE(ztbz,'Y','在途','N','否') ztbz";
	ls_sql+=" from  jxc_kcb";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
	ls_sql+=" order by lsh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	//out.print(ls_sql);
	while (rs.next())
	{
		lsh=cf.fillNull(rs.getString("lsh"));
		kcsl=rs.getDouble("kcsl");
		kcje=rs.getDouble("kcje");
		zljb=cf.fillNull(rs.getString("zljb"));
		rkph=cf.fillNull(rs.getString("rkph"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		ztbz=cf.fillNull(rs.getString("ztbz"));

		%>
	  <tr bgcolor="#FFFFFF">
	    <td align="right">流水号：<%=lsh%>
			<input type="hidden" name="lsh" value="<%=lsh%>"  >			
		</td>
	    <td align="right">入库批号：<%=rkph%></td>
	    <td align="right">入库时间：<%=rksj%></td>
	    <td align="right">在途标志：<%=ztbz%></td>
    </tr>
	  <tr bgcolor="#FFFFFF">
        <td width="25%" align="right">质量级别：<%=zljb%></td>
        <td width="25%" align="right">库存数量：
          <input type="text" name="kcsl" size="10" maxlength="8" value="<%=kcsl%>"  >
        </td>
        <td width="25%" align="right">库存金额：<%=kcje%></td>
        <td width="25%" align="right">&nbsp;</td>
      </tr>
		<%
	}
	rs.close();
	ps.close();
%>
      <tr align="center" bgcolor="#999999">
        <td colspan="4"><input type="button"  value="修改库存" onClick="f_do(selectform)">
          &nbsp;&nbsp;
          <input type="reset"  value="重输">        </td>
      </tr>
</table>
</form>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请选择[仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="" && javaTrim(FormName.nbbm)=="") {
		alert("请输入[材料编码]或[内部编码]！");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="updateKc.jsp";
	FormName.submit();
	return true;

}
//-->
</SCRIPT>
