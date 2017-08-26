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
String jldwmc=null;
String xjgsfgx=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String cldlmc=null;

String wxr=null;
wxr=request.getParameter("wxr");
if (wxr!=null)
{
	wxr=cf.GB2Uni(wxr);
	if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
}

cldlmc=request.getParameter("cldlmc");
if (cldlmc!=null)
{
	cldlmc=cf.GB2Uni(cldlmc);
	if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
}
xjgsfgx=request.getParameter("xjgsfgx");
if (xjgsfgx!=null)
{
	xjgsfgx=xjgsfgx.trim();
	if (!(xjgsfgx.equals("")))	wheresql+=" and  (cl_jgmx.xjgsfgx='"+xjgsfgx+"') ";
}
whereclbm=request.getParameter("clbm");
if (whereclbm!=null)
{
	whereclbm=whereclbm.trim();
	if (!(whereclbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+whereclbm+"') ";
}
jldwmc=request.getParameter("jldwmc");
if (jldwmc!=null)
{
	jldwmc=cf.GB2Uni(jldwmc);
	if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
}


String clbm=null;
clbm=request.getParameter("clbm");
if (clbm!=null)
{
	clbm=cf.GB2Uni(clbm);
	if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
}
clmc=request.getParameter("clmc");
if (clmc!=null)
{
	clmc=cf.GB2Uni(clmc);
	if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+clmc+"%')";
}
clgg=request.getParameter("clgg");
if (clgg!=null)
{
	clgg=cf.GB2Uni(clgg);
	if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+clgg+"%')";
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
double cj2=0;
double cjjsj2=0;
double fgsdj2=0;
double gdj2=0;

String xjgsxsj=null;
String sfycx=null;
String cxkssj=null;
String cxjzsj=null;
double cxcj=0;
double cxcjjsj=0;
double cxfgsdj=0;
double cxgdj=0;

double xcj=0;
double xcjjsj=0;
double xfgsdj=0;
double xgdj=0;

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

	ls_sql=" update cl_jgmx set cjjsj=xcjjsj,gdj=xgdj  ,xjgsfgx='2',xjgsxsj=null,xcjjsj=null,xgdj=null";
	ls_sql+=" where dwbh='"+ssfgs+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
%>

<form method="post" action="" name="selectform" target="_back">
  <b>总部调整价格（<%=dwmc%>）《<font color="#FF0000">注意：更新项目必须录入：新价格生效时间</font>》</b>
        
  <table width="110%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="0" align="center">
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="4%" >&nbsp;</td>
      <td width="6%" ><b>序号</b></td>
      <td width="12%" ><b>材料编码</b></td>
      <td width="19%" ><b>材料名称</b></td>
      <td width="8%" ><b>计量单位</b></td>
      <td width="11%" ><b>新价格生效时间</b></td>
      <td width="11%" ><b>新与厂家结算价</b></td>
      <td width="11%" ><b>新工队价</b></td>
      <td width="18%" ><b>材料规格</b></td>
	</tr>
    <%

	ls_sql=" SELECT cl_clbm.clbm clbm,clmc,clgg,jldwmc,cj,cjjsj,fgsdj,gdj,cl_jgmx.xjgsxsj,sfycx,cxkssj,cxjzsj,cxcj,cxcjjsj,cxfgsdj,cxgdj,xcj,xcjjsj,xfgsdj,xgdj";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
	ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and  cl_jgmx.dwbh='"+ssfgs+"'";
	ls_sql+=wheresql;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row+=1;
		clbm2=cf.fillNull(rs.getString("clbm"));
		clmc2=cf.fillNull(rs.getString("clmc"));
		clgg2=cf.fillNull(rs.getString("clgg"));
		jldwmc2=cf.fillNull(rs.getString("jldwmc"));
		cj2=rs.getDouble("cj");
		cjjsj2=rs.getDouble("cjjsj");
		fgsdj2=rs.getDouble("fgsdj");
		gdj2=rs.getDouble("gdj");

		xjgsxsj=cf.fillNull(rs.getDate("xjgsxsj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxcj=rs.getDouble("cxcj");
		cxcjjsj=rs.getDouble("cxcjjsj");
		cxfgsdj=rs.getDouble("cxfgsdj");
		cxgdj=rs.getDouble("cxgdj");
		xcj=rs.getDouble("xcj");
		xcjjsj=rs.getDouble("xcjjsj");
		xfgsdj=rs.getDouble("xfgsdj");
		xgdj=rs.getDouble("xgdj");
	%> 
    <tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center" > 
      <td > 
        <input name="clbmbox" type="checkbox" value="<%=clbm2%>">
      </td>
      <td > 
        <%=row%>
      </td>
      <td > <%=clbm2%>
          <input type="hidden" name="clbm" value="<%=clbm2%>">
      </td>
      <td > 
       <%=clmc2%> 
      </td>
      <td > 
        <%=jldwmc2%>
      </td>
      <td > 
        <input type="text" name="xjgsxsj" size="10" maxlength="10" value="<%=xjgsxsj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xcjjsj[<%=(row-1)%>])">
      </td>

      <td > 
        <input type="text" name="xcjjsj" size="10" maxlength="13" value="<%=xcjjsj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xgdj[<%=(row-1)%>])">
		  <BR><font color="#000099">目前：<%=cjjsj2%></font>
      </td>
      <td > 
        <input type="text" name="xgdj" size="10" maxlength="13" value="<%=xgdj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xjgsxsj[<%=row%>])">
		  <BR><font color="#000099">目前：<%=gdj2%></font>
      </td>
      <td > 
        <%=clgg2%>
      </td>



	
	</tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="18"> 
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
	var mark=0;
	if (<%=row%>>1)
	{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.xjgsxsj[i])!="") 
			{
				if(!(isDatetime(FormName.xjgsxsj[i], "新价格生效时间"))) 
				{
					return false;
				}
				mark++;
			}
		}
	}
	else if (<%=row%>==1)
	{
		if(	javaTrim(FormName.xjgsxsj)!="") 
		{
			if(!(isDatetime(FormName.xjgsxsj, "新价格生效时间"))) 
			{
				return false;
			}
			mark++;
		}
	}

	if (mark==0)
	{
		alert("错误！必须录入【新价格生效时间】，否则修改无效");
		return;
	}

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