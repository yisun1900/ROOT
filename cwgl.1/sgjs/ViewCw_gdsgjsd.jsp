<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_gdsgjsd_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_xb=null;
String cw_gdsgjsd_wdzje=null;
String cw_gdsgjsd_wtj=null;
String cw_gdsgjsd_wtjrq=null;
String cw_gdsgjsd_ssk=null;
String cw_gdsgjsd_jsk=null;
String cw_gdsgjsd_jsrq=null;
String cw_gdsgjsd_mgfy=null;
String cw_gdsgjsd_mgrq=null;
String cw_gdsgjsd_sdgfy=null;
String cw_gdsgjsd_sdgrq=null;
String cw_gdsgjsd_nsgfy=null;
String cw_gdsgjsd_nsgrq=null;
String cw_gdsgjsd_yqgfy=null;
String cw_gdsgjsd_yqgrq=null;
String cw_gdsgjsd_fyze=null;
String cw_gdsgjsd_ye=null;
String cw_gdsgjsd_mll=null;
String cw_gdsgjsd_lrr=null;
String cw_gdsgjsd_lrsj=null;
String cw_gdsgjsd_lrbm=null;
String cw_gdsgjsd_bz=null;
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_gdsgjsd.khbh as cw_gdsgjsd_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.xb as crm_khxx_xb,cw_gdsgjsd.wdzje as cw_gdsgjsd_wdzje,cw_gdsgjsd.wtj as cw_gdsgjsd_wtj,cw_gdsgjsd.wtjrq as cw_gdsgjsd_wtjrq,cw_gdsgjsd.ssk as cw_gdsgjsd_ssk,cw_gdsgjsd.jsk as cw_gdsgjsd_jsk,cw_gdsgjsd.jsrq as cw_gdsgjsd_jsrq,cw_gdsgjsd.mgfy as cw_gdsgjsd_mgfy,cw_gdsgjsd.mgrq as cw_gdsgjsd_mgrq,cw_gdsgjsd.sdgfy as cw_gdsgjsd_sdgfy,cw_gdsgjsd.sdgrq as cw_gdsgjsd_sdgrq,cw_gdsgjsd.nsgfy as cw_gdsgjsd_nsgfy,cw_gdsgjsd.nsgrq as cw_gdsgjsd_nsgrq,cw_gdsgjsd.yqgfy as cw_gdsgjsd_yqgfy,cw_gdsgjsd.yqgrq as cw_gdsgjsd_yqgrq,cw_gdsgjsd.fyze as cw_gdsgjsd_fyze,cw_gdsgjsd.ye as cw_gdsgjsd_ye,cw_gdsgjsd.mll as cw_gdsgjsd_mll,cw_gdsgjsd.lrr as cw_gdsgjsd_lrr,cw_gdsgjsd.lrsj as cw_gdsgjsd_lrsj,cw_gdsgjsd.lrbm as cw_gdsgjsd_lrbm,cw_gdsgjsd.bz as cw_gdsgjsd_bz ";
	ls_sql+=" from  crm_khxx,cw_gdsgjsd";
	ls_sql+=" where cw_gdsgjsd.khbh=crm_khxx.khbh and  (cw_gdsgjsd.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_gdsgjsd_khbh=cf.fillNull(rs.getString("cw_gdsgjsd_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_xb=cf.fillNull(rs.getString("crm_khxx_xb"));
		cw_gdsgjsd_wdzje=cf.fillNull(rs.getString("cw_gdsgjsd_wdzje"));
		cw_gdsgjsd_wtj=cf.fillNull(rs.getString("cw_gdsgjsd_wtj"));
		cw_gdsgjsd_wtjrq=cf.fillNull(rs.getDate("cw_gdsgjsd_wtjrq"));
		cw_gdsgjsd_ssk=cf.fillNull(rs.getString("cw_gdsgjsd_ssk"));
		cw_gdsgjsd_jsk=cf.fillNull(rs.getString("cw_gdsgjsd_jsk"));
		cw_gdsgjsd_jsrq=cf.fillNull(rs.getDate("cw_gdsgjsd_jsrq"));
		cw_gdsgjsd_mgfy=cf.fillNull(rs.getString("cw_gdsgjsd_mgfy"));
		cw_gdsgjsd_mgrq=cf.fillNull(rs.getDate("cw_gdsgjsd_mgrq"));
		cw_gdsgjsd_sdgfy=cf.fillNull(rs.getString("cw_gdsgjsd_sdgfy"));
		cw_gdsgjsd_sdgrq=cf.fillNull(rs.getDate("cw_gdsgjsd_sdgrq"));
		cw_gdsgjsd_nsgfy=cf.fillNull(rs.getString("cw_gdsgjsd_nsgfy"));
		cw_gdsgjsd_nsgrq=cf.fillNull(rs.getDate("cw_gdsgjsd_nsgrq"));
		cw_gdsgjsd_yqgfy=cf.fillNull(rs.getString("cw_gdsgjsd_yqgfy"));
		cw_gdsgjsd_yqgrq=cf.fillNull(rs.getDate("cw_gdsgjsd_yqgrq"));
		cw_gdsgjsd_fyze=cf.fillNull(rs.getString("cw_gdsgjsd_fyze"));
		cw_gdsgjsd_ye=cf.fillNull(rs.getString("cw_gdsgjsd_ye"));
		cw_gdsgjsd_mll=cf.fillNull(rs.getString("cw_gdsgjsd_mll"));
		cw_gdsgjsd_lrr=cf.fillNull(rs.getString("cw_gdsgjsd_lrr"));
		cw_gdsgjsd_lrsj=cf.fillNull(rs.getDate("cw_gdsgjsd_lrsj"));
		cw_gdsgjsd_lrbm=cf.fillNull(rs.getString("cw_gdsgjsd_lrbm"));
		cw_gdsgjsd_bz=cf.fillNull(rs.getString("cw_gdsgjsd_bz"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    客户编号  </td>
  <td width="35%"> 
    <%=cw_gdsgjsd_khbh%>  </td>
  <td align="right" width="15%"> 
    客户姓名  </td>
  <td width="35%"> 
    <%=crm_khxx_khxm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    房屋地址  </td>
  <td width="35%"> 
    <%=crm_khxx_fwdz%>  </td>
  <td align="right" width="15%"> 
    电话  </td>
  <td width="35%"> 
    <%=crm_khxx_lxfs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    合同号  </td>
  <td width="35%"> 
    <%=crm_khxx_hth%>  </td>
  <td align="right" width="15%"> 
    设计师  </td>
  <td width="35%"> 
    <%=crm_khxx_sjs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工程预算款 </td>
  <td width="35%"><%=cw_gdsgjsd_wdzje%></td>
  <td align="right" width="15%">实收款</td>
  <td width="35%"><%=cw_gdsgjsd_ssk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    委托金  </td>
  <td width="35%"> 
    <%=cw_gdsgjsd_wtj%>  </td>
  <td align="right" width="15%"> 
    委托金日期  </td>
  <td width="35%"> 
    <%=cw_gdsgjsd_wtjrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算款 </td>
  <td width="35%"><%=cw_gdsgjsd_jsk%></td>
  <td align="right" width="15%">结算日期</td>
  <td width="35%"><%=cw_gdsgjsd_jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">木工费用</td>
  <td width="35%"><%=cw_gdsgjsd_mgfy%></td>
  <td align="right" width="15%">木工日期 </td>
  <td width="35%"><%=cw_gdsgjsd_mgrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">水电工费用</td>
  <td width="35%"><%=cw_gdsgjsd_sdgfy%></td>
  <td align="right" width="15%">水电工日期</td>
  <td width="35%"><%=cw_gdsgjsd_sdgrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">泥水工费用</td>
  <td width="35%"><%=cw_gdsgjsd_nsgfy%></td>
  <td align="right" width="15%">泥水工日期</td>
  <td width="35%"><%=cw_gdsgjsd_nsgrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">油漆工费用</td>
  <td width="35%"><%=cw_gdsgjsd_yqgfy%></td>
  <td align="right" width="15%">油漆工日期 </td>
  <td width="35%"><%=cw_gdsgjsd_yqgrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">支出费用总额</td>
  <td width="35%"><%=cw_gdsgjsd_fyze%></td>
  <td align="right" width="15%">余额</td>
  <td width="35%"><%=cw_gdsgjsd_ye%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">毛利率 </td>
  <td width="35%"><%=cw_gdsgjsd_mll%></td>
  <td align="right" width="15%">录入部门</td>
  <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_gdsgjsd_lrbm+"'",cw_gdsgjsd_lrbm,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    录入人  </td>
  <td width="35%"> 
    <%=cw_gdsgjsd_lrr%>  </td>
  <td align="right" width="15%"> 
    录入时间  </td>
  <td width="35%"> 
    <%=cw_gdsgjsd_lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td>
  <td colspan="3"><%=cw_gdsgjsd_bz%></td>
  </tr>
</table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#E8E8FF" >费用支出明细</td>
    </tr>
<%
	String fybm=null;
	String fymc=null;
	ls_sql="select fybm,fymc";
	ls_sql+=" from cw_gdfybm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();


	int js=4;

	while (js==4)
	{
		js=0;
		%>
		<tr bgcolor="#FFFFFF"> 
		<%

		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			double fyje=0;
			ls_sql="select fyje from cw_gdfymx ";
			ls_sql+=" where  khbh='"+khbh+"' and fybm='"+fybm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				fyje=rs1.getDouble("fyje");
			}
			rs1.close();
			ps1.close();

			%>
			  <td width="25%" ><%=fymc%>：<%=fyje%></td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			double fyje=0;
			ls_sql="select fyje from cw_gdfymx ";
			ls_sql+=" where  khbh='"+khbh+"' and fybm='"+fybm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				fyje=rs1.getDouble("fyje");
			}
			rs1.close();
			ps1.close();

			%>
			  <td width="25%" ><%=fymc%>：<%=fyje%></td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			double fyje=0;
			ls_sql="select fyje from cw_gdfymx ";
			ls_sql+=" where  khbh='"+khbh+"' and fybm='"+fybm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				fyje=rs1.getDouble("fyje");
			}
			rs1.close();
			ps1.close();

			%>
			  <td width="25%" ><%=fymc%>：<%=fyje%></td>
			<%
		}
		if (rs.next())
		{
			fybm=rs.getString("fybm");
			fymc=rs.getString("fymc");
			js++;

			double fyje=0;
			ls_sql="select fyje from cw_gdfymx ";
			ls_sql+=" where  khbh='"+khbh+"' and fybm='"+fybm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				fyje=rs1.getDouble("fyje");
			}
			rs1.close();
			ps1.close();

			%>
			  <td width="25%" ><%=fymc%>：<%=fyje%></td>
			<%
		}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	
  </table>


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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>