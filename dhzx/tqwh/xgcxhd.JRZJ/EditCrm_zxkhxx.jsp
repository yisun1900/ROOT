<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String ywy=null;
String sjs=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String ssfgs=null;

String zklx=null;
double zdzk=10;
double gcfqdzk=10;
double qtsfxmzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
String zjxzklx=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,xb,fwdz,lxfs,qtdh,email,ywy,sjs,cxhdbmxq,cxhdbmzh,cxhdbm,ssfgs ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		ssfgs=cf.fillNull(rs.getString("ssfgs"));

	}
	rs.close();
	ps.close();

	ls_sql="select DECODE(zklx,'1','整单打折','2','单项打折','3','部分费用打折') zklx,zdzk,gcfqdzk,qtsfxmzk,glfzk,sjzk,sjfzk,DECODE(zjxzklx,'1','同合同','2','独立折扣') zjxzklx";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">修改促销活动（客户编号：<%=khbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">客户姓名</font></td>
              <td width="30%"><%=khxm%></td>
              <td width="19%" align="right"><font color="#0000FF">性别</font></td>
              <td width="31%"><%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">设计师</font></td>
              <td><%=sjs%></td>
              <td align="right"><font color="#0000FF">业务员</font></td>
              <td><%=ywy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center">客户折扣</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">折扣类型</font></td>
              <td><%=zklx%></td>
              <td align="right"><font color="#0000FF">增减项折扣</font></td>
              <td><%=zjxzklx%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">整单折扣</font></td>
              <td><%=zdzk%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">工程费签单折扣</font></td>
              <td><%=gcfqdzk%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">管理费折扣</font></td>
              <td><%=glfzk%></td>
              <td align="right"><font color="#0000FF">税金折扣</font></td>
              <td><%=sjzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">设计费折扣</font></td>
              <td><%=sjfzk%></td>
              <td align="right"><font color="#0000FF">其它收费项目折扣</font></td>
              <td><%=qtsfxmzk%></td>
            </tr>

<%
	String 	xmflmc=null;
	double zk=0;
	ls_sql="SELECT xmflmc,zk ";
	ls_sql+=" FROM crm_khbfxmzk,bdm_xmflbm  ";
	ls_sql+=" where crm_khbfxmzk.xmflbm=bdm_xmflbm.xmflbm(+) and khbh='"+khbh+"'";
	ls_sql+=" order by  crm_khbfxmzk.xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflmc=cf.fillNull(rs.getString("xmflmc"));
		zk=rs.getDouble("zk");

		%>
		<tr bgcolor="#FFFFFF">
		  <td width="20%" align="right"><font color="#0000FF"><%=xmflmc%></font></td>
		  <td width="30%"><%=zk%></td>
		  <td colspan="2">部分工程项目打折，取代工程费折扣</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
          </table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="21%">活动赠送项目</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">市场单价</td>
	<td  width="6%">下限</td>
	<td  width="6%">上限</td>
	<td  width="6%">数量</td>
	<td  width="43%">备注</td>
</tr>
<%
	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String bz=null;
	String sjsl=null;
	double zsjz=0;
	double xjzsjz=0;
	int row=0;


	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz ";
	ls_sql+=" FROM crm_khzsxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by  zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));
		sjsl=cf.fillNull(rs.getString("sjsl"));
		zsjz=rs.getDouble("zsjz");

		xjzsjz+=zsjz;

		%>
		<tr align="center">
			<td><%=zsxm%></td>
			<td><%=jldw%></td>
			<td><%=scdj%></td>
			<td><%=zsslxx%></td>
			<td><%=zsslsx%></td>
			<td><%=sjsl%></td>
			<td><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
          </table>
<BR>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="21%">特权赠送项目</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">市场单价</td>
	<td  width="6%">下限</td>
	<td  width="6%">上限</td>
	<td  width="6%">数量</td>
	<td  width="43%">备注</td>
</tr>
<%
	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz ";
	ls_sql+=" FROM crm_khtqzsxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by  zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));
		sjsl=cf.fillNull(rs.getString("sjsl"));
		zsjz=rs.getDouble("zsjz");

		xjzsjz+=zsjz;

		%>
		<tr align="center">
			<td><%=zsxm%></td>
			<td><%=jldw%></td>
			<td><%=scdj%></td>
			<td><%=zsslxx%></td>
			<td><%=zsslsx%></td>
			<td><%=sjsl%></td>
			<td><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
          </table>
<BR>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">公司促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc",cxhdbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">小区促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc",cxhdbmxq);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">展会促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc",cxhdbmzh);
%> 
                </select>              </td>
            </tr>
            
            
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button" onClick="f_zsxx(editform)"  value="选择活动赠送项目">
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

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveEditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_zsxx(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertCrm_khzsxx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
