<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khxm=null;
String fwdz=null;
String hth=null;
String bjjbbm=null;
String bjjbmc=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqbm=null;
String dqmc=null;

String khbh=request.getParameter("khbh");
String gdjsjlh=request.getParameter("gdjsjlh");
String zjxxh=request.getParameter("zjxxh");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,fwdz,hth,crm_khxx.bjjb,bjjbmc,sq_dwxx.dqbm,dqmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_dqbm,bdm_bjjbbm";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.fgsbh=sq_dwxx.dwbh and sq_dwxx.dqbm=dm_dqbm.dqbm and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		hth=rs.getString("hth");
		bjjbbm=rs.getString("bjjb");
		bjjbmc=rs.getString("bjjbmc");
		dqbm=rs.getString("dqbm");
		dqmc=rs.getString("dqmc");
	}
	else{
		out.println("错误！客户不存在");
		return;
	}
	rs.close();
	ps.close();


	ls_sql="SELECT xmmc,xmdlmc,xmxlmc";
	ls_sql+=" FROM bj_bjxmmxh,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_bjxmmxh.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.xmbh='"+xmbh+"' and bj_bjxmmxh.bjjb='"+bjjbbm+"'";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bj_bjxmmxh.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" target="_blank">
  <div align="center">录入客户工料分析表
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr> 
        <td width="19%">姓名：<%=khxm%></td>
        <td width="47%">地址：<%=fwdz%></td>
        <td width="34%">合同号：<%=hth%></td>
      </tr>
      <tr> 
        <td width="19%">地区：<%=dqmc%></td>
        <td width="47%">项目大类：<%=xmdlbm%></td>
        <td width="34%">项目小类：<%=xmxlbm%></td>
      </tr>
      <tr> 
        <td width="19%">项目编号：<%=xmbh%></td>
        <td width="47%">项目名称：<%=xmmc%></td>
        <td width="34%">报价级别： <%=bjjbmc%> </td>
      </tr>
    </table>
  </div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="8" > 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="hidden" name="gdjsjlh"  value="<%=gdjsjlh%>" >
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button"  value="删除" onClick="f_sc(editform)" >
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset"  value="重输">
          （<font color="#FF0000"><b>材料费必须录入【结算材料编码】，若没有可输0</b></font>）</div>
      </td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="4%">&nbsp;</td>
      <td width="4%">序号</td>
      <td width="11%">工料分类</td>
      <td width="15%">结算材料编码</td>
      <td width="33%">工料名称</td>
      <td width="11%">计量单位</td>
      <td width="10%">消耗量</td>
      <td width="12%">单价</td>
    </tr>
    <%
	String bgcolor=null;
	String glbxh=null;
	String glflbm=null;
	String glmc=null;
	String pp=null;
	String xhgg=null;
	String jldwbm=null;
	String bjjb=null;
	String wlbm="";
	double xhl=0;
	double dj=0;

	int row=0;
	ls_sql="SELECT glbxh,dqmc,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,bjjb,wlbm";
	ls_sql+=" FROM bj_khglfxbh,dm_dqbm ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" order by glflbm,glbxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		glbxh=rs.getString("glbxh");
		dqmc=rs.getString("dqmc");

		glflbm=rs.getString("glflbm");
		glmc=rs.getString("glmc");
		pp=cf.fillNull(rs.getString("pp"));
		xhgg=cf.fillNull(rs.getString("xhgg"));
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		dj=rs.getDouble("dj");
		wlbm=cf.fillNull(rs.getString("wlbm"));

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td> 
        <input name="scglbxh" type=checkbox value="<%=glbxh%>">
        <input type="hidden" name="glbxh"  value="<%=glbxh%>" >
      </td>
      <td><%=(row+1)%> </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(wlbm[<%=row%>])">
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm where glflbm='"+glflbm+"'",glflbm);
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="wlbm" value="<%=wlbm%>" readonly size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <input type="text" name="glmc" value="<%=glmc%>" readonly size="40" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm where cljldwbm='"+jldwbm+"'",jldwbm);
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" value="<%=xhl%>" readonly size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <input type="text" name="dj" value="<%=dj%>" readonly size="10" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

	for (;row<40 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td> &nbsp; 
        <input type="hidden" name="glbxh"  value="" >
      </td>
      <td><%=(row+1)%> </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(wlbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="wlbm" value="" size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <input type="text" name="glmc" size="40" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <input type="text" name="dj" value="" size="10" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="8" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button"  value="删除" onClick="f_sc(editform)" >
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>

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

	FormName.action="SaveInsertZjxBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
function f_sc(FormName)//参数FormName:Form的名称
{
	var choo=0;
	if ( confirm("确实要继续吗?") )	{
		var i = 0;
		if (100==1){
			if( FormName.scglbxh.checked ){
				choo=1;
			}
		} 
		else{ 
			for (i=0;i <<%=rownum%>;i++ ){
				if( FormName.scglbxh[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			FormName.action="DeleteZjxBj_jzglfxb.jsp";
			FormName.submit();
			return true;
		}
	}
} 
//-->
</SCRIPT>
