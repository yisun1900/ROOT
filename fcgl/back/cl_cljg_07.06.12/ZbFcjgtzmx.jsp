<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<%
String ssfgs=request.getParameter("fgs");
String wheresql="";
String whereclbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrbfb=null;
String cldj=null;
String jldwmc=null;
String jgtzzt=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String cldlmc=null;

cldlmc=request.getParameter("cldlmc");
if (cldlmc!=null)
{
	cldlmc=cf.GB2Uni(cldlmc);
	if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
}
jgtzzt=request.getParameter("jgtzzt");
if (jgtzzt!=null)
{
	jgtzzt=jgtzzt.trim();
	if (jgtzzt.equals("1"))	wheresql+=" and  (fgsdj=0) ";
}
whereclbm=request.getParameter("clbm");
if (whereclbm!=null)
{
	whereclbm=whereclbm.trim();
	if (!(whereclbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+whereclbm+"') ";
}
cldj=request.getParameter("cldj");
if (cldj!=null)
{
	cldj=cldj.trim();
	if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj>="+cldj+") ";
}
cldj=request.getParameter("cldj2");
if (cldj!=null)
{
	cldj=cldj.trim();
	if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj<="+cldj+") ";
}
jldwmc=request.getParameter("jldwmc");
if (jldwmc!=null)
{
	jldwmc=cf.GB2Uni(jldwmc);
	if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
}
clmc=request.getParameter("clmc");
if (clmc!=null)
{
	clmc=cf.GB2Uni(clmc);
	if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+clmc+"')";
}
clgg=request.getParameter("clgg");
if (clgg!=null)
{
	clgg=cf.GB2Uni(clgg);
	if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+clgg+"')";
}
lrjsfs=request.getParameter("lrjsfs");
if (lrjsfs!=null)
{
	lrjsfs=cf.GB2Uni(lrjsfs);
	if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
}
lrbfb=request.getParameter("lrbfb");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
}
lrbfb=request.getParameter("lrbfb2");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String clbm2=null;
String clmc2=null;
String clgg2=null;
String jldwmc2=null;
double cldj2=0;
double cj2=0;
double cjjsj2=0;
double fgsdj2=0;
double gdj2=0;

String dwmc=null;
int row=0;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="" name="selectform" target="_back">
  <div align="center"><b>总部调整价格（<%=dwmc%>）</b></div>
        
  <table width="100%" border="0" style="FONT-SIZE:13" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="3%">&nbsp;</td>
      <td width="5%"> 
        <div align="center"><b>序号</b></div>
      </td>
      <td width="16%"> 
        <div align="center"><b>材料名称</b></div>
      </td>
      <td width="16%"> 
        <div align="center"><b>材料规格</b></div>
      </td>
      <td width="7%"> 
        <div align="center"><b>计量单位</b></div>
      </td>
      <td width="9%"> 
        <div align="center"><b>总公司材料单价</b></div>
      </td>
      <td width="11%"><b>厂价</b></td>
      <td width="11%"><b>与厂家结算价</b></td>
      <td width="11%"><b>分公司材料单价</b></td>
      <td width="11%"> 
        <div align="center"><b>工队价</b></div>
      </td>
    </tr>
    <%

	ls_sql=" SELECT cl_clbm.clbm clbm,clmc,clgg,jldwmc,cldj,cj,cjjsj,fgsdj,gdj ";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
	ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and  cl_jgmx.dwbh='"+ssfgs+"'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row+=1;
		clbm2=cf.fillNull(rs.getString("clbm"));
		clmc2=cf.fillNull(rs.getString("clmc"));
		clgg2=cf.fillNull(rs.getString("clgg"));
		jldwmc2=cf.fillNull(rs.getString("jldwmc"));
		cldj2=rs.getDouble("cldj");
		cj2=rs.getDouble("cj");
		cjjsj2=rs.getDouble("cjjsj");
		fgsdj2=rs.getDouble("fgsdj");
		gdj2=rs.getDouble("gdj");
	%> 
    <tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>"> 
      <td > 
        <input name="clbmbox" type="checkbox" value="<%=clbm2%>">
      </td>
      <td > 
        <div align="center"><%=row%></div>
      </td>
      <td > 
        <div align="center"><%=clmc2%> 
          <input type="hidden" name="clbm" value="<%=clbm2%>">
        </div>
      </td>
      <td > 
        <div align="center"><%=clgg2%></div>
      </td>
      <td > 
        <div align="center"><%=jldwmc2%></div>
      </td>
      <td > 
        <div align="center"><%=cldj2%></div>
      </td>
      <td > 
        <input type="text" name="cj" size="8" maxlength="13" value="<%=cj2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cjjsj[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="cjjsj" size="8" maxlength="13" value="<%=cjjsj2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fgsdj[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="fgsdj" size="8" maxlength="13" value="<%=fgsdj2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="gdj" size="8" maxlength="13" value="<%=gdj2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cj[<%=row%>])">
      </td>
    </tr>
    <%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="10"> 
        <input type="hidden" name="dwbh" value="<%=ssfgs%>">
        <input type="button"  value=" 保 存 " onClick="f_do(selectform)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  value=" 删 除 " onClick="f_delete(selectform)">
      </td>
    </tr>
  </table>
		</form>
		</body>
		</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
/*
	var len=<%=row%>-0;
	var m=0,val,ycldj;
	if (len<=1)
	{
		val=FormName.fgsdj.value-0;
		ycldj=FormName.cldj.value-0;
//		alert(FormName.fgsdj.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.fgsdj)=="") {
			alert("【"+FormName.clmc.value+"】"+"价格不能为空!!!");
			FormName.fgsdj.focus();
			return false;
		}
		if (!(isFloat(FormName.fgsdj,"【"+FormName.clmc.value+"】"))){
			FormName.fgsdj.focus();     
			return      
		   }
		if (val<=0)
		{
			alert("【"+FormName.clmc.value+"】"+"价格不能小于或者等于零!!!");
			FormName.fgsdj.focus(); 
			return false;
		}
		if (val<ycldj)
		{
			alert("【"+FormName.clmc.value+"】"+"价格不能小于公司材料单价!!!");
			FormName.fgsdj.focus(); 
			return false;
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.fgsdj[m].value-0;
			ycldj=FormName.cldj[m].value-0;
	//		alert(FormName.fgsdj[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.fgsdj[m])=="") {
				alert("【"+FormName.clmc[m].value+"】"+"价格不能为空!!!");
				FormName.fgsdj[m].focus();
				return false;
			}
			if (!(isFloat(FormName.fgsdj[m],"【"+FormName.clmc[m].value+"】"))){
				FormName.fgsdj[m].focus();     
				return      
			   }
			if (val<=0)
			{
				alert("【"+FormName.clmc[m].value+"】"+"价格不能小于或者等于零!!!");
				FormName.fgsdj[m].focus(); 
				return false;
			}	
			if (val<ycldj)
			{
				alert("【"+FormName.clmc[m].value+"】"+"价格不能小于公司材料单价!!!");
				FormName.fgsdj[m].focus(); 
				return false;
			}
		}
	}
*/

	FormName.action="SaveZbFcjgtzmx.jsp";
	FormName.submit();
	return true;
}

function f_delete(FormName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( FormName.clbmbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( FormName.clbmbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			FormName.action="DeleteFcjgtzmx.jsp";
			FormName.submit();
			return true;
		}
	}
} 

//-->
</SCRIPT>