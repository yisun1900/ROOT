<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT xmmc,dqmc,xmdlmc,xmxlmc";
	ls_sql+=" FROM bj_gzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_gzbjb.dqbm='"+dqbm+"' and bj_gzbjb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_gzbjb.dqbm=dm_dqbm.dqbm and bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
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
<title>公装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" >
  <div align="center">修改公装工料分析表 
    <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr> 
        <td width="19%">地区：<%=dqmc%></td>
        <td width="47%">项目大类：<%=xmdlbm%></td>
        <td width="34%">项目小类：<%=xmxlbm%></td>
      </tr>
      <tr> 
        <td width="19%">项目编号：<%=xmbh%></td>
        <td width="47%">项目名称：<%=xmmc%></td>
        <td width="34%">&nbsp;</td>
      </tr>
    </table>
  </div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="2%">&nbsp;</td>
      <td width="3%">序号</td>
      <td width="7%">报价级别</td>
      <td width="5%">工料分类</td>
      <td width="13%">工料名称</td>
      <td width="5%">计量单位</td>
      <td width="6%">消耗量</td>
      <td width="6%">单价</td>
      <td width="10%">品牌</td>
      <td width="12%">型号规格</td>
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
	double xhl=0;
	double dj=0;

	int row=0;
	ls_sql="SELECT glbxh,dqmc,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,bjjb";
	ls_sql+=" FROM bj_gzglfxb,dm_dqbm ";
	ls_sql+=" where bj_gzglfxb.dqbm='"+dqbm+"' and bj_gzglfxb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_gzglfxb.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" order by glbxh";
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
		bjjb=cf.fillNull(rs.getString("bjjb"));

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
        <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(glflbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjb);
					%> 
        </select>
	  </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glmc[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm",glflbm);
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="glmc" value="<%=glmc%>" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc",jldwbm);
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" value="<%=xhl%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="dj" value="<%=dj%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="pp" value="<%=pp%>" size="14" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xhgg[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="xhgg" value="<%=xhgg%>" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

	for (;row<15 ;row++ )
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
        <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(glflbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
					%> 
        </select>
	  </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glmc[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="glmc" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="dj" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="pp" size="14" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xhgg[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="xhgg" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="9" > 
        <div align="center"> 
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
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

	FormName.action="SaveEditBj_gzglfxb.jsp";
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
			FormName.action="DeleteBj_gzglfxb.jsp";
			FormName.submit();
			return true;
		}
	}
} 
//-->
</SCRIPT>
